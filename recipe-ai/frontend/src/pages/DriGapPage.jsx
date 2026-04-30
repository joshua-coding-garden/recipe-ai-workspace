import { useState } from "react";
import theme from "../utils/theme";
import {
  getDriTargets,
  ACTIVITY_LEVELS,
  ACTIVITY_DEFAULT,
  ACTIVITY_DESCRIPTIONS,
  getAvailableActivityLevels,
} from "../utils/driReferences";
import { buildDriRows, calculateDriGap, STATUS_COLORS } from "../utils/driCalculations";
import { getNutrientFoods } from "../api/healthApi";
import TaiwanFoodModal from "../components/food/TaiwanFoodModal";

const STEPS = ["輸入個人資訊", "DRI 建議值 + 攝取量輸入", "缺口分析結果", "食物推薦排行"];

function ProcessBlock({ title, children, defaultOpen = true }) {
  const [open, setOpen] = useState(defaultOpen);
  return (
    <div style={{ margin: "12px 0", border: `1px solid ${theme.border}`, borderRadius: 8, overflow: "hidden" }}>
      <div
        onClick={() => setOpen(!open)}
        style={{ padding: "8px 14px", background: theme.accentLight, cursor: "pointer", fontWeight: 600, fontSize: 13, color: theme.accent, display: "flex", justifyContent: "space-between", alignItems: "center" }}
      >
        <span>{title}</span>
        <span>{open ? "▲" : "▼"}</span>
      </div>
      {open && <div style={{ padding: "10px 14px", fontSize: 13, color: theme.textMuted, background: "#f9fcf9" }}>{children}</div>}
    </div>
  );
}

function StepIndicator({ current }) {
  return (
    <div style={{ display: "flex", gap: 8, marginBottom: 20, flexWrap: "wrap" }}>
      {STEPS.map((label, i) => (
        <div key={i} style={{ padding: "6px 14px", borderRadius: 20, fontSize: 13, fontWeight: i === current ? 700 : 400, background: i === current ? theme.accent : i < current ? theme.accentLight : theme.inputBg, color: i === current ? "#fff" : i < current ? theme.accent : theme.textMuted }}>
          {i + 1}. {label}
        </div>
      ))}
    </div>
  );
}

export default function DriGapPage() {
  const [step, setStep] = useState(0);
  const [age, setAge] = useState("");
  const [sex, setSex] = useState("male");
  const [activityLevel, setActivityLevel] = useState(ACTIVITY_DEFAULT);
  const [driInfo, setDriInfo] = useState(null);
  const [driRows, setDriRows] = useState([]);
  const [intake, setIntake] = useState({});
  const [gapResults, setGapResults] = useState([]);
  const [foodRecs, setFoodRecs] = useState({});
  const [foodLoading, setFoodLoading] = useState(false);
  const [foodError, setFoodError] = useState(null);
  const [selectedFoodId, setSelectedFoodId] = useState(null);

  const ageNum = Number(age) || 0;
  const availableActivities = ageNum >= 1 && ageNum <= 120
    ? getAvailableActivityLevels(ageNum, sex)
    : ACTIVITY_LEVELS;

  // Step 1 -> 2
  const handleLookupDri = () => {
    const a = Number(age);
    if (!a || a < 1 || a > 120) return;
    const info = getDriTargets({ age: a, gender: sex, activityLevel });
    const rows = buildDriRows(info.targets, info.upperLimits);
    setDriInfo(info);
    setDriRows(rows);
    setIntake({});
    setStep(1);
  };

  // Step 2 -> 3
  const handleCalcGap = () => {
    const results = calculateDriGap(intake, driRows);
    setGapResults(results);
    setStep(2);
  };

  // Step 3 -> 4
  const handleFoodRec = async () => {
    const deficient = gapResults.filter((r) => r.status === "deficient" || r.status === "low");
    if (deficient.length === 0) {
      setStep(3);
      setFoodRecs({});
      return;
    }
    setFoodLoading(true);
    setFoodError(null);
    setStep(3);
    try {
      const results = {};
      for (const item of deficient) {
        try {
          const foods = await getNutrientFoods(item.field, 10);
          results[item.field] = { nutrient: item.nutrient, foods: foods?.foods || foods || [] };
        } catch {
          results[item.field] = { nutrient: item.nutrient, foods: [], error: true };
        }
      }
      setFoodRecs(results);
    } catch (e) {
      setFoodError(e.message || "查詢失敗");
    } finally {
      setFoodLoading(false);
    }
  };

  const deficientCount = gapResults.filter((r) => r.status === "deficient" || r.status === "low").length;
  const excessCount = gapResults.filter((r) => r.status === "excess").length;
  const nearLimitCount = gapResults.filter((r) => r.status === "near_limit").length;

  return (
    <div style={{ minHeight: "100vh", background: theme.bg, padding: "24px 16px" }}>
      <div style={{ maxWidth: 900, margin: "0 auto" }}>
        <h1 style={{ color: theme.accent, marginBottom: 4, fontSize: 24 }}>DRI 營養缺口分析</h1>
        <p style={{ color: theme.textMuted, marginBottom: 20, fontSize: 14 }}>根據國人膳食營養素參考攝取量第八版，分析您的每日營養素缺口</p>

        <StepIndicator current={step} />

        {/* ---- STEP 1 ---- */}
        {step === 0 && (
          <div style={styles.card}>
            <h2 style={styles.cardTitle}>步驟一：輸入個人資訊</h2>
            <div style={{ display: "flex", gap: 16, flexWrap: "wrap", alignItems: "flex-end" }}>
              <div>
                <label style={styles.label}>年齡</label>
                <input
                  type="number" min={1} max={120} value={age}
                  onChange={(e) => {
                    setAge(e.target.value);
                    const a = Number(e.target.value);
                    if (a >= 1 && a <= 120) {
                      const avail = getAvailableActivityLevels(a, sex);
                      if (!avail.includes(activityLevel)) setActivityLevel(ACTIVITY_DEFAULT);
                    }
                  }}
                  placeholder="例如 30"
                  style={styles.input}
                />
              </div>
              <div>
                <label style={styles.label}>性別</label>
                <select
                  value={sex}
                  onChange={(e) => {
                    setSex(e.target.value);
                    if (ageNum >= 1 && ageNum <= 120) {
                      const avail = getAvailableActivityLevels(ageNum, e.target.value);
                      if (!avail.includes(activityLevel)) setActivityLevel(ACTIVITY_DEFAULT);
                    }
                  }}
                  style={styles.input}
                >
                  <option value="male">男性</option>
                  <option value="female">女性</option>
                </select>
              </div>
              <div>
                <label style={styles.label}>活動強度</label>
                <select
                  value={activityLevel}
                  onChange={(e) => setActivityLevel(e.target.value)}
                  style={styles.input}
                  title={ACTIVITY_DESCRIPTIONS[activityLevel] || ""}
                >
                  {ACTIVITY_LEVELS.map((lvl) => {
                    const enabled = availableActivities.includes(lvl);
                    return (
                      <option key={lvl} value={lvl} disabled={!enabled}>
                        {lvl}
                        {!enabled ? "（HPA 未提供）" : ""}
                      </option>
                    );
                  })}
                </select>
                <div style={{ fontSize: 11, color: theme.textMuted, marginTop: 2, maxWidth: 220 }}>
                  {ACTIVITY_DESCRIPTIONS[activityLevel] || ""}
                </div>
              </div>
              <button onClick={handleLookupDri} disabled={!age || Number(age) < 1 || Number(age) > 120} style={{ ...styles.btn, opacity: (!age || Number(age) < 1) ? 0.5 : 1 }}>
                查看 DRI 建議
              </button>
            </div>
            <ProcessBlock title="計算過程說明">
              <p>根據您輸入的年齡與性別，查詢「國人膳食營養素參考攝取量第八版」（DRI v8），對應至適合的年齡群組，取得各營養素的每日建議攝取量（RDA）與上限攝取量（UL）。</p>
              <p style={{ marginTop: 6, fontSize: 12 }}>
                生活活動強度依 HPA Table 3 註(3) 分為「低 / 稍低 / 適度 / 高」四級，會直接影響熱量、膳食纖維與其他熱量衍生欄位的目標值。71 歲以上 HPA 不提供「高」強度建議。
              </p>
            </ProcessBlock>
          </div>
        )}

        {/* ---- STEP 2 ---- */}
        {step === 1 && driInfo && (
          <div style={styles.card}>
            <h2 style={styles.cardTitle}>步驟二：DRI 建議值 + 攝取量輸入</h2>

            <ProcessBlock title="計算過程">
              <p>根據 <strong>{age} 歲 {sex === "male" ? "男" : "女"}性</strong> → 查詢國人膳食營養素參考攝取量第八版 → 對應群組：<strong>{driInfo.ageBand}</strong></p>
              <p style={{ marginTop: 4 }}>
                活動強度：<strong>{driInfo.activityLevel}</strong>
                {driInfo.activityLevelRequested !== driInfo.activityLevel
                  ? `（您選的「${driInfo.activityLevelRequested}」HPA 未提供，已回退至預設）`
                  : ""}
              </p>
              {driInfo.anthropometry && (
                <p style={{ marginTop: 4, color: theme.textMuted }}>
                  HPA 標準參考身材：身高 <strong>{driInfo.anthropometry.height_cm} cm</strong>、
                  體重 <strong>{driInfo.anthropometry.weight_kg} kg</strong>（用於計算建議攝取量的假設體型）
                </p>
              )}
              <p style={{ marginTop: 4, fontSize: 12 }}>資料來源：{driInfo.source}</p>
            </ProcessBlock>

            <div style={{ overflowX: "auto" }}>
              <table style={styles.table}>
                <thead>
                  <tr>
                    <th style={styles.th}>營養素</th>
                    <th style={styles.th}>建議量 (RDA)</th>
                    <th style={styles.th}>上限攝取量</th>
                    <th style={styles.th}>單位</th>
                    <th style={styles.th}>您的每日攝取量</th>
                  </tr>
                </thead>
                <tbody>
                  {driRows.map((row) => (
                    <tr key={row.field}>
                      <td style={styles.td}>{row.nutrient}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.rda}</td>
                      <td style={{ ...styles.td, textAlign: "right", color: theme.textMuted }}>{row.ul ?? "-"}</td>
                      <td style={styles.td}>{row.unit}</td>
                      <td style={styles.td}>
                        <input
                          type="number" min={0} step="any"
                          value={intake[row.field] ?? ""}
                          onChange={(e) => setIntake((prev) => ({ ...prev, [row.field]: e.target.value === "" ? "" : Number(e.target.value) }))}
                          placeholder="0"
                          style={{ ...styles.input, width: 100, margin: 0 }}
                        />
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div style={{ display: "flex", gap: 12, marginTop: 16 }}>
              <button onClick={() => setStep(0)} style={styles.btnSecondary}>上一步</button>
              <button onClick={handleCalcGap} style={styles.btn}>計算營養缺口</button>
            </div>
          </div>
        )}

        {/* ---- STEP 3 ---- */}
        {step === 2 && (
          <div style={styles.card}>
            <h2 style={styles.cardTitle}>步驟三：缺口分析結果</h2>

            <ProcessBlock title="計算過程">
              <p>建議攝取量（RDA / 下限）以「百分比」呈現；上限攝取量（UL）以「數值」呈現，兩者並列形成範圍評估。</p>
              <p>建議攝取量 = 實際攝取量 / 建議量 × 100%　|　差額 = 建議量 − 實際攝取量</p>
              <p style={{ marginTop: 6 }}>
                <span style={{ display: "inline-block", width: 12, height: 12, background: STATUS_COLORS.deficient.bg, border: `1px solid ${STATUS_COLORS.deficient.text}`, marginRight: 4, verticalAlign: "middle" }} /> {"<70% 嚴重不足　"}
                <span style={{ display: "inline-block", width: 12, height: 12, background: STATUS_COLORS.low.bg, border: `1px solid ${STATUS_COLORS.low.text}`, marginRight: 4, verticalAlign: "middle" }} /> {"70-99% 略低　"}
                <span style={{ display: "inline-block", width: 12, height: 12, background: STATUS_COLORS.adequate.bg, border: `1px solid ${STATUS_COLORS.adequate.text}`, marginRight: 4, verticalAlign: "middle" }} /> {"≥100% 充足　"}
                <span style={{ display: "inline-block", width: 12, height: 12, background: STATUS_COLORS.near_limit.bg, border: `1px solid ${STATUS_COLORS.near_limit.text}`, marginRight: 4, verticalAlign: "middle" }} /> {"⚠ 接近上限 (≥85% UL)　"}
                <span style={{ display: "inline-block", width: 12, height: 12, background: STATUS_COLORS.excess.bg, border: `1px solid ${STATUS_COLORS.excess.text}`, marginRight: 4, verticalAlign: "middle" }} /> {"🚫 >UL 超過上限"}
              </p>
            </ProcessBlock>

            <div style={{ overflowX: "auto" }}>
              <table style={styles.table}>
                <thead>
                  <tr>
                    <th style={styles.th}>營養素</th>
                    <th style={styles.th}>建議量</th>
                    <th style={styles.th}>實際攝取</th>
                    <th style={styles.th}>差額</th>
                    <th style={styles.th}>建議攝取量 (%)</th>
                    <th style={styles.th}>上限攝取量</th>
                    <th style={styles.th}>狀態</th>
                  </tr>
                </thead>
                <tbody>
                  {gapResults.map((r) => {
                    const sc = STATUS_COLORS[r.status];
                    return (
                      <tr key={r.field} style={{ background: sc.bg }}>
                        <td style={styles.td}>{r.nutrient} ({r.unit})</td>
                        <td style={{ ...styles.td, textAlign: "right" }}>{r.target}</td>
                        <td style={{ ...styles.td, textAlign: "right" }}>{r.actual}</td>
                        <td style={{ ...styles.td, textAlign: "right", color: r.gap > 0 ? STATUS_COLORS.deficient.text : theme.success }}>{r.gap > 0 ? `−${r.gap}` : `+${Math.abs(r.gap)}`}</td>
                        <td style={{ ...styles.td, textAlign: "right", fontWeight: 600 }}>{r.gapPercent !== null ? `${r.gapPercent}%` : "-"}</td>
                        <td style={{ ...styles.td, textAlign: "right", color: r.ul != null ? theme.text : theme.textMuted }}>{r.ul != null ? r.ul : "-"}</td>
                        <td style={{ ...styles.td, color: sc.text, fontWeight: 600 }}>{sc.label}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            </div>

            {(excessCount > 0 || nearLimitCount > 0) && (
              <div style={{ marginTop: 12, padding: "10px 14px", background: STATUS_COLORS.near_limit.bg, border: `1px solid ${STATUS_COLORS.near_limit.text}`, borderRadius: 6, fontSize: 13, color: STATUS_COLORS.near_limit.text }}>
                {excessCount > 0 && <div>🚫 有 <strong>{excessCount}</strong> 項營養素已超過上限攝取量（UL），長期攝取可能造成健康風險。</div>}
                {nearLimitCount > 0 && <div>⚠ 有 <strong>{nearLimitCount}</strong> 項營養素接近上限（≥85% UL），請留意。</div>}
              </div>
            )}

            <div style={{ display: "flex", gap: 12, marginTop: 16 }}>
              <button onClick={() => setStep(1)} style={styles.btnSecondary}>上一步</button>
              {deficientCount > 0 && (
                <button onClick={handleFoodRec} style={styles.btn}>查看食物推薦（{deficientCount} 項不足）</button>
              )}
            </div>
          </div>
        )}

        {/* ---- STEP 4 ---- */}
        {step === 3 && (
          <div style={styles.card}>
            <h2 style={styles.cardTitle}>步驟四：缺乏營養素食物推薦排行</h2>

            <ProcessBlock title="計算過程">
              <p>缺乏營養素 → 查詢食物資料庫 → 按含量排序 → 取前 10 名</p>
            </ProcessBlock>

            {foodLoading && <p style={{ color: theme.textMuted, padding: 20, textAlign: "center" }}>正在查詢食物推薦...</p>}
            {foodError && <p style={{ color: theme.error, padding: 20 }}>{foodError}</p>}

            {!foodLoading && Object.keys(foodRecs).length > 0 && (
              <div style={{ display: "flex", flexDirection: "column", gap: 20 }}>
                {Object.entries(foodRecs).map(([field, data]) => (
                  <div key={field} style={{ border: `1px solid ${theme.border}`, borderRadius: 8, overflow: "hidden" }}>
                    <div style={{ padding: "10px 14px", background: theme.accentLight, fontWeight: 600, color: theme.accent }}>
                      {data.nutrient}
                    </div>
                    {data.error ? (
                      <p style={{ padding: 12, color: theme.textMuted, fontSize: 13 }}>查詢此營養素的食物資料時發生錯誤</p>
                    ) : data.foods.length === 0 ? (
                      <p style={{ padding: 12, color: theme.textMuted, fontSize: 13 }}>暫無相關食物資料</p>
                    ) : (
                      <table style={{ ...styles.table, margin: 0 }}>
                        <thead>
                          <tr>
                            <th style={styles.th}>排名</th>
                            <th style={styles.th}>食物名稱</th>
                            <th style={styles.th}>含量 (每100g)</th>
                            <th style={styles.th}>推薦原因</th>
                          </tr>
                        </thead>
                        <tbody>
                          {data.foods.map((food, i) => (
                            <tr key={i}>
                              <td style={styles.td}>{i + 1}</td>
                              <td style={styles.td}>
                                {food.source === "taiwan_foods" && food.id ? (
                                  <button
                                    type="button"
                                    style={styles.linkButton}
                                    onClick={() => setSelectedFoodId(food.id)}
                                  >
                                    {food.name || food.food_name || "-"}
                                  </button>
                                ) : (
                                  <span>{food.name || food.food_name || "-"}</span>
                                )}
                              </td>
                              <td style={{ ...styles.td, textAlign: "right" }}>{food.amount ?? food.content ?? "-"}</td>
                              <td style={styles.td}>補足{data.nutrient}攝取不足</td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    )}
                  </div>
                ))}
              </div>
            )}

            <div style={{ display: "flex", gap: 12, marginTop: 16 }}>
              <button onClick={() => setStep(2)} style={styles.btnSecondary}>上一步</button>
              <button onClick={() => { setStep(0); setGapResults([]); setFoodRecs({}); }} style={styles.btnSecondary}>重新開始</button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}

const styles = {
  card: {
    background: theme.cardBg,
    borderRadius: 12,
    padding: "24px",
    boxShadow: "0 1px 4px rgba(0,0,0,0.06)",
    border: `1px solid ${theme.borderLight}`,
  },
  cardTitle: {
    fontSize: 18,
    color: theme.text,
    marginTop: 0,
    marginBottom: 16,
  },
  label: {
    display: "block",
    fontSize: 13,
    color: theme.textMuted,
    marginBottom: 4,
    fontWeight: 600,
  },
  input: {
    padding: "8px 12px",
    border: `1px solid ${theme.border}`,
    borderRadius: 6,
    background: theme.inputBg,
    fontSize: 14,
    color: theme.text,
    outline: "none",
  },
  btn: {
    padding: "10px 22px",
    background: theme.accent,
    color: "#fff",
    border: "none",
    borderRadius: 6,
    fontSize: 14,
    fontWeight: 600,
    cursor: "pointer",
  },
  btnSecondary: {
    padding: "10px 22px",
    background: "transparent",
    color: theme.accent,
    border: `1px solid ${theme.accent}`,
    borderRadius: 6,
    fontSize: 14,
    fontWeight: 600,
    cursor: "pointer",
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
    fontSize: 13,
  },
  th: {
    textAlign: "left",
    padding: "8px 10px",
    borderBottom: `2px solid ${theme.border}`,
    color: theme.textMuted,
    fontWeight: 600,
    fontSize: 12,
    whiteSpace: "nowrap",
  },
  td: {
    padding: "7px 10px",
    borderBottom: `1px solid ${theme.borderLight}`,
    color: theme.text,
  },
};
