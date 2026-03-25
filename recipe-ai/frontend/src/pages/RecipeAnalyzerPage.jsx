import { useEffect, useState } from "react";
import {
  extractIngredients,
  extractIngredientsWithAmounts,
  lookupIngredients,
  calculateNutrition,
  saveRecipe,
} from "../api/recipeApi";
import { createStopwordsBulk, deleteStopword } from "../api/stopwordsApi";
import LoadingSpinner from "../components/common/LoadingSpinner";
import ErrorMessage from "../components/common/ErrorMessage";
import NutritionDetailPanel, {
  NutritionPerItemTable,
} from "../components/recipe/NutritionDetailPanel";
import useAuthStore from "../store/authStore";
import theme from "../utils/theme";

const RECIPE_INPUT_HISTORY_MAX = 100;
const RECIPE_INPUT_HISTORY_RECENT = 5;

export default function RecipeAnalyzerPage() {
  const { user } = useAuthStore();
  const userId = user?.id || "guest";
  const historyKey = `recipe_input_history:${userId}`;
  const historyEnabledKey = `recipe_input_history_enabled:${userId}`;

  const [step, setStep] = useState(1);
  const [recipeText, setRecipeText] = useState("");
  const [servings, setServings] = useState(1);
  const [matchLimit, setMatchLimit] = useState(8);
  const [ingredients, setIngredients] = useState([]);
  const [newIngredient, setNewIngredient] = useState("");
  const [results, setResults] = useState(null);
  const [nutritionResult, setNutritionResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [saveMsg, setSaveMsg] = useState("");
  // 每個食材的用量和選中的匹配 (Step 3 -> Step 4)
  const [selectedMatches, setSelectedMatches] = useState({});
  const [amounts, setAmounts] = useState({});
  const [parsedAmounts, setParsedAmounts] = useState({});
  const [saveInputHistory, setSaveInputHistory] = useState(true);
  const [inputHistory, setInputHistory] = useState([]);
  const [historyCollapsed, setHistoryCollapsed] = useState(true);
  const [showAllHistory, setShowAllHistory] = useState(false);

  useEffect(() => {
    try {
      const enabledRaw = localStorage.getItem(historyEnabledKey);
      setSaveInputHistory(enabledRaw !== "0");
      const raw = localStorage.getItem(historyKey);
      const list = raw ? JSON.parse(raw) : [];
      setInputHistory(Array.isArray(list) ? list : []);
    } catch {
      setSaveInputHistory(true);
      setInputHistory([]);
    }
    setHistoryCollapsed(true);
    setShowAllHistory(false);
  }, [historyEnabledKey, historyKey]);

  const persistHistory = (text) => {
    if (!saveInputHistory) return;
    const trimmed = String(text || "").trim();
    if (!trimmed) return;

    const nowIso = new Date().toISOString();
    let next = [...inputHistory];
    const duplicateIdx = next.findIndex((it) => isMostlyOverlapped(it.text, trimmed));

    if (duplicateIdx >= 0) {
      const updated = {
        ...next[duplicateIdx],
        text: trimmed,
        createdAt: nowIso,
      };
      next.splice(duplicateIdx, 1);
      next.unshift(updated);
    } else {
      next.unshift({
        id: `${Date.now()}_${Math.random().toString(36).slice(2, 8)}`,
        text: trimmed,
        createdAt: nowIso,
      });
    }

    next = next.slice(0, RECIPE_INPUT_HISTORY_MAX);
    setInputHistory(next);
    try {
      localStorage.setItem(historyKey, JSON.stringify(next));
    } catch {
      // ignore localStorage errors
    }
  };

  const applyHistoryText = (text) => {
    setRecipeText(text || "");
    const detected = detectServingsFromText(text || "");
    if (detected) setServings(detected);
  };

  const clearHistory = () => {
    setInputHistory([]);
    try {
      localStorage.setItem(historyKey, JSON.stringify([]));
    } catch {
      // ignore localStorage errors
    }
  };

  const toggleHistoryEnabled = () => {
    const next = !saveInputHistory;
    setSaveInputHistory(next);
    try {
      localStorage.setItem(historyEnabledKey, next ? "1" : "0");
    } catch {
      // ignore localStorage errors
    }
  };

  // Step 1 -> Step 2: 提取食材
  const handleExtract = async () => {
    if (!recipeText.trim()) { setError("請輸入食譜內容"); return; }
    persistHistory(recipeText);
    setLoading(true); setError("");
    try {
      let kw = [];
      const amountMap = {};

      try {
        const withAmounts = await extractIngredientsWithAmounts(recipeText);
        const parsedItems = withAmounts.ingredients || [];
        kw = parsedItems.map((x) => x.name).filter(Boolean);
        parsedItems.forEach((x) => {
          if (x?.name) {
            amountMap[x.name] = x.amount || "";
          }
        });
      } catch {
        // fallback to plain keyword extraction
        const data = await extractIngredients(recipeText);
        kw = data.keywords || [];
      }

      setIngredients(kw);
      setParsedAmounts(amountMap);
      const detectedServings = detectServingsFromText(recipeText);
      if (detectedServings) setServings(detectedServings);
      if (kw.length > 0) {
        setStep(2);
      } else {
        setError("未能識別出食材，請確認食譜內容或手動輸入食材");
      }
    } catch (e) {
      setError(e.response?.data?.detail || "識別失敗");
    } finally { setLoading(false); }
  };

  // Step 2 -> Step 3: 查詢營養
  const handleLookup = async () => {
    if (!ingredients.length) { setError("請至少輸入一個食材"); return; }
    setLoading(true); setError("");
    try {
      const data = await lookupIngredients(ingredients, matchLimit);
      setResults(data.results || []);
      // 初始化每個食材的選中匹配和用量
      const initSelected = {};
      const initAmounts = {};

      const candidateRank = (c) => {
        const score = Number(c?.score) || 0;
        const nutrition = c?.nutrition || {};
        const nonZero = Object.values(nutrition).filter((v) => Number(v) > 0).length;
        const richnessBonus = nonZero * 0.01;
        const sourceBonus = c?.source === "taiwan_foods" ? 0.03 : 0;
        return score + richnessBonus + sourceBonus;
      };

      (data.results || []).forEach((r) => {
        const candidates = [];
        (r.matches || []).forEach((m) => {
          if (m?.tw) candidates.push({ ...m.tw, source: m.tw.source || "taiwan_foods" });
          if (m?.en) candidates.push({ ...m.en, source: m.en.source || "foodb" });
        });

        const best = candidates.sort((a, b) => candidateRank(b) - candidateRank(a))[0];
        if (best) {
          initSelected[r.ingredient] = {
            food_id: best.id,
            source: best.source,
            food_name: best.name,
          };
        }
        initAmounts[r.ingredient] = parsedAmounts[r.ingredient] || "";
      });
      setSelectedMatches(initSelected);
      setAmounts(initAmounts);
      setStep(3);
    } catch (e) {
      setError(e.response?.data?.detail || "查詢失敗");
    } finally { setLoading(false); }
  };

  // Step 3 -> Step 4: 計算完整營養
  const handleCalculateNutrition = async () => {
    const items = [];
    for (const [ingredient, match] of Object.entries(selectedMatches)) {
      if (match) {
        items.push({
          food_id: match.food_id,
          source: match.source,
          food_name: match.food_name,
          amount: amounts[ingredient] || "",
        });
      }
    }
    if (!items.length) { setError("請至少選擇一個匹配的食材"); return; }
    setLoading(true); setError("");
    try {
      const data = await calculateNutrition(items);
      setNutritionResult(data);
      setStep(4);
    } catch (e) {
      setError(e.response?.data?.detail || "營養計算失敗");
    } finally { setLoading(false); }
  };

  const selectMatch = (ingredient, match, source) => {
    setSelectedMatches((prev) => ({
      ...prev,
      [ingredient]: { food_id: match.id, source, food_name: match.name },
    }));
  };

  const updateAmount = (ingredient, value) => {
    setAmounts((prev) => ({ ...prev, [ingredient]: value }));
  };

  const removeIngredient = (idx) => setIngredients(ingredients.filter((_, i) => i !== idx));
  const addIngredient = () => {
    const v = newIngredient.trim();
    if (v && !ingredients.includes(v)) {
      setIngredients([...ingredients, v]);
      setParsedAmounts((prev) => ({ ...prev, [v]: "" }));
      setNewIngredient("");
    }
  };

  // 拖曳 → 停用詞 (雙向)
  const [dropActive, setDropActive] = useState(false);
  const [tagDropActive, setTagDropActive] = useState(false);
  const [recentStopwords, setRecentStopwords] = useState([]);
  const [stopwordMsg, setStopwordMsg] = useState("");

  // 食材 → 停用詞
  const handleDropToStopword = async (e) => {
    e.preventDefault();
    setDropActive(false);
    const word = (e.dataTransfer.getData("text/plain") || "").trim();
    if (!word) return;
    const snapshot = ingredients;
    setIngredients(ingredients.filter((x) => x !== word));
    try {
      await createStopwordsBulk([word], "user_flag", "recipe_analyzer");
      setRecentStopwords((prev) => (prev.includes(word) ? prev : [...prev, word]));
      setStopwordMsg(`已加入停用詞:${word}`);
      setTimeout(() => setStopwordMsg(""), 2500);
    } catch (err) {
      setIngredients(snapshot);
      setStopwordMsg(err?.response?.data?.detail || "加入停用詞失敗");
      setTimeout(() => setStopwordMsg(""), 2500);
    }
  };

  // 停用詞 → 食材 (反向)
  const handleDropToIngredient = async (e) => {
    e.preventDefault();
    setTagDropActive(false);
    const word = (e.dataTransfer.getData("application/x-stopword") || "").trim();
    if (!word) return;
    const snapshotChips = recentStopwords;
    setRecentStopwords((prev) => prev.filter((x) => x !== word));
    try {
      await deleteStopword(word);
      setIngredients((prev) => (prev.includes(word) ? prev : [...prev, word]));
      setStopwordMsg(`已移出停用詞:${word}`);
      setTimeout(() => setStopwordMsg(""), 2500);
    } catch (err) {
      setRecentStopwords(snapshotChips);
      setStopwordMsg(err?.response?.data?.detail || "移出停用詞失敗");
      setTimeout(() => setStopwordMsg(""), 2500);
    }
  };

  const canNavigateStep = (targetStep) => {
    if (targetStep === 1) return true;
    if (targetStep === 2) return ingredients.length > 0;
    if (targetStep === 3) return Array.isArray(results) && results.length > 0;
    if (targetStep === 4) return !!nutritionResult;
    return false;
  };

  const handleSave = async () => {
    if (!results) return;
    try {
      const matched = results.filter(r => r.matches?.some(m => m.tw || m.en));
      const total = nutritionResult?.total || {};
      await saveRecipe({
        recipe_name: recipeText.slice(0, 50) || "未命名食譜",
        recipe_content: recipeText,
        servings: Math.max(1, Number(servings) || 1),
        nutrition: {
          calories: Number(total.cal_per_100g || total.modified_cal_per_100g || total.calories || 0),
          protein: Number(total.protein_per_100g || total.protein || 0),
          carbs: Number(total.carbon_per_100g || total.carbs || 0),
          fat: Number(total.fats_per_100g || total.fat || 0),
          fiber: Number(total.dietary_fiber_per_100g || total.fiber || 0),
        },
        nutrition_detail: total,
        ingredients: matched.map(r => ({
          name: r.ingredient,
          amount: amounts[r.ingredient] || "",
        })),
      });
      setSaveMsg("食譜已儲存！");
    } catch (e) {
      setError("儲存失敗：" + (e.response?.data?.detail || e.message));
    }
  };

  const matchedCount = results ? results.filter(r => r.matches?.some(m => m.tw || m.en)).length : 0;
  const totalMatches = results ? results.reduce((sum, r) => sum + (r.matches?.length || 0), 0) : 0;

  return (
    <div style={{ maxWidth: 800, margin: "0 auto" }}>
      <h1 style={S.title}>食譜文本營養查詢</h1>
      <p style={S.subtitle}>貼上食譜，自動識別食材並查詢營養資訊</p>

      {/* 步驟指示器 */}
      <div style={S.steps}>
        {[1, 2, 3, 4].map(n => (
          <button
            key={n}
            type="button"
            onClick={() => canNavigateStep(n) && setStep(n)}
            style={{
              ...S.stepItem,
              opacity: step >= n ? 1 : 0.4,
              cursor: canNavigateStep(n) ? "pointer" : "not-allowed",
            }}
            disabled={!canNavigateStep(n)}
            title={canNavigateStep(n) ? "點擊返回此步驟修改" : "尚未完成前置步驟"}
          >
            <div style={{ ...S.stepCircle, background: step >= n ? theme.accent : theme.border }}>{n}</div>
            <span style={S.stepLabel}>
              {["輸入食譜", "確認食材", "查詢匹配", "營養結算"][n - 1]}
            </span>
          </button>
        ))}
      </div>

      <ErrorMessage message={error} />

      {/* STEP 1：輸入食譜 */}
      {step === 1 && (
        <div style={S.card}>
          <h2 style={S.stepTitle}>步驟1: 輸入食譜文本</h2>
          <div style={S.configRow}>
            <label style={S.configLabel}>人份</label>
            <input
              type="number"
              min="1"
              step="1"
              value={servings}
              onChange={(e) => setServings(Math.max(1, parseInt(e.target.value || "1", 10)))}
              style={S.configInput}
            />
            <button
              type="button"
              style={S.btnSmall}
              onClick={() => {
                const detected = detectServingsFromText(recipeText);
                if (detected) setServings(detected);
              }}
            >
              從文本偵測
            </button>
          </div>
          <textarea
            style={S.textarea}
            rows={6}
            placeholder={"黑糖饅頭20g*4顆\n水煮蛋1顆\n鮮奶250cc"}
            value={recipeText}
            onChange={e => setRecipeText(e.target.value)}
          />

          <div style={S.historyConfigRow}>
            <label style={S.checkboxLabel}>
              <input type="checkbox" checked={saveInputHistory} onChange={toggleHistoryEnabled} />
              <span>保留輸入紀錄（可隨時關閉）</span>
            </label>
            {inputHistory.length > 0 && (
              <button type="button" style={S.btnTinyGhost} onClick={clearHistory}>清空紀錄</button>
            )}
          </div>

          {saveInputHistory && inputHistory.length > 0 && (
            <div style={S.historyWrap}>
              <button
                type="button"
                style={S.historyToggleBtn}
                onClick={() => setHistoryCollapsed((v) => !v)}
              >
                {historyCollapsed ? "▶" : "▼"} 輸入紀錄（最近 {Math.min(RECIPE_INPUT_HISTORY_RECENT, inputHistory.length)} 筆）
              </button>

              {!historyCollapsed && (
                <div style={S.historyList}>
                  {(showAllHistory ? inputHistory : inputHistory.slice(0, RECIPE_INPUT_HISTORY_RECENT)).map((h) => (
                    <button
                      key={h.id}
                      type="button"
                      style={S.historyItem}
                      onClick={() => applyHistoryText(h.text)}
                      title={h.text}
                    >
                      <div style={S.historyTime}>{formatHistoryTime(h.createdAt)}</div>
                      <div style={S.historyPreview}>{toPreview(h.text)}</div>
                    </button>
                  ))}

                  {inputHistory.length > RECIPE_INPUT_HISTORY_RECENT && (
                    <button
                      type="button"
                      style={S.btnTinyGhost}
                      onClick={() => setShowAllHistory((v) => !v)}
                    >
                      {showAllHistory ? "收起舊紀錄" : "顯示更多以往紀錄"}
                    </button>
                  )}
                </div>
              )}
            </div>
          )}

          <button style={S.btnPrimary} onClick={handleExtract} disabled={loading}>
            {loading ? "解析中..." : "解析食材"}
          </button>
          {loading && <LoadingSpinner text="正在解析食材..." />}
        </div>
      )}

      {/* STEP 2：確認食材 */}
      {step === 2 && (
        <div style={S.card}>
          <h2 style={S.stepTitle}>步驟2: 確認與編輯食材</h2>
          <p style={S.hint}>已識別以下食材，您可以新增、刪除或修改</p>
          <div style={S.configRow}>
            <label style={S.configLabel}>每個食材匹配候選數</label>
            <select
              value={matchLimit}
              onChange={(e) => setMatchLimit(parseInt(e.target.value, 10))}
              style={S.configSelect}
            >
              <option value={3}>3 筆</option>
              <option value={5}>5 筆</option>
              <option value={8}>8 筆</option>
              <option value={12}>12 筆</option>
            </select>
          </div>
          <div
            style={{
              ...S.tagList,
              ...(tagDropActive ? S.tagListActive : {}),
            }}
            onDragOver={(e) => {
              if (e.dataTransfer.types.includes("application/x-stopword")) {
                e.preventDefault();
                setTagDropActive(true);
              }
            }}
            onDragLeave={() => setTagDropActive(false)}
            onDrop={handleDropToIngredient}
          >
            {ingredients.map((ing, i) => (
              <span
                key={i}
                style={S.tag}
                draggable
                onDragStart={(e) => {
                  e.dataTransfer.effectAllowed = "move";
                  e.dataTransfer.setData("text/plain", ing);
                }}
                title="拖到下方停用詞區 → 以後自動略過"
              >
                {ing}
                <span style={S.tagX} onClick={() => removeIngredient(i)}>&times;</span>
              </span>
            ))}
            {ingredients.length === 0 && tagDropActive && (
              <div style={{ color: theme.textMuted, fontSize: 13 }}>拖回此區 → 從停用詞移除</div>
            )}
          </div>
          {/* 停用詞拖曳區 (雙向) */}
          <div
            style={{
              ...S.stopwordDrop,
              ...(dropActive ? S.stopwordDropActive : {}),
            }}
            onDragOver={(e) => {
              if (e.dataTransfer.types.includes("text/plain")
                  && !e.dataTransfer.types.includes("application/x-stopword")) {
                e.preventDefault();
                setDropActive(true);
              }
            }}
            onDragLeave={() => setDropActive(false)}
            onDrop={handleDropToStopword}
          >
            <div style={S.stopwordTitle}>
              拖食材到這裡 → 加入停用詞 ·  拖下方 chip 回去 → 移除停用詞
            </div>
            {recentStopwords.length > 0 && (
              <div style={S.stopwordList}>
                {recentStopwords.map((w) => (
                  <span
                    key={w}
                    style={S.stopwordChip}
                    draggable
                    onDragStart={(e) => {
                      e.dataTransfer.effectAllowed = "move";
                      e.dataTransfer.setData("application/x-stopword", w);
                      // 同時給 text/plain 以便顯示 ghost,但 drop 判斷看 x-stopword
                      e.dataTransfer.setData("text/plain", w);
                    }}
                    title="拖回食材區 → 從停用詞移除"
                  >
                    {w}
                  </span>
                ))}
              </div>
            )}
            {stopwordMsg && <div style={S.stopwordMsg}>{stopwordMsg}</div>}
          </div>
          <div style={S.addRow}>
            <input
              style={S.addInput}
              placeholder="新增食材..."
              value={newIngredient}
              onChange={e => setNewIngredient(e.target.value)}
              onKeyDown={e => e.key === "Enter" && addIngredient()}
            />
            <button style={S.btnSmall} onClick={addIngredient}>+ 新增</button>
          </div>
          <div style={{ display: "flex", gap: 12, marginTop: 16 }}>
            <button style={S.btnSecondary} onClick={() => setStep(1)}>上一步</button>
            <button style={S.btnPrimary} onClick={handleLookup} disabled={loading}>
              {loading ? "查詢中..." : "開始查詢營養資訊"}
            </button>
          </div>
          {loading && <LoadingSpinner text="正在搜尋雙資料庫..." />}
        </div>
      )}

      {/* STEP 3：查詢結果 + 選擇匹配 + 輸入用量 */}
      {step === 3 && results && (
        <div style={S.card}>
          <h2 style={S.stepTitle}>步驟3: 選擇匹配並輸入用量</h2>
          <p style={S.hint}>點擊選擇每個食材的最佳匹配，並輸入用量（如 3顆、2大匙、300g）</p>

          <div style={S.statsRow}>
            <div style={S.statBox}>
              <div style={S.statNum}>{ingredients.length}</div>
              <div style={S.statLabel}>食材數量</div>
            </div>
            <div style={S.statBox}>
              <div style={S.statNum}>{totalMatches}</div>
              <div style={S.statLabel}>找到匹配</div>
            </div>
          </div>

          {matchedCount > 0 && (
            <div style={{ marginTop: 20 }}>
              {results.filter(r => r.matches?.some(m => m.tw || m.en)).map((r, idx) => (
                <IngredientMatchCard
                  key={idx}
                  data={r}
                  selected={selectedMatches[r.ingredient]}
                  onSelect={selectMatch}
                  amount={amounts[r.ingredient] || ""}
                  onAmountChange={updateAmount}
                />
              ))}
            </div>
          )}

          {results.filter(r => !r.matches?.some(m => m.tw || m.en)).length > 0 && (
            <div style={{ marginTop: 20 }}>
              <h3 style={{ ...S.sectionTitle, color: theme.warning }}>
                未找到匹配 ({results.filter(r => !r.matches?.some(m => m.tw || m.en)).length})
              </h3>
              {results.filter(r => !r.matches?.some(m => m.tw || m.en)).map((r, idx) => (
                <div key={idx} style={S.notFoundRow}>{r.ingredient}</div>
              ))}
            </div>
          )}

          <div style={{ display: "flex", gap: 12, marginTop: 20 }}>
            <button style={S.btnSecondary} onClick={() => setStep(2)}>返回編輯</button>
            <button style={S.btnPrimary} onClick={handleCalculateNutrition} disabled={loading}>
              {loading ? "計算中..." : "計算完整營養素"}
            </button>
          </div>
          {loading && <LoadingSpinner text="正在計算營養素..." />}
        </div>
      )}

      {/* STEP 4：營養素結算結果 */}
      {step === 4 && nutritionResult && (
        <div style={S.card}>
          <h2 style={S.stepTitle}>步驟4: 營養素結算結果</h2>

          <NutritionPerItemTable items={nutritionResult.items} />

          <NutritionDetailPanel
            nutritionDetail={nutritionResult.total}
            nutrientMeta={nutritionResult.nutrient_meta}
            title="營養素總量"
          />

          <div style={{ display: "flex", gap: 12, marginTop: 20 }}>
            <button style={S.btnSecondary} onClick={() => setStep(3)}>返回調整</button>
            <button style={S.btnSecondary} onClick={() => {
              setStep(1); setResults(null); setIngredients([]);
              setNutritionResult(null); setSaveMsg("");
              setServings(1);
            }}>重新開始</button>
            <button style={S.btnPrimary} onClick={handleSave}>儲存食譜</button>
          </div>
          {saveMsg && <p style={{ color: theme.success, marginTop: 8 }}>{saveMsg}</p>}
        </div>
      )}
    </div>
  );
}


/* 食材匹配卡片（含選擇 + 用量輸入） */
function IngredientMatchCard({ data, selected, onSelect, amount, onAmountChange }) {
  const { ingredient, matches } = data;
  const validMatches = (matches || []).filter(m => m.tw || m.en);
  const conversionPreview = getAmountConversionPreview(amount);

  return (
    <div style={S.ingredientCard}>
      <div style={S.ingredientHeader}>
        <span style={S.ingredientName}>{ingredient}</span>
        <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
          <input
            style={S.amountInput}
            placeholder="用量 (如 3顆、200g)"
            value={amount}
            onChange={e => onAmountChange(ingredient, e.target.value)}
          />
        </div>
      </div>
      <div style={S.conversionHint}>
        {conversionPreview.message}
      </div>
      {validMatches.map((m, i) => (
        <MatchRowSelectable
          key={i}
          tw={m.tw}
          en={m.en}
          ingredient={ingredient}
          selected={selected}
          onSelect={onSelect}
          amountInfo={conversionPreview}
        />
      ))}
    </div>
  );
}

function getAmountConversionPreview(amountText) {
  const text = String(amountText || "").trim();
  const normalized = text
    .replaceAll("\u00BC", "1/4")
    .replaceAll("\u00BD", "1/2")
    .replaceAll("\u00BE", "3/4")
    .replaceAll("\u2153", "1/3")
    .replaceAll("\u2154", "2/3")
    .replaceAll("\u215B", "1/8")
    .replaceAll("\u215C", "3/8")
    .replaceAll("\u215D", "5/8")
    .replaceAll("\u215E", "7/8");

  const parseNumberToken = (token) => {
    const t = String(token || "").trim();
    if (!t) return null;
    if (/^\d+(?:\.\d+)?\/\d+(?:\.\d+)?$/.test(t)) {
      const [a, b] = t.split("/").map(Number);
      if (!b) return null;
      return a / b;
    }
    const n = Number(t);
    return Number.isFinite(n) ? n : null;
  };

  if (!text) {
    return {
      message: "尚未輸入用量，系統將在下一步以預設值估算。",
    };
  }

  const multiMass = normalized.match(/([\d.]+(?:\/[\d.]+)?)\s*(g|gram|grams|克|公克|ml|cc)\s*[xX*]\s*([\d.]+(?:\/[\d.]+)?)/i);
  if (multiMass) {
    const base = parseNumberToken(multiMass[1]);
    const unit = multiMass[2].toLowerCase();
    const count = parseNumberToken(multiMass[3]);
    if (!base || !count) {
      return { message: `轉換參考：${text}（乘數格式偵測到，但數值不完整）`, estimatedGrams: null };
    }
    const grams = unit === "g" || unit === "gram" || unit === "grams" || unit === "克" || unit === "公克" ? base * count : base * count;
    return { message: `轉換參考：${text} ≈ ${grams.toFixed(1)} g（乘數換算）`, estimatedGrams: grams };
  }

  // 例如 1 (8-inch) whole-wheat tortilla，先視為 1 份 wrap/tortilla。
  const inchWrap = normalized.match(/^([\d.]+(?:\/[\d.]+)?)\s*\((\d+(?:\.\d+)?)\s*-?\s*inch\)/i);
  if (inchWrap) {
    const count = parseNumberToken(inchWrap[1]);
    const inch = Number(inchWrap[2]);
    if (count && inch) {
      const perPiece = 50 * (inch / 8);
      const grams = count * perPiece;
      return { message: `轉換參考：${text} ≈ ${grams.toFixed(1)} g（${inch}-inch 餅皮估算）`, estimatedGrams: grams };
    }
  }

  const number = normalized.match(/([\d.]+(?:\/[\d.]+)?)/);
  const value = number ? parseNumberToken(number[1]) : null;
  if (!value) {
    return { message: "偵測到非數值用量，系統將在下一步做估算，可手動改成 g 更精準。" };
  }

  if (/(g|gram|grams|克|公克)/i.test(normalized)) return { message: `轉換參考：${text}（已是公克）`, estimatedGrams: value };
  if (/(kg|kilogram|kilograms|公斤)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 1000).toFixed(1)} g`, estimatedGrams: value * 1000 };
  if (/(ml|cc)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${value.toFixed(1)} g（以密度 1 估算）`, estimatedGrams: value };
  if (/(大匙|tablespoon|tablespoons|tbsp)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 15).toFixed(1)} g（1 大匙約 15 g）`, estimatedGrams: value * 15 };
  if (/(茶匙|小匙|teaspoon|teaspoons|tsp)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 5).toFixed(1)} g（1 茶匙約 5 g）`, estimatedGrams: value * 5 };
  if (/(顆|piece|pieces|whole)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 50).toFixed(1)} g（1 顆約 50 g）`, estimatedGrams: value * 50 };
  if (/(片|slice|slices)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 15).toFixed(1)} g（1 片約 15 g）`, estimatedGrams: value * 15 };
  if (/(杯|cup|cups)/i.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 240).toFixed(1)} g（1 杯約 240 ml）`, estimatedGrams: value * 240 };
  if (/碗/.test(normalized)) return { message: `轉換參考：${text} ≈ ${(value * 150).toFixed(1)} g（1 碗約 150 g）`, estimatedGrams: value * 150 };

  return { message: `轉換參考：${text}（單位待估算，可改用 g 提高準確度）`, estimatedGrams: null };
}


/* 可選擇的匹配行 */
function MatchRowSelectable({ tw, en, ingredient, selected, onSelect, amountInfo }) {
  const isTwSelected = tw && selected?.food_id === tw.id && selected?.source === "taiwan_foods";
  const isEnSelected = en && selected?.food_id === en.id && selected?.source === "foodb";

  return (
    <div style={S.matchRow}>
      <div
        style={{
          ...S.matchCell,
          border: isTwSelected ? `2px solid ${theme.success}` : "2px solid transparent",
          cursor: tw ? "pointer" : "default",
        }}
        onClick={() => tw && onSelect(ingredient, tw, "taiwan_foods")}
      >
        <div style={S.dbBadgeTW}>台灣資料庫</div>
        {tw ? (
          <>
            <div style={S.foodName}>{tw.name}</div>
            <div style={S.foodCat}>{tw.category}</div>
            {tw.score != null && (
              <div style={S.scoreInfo}>
                相似度: {(tw.score * 100).toFixed(1)}%
                {tw.score_parts && (
                  <span style={S.scoreParts}>
                    （sim:{(tw.score_parts.sim * 100).toFixed(0)}% + contains:{(tw.score_parts.contains * 100).toFixed(0)}% + exact:{(tw.score_parts.exact * 100).toFixed(0)}%）
                  </span>
                )}
              </div>
            )}
            {tw.nutrition && (
              <>
                <div style={S.kcal}>熱量: {tw.nutrition.calories?.toFixed(2)} kcal / 100g</div>
                {amountInfo?.estimatedGrams ? (
                  <div style={S.kcalEstimated}>
                    估算本食譜用量: {estimateKcal(tw.nutrition.calories, amountInfo.estimatedGrams).toFixed(1)} kcal ({amountInfo.estimatedGrams.toFixed(1)} g)
                  </div>
                ) : null}
              </>
            )}
            {isTwSelected && <div style={S.selectedBadge}>已選擇</div>}
          </>
        ) : (
          <div style={S.noData}>無資料</div>
        )}
      </div>
      <div
        style={{
          ...S.matchCell,
          border: isEnSelected ? `2px solid ${theme.success}` : "2px solid transparent",
          cursor: en ? "pointer" : "default",
        }}
        onClick={() => en && onSelect(ingredient, en, "foodb")}
      >
        <div style={S.dbBadgeEN}>FooDB</div>
        {en ? (
          <>
            <div style={S.foodName}>{en.name}</div>
            <div style={S.foodCat}>{en.category}</div>
            {en.score != null && (
              <div style={S.scoreInfo}>
                相似度: {(en.score * 100).toFixed(1)}%
                {en.score_parts && (
                  <span style={S.scoreParts}>
                    （sim:{(en.score_parts.sim * 100).toFixed(0)}% + contains:{(en.score_parts.contains * 100).toFixed(0)}% + exact:{(en.score_parts.exact * 100).toFixed(0)}%）
                  </span>
                )}
              </div>
            )}
            {en.nutrition && (
              <>
                <div style={S.kcal}>熱量: {en.nutrition.calories?.toFixed(2)} kcal / 100g</div>
                {amountInfo?.estimatedGrams ? (
                  <div style={S.kcalEstimated}>
                    估算本食譜用量: {estimateKcal(en.nutrition.calories, amountInfo.estimatedGrams).toFixed(1)} kcal ({amountInfo.estimatedGrams.toFixed(1)} g)
                  </div>
                ) : null}
              </>
            )}
            {!en.nutrition && <div style={S.noData}>無營養資料</div>}
            {isEnSelected && <div style={S.selectedBadge}>已選擇</div>}
          </>
        ) : (
          <div style={S.noData}>無資料</div>
        )}
      </div>
    </div>
  );
}

function estimateKcal(calPer100g, grams) {
  return (Number(calPer100g) || 0) * (Number(grams) || 0) / 100;
}

function detectServingsFromText(text) {
  const input = String(text || "");
  const m = input.match(/(\d+(?:\.\d+)?)\s*(?:人份|份量|servings?)/i);
  if (!m) return null;
  const n = Number(m[1]);
  if (!Number.isFinite(n) || n <= 0) return null;
  return Math.round(n);
}

function normalizeForCompare(text) {
  return String(text || "")
    .toLowerCase()
    .replace(/\s+/g, "")
    .replace(/[，,。.!！?？;；:\-_=+*()（）\[\]{}]/g, "");
}

function isMostlyOverlapped(a, b) {
  const x = normalizeForCompare(a);
  const y = normalizeForCompare(b);
  if (!x || !y) return false;
  if (x === y) return true;
  const short = x.length <= y.length ? x : y;
  const long = x.length > y.length ? x : y;
  if (long.includes(short)) {
    return short.length / long.length >= 0.7;
  }
  return false;
}

function toPreview(text) {
  const oneLine = String(text || "").replace(/\s+/g, " ").trim();
  if (oneLine.length <= 90) return oneLine;
  return `${oneLine.slice(0, 90)}...`;
}

function formatHistoryTime(iso) {
  if (!iso) return "";
  const d = new Date(iso);
  if (Number.isNaN(d.getTime())) return "";
  return d.toLocaleString("zh-TW", {
    year: "numeric",
    month: "2-digit",
    day: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
  });
}


const S = {
  title: { color: theme.accent, marginBottom: 4, fontSize: 24 },
  subtitle: { color: theme.textLight, marginBottom: 20, fontSize: 14 },
  steps: { display: "flex", justifyContent: "center", gap: 24, marginBottom: 24, flexWrap: "wrap" },
  stepItem: { display: "flex", alignItems: "center", gap: 8, background: "transparent", border: "none", color: "inherit" },
  stepCircle: {
    width: 28, height: 28, borderRadius: "50%", color: "#fff",
    display: "flex", alignItems: "center", justifyContent: "center",
    fontSize: 14, fontWeight: "bold",
  },
  stepLabel: { color: theme.textMuted, fontSize: 13 },
  card: { background: theme.cardBg, borderRadius: 12, padding: 24, marginBottom: 20, border: `1px solid ${theme.border}`, boxShadow: "0 2px 8px rgba(0,0,0,0.06)" },
  stepTitle: { color: theme.accent, marginBottom: 12, fontSize: 18 },
  hint: { color: theme.textLight, fontSize: 13, marginBottom: 12 },
  configRow: { display: "flex", gap: 8, alignItems: "center", marginBottom: 10, flexWrap: "wrap" },
  configLabel: { color: theme.textMuted, fontSize: 13, minWidth: 72 },
  configInput: { width: 90, background: theme.inputBg, border: `1px solid ${theme.border}`, borderRadius: 8, padding: "8px 10px", color: theme.text, fontSize: 14 },
  configSelect: { background: theme.inputBg, border: `1px solid ${theme.border}`, borderRadius: 8, padding: "8px 10px", color: theme.text, fontSize: 14 },
  historyConfigRow: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    gap: 8,
    marginBottom: 8,
    flexWrap: "wrap",
  },
  checkboxLabel: {
    display: "inline-flex",
    alignItems: "center",
    gap: 8,
    color: theme.textMuted,
    fontSize: 13,
  },
  historyWrap: {
    background: theme.inputBg,
    border: `1px solid ${theme.border}`,
    borderRadius: 8,
    padding: 10,
    marginBottom: 10,
  },
  historyToggleBtn: {
    width: "100%",
    textAlign: "left",
    background: "transparent",
    border: "none",
    color: theme.textMuted,
    fontSize: 13,
    cursor: "pointer",
    padding: "2px 0",
  },
  historyList: {
    marginTop: 8,
    display: "flex",
    flexDirection: "column",
    gap: 8,
  },
  historyItem: {
    width: "100%",
    textAlign: "left",
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: 8,
    padding: "8px 10px",
    color: theme.text,
    cursor: "pointer",
  },
  historyTime: {
    color: theme.textLight,
    fontSize: 11,
    marginBottom: 2,
  },
  historyPreview: {
    color: theme.text,
    fontSize: 13,
  },
  btnTinyGhost: {
    background: "transparent",
    color: theme.textMuted,
    border: `1px solid ${theme.border}`,
    borderRadius: 6,
    padding: "4px 8px",
    fontSize: 12,
    cursor: "pointer",
  },
  textarea: {
    width: "100%", background: theme.inputBg, border: `1px solid ${theme.border}`,
    borderRadius: 8, padding: 12, color: theme.text, fontSize: 14,
    resize: "vertical", boxSizing: "border-box", marginBottom: 12,
  },
  btnPrimary: {
    background: theme.accent, color: "#fff", border: "none",
    padding: "10px 24px", borderRadius: 8, cursor: "pointer",
    fontSize: 14, fontWeight: "bold",
  },
  btnSecondary: {
    background: "transparent", color: theme.textMuted, border: `1px solid ${theme.border}`,
    padding: "10px 20px", borderRadius: 8, cursor: "pointer", fontSize: 13,
  },
  btnSmall: {
    background: theme.accentLight, color: theme.textMuted, border: `1px solid ${theme.border}`,
    padding: "6px 14px", borderRadius: 6, cursor: "pointer", fontSize: 13,
  },
  tagList: {
    display: "flex", flexWrap: "wrap", gap: 8, marginBottom: 12,
    minHeight: 32, padding: 6, borderRadius: 8,
    border: `2px dashed transparent`, transition: "all 0.15s ease",
  },
  tagListActive: {
    borderColor: theme.accent, background: theme.accentLight,
  },
  tag: {
    background: theme.accentLight, color: theme.text, padding: "6px 12px",
    borderRadius: 20, fontSize: 14, display: "flex", alignItems: "center", gap: 6,
  },
  tagX: { cursor: "pointer", color: theme.error, fontWeight: "bold", fontSize: 16 },
  stopwordDrop: {
    marginBottom: 12, padding: "12px 14px", borderRadius: 8,
    border: `2px dashed ${theme.border}`, background: theme.inputBg,
    transition: "all 0.15s ease",
  },
  stopwordDropActive: {
    borderColor: theme.accent, background: theme.accentLight,
  },
  stopwordTitle: {
    color: theme.textMuted, fontSize: 13, marginBottom: 6, textAlign: "center",
  },
  stopwordList: { display: "flex", flexWrap: "wrap", gap: 6, marginTop: 6 },
  stopwordChip: {
    background: "#fff", border: `1px solid ${theme.border}`,
    color: theme.textMuted, padding: "2px 10px",
    borderRadius: 12, fontSize: 12,
  },
  stopwordMsg: {
    marginTop: 6, fontSize: 12, color: theme.success, textAlign: "center",
  },
  addRow: { display: "flex", gap: 8 },
  addInput: {
    flex: 1, background: theme.inputBg, border: `1px solid ${theme.border}`,
    borderRadius: 8, padding: "8px 12px", color: theme.text, fontSize: 14,
  },
  statsRow: { display: "flex", gap: 16 },
  statBox: {
    background: theme.inputBg, borderRadius: 10, padding: "16px 24px",
    textAlign: "center", flex: 1, border: `1px solid ${theme.border}`,
  },
  statNum: { color: theme.accent, fontSize: 28, fontWeight: "bold" },
  statLabel: { color: theme.textLight, fontSize: 12, marginTop: 4 },
  sectionTitle: { color: theme.success, fontSize: 16, marginBottom: 12 },
  ingredientCard: {
    background: theme.inputBg, borderRadius: 10, padding: 16,
    marginBottom: 12, border: `1px solid ${theme.border}`,
  },
  ingredientHeader: {
    display: "flex", justifyContent: "space-between",
    alignItems: "center", marginBottom: 12,
  },
  ingredientName: { color: theme.text, fontSize: 16, fontWeight: "bold" },
  amountInput: {
    background: theme.cardBg, border: `1px solid ${theme.border}`,
    borderRadius: 6, padding: "6px 10px", color: theme.text, fontSize: 13,
    width: 180,
  },
  conversionHint: {
    marginBottom: 10,
    color: theme.textMuted,
    fontSize: 12,
    background: theme.accentLight,
    border: `1px solid ${theme.border}`,
    borderRadius: 6,
    padding: "6px 10px",
  },
  matchRow: {
    display: "grid", gridTemplateColumns: "1fr 1fr", gap: 12, marginBottom: 10,
  },
  matchCell: {
    background: theme.cardBg, borderRadius: 8, padding: 12,
    transition: "border-color 0.2s",
  },
  dbBadgeTW: {
    display: "inline-block", background: "#e3f2fd", color: "#1565c0",
    padding: "2px 10px", borderRadius: 12, fontSize: 11, marginBottom: 8,
  },
  dbBadgeEN: {
    display: "inline-block", background: "#f3e5f5", color: "#7b1fa2",
    padding: "2px 10px", borderRadius: 12, fontSize: 11, marginBottom: 8,
  },
  foodName: { color: theme.text, fontSize: 14, fontWeight: "bold" },
  foodCat: { color: theme.textLight, fontSize: 12, marginTop: 2 },
  scoreInfo: { color: theme.accent, fontSize: 11, marginTop: 3, fontWeight: "bold" },
  scoreParts: { color: theme.textLight, fontWeight: "normal", fontSize: 10 },
  kcal: { color: "#e65100", fontSize: 12, marginTop: 4 },
  kcalEstimated: { color: "#1565c0", fontSize: 12, marginTop: 2 },
  noData: { color: theme.textLight, fontSize: 12, fontStyle: "italic" },
  selectedBadge: {
    display: "inline-block", background: theme.successBg, color: theme.success,
    padding: "2px 8px", borderRadius: 8, fontSize: 10, marginTop: 6,
  },
  notFoundRow: {
    background: theme.errorBg, color: theme.error, padding: "10px 14px",
    borderRadius: 8, marginBottom: 6, border: `1px solid #ef9a9a`,
  },
};
