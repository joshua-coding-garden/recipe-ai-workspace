import { useEffect, useMemo, useState } from "react";
import { getProfile, updateProfile } from "../api/authApi";
import { getDietLogs } from "../api/dietApi";
import { listRecipes } from "../api/recipeApi";
import LoadingSpinner from "../components/common/LoadingSpinner";
import ErrorMessage from "../components/common/ErrorMessage";
import {
  DRI_V8_SOURCE_URL,
  getDriTargets,
  getNutrientMeta,
  resolveDriTarget,
  resolveDriUpperLimit,
} from "../utils/driReferences";
import theme from "../utils/theme";

const TODAY_SELECTION_KEY = "today_recipe_intake_selection";
const PROFILE_VIEW_NUTRIENTS_KEY = "profile_view_nutrients";

const DEFAULT_PROFILE_NUTRIENTS = [
  "dietary_fiber_per_100g",
  "vitamin_c_mg",
  "calcium_per_100g",
  "iron_per_100g",
  "sodium_per_100g",
];

// 個人檔案 5 級英文活動量 → HPA 第八版 4 級中文活動強度
const ACTIVITY_PROFILE_TO_HPA = {
  sedentary: "低",
  light: "稍低",
  moderate: "適度",
  active: "高",
  very_active: "高",
};

export default function ProfilePage() {
  const [profile, setProfile] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [editing, setEditing] = useState(false);
  const [form, setForm] = useState({});
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);
  const [dietLogs, setDietLogs] = useState([]);
  const [recipes, setRecipes] = useState([]);
  const [selectedRecipeIds, setSelectedRecipeIds] = useState([]);
  const [selectedNutrientKeys, setSelectedNutrientKeys] = useState(DEFAULT_PROFILE_NUTRIENTS);

  useEffect(() => {
    fetchProfile();
    fetchDietLogs();
    fetchRecipes();
    setSelectedRecipeIds(loadTodayRecipeSelection());
    setSelectedNutrientKeys(loadProfileNutrients());
  }, []);

  async function fetchProfile() {
    try {
      setLoading(true);
      setError(null);
      const data = await getProfile();
      setProfile(data);
      setForm({
        username: data.username || "",
        height_cm: data.height_cm || "",
        weight_kg: data.weight_kg || "",
        age: data.age || "",
        gender: data.gender || "",
        activity_level: data.activity_level || "moderate",
        goal: data.goal || "",
      });
    } catch (err) {
      setError(err.message || "載入個人資料失敗");
    } finally {
      setLoading(false);
    }
  }

  async function fetchDietLogs() {
    try {
      const data = await getDietLogs();
      setDietLogs(Array.isArray(data) ? data : []);
    } catch {
      setDietLogs([]);
    }
  }

  async function fetchRecipes() {
    try {
      const data = await listRecipes();
      setRecipes(Array.isArray(data) ? data : []);
    } catch {
      setRecipes([]);
    }
  }

  async function handleSave(e) {
    e.preventDefault();
    try {
      setSaving(true);
      const updated = await updateProfile({
        ...form,
        height_cm: form.height_cm ? parseFloat(form.height_cm) : null,
        weight_kg: form.weight_kg ? parseFloat(form.weight_kg) : null,
        age: form.age ? parseInt(form.age, 10) : null,
      });
      setProfile(updated);
      setEditing(false);
      setSaved(true);
      setTimeout(() => setSaved(false), 3000);
    } catch (err) {
      setError(err.message || "更新失敗");
    } finally {
      setSaving(false);
    }
  }

  const activityLabels = {
    sedentary: "久坐（幾乎不運動）",
    light: "輕度（每週 1-3 天）",
    moderate: "中度（每週 3-5 天）",
    active: "積極（每週 6-7 天）",
    very_active: "非常積極（每天高強度）",
  };

  const genderLabels = { male: "男", female: "女", other: "其他" };

  const bmi = useMemo(() => {
    if (!profile?.height_cm || !profile?.weight_kg) return null;
    return profile.weight_kg / (profile.height_cm / 100) ** 2;
  }, [profile]);

  const caloriePlan = useMemo(() => calculateDailyCalorieTarget(profile, bmi), [profile, bmi]);

  const intake = useMemo(
    () => summarizeTodayIntake(dietLogs, recipes, selectedRecipeIds),
    [dietLogs, recipes, selectedRecipeIds]
  );

  const macroTarget = useMemo(() => {
    if (!caloriePlan?.targetKcal) return null;
    return {
      protein: roundTo1((caloriePlan.targetKcal * 0.2) / 4),
      carbs: roundTo1((caloriePlan.targetKcal * 0.5) / 4),
      fat: roundTo1((caloriePlan.targetKcal * 0.3) / 9),
    };
  }, [caloriePlan]);

  const dri = useMemo(() => {
    const hpaActivity = ACTIVITY_PROFILE_TO_HPA[profile?.activity_level] || undefined;
    return getDriTargets({ ...profile, activityLevel: hpaActivity });
  }, [profile]);

  const nutrientOptions = useMemo(() => {
    const keys = new Set([...Object.keys(dri.targets || {}), ...Object.keys(intake.nutrients || {})]);
    return [...keys]
      .map((key) => ({ key, ...getNutrientMeta(key) }))
      .sort((a, b) => a.label.localeCompare(b.label, "zh-TW"));
  }, [dri.targets, intake.nutrients]);

  const macroProgress = useMemo(() => {
    if (!macroTarget || !caloriePlan?.targetKcal) return [];
    return [
      {
        key: "calories",
        label: "熱量",
        value: intake.calories,
        target: caloriePlan.targetKcal,
        unit: "kcal",
        color: "#4f46e5",
      },
      {
        key: "protein",
        label: "蛋白質",
        value: intake.protein,
        target: macroTarget.protein,
        unit: "g",
        color: "#0ea5e9",
      },
      {
        key: "carbs",
        label: "碳水",
        value: intake.carbs,
        target: macroTarget.carbs,
        unit: "g",
        color: "#10b981",
      },
      {
        key: "fat",
        label: "脂肪",
        value: intake.fat,
        target: macroTarget.fat,
        unit: "g",
        color: "#f59e0b",
      },
    ];
  }, [macroTarget, caloriePlan, intake]);

  const extendedProgress = useMemo(() => {
    return selectedNutrientKeys.map((key) => {
      const meta = getNutrientMeta(key);
      const target = resolveDriTarget(dri.targets, key);
      const upperLimit = resolveDriUpperLimit(dri.upperLimits, key);
      const value = intake.nutrients?.[key] ?? 0;
      return {
        key,
        label: meta.label,
        unit: meta.unit,
        value,
        target,
        upperLimit,
      };
    });
  }, [selectedNutrientKeys, dri.targets, dri.upperLimits, intake.nutrients]);

  function addNutrientView(key) {
    if (!key) return;
    const next = selectedNutrientKeys.includes(key) ? selectedNutrientKeys : [...selectedNutrientKeys, key];
    setSelectedNutrientKeys(next);
    saveProfileNutrients(next);
  }

  function removeNutrientView(key) {
    const next = selectedNutrientKeys.filter((k) => k !== key);
    setSelectedNutrientKeys(next);
    saveProfileNutrients(next.length ? next : DEFAULT_PROFILE_NUTRIENTS);
  }

  if (loading) return <LoadingSpinner message="載入個人資料中..." />;

  return (
    <div style={{ maxWidth: 980, margin: "0 auto", padding: "24px 16px" }}>
      <h1 style={{ fontSize: 28, fontWeight: 700, color: theme.text, marginBottom: 24 }}>個人資料</h1>

      {error && <ErrorMessage message={error} onDismiss={() => setError(null)} />}

      {saved && (
        <div style={successStyle}>
          個人資料已更新（含年齡）
        </div>
      )}

      <div style={cardStyle}>
        <div style={heroStyle}>
          <div style={avatarStyle}>{profile?.username?.[0]?.toUpperCase() || "U"}</div>
          <p style={{ color: "#fff", fontWeight: 600, fontSize: 20, margin: 0 }}>{profile?.username || "用戶"}</p>
          <p style={{ color: "rgba(255,255,255,0.7)", fontSize: 14, margin: "4px 0 0" }}>{profile?.email}</p>
        </div>

        <div style={{ padding: 24 }}>
          {!editing ? (
            <>
              <div style={infoGridStyle}>
                <InfoItem label="身高" value={profile?.height_cm ? `${profile.height_cm} cm` : "未設定"} />
                <InfoItem label="體重" value={profile?.weight_kg ? `${profile.weight_kg} kg` : "未設定"} />
                <InfoItem label="年齡" value={profile?.age ? `${profile.age} 歲` : "未設定"} />
                <InfoItem label="性別" value={genderLabels[profile?.gender] || "未設定"} />
                <InfoItem label="活動量" value={activityLabels[profile?.activity_level] || "未設定"} wide />
                <InfoItem label="目標" value={profile?.goal || "未設定"} wide />
              </div>

              {bmi && (
                <div style={bmiCardStyle}>
                  <p style={{ fontWeight: 600, color: "#0369a1", marginBottom: 8 }}>BMI 指數</p>
                  <p style={{ fontSize: 28, fontWeight: 700, color: "#0ea5e9", margin: 0 }}>{bmi.toFixed(1)}</p>
                  <p style={{ color: theme.textLight, fontSize: 13, margin: "4px 0 0" }}>{getBMILabel(bmi)}</p>
                </div>
              )}

              {dri?.anthropometry && (
                <div style={hpaRefCardStyle}>
                  <p style={{ fontWeight: 600, color: "#475569", marginBottom: 6, fontSize: 13 }}>
                    HPA 第八版標準參考體型（{dri.ageBand}）
                  </p>
                  <p style={{ color: theme.textMuted, fontSize: 12, margin: 0 }}>
                    身高 <b style={{ color: theme.text }}>{dri.anthropometry.height_cm} cm</b>
                    體重 <b style={{ color: theme.text }}>{dri.anthropometry.weight_kg} kg</b>
                    　|　活動強度：<b style={{ color: theme.text }}>{dri.activityLevel}</b>
                    {dri.activityLevelRequested && dri.activityLevelRequested !== dri.activityLevel
                      ? `（您選的「${dri.activityLevelRequested}」HPA 未提供，已回退預設）`
                      : ""}
                  </p>
                  <p style={{ color: theme.textLight, fontSize: 11, margin: "4px 0 0" }}>
                    這是 HPA 計算建議攝取量（RDA）時假設的標準體型。下方營養素目標即依此推算。
                  </p>
                </div>
              )}

              <CalorieFormulaCard caloriePlan={caloriePlan} bmi={bmi} />

              {caloriePlan?.ready && (
                <div style={sectionCardStyle}>
                  <p style={sectionTitleStyle}>今日需求與攝取進度</p>
                  <p style={sectionHintStyle}>攝取來源：今日飲食記錄 + 我的食譜勾選「納入今日攝取進度」</p>
                  <div style={macroGridStyle}>
                    {macroProgress.map((item) => (
                      <ProgressCircleCard key={item.key} {...item} />
                    ))}
                  </div>
                </div>
              )}

              <div style={sectionCardStyle}>
                <div style={{ display: "flex", justifyContent: "space-between", alignItems: "center", gap: 12, flexWrap: "wrap" }}>
                  <p style={{ ...sectionTitleStyle, marginBottom: 0 }}>擴充營養素進度（DRI 第八版）</p>
                  <select
                    style={selectStyle}
                    defaultValue=""
                    onChange={(e) => {
                      addNutrientView(e.target.value);
                      e.target.value = "";
                    }}
                  >
                    <option value="">+ 新增要追蹤的營養素</option>
                    {nutrientOptions.map((n) => (
                      <option key={n.key} value={n.key}>{n.label}</option>
                    ))}
                  </select>
                </div>

                <p style={sectionHintStyle}>
                  {dri.source}
                  <a
                    href={DRI_V8_SOURCE_URL}
                    target="_blank"
                    rel="noreferrer"
                    style={{ marginLeft: 8, color: theme.accent, fontWeight: 600 }}
                  >
                    明確來源（PDF）
                  </a>
                </p>
                <p style={{ ...sectionHintStyle, marginTop: -6 }}>
                  年齡分層：{dri.ageBand || "未設定"} | 資料格式：{dri.storageFormat || "javascript-object"}
                </p>

                <div style={chipWrapStyle}>
                  {selectedNutrientKeys.map((k) => {
                    const meta = getNutrientMeta(k);
                    return (
                      <span key={k} style={chipStyle}>
                        {meta.label}
                        <button style={chipButtonStyle} onClick={() => removeNutrientView(k)}>x</button>
                      </span>
                    );
                  })}
                </div>

                <div style={extendedGridStyle}>
                  {extendedProgress.map((item) => (
                    <NutrientProgressRow key={item.key} item={item} />
                  ))}
                </div>
              </div>

              <button onClick={() => setEditing(true)} style={primaryButtonStyle}>編輯資料</button>
            </>
          ) : (
            <form onSubmit={handleSave}>
              <div style={hintBoxStyle}>
                建議至少填寫：身高、體重、年齡、性別、活動量。系統會用這些欄位估算每日熱量需求與營養目標。
              </div>
              <div style={infoGridStyle}>
                <FormField label="用戶名稱" type="text" value={form.username} onChange={(v) => setForm({ ...form, username: v })} placeholder="例如：王小明" wide />
                <FormField label="身高 (cm)" type="number" value={form.height_cm} onChange={(v) => setForm({ ...form, height_cm: v })} min="100" max="250" placeholder="例如：170" />
                <FormField label="體重 (kg)" type="number" value={form.weight_kg} onChange={(v) => setForm({ ...form, weight_kg: v })} min="20" max="300" placeholder="例如：65" />
                <FormField label="年齡" type="number" value={form.age} onChange={(v) => setForm({ ...form, age: v })} min="1" max="120" placeholder="例如：28" />

                <div>
                  <label style={labelStyle}>性別</label>
                  <select value={form.gender} onChange={(e) => setForm({ ...form, gender: e.target.value })} style={selectStyle}>
                    <option value="">未設定</option>
                    <option value="male">男</option>
                    <option value="female">女</option>
                    <option value="other">其他</option>
                  </select>
                </div>

                <div>
                  <label style={labelStyle}>活動量</label>
                  <select
                    value={form.activity_level}
                    onChange={(e) => setForm({ ...form, activity_level: e.target.value })}
                    style={selectStyle}
                  >
                    {Object.entries(activityLabels).map(([k, v]) => (
                      <option key={k} value={k}>{v}</option>
                    ))}
                  </select>
                </div>

                <div style={{ gridColumn: "1 / -1" }}>
                  <label style={labelStyle}>健康目標</label>
                  <input type="text" value={form.goal} onChange={(e) => setForm({ ...form, goal: e.target.value })} placeholder="例：增肌減脂、維持體重..." style={inputStyle} />
                </div>
              </div>

              <div style={{ display: "flex", gap: 12 }}>
                <button type="submit" disabled={saving} style={{ ...primaryButtonStyle, flex: 1 }}>
                  {saving ? "儲存中..." : "儲存"}
                </button>
                <button type="button" onClick={() => setEditing(false)} style={secondaryButtonStyle}>取消</button>
              </div>
            </form>
          )}
        </div>
      </div>
    </div>
  );
}

function CalorieFormulaCard({ caloriePlan, bmi }) {
  return (
    <div style={sectionCardStyle}>
      <p style={sectionTitleStyle}>衛福部每日熱量估算（依體重與活動量）</p>
      <p style={sectionHintStyle}>來源：衛生福利部國民健康署「每日飲食建議量」</p>
      <div style={{ overflowX: "auto", marginBottom: 10 }}>
        <table style={tableStyle}>
          <thead>
            <tr>
              <th style={thStyle}>活動量</th>
              <th style={thStyle}>體重過輕</th>
              <th style={thStyle}>體重正常</th>
              <th style={thStyle}>過重/肥胖</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style={tdStyle}>輕度</td>
              <td style={tdStyle}>35 x 體重(kg)</td>
              <td style={tdStyle}>30 x 體重(kg)</td>
              <td style={tdStyle}>20-25 x 體重(kg)</td>
            </tr>
            <tr>
              <td style={tdStyle}>中度</td>
              <td style={tdStyle}>40 x 體重(kg)</td>
              <td style={tdStyle}>35 x 體重(kg)</td>
              <td style={tdStyle}>30 x 體重(kg)</td>
            </tr>
            <tr>
              <td style={tdStyle}>重度</td>
              <td style={tdStyle}>45 x 體重(kg)</td>
              <td style={tdStyle}>40 x 體重(kg)</td>
              <td style={tdStyle}>35 x 體重(kg)</td>
            </tr>
          </tbody>
        </table>
      </div>

      {!caloriePlan?.ready ? (
        <p style={{ margin: 0, color: theme.textMuted, fontSize: 13 }}>
          請先填寫「身高、體重、活動量」後即可自動估算每日所需熱量。
        </p>
      ) : (
        <div style={{ color: theme.text, fontSize: 14 }}>
          <p style={{ margin: "0 0 6px" }}>
            你的狀態：{caloriePlan.weightStatusLabel}（BMI {bmi.toFixed(1)}）
          </p>
          <p style={{ margin: 0 }}>
            建議熱量：
            <strong style={{ marginLeft: 4 }}>
              {caloriePlan.minKcal === caloriePlan.maxKcal
                ? `${caloriePlan.minKcal} kcal/日`
                : `${caloriePlan.minKcal} - ${caloriePlan.maxKcal} kcal/日`}
            </strong>
          </p>
        </div>
      )}

      <a
        href="https://www.hpa.gov.tw/Pages/Detail.aspx?nodeid=544&pid=728"
        target="_blank"
        rel="noreferrer"
        style={{ fontSize: 12, color: theme.accent, display: "inline-block", marginTop: 8 }}
      >
        查看官方說明
      </a>
    </div>
  );
}

function NutrientProgressRow({ item }) {
  const target = item.target || 0;
  const pct = target > 0 ? Math.min(100, Math.round((item.value / target) * 100)) : null;
  const ul = item.upperLimit || 0;
  const ulPct = ul > 0 ? Math.round((item.value / ul) * 100) : null;
  const risk = ul > 0 && item.value >= ul;
  const nearRisk = ul > 0 && !risk && item.value >= ul * 0.85;

  return (
    <div style={nutrientRowStyle}>
      <div style={{ display: "flex", justifyContent: "space-between", marginBottom: 6 }}>
        <span style={{ color: theme.text, fontWeight: 600, fontSize: 14 }}>{item.label}</span>
        <span style={{ color: theme.textMuted, fontSize: 13 }}>
          {roundTo2(item.value)} {item.unit}
          {target ? ` / ${roundTo2(target)} ${item.unit}` : ""}
        </span>
      </div>
      {target ? (
        <>
          <div style={{ marginTop: 2, fontSize: 12, color: theme.textLight }}>建議值進度</div>
          <div style={trackStyle}>
            <div style={{ ...fillStyle, width: `${pct}%` }} />
          </div>
          <div style={{ marginTop: 4, fontSize: 12, color: theme.textLight }}>{pct}%</div>
        </>
      ) : (
        <div style={{ fontSize: 12, color: theme.textLight }}>參考值未收錄，先顯示攝取量</div>
      )}

      {ul > 0 ? (
        <>
          <div style={{ marginTop: 8, fontSize: 12, color: theme.textLight }}>上限攝取量進度</div>
          <div style={{ ...trackStyle, background: "#fee2e2" }}>
            <div
              style={{
                height: "100%",
                width: `${Math.min(100, Math.max(0, ulPct || 0))}%`,
                background: risk ? "#dc2626" : nearRisk ? "#f59e0b" : "#22c55e",
              }}
            />
          </div>
          <div style={{ marginTop: 4, fontSize: 12, color: risk ? "#b91c1c" : nearRisk ? "#b45309" : theme.textLight }}>
            上限攝取量：{roundTo2(ul)} {item.unit}
            {ulPct != null ? `（${ulPct}%）` : ""}
            {risk ? " | 已超過上限" : nearRisk ? " | 接近上限" : ""}
          </div>
        </>
      ) : null}
    </div>
  );
}

function InfoItem({ label, value, wide }) {
  return (
    <div style={{ gridColumn: wide ? "1 / -1" : undefined }}>
      <p style={{ color: theme.textLight, fontSize: 13, margin: "0 0 4px" }}>{label}</p>
      <p style={{ fontWeight: 600, fontSize: 15, margin: 0, color: theme.text }}>{value}</p>
    </div>
  );
}

function FormField({ label, type, value, onChange, min, max, wide, placeholder }) {
  return (
    <div style={{ gridColumn: wide ? "1 / -1" : undefined }}>
      <label style={labelStyle}>{label}</label>
      <input type={type} value={value} onChange={(e) => onChange(e.target.value)} min={min} max={max} placeholder={placeholder} style={inputStyle} />
    </div>
  );
}

function ProgressCircleCard({ label, value, target, unit, color }) {
  const safeTarget = target > 0 ? target : 1;
  const ratio = value / safeTarget;
  const percent = Math.max(0, Math.min(100, Math.round(ratio * 100)));
  const r = 38;
  const c = 2 * Math.PI * r;
  const dash = (Math.min(ratio, 1) * c).toFixed(2);

  return (
    <div style={progressCardStyle}>
      <p style={{ margin: "0 0 8px", fontSize: 14, color: theme.textMuted, fontWeight: 600 }}>{label}</p>
      <div style={{ width: 96, height: 96, margin: "0 auto", position: "relative" }}>
        <svg width="96" height="96" viewBox="0 0 96 96">
          <circle cx="48" cy="48" r={r} fill="none" stroke={theme.borderLight} strokeWidth="8" />
          <circle
            cx="48"
            cy="48"
            r={r}
            fill="none"
            stroke={color}
            strokeWidth="8"
            strokeLinecap="round"
            strokeDasharray={`${dash} ${c}`}
            transform="rotate(-90 48 48)"
          />
        </svg>
        <div style={progressPercentStyle}>{percent}%</div>
      </div>
      <p style={{ margin: "8px 0 0", fontSize: 13, color: theme.textLight }}>
        {roundTo1(value)} / {roundTo1(target)} {unit}
      </p>
    </div>
  );
}

function summarizeTodayIntake(logs, recipes, selectedRecipeIds) {
  const today = new Date();
  const nutrients = {};

  let calories = 0;
  let protein = 0;
  let carbs = 0;
  let fat = 0;

  for (const log of logs || []) {
    const time = log?.logged_at ? new Date(log.logged_at) : null;
    if (!time || Number.isNaN(time.getTime())) continue;

    if (
      time.getFullYear() !== today.getFullYear() ||
      time.getMonth() !== today.getMonth() ||
      time.getDate() !== today.getDate()
    ) {
      continue;
    }

    const detail = normalizeDetail(log?.nutrition_detail || {});
    mergeNutrients(nutrients, detail);

    calories += toNumber(log?.calories) ?? toNumber(detail.cal_per_100g) ?? toNumber(detail.calories) ?? 0;
    protein += toNumber(detail.protein_per_100g) ?? toNumber(detail.protein) ?? 0;
    carbs += toNumber(detail.carbon_per_100g) ?? toNumber(detail.carbs) ?? 0;
    fat += toNumber(detail.fats_per_100g) ?? toNumber(detail.fat) ?? 0;
  }

  for (const recipe of recipes || []) {
    if (!selectedRecipeIds.includes(recipe.id)) continue;

    const detail = normalizeDetail(recipe?.nutrition_detail || {});
    mergeNutrients(nutrients, detail);

    calories += toNumber(recipe?.calories) ?? toNumber(detail.cal_per_100g) ?? toNumber(detail.calories) ?? 0;
    protein += toNumber(recipe?.protein) ?? toNumber(detail.protein_per_100g) ?? toNumber(detail.protein) ?? 0;
    carbs += toNumber(recipe?.carbs) ?? toNumber(detail.carbon_per_100g) ?? toNumber(detail.carbs) ?? 0;
    fat += toNumber(recipe?.fat) ?? toNumber(detail.fats_per_100g) ?? toNumber(detail.fat) ?? 0;
  }

  nutrients.calories = (nutrients.calories || 0) + calories;
  nutrients.protein = (nutrients.protein || 0) + protein;
  nutrients.carbs = (nutrients.carbs || 0) + carbs;
  nutrients.fat = (nutrients.fat || 0) + fat;

  return {
    calories,
    protein,
    carbs,
    fat,
    nutrients,
  };
}

function mergeNutrients(target, source) {
  Object.entries(source || {}).forEach(([k, v]) => {
    target[k] = (target[k] || 0) + (toNumber(v) || 0);
  });
}

function normalizeDetail(detail) {
  const out = {};
  Object.entries(detail || {}).forEach(([k, v]) => {
    const n = toNumber(v);
    if (n != null) out[k] = n;
  });
  return out;
}

function calculateDailyCalorieTarget(profile, bmi) {
  const weight = Number(profile?.weight_kg);
  const activity = normalizeActivityLevel(profile?.activity_level);

  if (!weight || !activity || !bmi) return { ready: false };

  const status = getWeightStatusByBMI(bmi);
  const factors = {
    underweight: { light: [35, 35], moderate: [40, 40], heavy: [45, 45] },
    normal: { light: [30, 30], moderate: [35, 35], heavy: [40, 40] },
    overweight_or_obese: { light: [20, 25], moderate: [30, 30], heavy: [35, 35] },
  };

  const selected = factors[status][activity];
  const minKcal = Math.round(weight * selected[0]);
  const maxKcal = Math.round(weight * selected[1]);
  const targetKcal = Math.round((minKcal + maxKcal) / 2);

  return {
    ready: true,
    minKcal,
    maxKcal,
    targetKcal,
    weightStatusLabel: status === "underweight" ? "體重過輕" : status === "normal" ? "體重正常" : "過重或肥胖",
  };
}

function normalizeActivityLevel(activityLevel) {
  if (activityLevel === "sedentary" || activityLevel === "light") return "light";
  if (activityLevel === "moderate") return "moderate";
  if (activityLevel === "active" || activityLevel === "very_active") return "heavy";
  return null;
}

function getWeightStatusByBMI(bmi) {
  if (bmi < 18.5) return "underweight";
  if (bmi < 24) return "normal";
  return "overweight_or_obese";
}

function getBMILabel(bmi) {
  if (bmi < 18.5) return "過輕";
  if (bmi < 24) return "正常";
  if (bmi < 27) return "過重";
  return "肥胖";
}

function loadTodayRecipeSelection() {
  try {
    const raw = localStorage.getItem(TODAY_SELECTION_KEY);
    if (!raw) return [];
    const parsed = JSON.parse(raw);
    const now = new Date();
    const todayKey = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
    if (parsed?.date !== todayKey || !Array.isArray(parsed?.selectedIds)) return [];
    return parsed.selectedIds;
  } catch {
    return [];
  }
}

function loadProfileNutrients() {
  try {
    const raw = localStorage.getItem(PROFILE_VIEW_NUTRIENTS_KEY);
    if (!raw) return DEFAULT_PROFILE_NUTRIENTS;
    const parsed = JSON.parse(raw);
    if (!Array.isArray(parsed) || parsed.length === 0) return DEFAULT_PROFILE_NUTRIENTS;
    return parsed;
  } catch {
    return DEFAULT_PROFILE_NUTRIENTS;
  }
}

function saveProfileNutrients(keys) {
  localStorage.setItem(PROFILE_VIEW_NUTRIENTS_KEY, JSON.stringify(keys));
}

function toNumber(value) {
  const n = Number(value);
  return Number.isFinite(n) ? n : null;
}

function roundTo1(value) {
  return Math.round((Number(value) || 0) * 10) / 10;
}

function roundTo2(value) {
  return Math.round((Number(value) || 0) * 100) / 100;
}

const successStyle = {
  padding: "12px 16px",
  background: theme.successBg,
  border: `1px solid #a5d6a7`,
  borderRadius: 8,
  color: theme.success,
  marginBottom: 16,
  fontWeight: 500,
};

const cardStyle = { background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: 16, overflow: "hidden", boxShadow: "0 2px 12px rgba(0,0,0,0.06)" };
const heroStyle = { background: `linear-gradient(135deg, ${theme.accent}, ${theme.accentHover})`, padding: "32px 24px", textAlign: "center" };
const avatarStyle = {
  width: 80,
  height: 80,
  borderRadius: "50%",
  background: "rgba(255,255,255,0.2)",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  fontSize: 36,
  margin: "0 auto 12px",
  color: "#fff",
  fontWeight: 700,
};

const infoGridStyle = { display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))", gap: 16, marginBottom: 24 };
const bmiCardStyle = { background: "#f0f9ff", border: "1px solid #bae6fd", borderRadius: 10, padding: 16, marginBottom: 20 };
const hpaRefCardStyle = { background: "#f8fafc", border: "1px solid #e2e8f0", borderRadius: 10, padding: 12, marginBottom: 20 };
const sectionCardStyle = { background: theme.inputBg, border: `1px solid ${theme.border}`, borderRadius: 12, padding: 16, marginBottom: 20 };
const sectionTitleStyle = { margin: "0 0 6px", fontWeight: 700, color: theme.text };
const sectionHintStyle = { margin: "0 0 12px", color: theme.textLight, fontSize: 13 };

const macroGridStyle = { display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(160px, 1fr))", gap: 14 };
const extendedGridStyle = { display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(260px, 1fr))", gap: 10 };
const nutrientRowStyle = { background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: 8, padding: 10 };
const trackStyle = { width: "100%", height: 8, borderRadius: 999, background: theme.borderLight, overflow: "hidden" };
const fillStyle = { height: "100%", background: theme.accent };

const chipWrapStyle = { display: "flex", gap: 8, flexWrap: "wrap", marginBottom: 12 };
const chipStyle = { background: theme.accentLight, color: theme.text, borderRadius: 999, padding: "4px 10px", fontSize: 12, display: "inline-flex", alignItems: "center", gap: 8 };
const chipButtonStyle = { background: "transparent", border: "none", color: theme.textMuted, cursor: "pointer", fontSize: 11 };

const labelStyle = { display: "block", marginBottom: 6, fontWeight: 500, fontSize: 14, color: theme.text };
const inputStyle = { width: "100%", padding: "10px 12px", border: `1px solid ${theme.border}`, borderRadius: 8, fontSize: 14, boxSizing: "border-box", background: theme.inputBg, color: theme.text };
const selectStyle = { ...inputStyle, background: theme.cardBg };

const primaryButtonStyle = {
  width: "100%",
  padding: "12px",
  background: theme.accent,
  color: "#fff",
  border: "none",
  borderRadius: 8,
  cursor: "pointer",
  fontWeight: 600,
  fontSize: 15,
};

const secondaryButtonStyle = {
  flex: 1,
  padding: "12px",
  background: theme.inputBg,
  color: theme.textMuted,
  border: `1px solid ${theme.border}`,
  borderRadius: 8,
  cursor: "pointer",
  fontWeight: 600,
};

const hintBoxStyle = {
  marginBottom: 14,
  padding: "10px 12px",
  borderRadius: 8,
  background: theme.inputBg,
  border: `1px solid ${theme.border}`,
  color: theme.textMuted,
  fontSize: 13,
};

const progressCardStyle = { border: `1px solid ${theme.border}`, borderRadius: 12, padding: 12, background: theme.cardBg, textAlign: "center" };
const progressPercentStyle = {
  position: "absolute",
  inset: 0,
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
  color: theme.text,
  fontWeight: 700,
};

const tableStyle = { width: "100%", borderCollapse: "collapse", minWidth: 560, fontSize: 13 };
const thStyle = { textAlign: "left", borderBottom: `1px solid ${theme.border}`, padding: "8px 10px", color: theme.textMuted, background: theme.inputBg, fontWeight: 700 };
const tdStyle = { borderBottom: `1px solid ${theme.borderLight}`, padding: "8px 10px", color: theme.textMuted };
