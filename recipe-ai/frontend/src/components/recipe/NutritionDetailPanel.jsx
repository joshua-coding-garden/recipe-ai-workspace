import theme from "../../utils/theme";

/**
 * NutritionDetailPanel - 完整營養素報告表格
 *
 * 接收 nutrition_detail (dict) 和 nutrient_meta (dict)，
 * 按分組顯示所有有值的營養素，類似食品營養成分標示。
 */

const GROUP_ORDER = ["basic", "sugar", "mineral", "vitamin", "fatty_acid", "amino_acid", "other"];

const GROUP_LABELS = {
  basic: "能量與基本營養素",
  sugar: "糖類細項",
  mineral: "礦物質",
  vitamin: "維生素",
  fatty_acid: "脂肪酸",
  amino_acid: "胺基酸",
  other: "其他成分",
};

export default function NutritionDetailPanel({ nutritionDetail, nutrientMeta, title }) {
  if (!nutritionDetail || !nutrientMeta || Object.keys(nutritionDetail).length === 0) {
    return null;
  }

  // 按 group 分組
  const grouped = {};
  for (const [key, value] of Object.entries(nutritionDetail)) {
    const meta = nutrientMeta[key];
    if (!meta) continue;
    const group = meta.group || "other";
    if (!grouped[group]) grouped[group] = [];
    grouped[group].push({ key, value, ...meta });
  }

  // 按 priority 排序
  for (const group of Object.values(grouped)) {
    group.sort((a, b) => (a.priority || 999) - (b.priority || 999));
  }

  const formatValue = (val, unit) => {
    if (val === null || val === undefined) return "--";
    if (unit === "kcal") return Math.round(val).toLocaleString();
    if (val >= 100) return val.toFixed(1);
    if (val >= 1) return val.toFixed(2);
    if (val >= 0.01) return val.toFixed(3);
    if (val > 0) return val.toFixed(4);
    return "0";
  };

  return (
    <div style={styles.panel}>
      {title && <h3 style={styles.title}>{title}</h3>}
      {GROUP_ORDER.map((groupKey) => {
        const items = grouped[groupKey];
        if (!items || items.length === 0) return null;
        return (
          <div key={groupKey} style={styles.groupSection}>
            <div style={styles.groupHeader}>{GROUP_LABELS[groupKey] || groupKey}</div>
            <table style={styles.table}>
              <tbody>
                {items.map((item) => (
                  <tr key={item.key} style={styles.row}>
                    <td style={styles.labelCell}>
                      <span style={styles.labelZh}>{item.label}</span>
                      <span style={styles.labelEn}>{item.label_en}</span>
                    </td>
                    <td style={styles.valueCell}>
                      {formatValue(item.value, item.unit)}
                    </td>
                    <td style={styles.unitCell}>{item.unit}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        );
      })}
    </div>
  );
}


/**
 * NutritionPerItemTable - 顯示每項食材的營養明細
 *
 * @param {Function} onSelectFood - (foodId) => void;有提供且 item 為 taiwan_foods 來源 + 已匹配時，食材名變為可點擊
 */
export function NutritionPerItemTable({ items, onSelectFood }) {
  if (!items || items.length === 0) return null;

  return (
    <div style={styles.perItemContainer}>
      <h3 style={styles.title}>各食材營養明細</h3>
      {items.map((item, idx) => {
        const displayName = item.input_food_name || item.food_name || `食材 ${idx + 1}`;
        const clickable =
          typeof onSelectFood === "function" &&
          item.found &&
          item.source === "taiwan_foods" &&
          item.food_id;
        return (
          <div key={idx} style={styles.perItemCard}>
            <div style={styles.perItemHeader}>
              {clickable ? (
                <button
                  type="button"
                  style={{ ...styles.perItemName, ...styles.nameButton }}
                  onClick={() => onSelectFood(item.food_id)}
                >
                  {displayName}
                </button>
              ) : (
                <span style={styles.perItemName}>{displayName}</span>
              )}
              <span style={styles.perItemGrams}>
                {item.grams}g
                {item.conversion?.estimated && (
                  <span style={styles.estimatedBadge}>估計值</span>
                )}
              </span>
              <span style={styles.perItemSource}>
                {item.source === "taiwan_foods" ? "台灣" : "FooDB"}
              </span>
            </div>
            {item.conversion && item.conversion.raw && (
              <div style={styles.conversionInfo}>
                原始用量: {item.conversion.raw} → {item.grams}g
              </div>
            )}
            {!item.found && (
              <div style={styles.notFoundMsg}>未找到此食物的營養資料</div>
            )}
          </div>
        );
      })}
    </div>
  );
}


const styles = {
  panel: {
    background: theme.cardBg,
    borderRadius: 12,
    padding: 20,
    marginTop: 16,
    border: `1px solid ${theme.border}`,
    boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
  },
  title: {
    color: theme.accent,
    fontSize: 18,
    fontWeight: "bold",
    marginBottom: 16,
    marginTop: 0,
  },
  groupSection: {
    marginBottom: 16,
  },
  groupHeader: {
    color: "#1565c0",
    fontSize: 14,
    fontWeight: "bold",
    padding: "6px 0",
    borderBottom: `1px solid ${theme.border}`,
    marginBottom: 4,
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
  },
  row: {
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  labelCell: {
    padding: "6px 8px",
    color: theme.textMuted,
    fontSize: 13,
    width: "60%",
  },
  labelZh: {
    display: "inline",
  },
  labelEn: {
    display: "inline",
    color: theme.textLight,
    fontSize: 11,
    marginLeft: 6,
  },
  valueCell: {
    padding: "6px 8px",
    color: theme.text,
    fontSize: 13,
    textAlign: "right",
    fontFamily: "monospace",
    width: "25%",
  },
  unitCell: {
    padding: "6px 8px",
    color: theme.textLight,
    fontSize: 12,
    textAlign: "left",
    width: "15%",
  },
  // Per-item styles
  perItemContainer: {
    marginTop: 16,
  },
  perItemCard: {
    background: theme.cardBg,
    borderRadius: 8,
    padding: 12,
    marginBottom: 8,
    border: `1px solid ${theme.border}`,
  },
  perItemHeader: {
    display: "flex",
    alignItems: "center",
    gap: 12,
  },
  perItemName: {
    color: theme.text,
    fontSize: 14,
    fontWeight: "bold",
    flex: 1,
  },
  nameButton: {
    background: "transparent",
    border: "none",
    padding: 0,
    textAlign: "left",
    color: theme.accent,
    cursor: "pointer",
    textDecoration: "underline",
    font: "inherit",
  },
  perItemGrams: {
    color: "#e65100",
    fontSize: 13,
    display: "flex",
    alignItems: "center",
    gap: 6,
  },
  perItemSource: {
    display: "inline-block",
    background: "#e3f2fd",
    color: "#1565c0",
    padding: "2px 8px",
    borderRadius: 10,
    fontSize: 11,
  },
  estimatedBadge: {
    display: "inline-block",
    background: theme.warningBg,
    color: theme.warning,
    padding: "1px 6px",
    borderRadius: 8,
    fontSize: 10,
  },
  conversionInfo: {
    color: theme.textLight,
    fontSize: 11,
    marginTop: 4,
  },
  notFoundMsg: {
    color: theme.error,
    fontSize: 12,
    marginTop: 4,
  },
};
