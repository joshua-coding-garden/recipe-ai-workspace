import { useState, useEffect } from "react";
import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer } from "recharts";
import { getTaiwanFoodDetail } from "../../api/taiwanFoodApi";
import {
  vitaminFields, mineralFields, sugarFields,
  saturatedFAFields, monoFAFields, polyFAFields,
  essentialAAFields, nonEssentialAAFields,
} from "../../utils/nutrientMappings";
import theme from "../../utils/theme";

const MACRO_COLORS = ["#FF6384", "#36A2EB", "#FFCE56"];

function fmt(v) {
  const n = parseFloat(v);
  return isNaN(n) ? "0.00" : n.toFixed(2);
}

function NutrientGrid({ fields, food }) {
  return (
    <div style={s.nutrientGrid}>
      {fields.map((f) => {
        const val = parseFloat(food[f.field]);
        return (
          <div key={f.field} style={s.nutrientItem}>
            <div style={s.nutrientName}>{f.name}</div>
            <div style={s.nutrientValue}>
              {isNaN(val) ? "0.00" : val.toFixed(2)}
              <span style={s.nutrientUnit}>{f.unit}</span>
            </div>
          </div>
        );
      })}
    </div>
  );
}

function NutritionTable({ fields, food, header }) {
  return (
    <table style={s.table}>
      <thead>
        <tr>
          <th style={s.th}>{header}</th>
          <th style={{ ...s.th, textAlign: "right" }}>含量</th>
          <th style={s.th}>單位</th>
        </tr>
      </thead>
      <tbody>
        {fields.map((f) => {
          const val = parseFloat(food[f.field]);
          return (
            <tr key={f.field} style={f.highlight ? s.highlightRow : {}}>
              <td style={s.td}>{f.name}</td>
              <td style={s.tdValue}>{isNaN(val) ? "0.00" : val.toFixed(2)}</td>
              <td style={s.td}>{f.unit}</td>
            </tr>
          );
        })}
      </tbody>
    </table>
  );
}

export default function TaiwanFoodModal({ foodId, onClose }) {
  const [food, setFood] = useState(null);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState("vitamins");

  useEffect(() => {
    if (!foodId) return;
    setLoading(true);
    getTaiwanFoodDetail(foodId)
      .then((data) => setFood(data))
      .catch(console.error)
      .finally(() => setLoading(false));
  }, [foodId]);

  if (!foodId) return null;

  const handleOverlayClick = (e) => {
    if (e.target === e.currentTarget) onClose();
  };

  const protein = parseFloat(food?.protein_per_100g) || 0;
  const fats = parseFloat(food?.fats_per_100g) || 0;
  const carbs = parseFloat(food?.carbon_per_100g) || 0;
  const macroTotal = protein + fats + carbs;
  const macroData = [
    { name: "蛋白質", value: protein },
    { name: "脂肪", value: fats },
    { name: "碳水化合物", value: carbs },
  ];

  const tabs = [
    { key: "vitamins", label: "維生素 & 礦物質" },
    { key: "sugars", label: "糖類分析" },
    { key: "fatty", label: "脂肪酸分析" },
    { key: "amino", label: "胺基酸分析" },
  ];

  return (
    <div style={s.overlay} onClick={handleOverlayClick}>
      <div style={s.modal}>
        {/* Header */}
        <div style={s.header}>
          <div style={{ flex: 1 }}>
            <h2 style={s.title}>{loading ? "載入中..." : food?.food_name || "-"}</h2>
            {food?.common_name && (
              <p style={s.commonName}>俗名：{food.common_name}</p>
            )}
            <div style={s.headerMeta}>
              <span style={s.badge}>{food?.category || "未分類"}</span>
              <span style={s.badge}>{food?.integration_code || "-"}</span>
            </div>
          </div>
          <button style={s.closeBtn} onClick={onClose}>&times;</button>
        </div>

        {loading ? (
          <div style={s.loadingBody}>載入中...</div>
        ) : food ? (
          <div style={s.body}>
            {/* Sample description */}
            {food.sample_name && (
              <div style={s.sampleDesc}>{food.sample_name}</div>
            )}

            {/* Energy dashboard */}
            <div style={s.energyGrid}>
              <div style={{ ...s.energyCard, borderColor: "#ff6b6b" }}>
                <div style={s.energyLabel}>熱量</div>
                <div style={{ ...s.energyValue, color: "#ff6b6b" }}>
                  {fmt(food.cal_per_100g)} kcal
                </div>
              </div>
              <div style={{ ...s.energyCard, borderColor: "#4ecdc4" }}>
                <div style={s.energyLabel}>蛋白質</div>
                <div style={{ ...s.energyValue, color: "#4ecdc4" }}>
                  {fmt(food.protein_per_100g)} g
                </div>
              </div>
              <div style={{ ...s.energyCard, borderColor: "#f39c12" }}>
                <div style={s.energyLabel}>碳水化合物</div>
                <div style={{ ...s.energyValue, color: "#f39c12" }}>
                  {fmt(food.carbon_per_100g)} g
                </div>
              </div>
              <div style={{ ...s.energyCard, borderColor: "#6c5ce7" }}>
                <div style={s.energyLabel}>脂肪</div>
                <div style={{ ...s.energyValue, color: "#6c5ce7" }}>
                  {fmt(food.fats_per_100g)} g
                </div>
              </div>
            </div>

            {/* Macros chart */}
            <div style={s.macrosSection}>
              <h3 style={s.sectionH3}>三大營養素分布</h3>
              {macroTotal > 0 ? (
                <div style={{ display: "flex", alignItems: "center", justifyContent: "center", gap: 32, flexWrap: "wrap" }}>
                  <ResponsiveContainer width={220} height={220}>
                    <PieChart>
                      <Pie
                        data={macroData}
                        dataKey="value"
                        cx="50%"
                        cy="50%"
                        innerRadius={50}
                        outerRadius={90}
                        paddingAngle={2}
                      >
                        {macroData.map((_, i) => (
                          <Cell key={i} fill={MACRO_COLORS[i]} />
                        ))}
                      </Pie>
                      <Tooltip
                        formatter={(v, name) =>
                          [`${v.toFixed(2)}g (${((v / macroTotal) * 100).toFixed(1)}%)`, name]
                        }
                      />
                    </PieChart>
                  </ResponsiveContainer>
                  <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
                    {macroData.map((d, i) => (
                      <div key={d.name} style={{ display: "flex", alignItems: "center", gap: 8 }}>
                        <div style={{ width: 16, height: 16, borderRadius: 4, background: MACRO_COLORS[i] }} />
                        <span>{d.name}</span>
                        <span style={{ fontWeight: 600 }}>
                          {d.value.toFixed(2)}g ({((d.value / macroTotal) * 100).toFixed(1)}%)
                        </span>
                      </div>
                    ))}
                  </div>
                </div>
              ) : (
                <p style={{ textAlign: "center", color: theme.textLight }}>無巨量營養素資料</p>
              )}
            </div>

            {/* Tabs */}
            <div style={s.tabBar}>
              {tabs.map((t) => (
                <button
                  key={t.key}
                  style={activeTab === t.key ? { ...s.tabBtn, ...s.tabActive } : s.tabBtn}
                  onClick={() => setActiveTab(t.key)}
                >
                  {t.label}
                </button>
              ))}
            </div>

            <div style={s.tabContent}>
              {activeTab === "vitamins" && (
                <>
                  <h4 style={s.subTitle}>維生素</h4>
                  <NutrientGrid fields={vitaminFields} food={food} />
                  <h4 style={s.subTitle}>礦物質</h4>
                  <NutrientGrid fields={mineralFields} food={food} />
                </>
              )}
              {activeTab === "sugars" && (
                <>
                  <h4 style={s.subTitle}>糖類組成</h4>
                  <NutrientGrid fields={sugarFields} food={food} />
                </>
              )}
              {activeTab === "fatty" && (
                <>
                  <h4 style={s.subTitle}>飽和脂肪酸</h4>
                  <NutritionTable fields={saturatedFAFields} food={food} header="脂肪酸名稱" />
                  <h4 style={s.subTitle}>單元不飽和脂肪酸</h4>
                  <NutritionTable fields={monoFAFields} food={food} header="脂肪酸名稱" />
                  <h4 style={s.subTitle}>多元不飽和脂肪酸 (含 Omega-3)</h4>
                  <NutritionTable fields={polyFAFields} food={food} header="脂肪酸名稱" />
                </>
              )}
              {activeTab === "amino" && (
                <>
                  <h4 style={s.subTitle}>必需胺基酸</h4>
                  <NutritionTable fields={essentialAAFields} food={food} header="胺基酸名稱" />
                  <h4 style={s.subTitle}>非必需胺基酸</h4>
                  <NutritionTable fields={nonEssentialAAFields} food={food} header="胺基酸名稱" />
                </>
              )}
            </div>

            <button style={s.closeBottom} onClick={onClose}>關閉</button>
          </div>
        ) : (
          <div style={s.loadingBody}>載入失敗</div>
        )}
      </div>
    </div>
  );
}

const s = {
  overlay: {
    position: "fixed", top: 0, left: 0, width: "100%", height: "100%",
    background: "rgba(0,0,0,0.4)", zIndex: 1000, display: "flex",
    alignItems: "center", justifyContent: "center", padding: 20,
    backdropFilter: "blur(4px)",
  },
  modal: {
    background: theme.cardBg, borderRadius: 16, maxWidth: 900, width: "100%",
    maxHeight: "90vh", overflow: "hidden", display: "flex", flexDirection: "column",
    boxShadow: "0 8px 32px rgba(0,0,0,0.15)",
  },
  header: {
    background: `linear-gradient(135deg, ${theme.accent} 0%, ${theme.accentHover} 100%)`,
    padding: "24px 32px", color: "#fff", display: "flex",
    justifyContent: "space-between", alignItems: "flex-start",
  },
  title: { margin: 0, fontSize: 22, color: "#fff" },
  commonName: { color: "rgba(255,255,255,0.85)", fontSize: 13, margin: "4px 0 0" },
  headerMeta: { display: "flex", gap: 12, marginTop: 12 },
  badge: {
    background: "rgba(255,255,255,0.2)", color: "#fff", padding: "6px 12px",
    borderRadius: 20, fontSize: 13, fontWeight: 500,
  },
  closeBtn: {
    background: "none", border: "none", color: "#fff", fontSize: 36,
    cursor: "pointer", width: 40, height: 40, display: "flex",
    alignItems: "center", justifyContent: "center", borderRadius: "50%",
  },
  body: { padding: 24, overflowY: "auto", flex: 1 },
  loadingBody: { padding: 64, textAlign: "center", color: theme.textLight },
  sampleDesc: {
    background: theme.accentLight,
    borderLeft: `4px solid ${theme.accent}`, padding: "12px 16px", marginBottom: 20,
    borderRadius: 6, fontSize: 13, color: theme.textMuted, lineHeight: 1.5,
  },
  energyGrid: { display: "grid", gridTemplateColumns: "repeat(4, 1fr)", gap: 16, marginBottom: 24 },
  energyCard: {
    background: theme.cardBg, borderRadius: 12, padding: 20, textAlign: "center",
    boxShadow: "0 2px 8px rgba(0,0,0,0.08)", border: "2px solid transparent",
  },
  energyLabel: { fontSize: 13, color: theme.textLight, marginBottom: 8, fontWeight: 500 },
  energyValue: { fontSize: 22, fontWeight: 700 },
  macrosSection: {
    background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: 12,
    padding: 24, marginBottom: 24,
  },
  sectionH3: { color: theme.text, marginBottom: 20, fontSize: 18 },
  tabBar: {
    display: "flex", gap: 8, borderBottom: `2px solid ${theme.border}`, marginBottom: 24,
  },
  tabBtn: {
    background: "none", border: "none", padding: "12px 24px", fontSize: 15,
    fontWeight: 500, color: theme.textLight, cursor: "pointer", borderBottom: "3px solid transparent",
    position: "relative", top: 2,
  },
  tabActive: { color: theme.accent, borderBottomColor: theme.accent },
  tabContent: { minHeight: 200 },
  subTitle: { color: theme.text, fontSize: 16, margin: "24px 0 16px", display: "flex", alignItems: "center", gap: 8 },
  nutrientGrid: {
    display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(200px, 1fr))",
    gap: 12, marginBottom: 24,
  },
  nutrientItem: {
    background: theme.inputBg, border: `1px solid ${theme.border}`, borderRadius: 8, padding: "12px 16px",
  },
  nutrientName: { fontSize: 13, color: theme.textLight, marginBottom: 4 },
  nutrientValue: { fontSize: 18, fontWeight: 600, color: theme.text },
  nutrientUnit: { fontSize: 12, color: theme.textLight, marginLeft: 4 },
  table: {
    width: "100%", borderCollapse: "collapse", background: theme.cardBg,
    borderRadius: 8, overflow: "hidden", boxShadow: "0 2px 4px rgba(0,0,0,0.05)",
    marginBottom: 24,
  },
  th: {
    background: `linear-gradient(135deg, ${theme.accent}, ${theme.accentHover})`, color: "#fff",
    padding: "12px 16px", textAlign: "left", fontWeight: 600, fontSize: 14,
  },
  td: { padding: "12px 16px", fontSize: 14, color: theme.textMuted, borderBottom: `1px solid ${theme.borderLight}` },
  tdValue: {
    padding: "12px 16px", fontSize: 14, textAlign: "right", fontWeight: 500,
    fontFamily: "'Courier New', monospace", color: theme.accent, borderBottom: `1px solid ${theme.borderLight}`,
  },
  highlightRow: { background: theme.warningBg },
  closeBottom: {
    width: "100%", padding: 16, background: theme.accent, color: "#fff",
    border: "none", borderRadius: 8, fontSize: 16, fontWeight: 500,
    cursor: "pointer", marginTop: 16,
  },
};
