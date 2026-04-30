import { useState, useEffect, Fragment } from "react";
import theme from "../utils/theme";
import {
  extractIngredients,
  extractIngredientsWithAmounts,
  lookupIngredients,
  llmSelectMatches,
  calculateNutrition,
  saveRecipe,
  getGemmaStatus,
} from "../api/recipeApi";
import { searchFood } from "../api/foodApi";
import { lookupSynonym } from "../api/synonymDictApi";
import { createStopwordsBulk, deleteStopword } from "../api/stopwordsApi";
import { getNutrientFoods } from "../api/healthApi";
import { createDietLog } from "../api/dietApi";
import { getProfile } from "../api/authApi";
import {
  getDriTargets,
  ACTIVITY_LEVELS,
  ACTIVITY_DEFAULT,
  ACTIVITY_DESCRIPTIONS,
  getAvailableActivityLevels,
} from "../utils/driReferences";
import {
  buildDriRows,
  calculateDriGap,
  suggestedServing,
  STATUS_COLORS,
} from "../utils/driCalculations";
import LoadingSpinner from "../components/common/LoadingSpinner";
import ErrorMessage from "../components/common/ErrorMessage";
import ServingReferenceBox from "../components/common/ServingReferenceBox";
import NutritionDetailPanel, {
  NutritionPerItemTable,
} from "../components/recipe/NutritionDetailPanel";
import TaiwanFoodModal from "../components/food/TaiwanFoodModal";
import useAuthStore from "../store/authStore";

const RECIPE_INPUT_HISTORY_MAX = 100;
const RECIPE_INPUT_HISTORY_RECENT = 5;

/* ─── Nutrition → DRI mapping ─────────────────────────────────
 * HPA v8 DRI 的 key 直接用 DB 欄位名 (cal_per_100g / protein_per_100g / ...),
 * 與 nutrition API 回傳一致,故 intake 直接 pass-through,不需要翻譯表。
 * `modified_cal_per_100g` 合併到 `cal_per_100g` 採後者優先 (已修正熱量)。
 */
function mapNutritionToIntake(total) {
  const intake = {};
  for (const [key, value] of Object.entries(total || {})) {
    if (typeof value !== "number" || value <= 0) continue;
    if (key === "modified_cal_per_100g") {
      intake.cal_per_100g = value;
    } else {
      intake[key] = value;
    }
  }
  return intake;
}

/* ─── Amount conversion preview ─── */
function getConversionPreview(text) {
  const s = String(text || "").trim();
  if (!s) return "尚未輸入用量";
  if (/(g|gram|克|公克)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `${n}g（已是公克）` : s;
  }
  if (/(kg|公斤)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `${(n * 1000).toFixed(1)}g` : s;
  }
  if (/(大匙|tbsp)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `≈ ${(n * 15).toFixed(1)}g` : s;
  }
  if (/(茶匙|小匙|tsp)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `≈ ${(n * 5).toFixed(1)}g` : s;
  }
  if (/(顆|piece)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `≈ ${(n * 50).toFixed(1)}g` : s;
  }
  if (/(杯|cup)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `≈ ${(n * 240).toFixed(1)}g` : s;
  }
  if (/(碗)/i.test(s)) {
    const n = parseFloat(s);
    return n ? `≈ ${(n * 150).toFixed(1)}g` : s;
  }
  return `${s}（單位待估算）`;
}

/* ─── Candidate ranking ─── */
const candidateRank = (c) => {
  const score = Number(c?.score) || 0;
  const nutrition = c?.nutrition || {};
  const nonZero = Object.values(nutrition).filter((v) => Number(v) > 0).length;
  return score + nonZero * 0.01 + (c?.source === "taiwan_foods" ? 0.03 : 0);
};

/* ─── ProcessBlock (collapsible computation display) ─── */
function ProcessBlock({ title, children, defaultOpen = false }) {
  const [open, setOpen] = useState(defaultOpen);
  return (
    <div
      style={{
        margin: "12px 0",
        border: `1px solid ${theme.border}`,
        borderRadius: 8,
        overflow: "hidden",
      }}
    >
      <div
        onClick={() => setOpen(!open)}
        style={{
          padding: "8px 14px",
          background: theme.accentLight,
          cursor: "pointer",
          fontWeight: 600,
          fontSize: 13,
          color: theme.accent,
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <span>{title}</span>
        <span>{open ? "▲" : "▼"}</span>
      </div>
      {open && (
        <div
          style={{
            padding: "10px 14px",
            fontSize: 13,
            color: theme.textMuted,
            background: "#f9fcf9",
          }}
        >
          {children}
        </div>
      )}
    </div>
  );
}

/* ─── SectionCard (collapsible section with status) ─── */
function SectionCard({ number, title, status, summary, children, defaultExpanded = false }) {
  const [expanded, setExpanded] = useState(defaultExpanded);

  useEffect(() => {
    if (status === "active") setExpanded(true);
  }, [status]);

  const canToggle = status !== "locked";

  return (
    <div
      style={{
        marginBottom: 16,
        opacity: status === "locked" ? 0.4 : 1,
        pointerEvents: status === "locked" ? "none" : "auto",
      }}
    >
      <div
        onClick={() => canToggle && setExpanded(!expanded)}
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          padding: "14px 20px",
          background:
            status === "completed" ? theme.accentLight : theme.cardBg,
          border: `1px solid ${status === "active" ? theme.accent : theme.border}`,
          borderRadius: expanded ? "12px 12px 0 0" : 12,
          cursor: canToggle ? "pointer" : "default",
        }}
      >
        <div style={{ display: "flex", alignItems: "center", gap: 12 }}>
          <div
            style={{
              width: 28,
              height: 28,
              borderRadius: "50%",
              background:
                status === "completed"
                  ? theme.success
                  : status === "active"
                    ? theme.accent
                    : theme.border,
              color: "#fff",
              display: "flex",
              alignItems: "center",
              justifyContent: "center",
              fontSize: 14,
              fontWeight: 700,
            }}
          >
            {status === "completed" ? "✓" : number}
          </div>
          <span style={{ fontWeight: 600, color: theme.text, fontSize: 15 }}>
            {title}
          </span>
          {status === "completed" && summary && !expanded && (
            <span
              style={{ color: theme.textMuted, fontSize: 13, marginLeft: 8 }}
            >
              — {summary}
            </span>
          )}
        </div>
        {canToggle && (
          <span style={{ color: theme.textMuted }}>
            {expanded ? "▲" : "▼"}
          </span>
        )}
      </div>
      {expanded && status !== "locked" && (
        <div
          style={{
            padding: 20,
            background: theme.cardBg,
            border: `1px solid ${status === "active" ? theme.accent : theme.border}`,
            borderTop: "none",
            borderRadius: "0 0 12px 12px",
          }}
        >
          {children}
        </div>
      )}
    </div>
  );
}

/* ─── Progress Indicator ─── */
const SECTION_NAMES = [
  "個人資訊",
  "食譜分析",
  "營養評估",
  "改善建議",
  "食材查詢",
  "記錄儲存",
];

function ProgressIndicator({ getSectionStatus }) {
  return (
    <div style={styles.progressBar}>
      {SECTION_NAMES.map((name, i) => {
        const n = i + 1;
        const st = getSectionStatus(n);
        const isCompleted = st === "completed";
        const isActive = st === "active";
        return (
          <div key={n} style={styles.progressStep}>
            <div
              style={{
                ...styles.progressCircle,
                background: isCompleted
                  ? theme.success
                  : isActive
                    ? theme.accent
                    : st === "unlocked"
                      ? theme.cardBg
                      : theme.border,
                color: isCompleted || isActive ? "#fff" : theme.textMuted,
                border: `2px solid ${isCompleted ? theme.success : isActive ? theme.accent : theme.border}`,
              }}
            >
              {isCompleted ? "✓" : n}
            </div>
            <span
              style={{
                fontSize: 11,
                color: isActive ? theme.accent : theme.textMuted,
                fontWeight: isActive ? 700 : 400,
                marginTop: 4,
                textAlign: "center",
              }}
            >
              {name}
            </span>
            {i < 5 && (
              <div
                style={{
                  position: "absolute",
                  top: 14,
                  left: "calc(50% + 18px)",
                  width: "calc(100% - 36px)",
                  height: 2,
                  background: isCompleted ? theme.success : theme.borderLight,
                }}
              />
            )}
          </div>
        );
      })}
    </div>
  );
}

function useMediaQuery(query) {
  const [matches, setMatches] = useState(() =>
    typeof window !== "undefined" ? window.matchMedia(query).matches : false
  );
  useEffect(() => {
    const mq = window.matchMedia(query);
    const handler = (e) => setMatches(e.matches);
    mq.addEventListener("change", handler);
    return () => mq.removeEventListener("change", handler);
  }, [query]);
  return matches;
}

/* ═══════════════════════════════════════════════
   UnifiedAnalysisPage — Main Component
   ═══════════════════════════════════════════════ */
export default function UnifiedAnalysisPage() {
  const isMobile = useMediaQuery("(max-width: 600px)");
  const { user } = useAuthStore();
  const userId = user?.id || "guest";
  const historyKey = `recipe_input_history:${userId}`;
  const historyEnabledKey = `recipe_input_history_enabled:${userId}`;

  /* ─── Section status tracking ─── */
  const [personalInfoDone, setPersonalInfoDone] = useState(false);
  const [recipeDone, setRecipeDone] = useState(false);
  const [assessmentDone, setAssessmentDone] = useState(false);
  const [improvementDone, setImprovementDone] = useState(false);

  /* ─── Section 1: Personal Info ─── */
  const [age, setAge] = useState("");
  const [sex, setSex] = useState("male");
  const [activityLevel, setActivityLevel] = useState(() => {
    try {
      return localStorage.getItem("dri_activity_level") || ACTIVITY_DEFAULT;
    } catch {
      return ACTIVITY_DEFAULT;
    }
  });
  const [driInfo, setDriInfo] = useState(null);

  /* ─── Section 2: Recipe Analysis ─── */
  const [recipeStep, setRecipeStep] = useState(1);
  const [recipeText, setRecipeText] = useState("");
  const [servings, setServings] = useState(1);
  const [servingsHint, setServingsHint] = useState("");
  const [saveInputHistory, setSaveInputHistory] = useState(true);
  const [inputHistory, setInputHistory] = useState([]);
  const [historyCollapsed, setHistoryCollapsed] = useState(true);
  const [showAllHistory, setShowAllHistory] = useState(false);
  const [ingredients, setIngredients] = useState([]);
  const [newIngredient, setNewIngredient] = useState("");
  const [matchLimit, setMatchLimit] = useState(20);
  const [results, setResults] = useState(null);
  const [selectedMatches, setSelectedMatches] = useState({});
  const [llmMatchReasons, setLlmMatchReasons] = useState({});
  const [llmSelecting, setLlmSelecting] = useState(false);
  const [amounts, setAmounts] = useState({});
  const [parsedAmounts, setParsedAmounts] = useState({});
  const [nutritionResult, setNutritionResult] = useState(null);

  // 拖曳 → 停用詞
  const [stopwordDropActive, setStopwordDropActive] = useState(false);
  const [tagDropActive, setTagDropActive] = useState(false);
  const [recentStopwords, setRecentStopwords] = useState([]);
  const [stopwordMsg, setStopwordMsg] = useState("");

  const handleDropToStopword = async (e) => {
    e.preventDefault();
    setStopwordDropActive(false);
    const word = (e.dataTransfer.getData("text/plain") || "").trim();
    if (!word) return;
    const snapshot = ingredients;
    setIngredients(ingredients.filter((x) => x !== word));
    try {
      await createStopwordsBulk([word], "user_flag", "unified_analysis");
      setRecentStopwords((prev) => (prev.includes(word) ? prev : [...prev, word]));
      setStopwordMsg(`已加入停用詞:${word}`);
      setTimeout(() => setStopwordMsg(""), 2500);
    } catch (err) {
      setIngredients(snapshot);
      setStopwordMsg(err?.response?.data?.detail || "加入停用詞失敗");
      setTimeout(() => setStopwordMsg(""), 2500);
    }
  };

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

  /* ─── Section 3: Assessment ─── */
  const [driRows, setDriRows] = useState([]);
  const [intake, setIntake] = useState({});
  const [gapResults, setGapResults] = useState([]);

  /* ─── Section 4: Improvement ─── */
  const [foodRecs, setFoodRecs] = useState({});
  const [foodRecLoading, setFoodRecLoading] = useState(false);

  /* ─── Section 3: DRI 表格內嵌推薦食物展開狀態（key = field） ─── */
  const [expandedDriField, setExpandedDriField] = useState(null);

  /* ─── Section 5: Food Search ─── */
  const [foodQuery, setFoodQuery] = useState("");
  const [foodResults, setFoodResults] = useState([]);
  const [synonymResult, setSynonymResult] = useState(null);
  const [selectedFoodId, setSelectedFoodId] = useState(null);

  /* ─── Section 6: Save ─── */
  const [saveMsg, setSaveMsg] = useState("");
  const [logMsg, setLogMsg] = useState("");

  /* ─── Shared ─── */
  const [recipeLoading, setRecipeLoading] = useState(false);
  const [searchLoading, setSearchLoading] = useState(false);
  const [error, setError] = useState("");
  // Gemma 雙軌
  const [gemmaAvailable, setGemmaAvailable] = useState(null);
  const [gemmaCorrections, setGemmaCorrections] = useState([]);
  const [lookupWarnings, setLookupWarnings] = useState([]);

  /* ─── Auto-fill profile ─── */
  useEffect(() => {
    getProfile()
      .then((p) => {
        if (p?.age) setAge(String(p.age));
        if (p?.gender) setSex(p.gender);
      })
      .catch(() => {});
    getGemmaStatus()
      .then((s) => setGemmaAvailable(s?.available ?? false))
      .catch(() => setGemmaAvailable(false));
  }, []);

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

  /* ─── Auto-recalculate DRI gap when intake changes ─── */
  useEffect(() => {
    if (driInfo && intake && Object.keys(intake).length > 0) {
      const rows = buildDriRows(
        driInfo?.targets || {},
        driInfo?.upperLimits || {}
      );
      const gaps = calculateDriGap(intake, rows);
      setGapResults(gaps);
    }
  }, [intake, driInfo]);

  /* ─── Section status logic ─── */
  const getSectionStatus = (n) => {
    if (n === 1) return personalInfoDone ? "completed" : "active";
    if (n === 2)
      return !personalInfoDone ? "locked" : recipeDone ? "completed" : "active";
    if (n === 3)
      return !recipeDone ? "locked" : assessmentDone ? "completed" : "active";
    if (n === 4)
      return !assessmentDone
        ? "locked"
        : improvementDone
          ? "completed"
          : "active";
    if (n === 5) return "unlocked";
    if (n === 6) return !recipeDone ? "locked" : "unlocked";
    return "locked";
  };

  /* ═══════════════════════════════════════════
     Section 1: Personal Info Handlers
     ═══════════════════════════════════════════ */
  const handleConfirmPersonal = () => {
    const ageNum = Number(age);
    if (!ageNum || ageNum < 1 || ageNum > 120) {
      setError("請輸入有效年齡（1-120）");
      return;
    }
    setError("");
    const info = getDriTargets({ age: ageNum, gender: sex, activityLevel });
    setDriInfo(info);
    try {
      localStorage.setItem("dri_activity_level", info.activityLevel || ACTIVITY_DEFAULT);
    } catch { /* ignore */ }
    setPersonalInfoDone(true);
  };

  /* ═══════════════════════════════════════════
     Section 2: Recipe Analysis Handlers
     ═══════════════════════════════════════════ */
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

  const handleAutoDetectServings = () => {
    const detected = detectServingsFromText(recipeText || "");
    if (!detected) {
      setServingsHint("尚未偵測到份數關鍵字");
      return;
    }
    setServings(detected);
    setServingsHint(`已自動更新為 ${detected} 份`);
  };

  const handleExtract = async () => {
    if (!recipeText.trim()) {
      setError("請輸入食譜內容");
      return;
    }
    persistHistory(recipeText);
    setRecipeLoading(true);
    setError("");
    setGemmaCorrections([]);
    try {
      let data;
      try {
        data = await extractIngredientsWithAmounts(recipeText);
      } catch {
        data = await extractIngredients(recipeText);
      }
      const items = data?.ingredients || data || [];
      const names = items.map((it) =>
        typeof it === "string" ? it : it.name || it.ingredient || ""
      ).filter(Boolean);
      // Pre-fill amounts from extracted data
      const amountMap = {};
      items.forEach((it) => {
        if (typeof it !== "string" && it.amount) {
          const name = it.name || it.ingredient || "";
          if (name) amountMap[name] = it.amount;
        }
      });
      setIngredients(names);
      setAmounts(amountMap);
      setParsedAmounts({});
      // Gemma 校正資訊
      if (data?.corrections) setGemmaCorrections(data.corrections);
      if (data?.gemma_available !== undefined) setGemmaAvailable(data.gemma_available);
      setRecipeStep(2);
    } catch (e) {
      setError(e?.response?.data?.detail || "食材解析失敗");
    } finally {
      setRecipeLoading(false);
    }
  };

  const handleLookup = async () => {
    if (ingredients.length === 0) {
      setError("至少需要一個食材");
      return;
    }
    setRecipeLoading(true);
    setError("");
    setLookupWarnings([]);
    setLlmMatchReasons({});
    try {
      const data = await lookupIngredients(ingredients, matchLimit);
      const resultList = data.results || [];
      if (data.warnings) setLookupWarnings(data.warnings);
      if (data.gemma_available !== undefined) setGemmaAvailable(data.gemma_available);
      setResults(resultList);

      // Build flat candidate lists per ingredient for LLM selection
      const candidateMap = {};
      resultList.forEach((r) => {
        const candidates = [];
        (r.matches || []).forEach((m) => {
          if (m?.tw) candidates.push({ ...m.tw, source: m.tw.source || "taiwan_foods" });
          if (m?.en) candidates.push({ ...m.en, source: m.en.source || "foodb" });
        });
        candidateMap[r.ingredient] = candidates;
      });

      // Call LLM to select best match per ingredient
      setLlmSelecting(true);
      const llmPayload = resultList.map((r) => ({
        ingredient: r.ingredient,
        amount: amounts[r.ingredient] || "",
        candidates: (candidateMap[r.ingredient] || []).map((c) => ({
          id: c.id,
          name: c.name || c.food_name || "",
          source: c.source || "",
          category: c.category || "",
          score: c.score ?? null,
        })),
      }));

      let autoSelect = {};
      const reasons = {};
      try {
        const llmData = await llmSelectMatches(llmPayload, recipeText?.slice(0, 500) || "");
        const selections = llmData.selections || [];
        selections.forEach((sel) => {
          const ing = sel.ingredient;
          const cands = candidateMap[ing] || [];
          reasons[ing] = sel.reasoning || "";
          if (sel.selected_index >= 0 && sel.selected_index < cands.length) {
            const best = cands[sel.selected_index];
            autoSelect[ing] = { food_id: best.id, source: best.source, food_name: best.name, ...best };
          }
        });
      } catch {
        // LLM 不可用，fallback 到 candidateRank 排序
        resultList.forEach((r) => {
          const cands = candidateMap[r.ingredient] || [];
          if (cands.length > 0) {
            cands.sort((a, b) => candidateRank(b) - candidateRank(a));
            const best = cands[0];
            autoSelect[r.ingredient] = { food_id: best.id, source: best.source, food_name: best.name, ...best };
            reasons[r.ingredient] = "LLM 不可用，使用預設排序";
          }
        });
      }
      setLlmSelecting(false);
      setLlmMatchReasons(reasons);
      setSelectedMatches(autoSelect);
      setRecipeStep(3);
    } catch (e) {
      setError(e?.response?.data?.detail || "食材查詢失敗");
      setLlmSelecting(false);
    } finally {
      setRecipeLoading(false);
    }
  };

  const handleCalculateNutrition = async () => {
    setRecipeLoading(true);
    setError("");
    try {
      const ingredientPayload = ingredients
        .filter((name) => selectedMatches[name])
        .map((name) => {
          const match = selectedMatches[name];
          const amountRaw = amounts[name] || "100g";
          return {
            ingredient: name,
            food_id: match.food_id || match.id,
            source: match.source,
            food_name: match.food_name || match.name,
            amount: amountRaw,
          };
        });
      const data = await calculateNutrition(ingredientPayload);
      setNutritionResult(data);
      setRecipeStep(4);
      setRecipeDone(true);
      // Auto-trigger section 3
      setTimeout(() => runAssessment(data), 300);
    } catch (e) {
      setError(e?.response?.data?.detail || "營養計算失敗");
    } finally {
      setRecipeLoading(false);
    }
  };

  /* ═══════════════════════════════════════════
     Section 3: Assessment
     ═══════════════════════════════════════════ */
  const runAssessment = (nutResult) => {
    const ageNum = Number(age);
    const info = driInfo || getDriTargets({ age: ageNum, gender: sex, activityLevel });
    const rows = buildDriRows(info.targets, info.upperLimits);
    const mapped = mapNutritionToIntake(
      (nutResult || nutritionResult)?.total || {}
    );
    const gaps = calculateDriGap(mapped, rows);
    setDriRows(rows);
    setIntake(mapped);
    setGapResults(gaps);
    setAssessmentDone(true);
    // Auto-trigger section 4
    setTimeout(() => runImprovements(gaps), 300);
  };

  const handleRecalculate = () => {
    const rows = buildDriRows(
      driInfo?.targets || {},
      driInfo?.upperLimits || {}
    );
    const gaps = calculateDriGap(intake, rows);
    setGapResults(gaps);
  };

  /* ═══════════════════════════════════════════
     Section 4: Improvement Recommendations
     ═══════════════════════════════════════════ */
  const runImprovements = async (gaps) => {
    const deficient = (gaps || gapResults).filter(
      (g) => g.status === "deficient" || g.status === "low"
    );
    if (deficient.length === 0) {
      setImprovementDone(true);
      return;
    }
    setFoodRecLoading(true);
    try {
      const recs = {};
      for (const g of deficient) {
        try {
          const foods = await getNutrientFoods(g.field, 10);
          recs[g.field] = { nutrient: g.nutrient, gap: g.gap, unit: g.unit, foods: foods || [] };
        } catch {
          recs[g.field] = { nutrient: g.nutrient, gap: g.gap, unit: g.unit, foods: [] };
        }
      }
      setFoodRecs(recs);
    } catch {
      /* ignore */
    } finally {
      setFoodRecLoading(false);
      setImprovementDone(true);
    }
  };

  /* ═══════════════════════════════════════════
     Section 5: Food Search
     ═══════════════════════════════════════════ */
  const handleFoodSearch = async () => {
    if (!foodQuery.trim()) return;
    setSearchLoading(true);
    setError("");
    setFoodResults([]);
    setSynonymResult(null);
    try {
      const [foods, syn] = await Promise.all([
        searchFood(foodQuery).catch(() => []),
        lookupSynonym(foodQuery).catch(() => null),
      ]);
      setFoodResults(Array.isArray(foods) ? foods : foods?.candidates || foods?.results || []);
      setSynonymResult(syn);
    } catch (e) {
      setError(e?.response?.data?.detail || "搜尋失敗");
    } finally {
      setSearchLoading(false);
    }
  };

  /* ═══════════════════════════════════════════
     Section 6: Save & Log
     ═══════════════════════════════════════════ */
  const handleSaveRecipe = async () => {
    setSaveMsg("");
    try {
      await saveRecipe({
        recipe_name: (recipeText || "").slice(0, 50) || "未命名食譜",
        recipe_content: recipeText,
        servings,
        nutrition: nutritionResult?.total || {},
        nutrition_detail: nutritionResult?.nutrition_detail || {},
        ingredients: ingredients.filter(name => selectedMatches[name]).map(name => {
          const match = selectedMatches[name];
          return {
            name,
            food_id: match.food_id || match.id,
            source: match.source,
            food_name: match.food_name || match.name,
            amount: amounts[name] || "100g",
          };
        }),
      });
      setSaveMsg("食譜已儲存成功！");
    } catch (e) {
      setSaveMsg("儲存失敗：" + (e?.response?.data?.detail || e.message));
    }
  };

  const handleCreateDietLog = async () => {
    setLogMsg("");
    try {
      const total = nutritionResult?.total || {};
      await createDietLog({
        food_name: (recipeText || "").slice(0, 50) || "未命名食譜",
        amount_g: total.cal_per_100g || total.modified_cal_per_100g || 0,
        meal_type: "snack",
      });
      setLogMsg("已加入今日飲食記錄！");
    } catch (e) {
      setLogMsg("記錄失敗：" + (e?.response?.data?.detail || e.message));
    }
  };

  /* ═══════════════════════════════════════════
     Summaries
     ═══════════════════════════════════════════ */
  const section1Summary = personalInfoDone
    ? `${age}歲 ${sex === "male" ? "男" : "女"}性`
    : "";

  const section2Summary = recipeDone && nutritionResult?.total
    ? `熱量 ${Math.round(nutritionResult.total.cal_per_100g || nutritionResult.total.modified_cal_per_100g || 0)} kcal | 蛋白 ${Math.round(nutritionResult.total.protein_per_100g || 0)}g | 碳水 ${Math.round(nutritionResult.total.carbon_per_100g || 0)}g | 脂肪 ${Math.round(nutritionResult.total.fats_per_100g || 0)}g`
    : "";

  const section3Summary = assessmentDone
    ? (() => {
        const adequate = gapResults.filter((g) => g.status === "adequate").length;
        const lacking = gapResults.filter(
          (g) => g.status === "deficient" || g.status === "low"
        ).length;
        const excess = gapResults.filter((g) => g.status === "excess").length;
        const near = gapResults.filter((g) => g.status === "near_limit").length;
        const parts = [`${adequate} 充足`, `${lacking} 不足`];
        if (near > 0) parts.push(`${near} 接近上限`);
        if (excess > 0) parts.push(`${excess} 超標`);
        return parts.join(" / ");
      })()
    : "";

  const section4Summary = improvementDone
    ? `${Object.keys(foodRecs).length} 個營養素推薦食物`
    : "";

  /* ═══════════════════════════════════════════
     RENDER
     ═══════════════════════════════════════════ */
  return (
    <div style={{ ...styles.page, ...(isMobile && { padding: "12px 8px" }) }}>
      <h1 style={styles.pageTitle}>統一營養分析</h1>
      <p style={styles.pageSubtitle}>
        從個人資訊到食譜分析、營養評估、改善建議，一站式完成
      </p>

      <ProgressIndicator getSectionStatus={getSectionStatus} />

      {error && <ErrorMessage message={error} />}

      {/* ═══ Section 1: Personal Info ═══ */}
      <SectionCard
        number={1}
        title="個人資訊"
        status={getSectionStatus(1)}
        summary={section1Summary}
      >
        <div style={styles.formRow}>
          <div style={styles.formGroup}>
            <label style={styles.label}>年齡</label>
            <input
              type="number"
              min={1}
              max={120}
              value={age}
              onChange={(e) => setAge(e.target.value)}
              placeholder="例：25"
              style={styles.input}
            />
          </div>
          <div style={styles.formGroup}>
            <label style={styles.label}>性別</label>
            <select
              value={sex}
              onChange={(e) => {
                setSex(e.target.value);
                const a = Number(age);
                if (a >= 1 && a <= 120) {
                  const avail = getAvailableActivityLevels(a, e.target.value);
                  if (!avail.includes(activityLevel)) setActivityLevel(ACTIVITY_DEFAULT);
                }
              }}
              style={styles.input}
            >
              <option value="male">男性</option>
              <option value="female">女性</option>
            </select>
          </div>
          <div style={styles.formGroup}>
            <label style={styles.label}>活動強度</label>
            <select
              value={activityLevel}
              onChange={(e) => setActivityLevel(e.target.value)}
              style={styles.input}
              title={ACTIVITY_DESCRIPTIONS[activityLevel] || ""}
            >
              {ACTIVITY_LEVELS.map((lvl) => {
                const a = Number(age);
                const avail = a >= 1 && a <= 120
                  ? getAvailableActivityLevels(a, sex)
                  : ACTIVITY_LEVELS;
                const enabled = avail.includes(lvl);
                return (
                  <option key={lvl} value={lvl} disabled={!enabled}>
                    {lvl}{!enabled ? "（HPA 未提供）" : ""}
                  </option>
                );
              })}
            </select>
            <div style={{ fontSize: 11, color: theme.textMuted, marginTop: 2 }}>
              {ACTIVITY_DESCRIPTIONS[activityLevel] || ""}
            </div>
          </div>
        </div>
        <button
          onClick={handleConfirmPersonal}
          style={styles.btnPrimary}
          disabled={!age}
        >
          確認
        </button>
        {driInfo && (
          <ProcessBlock title="計算過程：DRI 查詢">
            <p>
              根據年齡 <b>{age}</b> 歲 + 性別{" "}
              <b>{sex === "male" ? "男" : "女"}</b> → 查詢國人膳食營養素參考攝取量第八版
              → 對應群組：<b>{driInfo.ageBand}</b>
            </p>
            <p style={{ marginTop: 4 }}>
              活動強度：<b>{driInfo.activityLevel}</b>
              {driInfo.activityLevelRequested !== driInfo.activityLevel
                ? `（您選的「${driInfo.activityLevelRequested}」HPA 未提供，已回退預設）`
                : ""}
            </p>
            {driInfo.anthropometry && (
              <p style={{ marginTop: 4, color: theme.textMuted }}>
                HPA 第八版標準參考身材：身高 <b>{driInfo.anthropometry.height_cm} cm</b>、
                體重 <b>{driInfo.anthropometry.weight_kg} kg</b>（用於計算建議攝取量的假設體型）
              </p>
            )}
          </ProcessBlock>
        )}
      </SectionCard>

      {/* ═══ Section 2: Recipe Analysis ═══ */}
      <SectionCard
        number={2}
        title="食譜分析"
        status={getSectionStatus(2)}
        summary={section2Summary}
      >
        {/* Sub-step indicator */}
        <div style={styles.subStepBar}>
          {["輸入食譜", "確認食材", "選擇匹配", "營養結果"].map((label, i) => (
            <div
              key={i}
              style={{
                ...styles.subStep,
                color: recipeStep > i + 1 ? theme.success : recipeStep === i + 1 ? theme.accent : theme.textMuted,
                fontWeight: recipeStep === i + 1 ? 700 : 400,
              }}
            >
              <span
                style={{
                  ...styles.subStepDot,
                  background: recipeStep > i + 1 ? theme.success : recipeStep === i + 1 ? theme.accent : theme.border,
                }}
              />
              {label}
            </div>
          ))}
        </div>

        {/* Sub-step 1: Input */}
        {recipeStep === 1 && (
          <div>
            <label style={styles.label}>食譜內容</label>
            <div style={styles.historyConfigRow}>
              <label style={styles.checkboxLabel}>
                <input
                  type="checkbox"
                  checked={saveInputHistory}
                  onChange={toggleHistoryEnabled}
                />
                儲存輸入紀錄
              </label>
              {inputHistory.length > 0 && (
                <button
                  type="button"
                  style={styles.btnTinyGhost}
                  onClick={clearHistory}
                >
                  清空紀錄
                </button>
              )}
            </div>
            {saveInputHistory && inputHistory.length > 0 && (
              <div style={styles.historyWrap}>
                <button
                  type="button"
                  style={styles.historyToggleBtn}
                  onClick={() => setHistoryCollapsed((v) => !v)}
                >
                  {historyCollapsed ? "▶" : "▼"} 輸入紀錄（最近 {Math.min(RECIPE_INPUT_HISTORY_RECENT, inputHistory.length)} 筆）
                </button>
                {!historyCollapsed && (
                  <div style={styles.historyList}>
                    {(showAllHistory ? inputHistory : inputHistory.slice(0, RECIPE_INPUT_HISTORY_RECENT)).map((h) => (
                      <button
                        key={h.id}
                        type="button"
                        style={styles.historyItem}
                        onClick={() => applyHistoryText(h.text)}
                      >
                        <div style={styles.historyTime}>{formatHistoryTime(h.createdAt)}</div>
                        <div style={styles.historyPreview}>{toPreview(h.text)}</div>
                      </button>
                    ))}
                    {inputHistory.length > RECIPE_INPUT_HISTORY_RECENT && (
                      <button
                        type="button"
                        style={styles.btnTinyGhost}
                        onClick={() => setShowAllHistory((v) => !v)}
                      >
                        {showAllHistory ? "收起舊紀錄" : "顯示更多以往紀錄"}
                      </button>
                    )}
                  </div>
                )}
              </div>
            )}
            <textarea
              value={recipeText}
              onChange={(e) => setRecipeText(e.target.value)}
              placeholder="請貼上食譜文字，例如：雞胸肉 300g、洋蔥 1顆、橄欖油 2大匙..."
              rows={6}
              style={{ ...styles.input, resize: "vertical", minHeight: 120 }}
            />
            <div style={styles.formRow}>
              <div style={styles.formGroup}>
                <label style={styles.label}>份數</label>
                <input
                  type="number"
                  min={1}
                  value={servings}
                  onChange={(e) => setServings(Number(e.target.value) || 1)}
                  style={{ ...styles.input, width: 80 }}
                />
              </div>
              <button
                type="button"
                onClick={handleAutoDetectServings}
                style={styles.btnSecondary}
                disabled={!recipeText.trim()}
              >
                自動判斷份數
              </button>
            </div>
            {servingsHint && (
              <div style={{ color: theme.textMuted, fontSize: 12, marginBottom: 8 }}>
                {servingsHint}
              </div>
            )}
            <button
              onClick={handleExtract}
              style={styles.btnPrimary}
              disabled={recipeLoading || !recipeText.trim()}
            >
              {recipeLoading ? "解析中..." : "解析食材"}
            </button>
            {recipeLoading && <LoadingSpinner text="正在解析食材..." />}
          </div>
        )}

        {/* Sub-step 2: Confirm Ingredients */}
        {recipeStep === 2 && (
          <div>
            <ProcessBlock title="計算過程：食材提取" defaultOpen>
              <p>
                輸入文字 → 正則表達式提取 → 取得{" "}
                <b>{ingredients.length}</b> 個食材關鍵字
                {gemmaAvailable && (
                  <span style={{ marginLeft: 8, color: theme.success, fontSize: 12 }}>
                    ● AI 已校正
                  </span>
                )}
                {gemmaAvailable === false && (
                  <span style={{ marginLeft: 8, color: theme.textMuted, fontSize: 12 }}>
                    ○ AI 未啟用
                  </span>
                )}
              </p>
            </ProcessBlock>
            {gemmaCorrections.length > 0 && (
              <div style={{
                marginBottom: 10, padding: "8px 12px", borderRadius: 8,
                background: theme.successBg, border: `1px solid ${theme.successBorder || theme.success}`,
                fontSize: 13,
              }}>
                <b style={{ color: theme.success }}>AI 校正</b>
                {gemmaCorrections.map((c, i) => (
                  <span key={i} style={{ marginLeft: 8, color: theme.text }}>
                    {c.action === "add" && `＋${c.name}`}
                    {c.action === "remove" && `－${c.name}`}
                    {c.action === "rename" && `${c.original}→${c.corrected}`}
                    {c.reason && <span style={{ color: theme.textMuted, marginLeft: 4 }}>({c.reason})</span>}
                  </span>
                ))}
              </div>
            )}
            <label style={styles.label}>已識別食材（可編輯）</label>
            <div
              style={{
                ...styles.tagList,
                minHeight: 32, padding: 6, borderRadius: 8,
                border: `2px dashed ${tagDropActive ? theme.accent : "transparent"}`,
                background: tagDropActive ? theme.accentLight : "transparent",
                transition: "all 0.15s ease",
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
                  style={styles.tag}
                  draggable
                  onDragStart={(e) => {
                    e.dataTransfer.effectAllowed = "move";
                    e.dataTransfer.setData("text/plain", ing);
                  }}
                  title="拖到下方停用詞區 → 以後自動略過"
                >
                  {ing}
                  <span
                    style={styles.tagX}
                    onClick={() =>
                      setIngredients(ingredients.filter((_, j) => j !== i))
                    }
                  >
                    ×
                  </span>
                </span>
              ))}
              {ingredients.length === 0 && tagDropActive && (
                <div style={{ color: theme.textMuted, fontSize: 13 }}>拖回此區 → 從停用詞移除</div>
              )}
            </div>
            {/* 停用詞拖曳區 (雙向) */}
            <div
              style={{
                marginTop: 8,
                padding: "12px 14px",
                borderRadius: 8,
                border: `2px dashed ${
                  stopwordDropActive ? theme.accent : theme.border
                }`,
                background: stopwordDropActive
                  ? theme.accentLight
                  : theme.inputBg,
                transition: "all 0.15s ease",
              }}
              onDragOver={(e) => {
                if (e.dataTransfer.types.includes("text/plain")
                    && !e.dataTransfer.types.includes("application/x-stopword")) {
                  e.preventDefault();
                  setStopwordDropActive(true);
                }
              }}
              onDragLeave={() => setStopwordDropActive(false)}
              onDrop={handleDropToStopword}
            >
              <div
                style={{
                  color: theme.textMuted,
                  fontSize: 13,
                  textAlign: "center",
                  marginBottom: 6,
                }}
              >
                拖食材到這裡 → 加入停用詞 · 拖下方 chip 回去 → 移除停用詞
              </div>
              {recentStopwords.length > 0 && (
                <div style={{ display: "flex", flexWrap: "wrap", gap: 6 }}>
                  {recentStopwords.map((w) => (
                    <span
                      key={w}
                      draggable
                      onDragStart={(e) => {
                        e.dataTransfer.effectAllowed = "move";
                        e.dataTransfer.setData("application/x-stopword", w);
                        e.dataTransfer.setData("text/plain", w);
                      }}
                      title="拖回食材區 → 從停用詞移除"
                      style={{
                        background: "#fff",
                        border: `1px solid ${theme.border}`,
                        color: theme.textMuted,
                        padding: "2px 10px",
                        borderRadius: 12,
                        fontSize: 12,
                        cursor: "grab",
                      }}
                    >
                      {w}
                    </span>
                  ))}
                </div>
              )}
              {stopwordMsg && (
                <div
                  style={{
                    marginTop: 6,
                    fontSize: 12,
                    color: theme.success,
                    textAlign: "center",
                  }}
                >
                  {stopwordMsg}
                </div>
              )}
            </div>
            <div style={{ display: "flex", gap: 8, marginTop: 12 }}>
              <input
                value={newIngredient}
                onChange={(e) => setNewIngredient(e.target.value)}
                onKeyDown={(e) => {
                  if (e.key === "Enter" && newIngredient.trim()) {
                    setIngredients([...ingredients, newIngredient.trim()]);
                    setNewIngredient("");
                  }
                }}
                placeholder="新增食材..."
                style={{ ...styles.input, flex: 1 }}
              />
              <button
                onClick={() => {
                  if (newIngredient.trim()) {
                    setIngredients([...ingredients, newIngredient.trim()]);
                    setNewIngredient("");
                  }
                }}
                style={styles.btnSecondary}
              >
                新增
              </button>
            </div>
            <div style={{ marginTop: 12 }}>
              <label style={styles.label}>每項匹配數量上限</label>
              <select
                value={matchLimit}
                onChange={(e) => setMatchLimit(Number(e.target.value))}
                style={{ ...styles.input, width: 100 }}
              >
                {[3, 5, 8, 12, 20].map((n) => (
                  <option key={n} value={n}>
                    {n}
                  </option>
                ))}
              </select>
            </div>
            <div style={{ marginTop: 16, display: "flex", gap: 8 }}>
              <button
                onClick={() => setRecipeStep(1)}
                style={styles.btnSecondary}
              >
                返回
              </button>
              <button
                onClick={handleLookup}
                style={styles.btnPrimary}
                disabled={recipeLoading || ingredients.length === 0}
              >
                {recipeLoading
                  ? llmSelecting ? "AI 判斷最佳匹配中..." : "查詢中..."
                  : "開始查詢營養資訊"}
              </button>
            </div>
            {recipeLoading && (
              <LoadingSpinner text={llmSelecting ? "AI 正在為每種食材從候選中挑選最佳匹配..." : "正在查詢食品資料庫..."} />
            )}
          </div>
        )}

        {/* Sub-step 3: Match Selection */}
        {recipeStep === 3 && results && (
          <div>
            <ProcessBlock title="計算過程：食材匹配 + AI 選擇" defaultOpen>
              <p>
                食材 → 同義詞擴展 + AI 搜尋詞擴展 → 台灣食品資料庫 pg_trgm 相似度搜尋
                → FooDB 搜尋 → 每種食材取前 {matchLimit} 筆候選 → <b>LLM 逐一判斷最佳匹配</b>
              </p>
              {Object.keys(llmMatchReasons).length > 0 && (
                <div style={{ marginTop: 8, fontSize: 12, color: theme.textMuted }}>
                  {Object.entries(llmMatchReasons).map(([ing, reason]) => (
                    <div key={ing}><b>{ing}</b>：{reason}</div>
                  ))}
                </div>
              )}
            </ProcessBlock>

            {lookupWarnings.length > 0 && (
              <div style={{
                marginBottom: 10, padding: "8px 12px", borderRadius: 8,
                background: theme.warningBg, border: `1px solid ${theme.warning}`,
                fontSize: 13,
              }}>
                <b style={{ color: theme.warning }}>AI 提醒</b>
                {lookupWarnings.map((w, i) => (
                  <div key={i} style={{ marginTop: 4, color: theme.text }}>
                    <b>{w.ingredient}</b>：{w.note}
                  </div>
                ))}
              </div>
            )}

            {(Array.isArray(results) ? results : []).map((r) => {
              const ingr = r.ingredient;
              const twFoods = (r.matches || [])
                .map((m) => m.tw)
                .filter(Boolean)
                .map((c) => ({ ...c, source: c.source || "taiwan_foods" }));
              const fooFoods = (r.matches || [])
                .map((m) => m.en)
                .filter(Boolean)
                .map((c) => ({ ...c, source: c.source || "foodb" }));
              const selected = selectedMatches[ingr];

              return (
                <div key={ingr} style={styles.matchSection}>
                  <div style={styles.matchHeader}>
                    <b>{ingr}</b>
                    {selected && (
                      <span style={styles.selectedBadge}>
                        已選：{selected.name || selected.food_name}
                      </span>
                    )}
                    {llmMatchReasons[ingr] && (
                      <span style={{ fontSize: 11, color: theme.textMuted, marginLeft: 8 }}>
                        AI：{llmMatchReasons[ingr]}
                      </span>
                    )}
                  </div>

                  <div style={{ ...styles.matchGrid, ...(isMobile && { gridTemplateColumns: "1fr" }) }}>
                    {/* Taiwan DB column */}
                    <div>
                      <div style={styles.dbBadgeTW}>台灣資料庫</div>
                      {twFoods.length === 0 && (
                        <div style={styles.noMatch}>無匹配結果</div>
                      )}
                      {twFoods.map((c, ci) => {
                        const isSelected =
                          selected?.id === c.id &&
                          selected?.source === "taiwan_foods";
                        return (
                          <div
                            key={ci}
                            onClick={() =>
                              setSelectedMatches({
                                ...selectedMatches,
                                [ingr]: c,
                              })
                            }
                            style={{
                              ...styles.matchCell,
                              border: isSelected
                                ? `2px solid ${theme.success}`
                                : `1px solid ${theme.borderLight}`,
                              background: isSelected
                                ? theme.successBg
                                : theme.cardBg,
                            }}
                          >
                            {isSelected && (
                              <span style={styles.selectedCellBadge}>
                                已選擇
                              </span>
                            )}
                            <div style={{ fontWeight: 600, fontSize: 13 }}>
                              {c.name || c.food_name}
                            </div>
                            {c.category && (
                              <div style={styles.scoreInfo}>{c.category}</div>
                            )}
                            <div style={styles.scoreInfo}>
                              相似度:{" "}
                              {(Number(c.score || 0) * 100).toFixed(0)}%
                            </div>
                            {c.nutrition?.cal_per_100g != null && (
                              <div style={styles.scoreInfo}>
                                熱量: {Number(c.nutrition.cal_per_100g).toFixed(0)} kcal/100g
                              </div>
                            )}
                          </div>
                        );
                      })}
                    </div>

                    {/* FooDB column */}
                    <div>
                      <div style={styles.dbBadgeEN}>FooDB</div>
                      {fooFoods.length === 0 && (
                        <div style={styles.noMatch}>無匹配結果</div>
                      )}
                      {fooFoods.map((c, ci) => {
                        const isSelected =
                          selected?.id === c.id &&
                          selected?.source === "foodb";
                        return (
                          <div
                            key={ci}
                            onClick={() =>
                              setSelectedMatches({
                                ...selectedMatches,
                                [ingr]: c,
                              })
                            }
                            style={{
                              ...styles.matchCell,
                              border: isSelected
                                ? `2px solid ${theme.success}`
                                : `1px solid ${theme.borderLight}`,
                              background: isSelected
                                ? theme.successBg
                                : theme.cardBg,
                            }}
                          >
                            {isSelected && (
                              <span style={styles.selectedCellBadge}>
                                已選擇
                              </span>
                            )}
                            <div style={{ fontWeight: 600, fontSize: 13 }}>
                              {c.name || c.food_name}
                            </div>
                            {c.category && (
                              <div style={styles.scoreInfo}>{c.category}</div>
                            )}
                            <div style={styles.scoreInfo}>
                              相似度:{" "}
                              {(Number(c.score || 0) * 100).toFixed(0)}%
                            </div>
                            {c.nutrition?.cal_per_100g != null && (
                              <div style={styles.scoreInfo}>
                                熱量: {Number(c.nutrition.cal_per_100g).toFixed(0)} kcal/100g
                              </div>
                            )}
                          </div>
                        );
                      })}
                    </div>
                  </div>

                  {/* Amount input */}
                  <div style={{ marginTop: 8, display: "flex", gap: 8, alignItems: "center" }}>
                    <label style={{ ...styles.label, margin: 0, minWidth: 50 }}>
                      用量：
                    </label>
                    <input
                      value={amounts[ingr] || ""}
                      onChange={(e) => {
                        setAmounts({ ...amounts, [ingr]: e.target.value });
                        setParsedAmounts({
                          ...parsedAmounts,
                          [ingr]: getConversionPreview(e.target.value),
                        });
                      }}
                      placeholder="例：300g、2大匙、1顆"
                      style={{ ...styles.input, flex: 1, margin: 0 }}
                    />
                    <span style={{ fontSize: 12, color: theme.textMuted, minWidth: 120 }}>
                      → {parsedAmounts[ingr] || getConversionPreview(amounts[ingr])}
                    </span>
                  </div>
                </div>
              );
            })}

            <ProcessBlock title="計算過程：用量轉換">
              {ingredients.map((ingr) => (
                <div key={ingr} style={{ marginBottom: 4 }}>
                  <b>{ingr}</b>：{amounts[ingr] || "100g"} →{" "}
                  {getConversionPreview(amounts[ingr] || "100g")}
                </div>
              ))}
            </ProcessBlock>

            <div style={{ marginTop: 16, display: "flex", gap: 8 }}>
              <button
                onClick={() => setRecipeStep(2)}
                style={styles.btnSecondary}
              >
                返回
              </button>
              <button
                onClick={handleCalculateNutrition}
                style={styles.btnPrimary}
                disabled={recipeLoading || Object.keys(selectedMatches).length === 0}
              >
                {recipeLoading ? "計算中..." : "計算完整營養素"}
              </button>
            </div>
            {recipeLoading && <LoadingSpinner text="正在計算營養素..." />}
          </div>
        )}

        {/* Sub-step 4: Results */}
        {recipeStep === 4 && nutritionResult && (
          <div>
            <div style={styles.statsRow}>
              {[
                {
                  label: "熱量",
                  value: Math.round(
                    nutritionResult.total?.cal_per_100g ||
                      nutritionResult.total?.modified_cal_per_100g ||
                      0
                  ),
                  unit: "kcal",
                  color: "#FF6384",
                },
                {
                  label: "蛋白質",
                  value: Math.round(
                    nutritionResult.total?.protein_per_100g || 0
                  ),
                  unit: "g",
                  color: "#36A2EB",
                },
                {
                  label: "碳水",
                  value: Math.round(
                    nutritionResult.total?.carbon_per_100g || 0
                  ),
                  unit: "g",
                  color: "#FFCE56",
                },
                {
                  label: "脂肪",
                  value: Math.round(
                    nutritionResult.total?.fats_per_100g || 0
                  ),
                  unit: "g",
                  color: "#FF9F40",
                },
                {
                  label: "膳食纖維",
                  value: Math.round(
                    nutritionResult.total?.dietary_fiber_per_100g || 0
                  ),
                  unit: "g",
                  color: "#4BC0C0",
                },
              ].map((s) => (
                <div key={s.label} style={{ ...styles.statBox, ...(isMobile && { minWidth: 60 }) }}>
                  <div
                    style={{ fontSize: 12, color: theme.textMuted }}
                  >
                    {s.label}
                  </div>
                  <div
                    style={{
                      fontSize: 22,
                      fontWeight: 700,
                      color: s.color,
                    }}
                  >
                    {s.value}
                  </div>
                  <div style={{ fontSize: 11, color: theme.textMuted }}>
                    {s.unit}
                  </div>
                </div>
              ))}
            </div>

            <ProcessBlock title="計算過程：營養素加總">
              {ingredients
                .filter((name) => selectedMatches[name])
                .map((name) => {
                  const match = selectedMatches[name];
                  const cal = Number(
                    match?.nutrition?.cal_per_100g || 0
                  ).toFixed(1);
                  const amt = amounts[name] || "100g";
                  return (
                    <div key={name} style={{ marginBottom: 4 }}>
                      食材 <b>{name}</b>（{match.name || match.food_name}）{amt}{" "}
                      × (熱量 {cal}/100g) = ...
                    </div>
                  );
                })}
              <div style={{ marginTop: 8, fontWeight: 600 }}>
                → 各項營養素分別加總得出最終結果
              </div>
            </ProcessBlock>

            <ProcessBlock title="完整營養素明細">
              <NutritionDetailPanel
                nutritionDetail={nutritionResult.nutrition_detail}
                nutrientMeta={nutritionResult.nutrient_meta}
                title="營養素明細"
              />
              {nutritionResult.items && (
                <NutritionPerItemTable
                  items={nutritionResult.items}
                  onSelectFood={setSelectedFoodId}
                />
              )}
            </ProcessBlock>
          </div>
        )}
      </SectionCard>

      {/* ═══ Section 3: DRI Assessment ═══ */}
      <SectionCard
        number={3}
        title="營養評估"
        status={getSectionStatus(3)}
        summary={section3Summary}
      >
        {gapResults.length > 0 && (
          <div>
            <ProcessBlock title="計算過程：DRI 評估" defaultOpen>
              <p>
                資料來源：國人膳食營養素參考攝取量第八版 → 年齡群組：
                <b>{driInfo?.ageBand || "未設定"}</b>
              </p>
              <p>
                欄位映射：食譜 cal_per_100g → DRI calories（反向別名對照表）
              </p>
              <p>
                建議攝取量（RDA / 下限）以「百分比」呈現；上限攝取量（UL）以「數值」呈現，並列形成範圍評估。
              </p>
              <p>缺口 = 建議量 - 實際攝取，建議攝取量 = 實際 ÷ 建議 × 100%</p>
              {driInfo?.activityLevel && (
                <p style={{ marginTop: 4, color: theme.textMuted }}>
                  以您選的「<b>{driInfo.activityLevel}</b>」活動強度為熱量/膳食纖維的計算基準。
                </p>
              )}
              <div style={{ marginTop: 8, display: "flex", gap: 12, flexWrap: "wrap" }}>
                {Object.entries(STATUS_COLORS).map(([key, sc]) => (
                  <span key={key} style={{ display: "flex", alignItems: "center", gap: 4 }}>
                    <span
                      style={{
                        display: "inline-block",
                        width: 12,
                        height: 12,
                        borderRadius: 2,
                        background: sc.bg,
                        border: `1px solid ${sc.text}`,
                      }}
                    />
                    <span style={{ fontSize: 12, color: sc.text }}>
                      {sc.label}
                    </span>
                  </span>
                ))}
              </div>
            </ProcessBlock>

            <div style={{ overflowX: "auto" }}>
              <table style={styles.table}>
                <thead>
                  <tr>
                    <th style={styles.th}>營養素</th>
                    <th style={styles.th}>建議量</th>
                    <th style={styles.th}>攝取量</th>
                    <th style={styles.th}>差額</th>
                    <th style={styles.th}>建議攝取量 (%)</th>
                    <th style={styles.th}>上限攝取量</th>
                    <th style={styles.th}>狀態</th>
                  </tr>
                </thead>
                <tbody>
                  {gapResults.map((g) => {
                    const sc = STATUS_COLORS[g.status] || STATUS_COLORS.adequate;
                    const isLackish = g.status === "deficient" || g.status === "low";
                    const rec = foodRecs[g.field];
                    const hasRec = isLackish && rec && rec.foods && rec.foods.length > 0;
                    const isOpen = expandedDriField === g.field && hasRec;
                    return (
                      <Fragment key={g.field}>
                        <tr style={{ background: sc.bg }}>
                          <td style={styles.td}>
                            {g.nutrient}{" "}
                            <span style={{ fontSize: 11, color: theme.textMuted }}>
                              ({g.unit})
                            </span>
                          </td>
                          <td style={styles.td}>{g.target}</td>
                          <td style={styles.td}>
                            <input
                              type="number"
                              value={intake[g.field] || 0}
                              onChange={(e) =>
                                setIntake({
                                  ...intake,
                                  [g.field]: Number(e.target.value) || 0,
                                })
                              }
                              style={{
                                ...styles.input,
                                width: 80,
                                margin: 0,
                                padding: "2px 6px",
                                fontSize: 13,
                              }}
                            />
                          </td>
                          <td style={styles.td}>
                            {g.gap > 0 ? `-${g.gap}` : `+${Math.abs(g.gap)}`}
                          </td>
                          <td style={styles.td}>
                            {g.gapPercent != null ? `${g.gapPercent}%` : "-"}
                          </td>
                          <td style={{ ...styles.td, color: g.ul != null ? theme.text : theme.textMuted, textAlign: "right" }}>
                            {g.ul != null ? g.ul : "-"}
                          </td>
                          <td style={{ ...styles.td, color: sc.text, fontWeight: 600 }}>
                            <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                              <span>{sc.label}</span>
                              {isLackish && (
                                <button
                                  type="button"
                                  disabled={!hasRec}
                                  onClick={() =>
                                    setExpandedDriField(isOpen ? null : g.field)
                                  }
                                  title={
                                    hasRec
                                      ? "查看推薦食物"
                                      : "請先到 Section 4 觸發改善建議"
                                  }
                                  style={{
                                    ...styles.linkButton,
                                    fontSize: 12,
                                    color: hasRec ? theme.accent : theme.textLight,
                                    cursor: hasRec ? "pointer" : "not-allowed",
                                    textDecoration: "none",
                                  }}
                                >
                                  {isOpen ? "▲ 收起" : "▼ 推薦食物"}
                                </button>
                              )}
                            </div>
                          </td>
                        </tr>
                        {isOpen && (
                          <tr style={{ background: theme.cardBg }}>
                            <td colSpan={7} style={{ padding: 0 }}>
                              <div style={{ padding: "8px 12px" }}>
                                <table style={{ ...styles.table, marginBottom: 0 }}>
                                  <thead>
                                    <tr>
                                      <th style={styles.th}>排名</th>
                                      <th style={styles.th}>食物名稱</th>
                                      <th style={styles.th}>來源</th>
                                      <th style={styles.th}>推薦原因</th>
                                      <th style={styles.th}>
                                        含量 ({rec.unit}/100g)
                                      </th>
                                      <th style={styles.th}>建議份數</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    {rec.foods.map((f, i) => {
                                      const reasonText = `補足${rec.nutrient}缺口（${Math.abs(rec.gap)} ${rec.unit}）`;
                                      const contentVal = Number(
                                        f.content_per_100g ??
                                          f.standard_content ??
                                          f.amount ??
                                          0
                                      );
                                      return (
                                        <tr key={i}>
                                          <td style={styles.td}>{i + 1}</td>
                                          <td style={styles.td}>
                                            {f.source === "taiwan_foods" && f.id ? (
                                              <button
                                                type="button"
                                                style={styles.linkButton}
                                                onClick={() => setSelectedFoodId(f.id)}
                                              >
                                                {f.name || f.food_name}
                                              </button>
                                            ) : (
                                              <span>{f.name || f.food_name}</span>
                                            )}
                                          </td>
                                          <td style={styles.td}>
                                            <span
                                              style={{
                                                fontSize: 12,
                                                padding: "2px 6px",
                                                borderRadius: 4,
                                                background:
                                                  f.source === "taiwan_foods"
                                                    ? "#e8f5e9"
                                                    : "#e3f2fd",
                                                color:
                                                  f.source === "taiwan_foods"
                                                    ? "#2e7d32"
                                                    : "#1565c0",
                                              }}
                                            >
                                              {f.source === "taiwan_foods"
                                                ? "台灣食品"
                                                : "FooDB"}
                                            </span>
                                          </td>
                                          <td style={styles.td}>{reasonText}</td>
                                          <td style={styles.td}>
                                            {contentVal.toFixed(2)}
                                          </td>
                                          <td style={styles.td}>
                                            {suggestedServing(Math.abs(rec.gap), contentVal, f)}
                                          </td>
                                        </tr>
                                      );
                                    })}
                                  </tbody>
                                </table>
                              </div>
                            </td>
                          </tr>
                        )}
                      </Fragment>
                    );
                  })}
                </tbody>
              </table>
            </div>

            <ServingReferenceBox />

            <button
              onClick={handleRecalculate}
              style={{ ...styles.btnSecondary, marginTop: 12 }}
            >
              重新計算
            </button>
          </div>
        )}
      </SectionCard>

      {/* ═══ Section 4: Improvement Recommendations ═══ */}
      <SectionCard
        number={4}
        title="改善建議"
        status={getSectionStatus(4)}
        summary={section4Summary}
      >
        {foodRecLoading && <LoadingSpinner text="正在查詢建議食物..." />}

        {!foodRecLoading && Object.keys(foodRecs).length === 0 && improvementDone && (
          <div
            style={{
              padding: 20,
              textAlign: "center",
              color: theme.success,
              background: theme.successBg,
              borderRadius: 8,
            }}
          >
            所有營養素均達標，無需改善建議！
          </div>
        )}

        {!foodRecLoading && Object.keys(foodRecs).length > 0 && (
          <div>
            <ProcessBlock title="計算過程：改善建議查詢" defaultOpen>
              <p>
                篩選條件：建議攝取量 {"<"} 100% → 共{" "}
                <b>{Object.keys(foodRecs).length}</b> 個缺乏/略低
              </p>
              <p>
                查詢路徑：缺乏營養素 → GET /health/nutrients/{"{"
                }field{"}"}/foods → 按含量排序 → Top 10
              </p>
            </ProcessBlock>

            {Object.entries(foodRecs).map(([field, rec]) => (
              <FoodRecCard
                key={field}
                field={field}
                rec={rec}
                onSelectFood={setSelectedFoodId}
              />
            ))}
            <ServingReferenceBox />
          </div>
        )}
      </SectionCard>

      {/* ═══ Section 5: Food Search ═══ */}
      <SectionCard
        number={5}
        title="食材查詢"
        status={getSectionStatus(5)}
        summary=""
        defaultExpanded={true}
      >
        <div style={{ display: "flex", gap: 8 }}>
          <input
            value={foodQuery}
            onChange={(e) => setFoodQuery(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && handleFoodSearch()}
            placeholder="輸入食材名稱搜尋..."
            style={{ ...styles.input, flex: 1 }}
          />
          <button
            onClick={handleFoodSearch}
            style={styles.btnPrimary}
            disabled={searchLoading || !foodQuery.trim()}
          >
            {searchLoading ? "搜尋中..." : "搜尋"}
          </button>
        </div>

        {searchLoading && <LoadingSpinner text="正在搜尋食品資料庫..." />}

        {foodQuery && foodResults.length > 0 && (
          <ProcessBlock title="計算過程：食品搜尋" defaultOpen>
            <p>
              搜尋 '<b>{foodQuery}</b>' → 台灣食品資料庫 + FooDB 相似度搜尋 → 合併排序
            </p>
            {synonymResult && (
              <p>
                同義詞查詢：{foodQuery} →{" "}
                {synonymResult.canonical || "無同義詞"}{" "}
                {synonymResult.synonyms?.length > 0 &&
                  `（${synonymResult.synonyms.join("、")}）`}
              </p>
            )}
          </ProcessBlock>
        )}

        {foodResults.length > 0 && (
          <div style={{ marginTop: 12 }}>
            {foodResults.map((food, i) => {
              const isTW = food.source === "taiwan_foods" || food.source === "taiwan";
              return (
                <div
                  key={i}
                  onClick={() => {
                    if (isTW && food.id) setSelectedFoodId(food.id);
                  }}
                  style={{
                    ...styles.foodRow,
                    cursor: isTW ? "pointer" : "default",
                  }}
                >
                  <div style={{ flex: 1 }}>
                    <span style={{ fontWeight: 600, fontSize: 14 }}>
                      {food.name || food.food_name}
                    </span>
                    {food.category && (
                      <span style={styles.scoreInfo}> | {food.category}</span>
                    )}
                  </div>
                  <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                    {food.cal_per_100g != null && (
                      <span style={{ fontSize: 12, color: theme.textMuted }}>
                        {Number(food.cal_per_100g).toFixed(0)} kcal
                      </span>
                    )}
                    <span style={isTW ? styles.dbBadgeTW : styles.dbBadgeEN}>
                      {isTW ? "台灣" : "FooDB"}
                    </span>
                    {food.score != null && (
                      <span style={styles.scoreInfo}>
                        {(Number(food.score) * 100).toFixed(0)}%
                      </span>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}

        {foodQuery && !searchLoading && foodResults.length === 0 && (
          <div style={{ marginTop: 12, color: theme.textMuted, textAlign: "center" }}>
            查無結果
          </div>
        )}

      </SectionCard>

      {/* ═══ Section 6: Save & Log ═══ */}
      <SectionCard
        number={6}
        title="記錄與儲存"
        status={getSectionStatus(6)}
        summary=""
      >
        {nutritionResult ? (
          <div>
            <div style={styles.saveSummary}>
              <div>
                <b>食譜名稱：</b>
                {(recipeText || "").slice(0, 50) || "未命名食譜"}
              </div>
              <div>
                <b>食材數量：</b>
                {ingredients.length} 種
              </div>
              <div>
                <b>份數：</b>
                {servings}
              </div>
              <div>
                <b>總熱量：</b>
                {Math.round(
                  nutritionResult.total?.cal_per_100g ||
                    nutritionResult.total?.modified_cal_per_100g ||
                    0
                )}{" "}
                kcal
              </div>
            </div>

            <ProcessBlock title="計算過程：儲存內容">
              <p>
                儲存內容：食譜名稱 + 份數 + 營養素總量 + 食材清單 → POST
                /recipe/save
              </p>
            </ProcessBlock>

            <div style={{ display: "flex", gap: 8, marginTop: 12 }}>
              <button onClick={handleSaveRecipe} style={styles.btnPrimary}>
                儲存食譜
              </button>
              <button onClick={handleCreateDietLog} style={styles.btnSecondary}>
                加入今日飲食記錄
              </button>
            </div>

            {saveMsg && (
              <div
                style={{
                  marginTop: 8,
                  padding: "8px 12px",
                  borderRadius: 6,
                  background: saveMsg.includes("成功")
                    ? theme.successBg
                    : theme.errorBg,
                  color: saveMsg.includes("成功")
                    ? theme.success
                    : theme.error,
                  fontSize: 13,
                }}
              >
                {saveMsg}
              </div>
            )}
            {logMsg && (
              <div
                style={{
                  marginTop: 8,
                  padding: "8px 12px",
                  borderRadius: 6,
                  background: logMsg.includes("成功")
                    ? theme.successBg
                    : theme.errorBg,
                  color: logMsg.includes("成功")
                    ? theme.success
                    : theme.error,
                  fontSize: 13,
                }}
              >
                {logMsg}
              </div>
            )}
          </div>
        ) : (
          <div style={{ color: theme.textMuted, textAlign: "center" }}>
            請先完成食譜分析（第 2 步）後才能儲存
          </div>
        )}
      </SectionCard>

      {selectedFoodId && (
        <TaiwanFoodModal
          foodId={selectedFoodId}
          onClose={() => setSelectedFoodId(null)}
        />
      )}
    </div>
  );
}

/* ─── FoodRecCard sub-component ─── */
function FoodRecCard({ field, rec, onSelectFood }) {
  const [open, setOpen] = useState(false);
  const reasonText = `補足${rec.nutrient}缺口（${Math.abs(rec.gap)} ${rec.unit}）`;

  return (
    <div style={{ marginBottom: 12, border: `1px solid ${theme.border}`, borderRadius: 8, overflow: "hidden" }}>
      <div
        onClick={() => setOpen(!open)}
        style={{
          padding: "10px 14px",
          background: theme.warningBg,
          cursor: "pointer",
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <span style={{ fontWeight: 600, fontSize: 14, color: theme.warning }}>
          {rec.nutrient}（缺口：{Math.abs(rec.gap)} {rec.unit}）
        </span>
        <span style={{ color: theme.textMuted }}>{open ? "▲" : "▼"}</span>
      </div>
      {open && (
        <div style={{ padding: 12 }}>
          {rec.foods.length === 0 ? (
            <div style={{ color: theme.textMuted }}>無推薦食物資料</div>
          ) : (
            <table style={styles.table}>
              <thead>
                <tr>
                  <th style={styles.th}>排名</th>
                  <th style={styles.th}>食物名稱</th>
                  <th style={styles.th}>來源</th>
                  <th style={styles.th}>推薦原因</th>
                  <th style={styles.th}>
                    含量 ({rec.unit}/100g)
                  </th>
                  <th style={styles.th}>建議份數</th>
                </tr>
              </thead>
              <tbody>
                {rec.foods.map((f, i) => {
                  const contentVal = Number(f.content_per_100g ?? f.standard_content ?? f.amount ?? 0);
                  return (
                  <tr key={i}>
                    <td style={styles.td}>{i + 1}</td>
                    <td style={styles.td}>
                      {f.source === "taiwan_foods" && f.id ? (
                        <button
                          type="button"
                          style={styles.linkButton}
                          onClick={() => onSelectFood?.(f.id)}
                        >
                          {f.name || f.food_name}
                        </button>
                      ) : (
                        <span>{f.name || f.food_name}</span>
                      )}
                    </td>
                    <td style={styles.td}>
                      <span style={{
                        fontSize: 12,
                        padding: "2px 6px",
                        borderRadius: 4,
                        background: f.source === "taiwan_foods" ? "#e8f5e9" : "#e3f2fd",
                        color: f.source === "taiwan_foods" ? "#2e7d32" : "#1565c0",
                      }}>
                        {f.source === "taiwan_foods" ? "台灣食品" : "FooDB"}
                      </span>
                    </td>
                    <td style={styles.td}>{reasonText}</td>
                    <td style={styles.td}>
                      {contentVal.toFixed(2)}
                    </td>
                    <td style={styles.td}>
                      {suggestedServing(Math.abs(rec.gap), contentVal, f)}
                    </td>
                  </tr>
                  );
                })}
              </tbody>
            </table>
          )}
        </div>
      )}
    </div>
  );
}

/* ═══════════════════════════════════════════════
   Styles
   ═══════════════════════════════════════════════ */
const styles = {
  page: {
    maxWidth: 900,
    margin: "0 auto",
    padding: "24px 16px",
    background: theme.bg,
    minHeight: "100vh",
  },
  pageTitle: {
    fontSize: 24,
    fontWeight: 700,
    color: theme.text,
    margin: 0,
  },
  pageSubtitle: {
    fontSize: 14,
    color: theme.textMuted,
    marginTop: 4,
    marginBottom: 20,
  },

  /* Progress */
  progressBar: {
    display: "flex",
    justifyContent: "space-between",
    flexWrap: "wrap",
    marginBottom: 24,
    padding: "12px 0",
  },
  progressStep: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    flex: 1,
    position: "relative",
  },
  progressCircle: {
    width: 28,
    height: 28,
    borderRadius: "50%",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    fontSize: 12,
    fontWeight: 700,
  },

  /* Form */
  formRow: {
    display: "flex",
    gap: 16,
    alignItems: "flex-end",
    flexWrap: "wrap",
    marginBottom: 12,
  },
  formGroup: {
    display: "flex",
    flexDirection: "column",
    gap: 4,
  },
  label: {
    fontSize: 13,
    fontWeight: 600,
    color: theme.text,
    marginBottom: 4,
  },
  input: {
    padding: "8px 12px",
    border: `1px solid ${theme.border}`,
    borderRadius: 8,
    fontSize: 14,
    background: theme.inputBg,
    color: theme.text,
    outline: "none",
    marginBottom: 8,
  },

  /* Buttons */
  btnPrimary: {
    padding: "10px 24px",
    background: theme.accent,
    color: "#fff",
    border: "none",
    borderRadius: 8,
    fontSize: 14,
    fontWeight: 600,
    cursor: "pointer",
  },
  btnSecondary: {
    padding: "10px 24px",
    background: theme.cardBg,
    color: theme.accent,
    border: `1px solid ${theme.accent}`,
    borderRadius: 8,
    fontSize: 14,
    fontWeight: 600,
    cursor: "pointer",
  },
  btnSmall: {
    padding: "4px 12px",
    background: theme.accentLight,
    color: theme.accent,
    border: `1px solid ${theme.border}`,
    borderRadius: 6,
    fontSize: 12,
    cursor: "pointer",
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

  /* History */
  checkboxLabel: {
    display: "inline-flex",
    alignItems: "center",
    gap: 8,
    color: theme.textMuted,
    fontSize: 13,
  },
  historyConfigRow: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    gap: 8,
    marginBottom: 8,
    flexWrap: "wrap",
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

  /* Tags */
  tagList: {
    display: "flex",
    flexWrap: "wrap",
    gap: 8,
  },
  tag: {
    display: "inline-flex",
    alignItems: "center",
    gap: 6,
    padding: "6px 12px",
    background: theme.accentLight,
    color: theme.accent,
    borderRadius: 20,
    fontSize: 13,
    fontWeight: 500,
  },
  tagX: {
    cursor: "pointer",
    fontWeight: 700,
    fontSize: 15,
    lineHeight: 1,
    color: theme.error,
  },

  /* Sub-steps */
  subStepBar: {
    display: "flex",
    gap: 20,
    marginBottom: 16,
    paddingBottom: 12,
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  subStep: {
    display: "flex",
    alignItems: "center",
    gap: 6,
    fontSize: 13,
  },
  subStepDot: {
    width: 8,
    height: 8,
    borderRadius: "50%",
    display: "inline-block",
  },

  /* Match grid */
  matchSection: {
    marginBottom: 16,
    padding: 12,
    background: theme.inputBg,
    borderRadius: 8,
    border: `1px solid ${theme.borderLight}`,
  },
  matchHeader: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    marginBottom: 8,
    fontSize: 14,
  },
  matchGrid: {
    display: "grid",
    gridTemplateColumns: "1fr 1fr",
    gap: 12,
  },
  matchCell: {
    padding: 10,
    borderRadius: 8,
    cursor: "pointer",
    marginBottom: 6,
    transition: "border-color 0.15s",
    position: "relative",
  },
  selectedBadge: {
    fontSize: 12,
    color: theme.success,
    fontWeight: 600,
    background: theme.successBg,
    padding: "2px 8px",
    borderRadius: 10,
  },
  selectedCellBadge: {
    position: "absolute",
    top: 4,
    right: 6,
    fontSize: 10,
    color: "#fff",
    background: theme.success,
    padding: "1px 6px",
    borderRadius: 8,
    fontWeight: 600,
  },
  noMatch: {
    padding: 12,
    textAlign: "center",
    color: theme.textMuted,
    fontSize: 13,
  },
  dbBadgeTW: {
    display: "inline-block",
    padding: "2px 8px",
    borderRadius: 10,
    background: "#e3f2fd",
    color: "#1565c0",
    fontSize: 11,
    fontWeight: 600,
    marginBottom: 6,
  },
  dbBadgeEN: {
    display: "inline-block",
    padding: "2px 8px",
    borderRadius: 10,
    background: "#fce4ec",
    color: "#c62828",
    fontSize: 11,
    fontWeight: 600,
    marginBottom: 6,
  },
  scoreInfo: {
    fontSize: 12,
    color: theme.textMuted,
    marginTop: 2,
  },

  /* Stats */
  statsRow: {
    display: "flex",
    gap: 12,
    flexWrap: "wrap",
    marginBottom: 16,
  },
  statBox: {
    flex: 1,
    minWidth: 100,
    padding: "16px 12px",
    background: theme.inputBg,
    borderRadius: 10,
    textAlign: "center",
    border: `1px solid ${theme.borderLight}`,
  },

  /* Table */
  table: {
    width: "100%",
    borderCollapse: "collapse",
    fontSize: 13,
  },
  th: {
    padding: "8px 10px",
    background: theme.accentLight,
    color: theme.accent,
    fontWeight: 600,
    textAlign: "left",
    borderBottom: `2px solid ${theme.border}`,
    fontSize: 12,
  },
  td: {
    padding: "8px 10px",
    borderBottom: `1px solid ${theme.borderLight}`,
    fontSize: 13,
    color: theme.text,
  },
  linkButton: {
    background: "transparent",
    border: "none",
    padding: 0,
    color: theme.accent,
    cursor: "pointer",
    fontSize: 13,
    textDecoration: "underline",
  },

  /* Food search */
  foodRow: {
    display: "flex",
    alignItems: "center",
    padding: "10px 12px",
    borderBottom: `1px solid ${theme.borderLight}`,
    gap: 12,
  },

  /* Save summary */
  saveSummary: {
    padding: 16,
    background: theme.inputBg,
    borderRadius: 8,
    border: `1px solid ${theme.borderLight}`,
    display: "flex",
    flexDirection: "column",
    gap: 6,
    fontSize: 14,
    color: theme.text,
  },
};

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
