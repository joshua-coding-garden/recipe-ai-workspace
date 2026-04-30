import { useEffect, useMemo, useState } from "react";
import { listRecipes, deleteRecipe, updateRecipe } from "../api/recipeApi";
import { getNutrientMeta } from "../utils/driReferences";
import { getProfile } from "../api/authApi";
import { sumRecipeNutrients } from "../utils/recipeNutritionAggregator";
import theme from "../utils/theme";

const TODAY_SELECTION_KEY = "today_recipe_intake_selection";
const TODAY_NUTRIENT_VIEW_KEY = "today_recipe_nutrient_view";

const DEFAULT_VIEW_KEYS = [
  "calories",
  "protein",
  "carbs",
  "fat",
  "fiber",
  "vitamin_c_mg",
  "calcium_per_100g",
  "iron_per_100g",
  "sodium_per_100g",
];

export default function SavedRecipesPage() {
  const [recipes, setRecipes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [editingId, setEditingId] = useState(null);
  const [editForm, setEditForm] = useState(null);
  const [saving, setSaving] = useState(false);
  const [selectedForToday, setSelectedForToday] = useState([]);
  const [viewNutrientKeys, setViewNutrientKeys] = useState(DEFAULT_VIEW_KEYS);
  const [mainTargets, setMainTargets] = useState(null);

  const todayKey = useMemo(() => getDateKey(new Date()), []);

  useEffect(() => {
    fetchRecipes();
    setSelectedForToday(loadTodaySelection(todayKey));
    setViewNutrientKeys(loadNutrientView());
    fetchMainTargets();
  }, [todayKey]);

  async function fetchMainTargets() {
    try {
      const profile = await getProfile();
      const target = calculateMainTargets(profile);
      setMainTargets(target);
    } catch {
      setMainTargets(null);
    }
  }

  const availableNutrients = useMemo(() => {
    const keySet = new Set(DEFAULT_VIEW_KEYS);
    for (const recipe of recipes) {
      const detail = recipe?.nutrition_detail || {};
      Object.keys(detail).forEach((k) => keySet.add(k));
    }
    return [...keySet]
      .filter((k) => !!k)
      .map((k) => ({ key: k, ...getNutrientMeta(k) }))
      .sort((a, b) => a.label.localeCompare(b.label, "zh-TW"));
  }, [recipes]);

  const todaySummary = useMemo(() => {
    const selected = recipes.filter((r) => selectedForToday.includes(r.id));
    return sumRecipeNutrients(selected);
  }, [recipes, selectedForToday]);

  const mainProgressItems = useMemo(() => {
    return [
      {
        key: "calories",
        label: "熱量",
        value: todaySummary.calories || 0,
        target: mainTargets?.calories || 0,
        unit: "kcal",
        color: "#6366f1",
      },
      {
        key: "protein",
        label: "蛋白質",
        value: todaySummary.protein || 0,
        target: mainTargets?.protein || 0,
        unit: "g",
        color: "#0ea5e9",
      },
      {
        key: "carbs",
        label: "碳水",
        value: todaySummary.carbs || 0,
        target: mainTargets?.carbs || 0,
        unit: "g",
        color: "#10b981",
      },
      {
        key: "fat",
        label: "脂肪",
        value: todaySummary.fat || 0,
        target: mainTargets?.fat || 0,
        unit: "g",
        color: "#f59e0b",
      },
    ];
  }, [todaySummary, mainTargets]);

  async function fetchRecipes() {
    try {
      setLoading(true);
      setError("");
      const data = await listRecipes();
      setRecipes((data || []).map(normalizeRecipeNutrition));
    } catch (e) {
      setError("載入食譜失敗：" + (e.response?.data?.detail || e.message));
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(id) {
    if (!window.confirm("確定要刪除這個食譜嗎？")) return;
    try {
      await deleteRecipe(id);
      setRecipes((prev) => prev.filter((r) => r.id !== id));
      const next = selectedForToday.filter((x) => x !== id);
      setSelectedForToday(next);
      saveTodaySelection(todayKey, next);
    } catch (e) {
      alert("刪除失敗：" + (e.response?.data?.detail || e.message));
    }
  }

  function toggleTodaySelection(id) {
    const next = selectedForToday.includes(id)
      ? selectedForToday.filter((x) => x !== id)
      : [...selectedForToday, id];
    setSelectedForToday(next);
    saveTodaySelection(todayKey, next);
  }

  function addViewNutrient(key) {
    if (!key) return;
    const next = viewNutrientKeys.includes(key) ? viewNutrientKeys : [...viewNutrientKeys, key];
    setViewNutrientKeys(next);
    saveNutrientView(next);
  }

  function removeViewNutrient(key) {
    const next = viewNutrientKeys.filter((k) => k !== key);
    setViewNutrientKeys(next);
    saveNutrientView(next);
  }

  function handleEditStart(recipe) {
    const baseServings = Math.max(1, Number(recipe.servings) || 1);
    const baseNutrition = {
      calories: Number(recipe.calories) || 0,
      protein: Number(recipe.protein) || 0,
      carbs: Number(recipe.carbs) || 0,
      fat: Number(recipe.fat) || 0,
      fiber: Number(recipe.fiber) || 0,
    };

    const baseDetail = normalizeDetail(recipe.nutrition_detail || {});
    const defaultEditable = Object.keys(baseDetail).slice(0, 10);

    setEditingId(recipe.id);
    setEditForm({
      recipe_name: recipe.recipe_name || "",
      servings: String(baseServings),
      nutrition: { ...baseNutrition },
      nutrition_detail: { ...baseDetail },
      editableDetailKeys: defaultEditable,
      baseServings,
      baseNutrition,
      baseDetail,
    });
  }

  function handleEditCancel() {
    setEditingId(null);
    setEditForm(null);
  }

  function handleServingsChange(nextValue) {
    if (!editForm) return;
    const nextServings = Math.max(1, Number(nextValue) || 1);
    const ratio = nextServings / editForm.baseServings;

    const scaledNutrition = {
      calories: roundTo2(editForm.baseNutrition.calories * ratio),
      protein: roundTo2(editForm.baseNutrition.protein * ratio),
      carbs: roundTo2(editForm.baseNutrition.carbs * ratio),
      fat: roundTo2(editForm.baseNutrition.fat * ratio),
      fiber: roundTo2(editForm.baseNutrition.fiber * ratio),
    };

    const scaledDetail = {};
    Object.entries(editForm.baseDetail).forEach(([k, v]) => {
      scaledDetail[k] = roundTo4(v * ratio);
    });

    setEditForm({
      ...editForm,
      servings: String(nextServings),
      nutrition: scaledNutrition,
      nutrition_detail: scaledDetail,
    });
  }

  function updateMacroField(key, value) {
    if (!editForm) return;
    setEditForm({
      ...editForm,
      nutrition: {
        ...editForm.nutrition,
        [key]: toNum(value) ?? 0,
      },
    });
  }

  function updateDetailField(key, value) {
    if (!editForm) return;
    setEditForm({
      ...editForm,
      nutrition_detail: {
        ...editForm.nutrition_detail,
        [key]: toNum(value) ?? 0,
      },
    });
  }

  function addEditableNutrient(key) {
    if (!editForm || !key) return;
    if (editForm.editableDetailKeys.includes(key)) return;
    setEditForm({
      ...editForm,
      editableDetailKeys: [...editForm.editableDetailKeys, key],
      nutrition_detail: {
        ...editForm.nutrition_detail,
        [key]: editForm.nutrition_detail[key] ?? 0,
      },
    });
  }

  function removeEditableNutrient(key) {
    if (!editForm) return;
    setEditForm({
      ...editForm,
      editableDetailKeys: editForm.editableDetailKeys.filter((k) => k !== key),
    });
  }

  async function handleEditSave(recipeId) {
    if (!editForm) return;

    try {
      setSaving(true);
      await updateRecipe(recipeId, {
        recipe_name: editForm.recipe_name,
        servings: Math.max(1, parseInt(editForm.servings || "1", 10)),
        nutrition: {
          calories: editForm.nutrition.calories,
          protein: editForm.nutrition.protein,
          carbs: editForm.nutrition.carbs,
          fat: editForm.nutrition.fat,
          fiber: editForm.nutrition.fiber,
        },
        nutrition_detail: editForm.nutrition_detail,
      });

      setRecipes((prev) =>
        prev.map((r) => {
          if (r.id !== recipeId) return r;
          return normalizeRecipeNutrition({
            ...r,
            recipe_name: editForm.recipe_name,
            servings: Math.max(1, parseInt(editForm.servings || "1", 10)),
            calories: editForm.nutrition.calories,
            protein: editForm.nutrition.protein,
            carbs: editForm.nutrition.carbs,
            fat: editForm.nutrition.fat,
            fiber: editForm.nutrition.fiber,
            nutrition_detail: editForm.nutrition_detail,
          });
        })
      );

      handleEditCancel();
    } catch (e) {
      alert("更新失敗：" + (e.response?.data?.detail || e.message));
    } finally {
      setSaving(false);
    }
  }

  if (loading) return <div style={s.center}>載入中...</div>;
  if (error) return <div style={{ ...s.center, color: theme.error }}>{error}</div>;

  return (
    <div style={s.page}>
      <h2 style={s.title}>我的食譜</h2>

      <div style={s.summaryCard}>
        <div style={s.summaryHeader}>
          <h3 style={{ margin: 0, color: theme.text }}>攝取營養素（已勾選食譜）</h3>
          <div style={s.selectorRow}>
            <select
              style={s.select}
              defaultValue=""
              onChange={(e) => {
                addViewNutrient(e.target.value);
                e.target.value = "";
              }}
            >
              <option value="">+ 新增要看的營養素</option>
              {availableNutrients.map((n) => (
                <option key={n.key} value={n.key}>
                  {n.label}
                </option>
              ))}
            </select>
          </div>
        </div>

        <div style={s.progressGrid}>
          {mainProgressItems.map((item) => (
            <ProgressCircleCard key={item.key} item={item} />
          ))}
        </div>

        <div style={s.tagList}>
          {viewNutrientKeys.map((k) => {
            const meta = getNutrientMeta(k);
            return (
              <span key={k} style={s.tag}>
                {meta.label}
                <button style={s.tagBtn} onClick={() => removeViewNutrient(k)}>x</button>
              </span>
            );
          })}
        </div>

        <div style={s.nutrientGrid}>
          {viewNutrientKeys.map((k) => {
            const meta = getNutrientMeta(k);
            const value = todaySummary[k] ?? 0;
            return <NutItem key={k} label={meta.label} value={value} unit={meta.unit} />;
          })}
        </div>
      </div>

      {recipes.length === 0 ? (
        <p style={s.empty}>尚無儲存的食譜，請先在食譜分析頁面儲存。</p>
      ) : (
        <div style={s.grid}>
          {recipes.map((r) => (
            <div key={r.id} style={s.card}>
              <div style={s.cardHeader}>
                <span style={s.name}>{r.recipe_name || "未命名食譜"}</span>
                <div style={s.cardActions}>
                  <button style={s.editBtn} onClick={() => handleEditStart(r)}>編輯</button>
                  <button style={s.delBtn} onClick={() => handleDelete(r.id)}>刪除</button>
                </div>
              </div>

              <label style={s.selectRow}>
                <input
                  type="checkbox"
                  checked={selectedForToday.includes(r.id)}
                  onChange={() => toggleTodaySelection(r.id)}
                />
                <span>納入今日攝取進度</span>
              </label>

              <p style={s.meta}>{r.servings || 1} 人份</p>

              {editingId === r.id && editForm ? (
                <div style={s.editPanel}>
                  <input
                    style={s.input}
                    value={editForm.recipe_name}
                    onChange={(e) => setEditForm({ ...editForm, recipe_name: e.target.value })}
                    placeholder="食譜名稱"
                  />

                  <div style={s.editGrid}>
                    <EditNumber label="人份" value={editForm.servings} onChange={handleServingsChange} />
                    <EditNumber
                      label="熱量(kcal)"
                      value={editForm.nutrition.calories}
                      onChange={(v) => updateMacroField("calories", v)}
                    />
                    <EditNumber
                      label="蛋白質(g)"
                      value={editForm.nutrition.protein}
                      onChange={(v) => updateMacroField("protein", v)}
                    />
                    <EditNumber
                      label="碳水(g)"
                      value={editForm.nutrition.carbs}
                      onChange={(v) => updateMacroField("carbs", v)}
                    />
                    <EditNumber
                      label="脂肪(g)"
                      value={editForm.nutrition.fat}
                      onChange={(v) => updateMacroField("fat", v)}
                    />
                    <EditNumber
                      label="纖維(g)"
                      value={editForm.nutrition.fiber}
                      onChange={(v) => updateMacroField("fiber", v)}
                    />
                  </div>

                  <div style={s.selectorRow}>
                    <select
                      style={s.select}
                      defaultValue=""
                      onChange={(e) => {
                        addEditableNutrient(e.target.value);
                        e.target.value = "";
                      }}
                    >
                      <option value="">+ 新增詳細營養素欄位</option>
                      {availableNutrients.map((n) => (
                        <option key={n.key} value={n.key}>
                          {n.label}
                        </option>
                      ))}
                    </select>
                  </div>

                  <div style={s.editGrid}>
                    {editForm.editableDetailKeys.map((key) => {
                      const meta = getNutrientMeta(key);
                      return (
                        <label key={key} style={s.inputLabel}>
                          <span>
                            {meta.label} {meta.unit ? `(${meta.unit})` : ""}
                            <button style={s.inlineRemove} onClick={() => removeEditableNutrient(key)}>
                              x
                            </button>
                          </span>
                          <input
                            type="number"
                            value={editForm.nutrition_detail[key] ?? 0}
                            onChange={(e) => updateDetailField(key, e.target.value)}
                            style={s.input}
                          />
                        </label>
                      );
                    })}
                  </div>

                  <div style={s.editActions}>
                    <button style={s.saveBtn} disabled={saving} onClick={() => handleEditSave(r.id)}>
                      {saving ? "儲存中..." : "儲存變更"}
                    </button>
                    <button style={s.cancelBtn} onClick={handleEditCancel}>取消</button>
                  </div>
                </div>
              ) : (
                <>
                  <div style={s.nutrientGrid}>
                    <NutItem label="熱量" value={r.calories} unit="kcal" />
                    <NutItem label="蛋白質" value={r.protein} unit="g" />
                    <NutItem label="碳水" value={r.carbs} unit="g" />
                    <NutItem label="脂肪" value={r.fat} unit="g" />
                    <NutItem label="纖維" value={r.fiber} unit="g" />
                  </div>
                  <DetailNutrientsPanel recipeId={r.id} detail={r.nutrition_detail} />
                </>
              )}

              <p style={s.date}>{new Date(r.created_at).toLocaleString("zh-TW")}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function EditNumber({ label, value, onChange }) {
  return (
    <label style={s.inputLabel}>
      <span>{label}</span>
      <input type="number" value={value} onChange={(e) => onChange(e.target.value)} style={s.input} />
    </label>
  );
}

function normalizeRecipeNutrition(recipe) {
  const detail = normalizeDetail(recipe?.nutrition_detail || {});

  return {
    ...recipe,
    nutrition_detail: detail,
    calories: toNum(recipe.calories) ?? toNum(detail.cal_per_100g) ?? toNum(detail.calories) ?? 0,
    protein: toNum(recipe.protein) ?? toNum(detail.protein_per_100g) ?? toNum(detail.protein) ?? 0,
    carbs: toNum(recipe.carbs) ?? toNum(detail.carbon_per_100g) ?? toNum(detail.carbs) ?? 0,
    fat: toNum(recipe.fat) ?? toNum(detail.fats_per_100g) ?? toNum(detail.fat) ?? 0,
    fiber: toNum(recipe.fiber) ?? toNum(detail.dietary_fiber_per_100g) ?? toNum(detail.fiber) ?? 0,
  };
}

function normalizeDetail(detail) {
  const out = {};
  Object.entries(detail || {}).forEach(([k, v]) => {
    const num = toNum(v);
    if (num != null) out[k] = num;
  });
  return out;
}

function loadTodaySelection(todayKey) {
  try {
    const raw = localStorage.getItem(TODAY_SELECTION_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    if (parsed.date !== todayKey || !Array.isArray(parsed.selectedIds)) return [];
    return parsed.selectedIds;
  } catch {
    return [];
  }
}

function saveTodaySelection(todayKey, selectedIds) {
  localStorage.setItem(TODAY_SELECTION_KEY, JSON.stringify({ date: todayKey, selectedIds }));
}

function loadNutrientView() {
  try {
    const raw = localStorage.getItem(TODAY_NUTRIENT_VIEW_KEY);
    if (!raw) return DEFAULT_VIEW_KEYS;
    const parsed = JSON.parse(raw);
    if (!Array.isArray(parsed)) return DEFAULT_VIEW_KEYS;
    return parsed.length ? parsed : DEFAULT_VIEW_KEYS;
  } catch {
    return DEFAULT_VIEW_KEYS;
  }
}

function saveNutrientView(keys) {
  localStorage.setItem(TODAY_NUTRIENT_VIEW_KEY, JSON.stringify(keys));
}

function getDateKey(date) {
  return `${date.getFullYear()}-${String(date.getMonth() + 1).padStart(2, "0")}-${String(
    date.getDate()
  ).padStart(2, "0")}`;
}

function toNum(v) {
  if (v === null || v === undefined || v === "") return null;
  const n = Number(v);
  return Number.isFinite(n) ? n : null;
}

function calculateMainTargets(profile) {
  const weight = Number(profile?.weight_kg || 0);
  const height = Number(profile?.height_cm || 0);
  const activityLevel = profile?.activity_level || "moderate";

  if (!weight || !height) {
    return {
      calories: 2000,
      protein: 100,
      carbs: 250,
      fat: 67,
    };
  }

  const bmi = weight / (height / 100) ** 2;
  let activity = "moderate";
  if (activityLevel === "sedentary" || activityLevel === "light") activity = "light";
  if (activityLevel === "active" || activityLevel === "very_active") activity = "heavy";

  const status = bmi < 18.5 ? "underweight" : bmi < 24 ? "normal" : "overweight";
  const factors = {
    underweight: { light: [35, 35], moderate: [40, 40], heavy: [45, 45] },
    normal: { light: [30, 30], moderate: [35, 35], heavy: [40, 40] },
    overweight: { light: [20, 25], moderate: [30, 30], heavy: [35, 35] },
  };

  const [minF, maxF] = factors[status][activity];
  const calories = Math.round(weight * (minF + maxF) / 2);

  return {
    calories,
    protein: roundTo2((calories * 0.2) / 4),
    carbs: roundTo2((calories * 0.5) / 4),
    fat: roundTo2((calories * 0.3) / 9),
  };
}

function roundTo2(value) {
  return Math.round((Number(value) || 0) * 100) / 100;
}

function roundTo4(value) {
  return Math.round((Number(value) || 0) * 10000) / 10000;
}

function NutItem({ label, value, unit, hideZero = false }) {
  if (value == null) return null;
  if (hideZero && roundTo2(value) === 0) return null;
  return (
    <div style={ni.box}>
      <span style={ni.val}>{roundTo2(value)}{unit ? ` ${unit}` : ""}</span>
      <span style={ni.lbl}>{label}</span>
    </div>
  );
}

function ProgressCircleCard({ item }) {
  const target = item.target > 0 ? item.target : 1;
  const ratio = item.value / target;
  const percent = Math.max(0, Math.min(100, Math.round(ratio * 100)));
  const r = 34;
  const c = 2 * Math.PI * r;
  const dash = (Math.min(ratio, 1) * c).toFixed(2);

  return (
    <div style={s.progressCard}>
      <p style={s.progressLabel}>{item.label}</p>
      <div style={{ width: 86, height: 86, margin: "0 auto", position: "relative" }}>
        <svg width="86" height="86" viewBox="0 0 86 86">
          <circle cx="43" cy="43" r={r} fill="none" stroke={theme.borderLight} strokeWidth="7" />
          <circle
            cx="43"
            cy="43"
            r={r}
            fill="none"
            stroke={item.color}
            strokeWidth="7"
            strokeLinecap="round"
            strokeDasharray={`${dash} ${c}`}
            transform="rotate(-90 43 43)"
          />
        </svg>
        <div style={s.progressPercent}>{percent}%</div>
      </div>
      <p style={s.progressValue}>{roundTo2(item.value)} / {roundTo2(item.target)} {item.unit}</p>
    </div>
  );
}

function DetailNutrientsPanel({ recipeId, detail }) {
  const entries = Object.entries(detail || {})
    .filter(([, v]) => (toNum(v) || 0) !== 0)
    .sort((a, b) => getNutrientMeta(a[0]).label.localeCompare(getNutrientMeta(b[0]).label, "zh-TW"));

  return (
    <details style={s.detailPanel}>
      <summary style={s.detailSummary}>
        詳細營養素（非 0 顯示）
        <span style={s.detailCount}>{entries.length} 項</span>
      </summary>
      {entries.length === 0 ? (
        <div style={s.emptyDetail}>目前沒有可顯示的詳細營養素（皆為 0 或未提供）</div>
      ) : (
        <div style={s.nutrientGrid}>
          {entries.map(([key, value]) => {
            const meta = getNutrientMeta(key);
            return (
              <NutItem
                key={`${recipeId}-${key}`}
                label={meta.label}
                value={value}
                unit={meta.unit}
                hideZero
              />
            );
          })}
        </div>
      )}
    </details>
  );
}

const s = {
  page: { padding: "24px", maxWidth: "1120px", margin: "0 auto" },
  title: { color: theme.accent, marginBottom: "20px" },
  empty: { color: theme.textLight, textAlign: "center", marginTop: "60px" },
  center: { textAlign: "center", padding: "40px", color: theme.textLight },
  summaryCard: { background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: "12px", padding: "16px", marginBottom: "16px", boxShadow: "0 2px 8px rgba(0,0,0,0.06)" },
  summaryHeader: { display: "flex", justifyContent: "space-between", alignItems: "center", gap: "12px", flexWrap: "wrap" },
  selectorRow: { marginTop: "10px", marginBottom: "10px" },
  progressGrid: { display: "grid", gridTemplateColumns: "repeat(auto-fit,minmax(130px,1fr))", gap: "10px", marginBottom: "12px" },
  progressCard: { background: theme.inputBg, border: `1px solid ${theme.border}`, borderRadius: "10px", padding: "10px", textAlign: "center" },
  progressLabel: { margin: "0 0 6px", color: theme.text, fontSize: "13px", fontWeight: 700 },
  progressPercent: { position: "absolute", inset: 0, display: "flex", alignItems: "center", justifyContent: "center", color: theme.text, fontWeight: 700, fontSize: "13px" },
  progressValue: { margin: "6px 0 0", color: theme.textLight, fontSize: "12px" },
  select: { background: theme.inputBg, color: theme.text, border: `1px solid ${theme.border}`, borderRadius: "6px", padding: "8px 10px" },
  tagList: { display: "flex", gap: "8px", flexWrap: "wrap", marginBottom: "12px" },
  tag: { background: theme.accentLight, color: theme.text, borderRadius: "999px", padding: "4px 10px", fontSize: "12px", display: "inline-flex", alignItems: "center", gap: "8px" },
  tagBtn: { background: "transparent", color: theme.textMuted, border: "none", cursor: "pointer" },
  grid: { display: "grid", gridTemplateColumns: "repeat(auto-fill,minmax(320px,1fr))", gap: "16px" },
  card: { background: theme.cardBg, borderRadius: "8px", padding: "16px", border: `1px solid ${theme.border}`, boxShadow: "0 2px 6px rgba(0,0,0,0.06)" },
  cardHeader: { display: "flex", justifyContent: "space-between", alignItems: "flex-start", marginBottom: "8px" },
  cardActions: { display: "flex", gap: "8px" },
  selectRow: { color: theme.textMuted, display: "flex", alignItems: "center", gap: "8px", marginBottom: "8px", fontSize: "13px" },
  name: { color: theme.text, fontWeight: "bold", fontSize: "15px", flex: 1, marginRight: "8px" },
  meta: { color: theme.textMuted, fontSize: "13px", margin: "0 0 8px" },
  detailPanel: { marginTop: "8px", border: `1px solid ${theme.border}`, borderRadius: "8px", padding: "6px 8px", background: theme.inputBg },
  detailSummary: { color: theme.textMuted, fontSize: "12px", cursor: "pointer", userSelect: "none", marginBottom: "6px", display: "flex", justifyContent: "space-between", alignItems: "center" },
  detailCount: { color: theme.textLight, fontSize: "11px", marginLeft: "10px" },
  emptyDetail: { color: theme.textLight, fontSize: "12px", padding: "6px 2px" },
  nutrientGrid: { display: "grid", gridTemplateColumns: "repeat(auto-fit,minmax(120px,1fr))", gap: "8px", margin: "8px 0" },
  editPanel: { marginTop: "8px", borderTop: `1px solid ${theme.border}`, paddingTop: "10px" },
  editGrid: { display: "grid", gridTemplateColumns: "1fr 1fr", gap: "8px" },
  editActions: { display: "flex", gap: "8px", marginTop: "10px" },
  inputLabel: { color: theme.textMuted, fontSize: "12px", display: "flex", flexDirection: "column", gap: "4px" },
  input: { background: theme.inputBg, color: theme.text, border: `1px solid ${theme.border}`, borderRadius: "6px", padding: "6px 8px", fontSize: "13px", width: "100%", boxSizing: "border-box" },
  saveBtn: { background: theme.success, color: "#fff", border: "none", borderRadius: "6px", padding: "6px 12px", fontWeight: "bold", cursor: "pointer" },
  cancelBtn: { background: theme.inputBg, color: theme.textMuted, border: `1px solid ${theme.border}`, borderRadius: "6px", padding: "6px 12px", cursor: "pointer" },
  date: { color: theme.textLight, fontSize: "12px", marginTop: "8px" },
  inlineRemove: { marginLeft: "6px", background: "transparent", border: "none", color: theme.textMuted, cursor: "pointer", fontSize: "11px" },
  editBtn: { background: "transparent", border: `1px solid ${theme.success}`, color: theme.success, padding: "2px 8px", borderRadius: "4px", cursor: "pointer", fontSize: "12px" },
  delBtn: { background: "transparent", border: `1px solid ${theme.error}`, color: theme.error, padding: "2px 8px", borderRadius: "4px", cursor: "pointer", fontSize: "12px" },
};

const ni = {
  box: { background: theme.accentLight, borderRadius: "6px", padding: "6px 10px", textAlign: "center" },
  val: { display: "block", color: theme.accent, fontWeight: "bold", fontSize: "13px" },
  lbl: { display: "block", color: theme.textMuted, fontSize: "11px" },
};
