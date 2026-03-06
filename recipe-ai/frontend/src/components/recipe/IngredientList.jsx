import theme from "../../utils/theme";

/**
 * IngredientList - 顯示食材匹配結果列表
 * 每個食材顯示：輸入名稱、匹配結果、來源標籤（台灣/FooDB）、或「未找到」
 */
export default function IngredientList({ ingredients = [] }) {
  if (!ingredients.length) return null;

  return (
    <div>
      <h3 style={{ color: theme.accent, marginBottom: "12px" }}>食材匹配結果</h3>
      <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
        {ingredients.map((item, i) => (
          <IngredientRow key={i} item={item} />
        ))}
      </div>
    </div>
  );
}

function IngredientRow({ item }) {
  const isNotFound = item.status === "not_found";

  return (
    <div style={{
      display: "flex", justifyContent: "space-between", alignItems: "center",
      padding: "10px 14px", borderRadius: "8px",
      background: isNotFound ? theme.errorBg : theme.successBg,
      border: `1px solid ${isNotFound ? "#ef9a9a" : "#a5d6a7"}`,
    }}>
      <div>
        <span style={{ color: theme.textMuted, fontSize: "14px" }}>{item.input_name}</span>
        {!isNotFound && (
          <span style={{ color: theme.textLight, fontSize: "12px", marginLeft: "8px" }}>
            → {item.matched_name}
          </span>
        )}
      </div>
      <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
        {isNotFound ? (
          <span style={styles.badge.notFound}>未找到</span>
        ) : (
          <>
            <span style={item.source === "taiwan_foods" ? styles.badge.taiwan : styles.badge.foodb}>
              {item.source === "taiwan_foods" ? "台灣食品庫" : "FooDB"}
            </span>
            {item.nutrition && (
              <span style={{ color: theme.textMuted, fontSize: "12px" }}>
                {item.nutrition.calories?.toFixed(0)} kcal
              </span>
            )}
          </>
        )}
      </div>
    </div>
  );
}

const styles = {
  badge: {
    taiwan: {
      background: "#e3f2fd", color: "#1565c0",
      padding: "2px 8px", borderRadius: "12px", fontSize: "11px",
    },
    foodb: {
      background: "#f3e5f5", color: "#7b1fa2",
      padding: "2px 8px", borderRadius: "12px", fontSize: "11px",
    },
    notFound: {
      background: theme.errorBg, color: theme.error,
      padding: "2px 8px", borderRadius: "12px", fontSize: "11px",
    },
  },
};
