import theme from "../../utils/theme";

/** NutritionResult - 顯示總營養卡片 */
export default function NutritionResult({ nutrition, servings = 1 }) {
  if (!nutrition) return null;

  const perServing = servings > 1
    ? Object.fromEntries(Object.entries(nutrition).map(([k, v]) => [k, v / servings]))
    : nutrition;

  const items = [
    { label: "熱量", value: perServing.calories?.toFixed(1), unit: "kcal", color: theme.accent },
    { label: "蛋白質", value: perServing.protein?.toFixed(1), unit: "g", color: "#4caf50" },
    { label: "碳水化合物", value: perServing.carbs?.toFixed(1), unit: "g", color: "#ff9800" },
    { label: "脂肪", value: perServing.fat?.toFixed(1), unit: "g", color: "#f44336" },
    { label: "膳食纖維", value: perServing.fiber?.toFixed(1), unit: "g", color: "#2196f3" },
  ];

  return (
    <div style={{ marginTop: "20px" }}>
      <h3 style={{ color: theme.accent, marginBottom: "12px" }}>
        總營養{servings > 1 ? `（每份，共 ${servings} 份）` : ""}
      </h3>
      <div style={{ display: "grid", gridTemplateColumns: "repeat(5, 1fr)", gap: "12px" }}>
        {items.map(({ label, value, unit, color }) => (
          <div key={label} style={{
            background: theme.cardBg, borderRadius: "10px", padding: "16px",
            textAlign: "center", border: `1px solid ${color}33`,
            boxShadow: "0 2px 6px rgba(0,0,0,0.06)",
          }}>
            <div style={{ color, fontSize: "22px", fontWeight: "bold" }}>
              {value ?? "—"}
            </div>
            <div style={{ color: theme.textLight, fontSize: "11px", marginTop: "2px" }}>{unit}</div>
            <div style={{ color: theme.textMuted, fontSize: "12px", marginTop: "4px" }}>{label}</div>
          </div>
        ))}
      </div>
    </div>
  );
}
