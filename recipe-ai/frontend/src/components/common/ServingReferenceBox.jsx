import { useState } from "react";
import theme from "../../utils/theme";

const CATEGORIES = [
  ["乳品類", "1杯", "240ml"],
  ["豆魚蛋肉類(低脂)", "1份", "35g"],
  ["豆魚蛋肉類(中脂)", "1份", "35-55g"],
  ["全穀雜糧類", "1份", "1/4碗飯(40g)"],
  ["蔬菜類", "1份", "100g(煮熟約半碗)"],
  ["水果類", "1份", "約拳頭大"],
  ["油脂與堅果種子類", "1份", "1茶匙油(5g)"],
];

const EXAMPLES = [
  ["雞蛋", "1顆", "55g"],
  ["牛奶/豆漿", "1杯", "240ml/190ml"],
  ["白飯", "1碗", "160g"],
  ["魚/肉", "1份", "35g(生)"],
  ["豆腐(傳統)", "1塊", "80g"],
  ["蔬菜", "1份", "100g"],
  ["水果(蘋果)", "1顆", "125g"],
  ["油", "1茶匙", "5g"],
  ["堅果", "1湯匙", "10g"],
];

export default function ServingReferenceBox() {
  const [open, setOpen] = useState(false);

  return (
    <div style={{
      margin: "8px 0",
      border: `1px solid ${theme.border}`,
      borderRadius: 6,
      fontSize: 12,
      overflow: "hidden",
    }}>
      <div
        onClick={() => setOpen(!open)}
        style={{
          padding: "6px 12px",
          background: theme.inputBg,
          cursor: "pointer",
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          userSelect: "none",
        }}
      >
        <span style={{ color: theme.textMuted }}>
          {open ? "▲" : "▼"} 份量單位參考（依食物代換表 2019.5）
        </span>
      </div>
      {open && (
        <div style={{ padding: "8px 12px", display: "flex", gap: 16, flexWrap: "wrap" }}>
          <div style={{ flex: "1 1 260px" }}>
            <div style={{ fontWeight: 600, marginBottom: 4, color: theme.text }}>六大類每份定義</div>
            <table style={{ width: "100%", borderCollapse: "collapse" }}>
              <tbody>
                {CATEGORIES.map(([cat, unit, weight]) => (
                  <tr key={cat} style={{ borderBottom: `1px solid ${theme.border}` }}>
                    <td style={{ padding: "2px 4px", color: theme.text }}>{cat}</td>
                    <td style={{ padding: "2px 4px", color: theme.primary, whiteSpace: "nowrap" }}>{unit}</td>
                    <td style={{ padding: "2px 4px", color: theme.textMuted }}>{weight}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
          <div style={{ flex: "1 1 240px" }}>
            <div style={{ fontWeight: 600, marginBottom: 4, color: theme.text }}>常見食物份量速查</div>
            <table style={{ width: "100%", borderCollapse: "collapse" }}>
              <tbody>
                {EXAMPLES.map(([food, unit, weight]) => (
                  <tr key={food} style={{ borderBottom: `1px solid ${theme.border}` }}>
                    <td style={{ padding: "2px 4px", color: theme.text }}>{food}</td>
                    <td style={{ padding: "2px 4px", color: theme.primary, whiteSpace: "nowrap" }}>{unit}</td>
                    <td style={{ padding: "2px 4px", color: theme.textMuted }}>{weight}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  );
}
