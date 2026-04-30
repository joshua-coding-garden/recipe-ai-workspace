import { useState, useMemo, useCallback } from "react";
import { getNutrientFoods } from "../api/healthApi";
import TaiwanFoodModal from "../components/food/TaiwanFoodModal";
import FoodbFoodModal from "../components/food/FoodbFoodModal";
import LoadingSpinner from "../components/common/LoadingSpinner";
import { NUTRIENT_GROUPS, FIELD_LOOKUP } from "../utils/nutrientRankingFields";
import theme from "../utils/theme";

export default function NutrientRankingPage() {
  const [groupName, setGroupName] = useState(NUTRIENT_GROUPS[2].group); // 預設「礦物質」
  const [field, setField] = useState(NUTRIENT_GROUPS[2].items[2].field); // 預設「鈣」
  const [limit, setLimit] = useState(20);
  const [rows, setRows] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [hasQueried, setHasQueried] = useState(false);
  const [selectedFoodId, setSelectedFoodId] = useState(null);
  const [selectedFoodbId, setSelectedFoodbId] = useState(null);

  const currentGroup = useMemo(
    () => NUTRIENT_GROUPS.find((g) => g.group === groupName) || NUTRIENT_GROUPS[0],
    [groupName],
  );
  const currentField = FIELD_LOOKUP[field];

  const handleGroupChange = (e) => {
    const g = e.target.value;
    setGroupName(g);
    const next = NUTRIENT_GROUPS.find((x) => x.group === g);
    if (next) setField(next.items[0].field);
  };

  const handleQuery = useCallback(async () => {
    if (!field) return;
    setLoading(true);
    setError("");
    setHasQueried(true);
    try {
      const data = await getNutrientFoods(field, limit);
      setRows(Array.isArray(data) ? data : []);
    } catch (err) {
      console.error(err);
      setError(err?.response?.data?.detail || err?.message || "查詢失敗");
      setRows([]);
    } finally {
      setLoading(false);
    }
  }, [field, limit]);

  const onFoodClick = (row) => {
    if (row.source === "taiwan_foods") setSelectedFoodId(row.id);
    else if (row.source === "foodb") setSelectedFoodbId(row.id);
  };

  return (
    <div>
      <div style={s.header}>
        <h1 style={s.title}>營養素排名</h1>
        <p style={s.subtitle}>
          選擇任一營養素（共 {Object.keys(FIELD_LOOKUP).length} 項，涵蓋台灣食品成分資料庫 2024
          UPDATE2 全部欄位），系統會列出含量最高的食物。點擊食物名可查看完整營養詳細資料。
        </p>
      </div>

      <div style={s.controls}>
        <div style={s.controlBlock}>
          <label style={s.label}>分組</label>
          <select value={groupName} onChange={handleGroupChange} style={s.select}>
            {NUTRIENT_GROUPS.map((g) => (
              <option key={g.group} value={g.group}>
                {g.group}（{g.items.length}）
              </option>
            ))}
          </select>
        </div>

        <div style={s.controlBlock}>
          <label style={s.label}>營養素</label>
          <select value={field} onChange={(e) => setField(e.target.value)} style={s.select}>
            {currentGroup.items.map((it) => (
              <option key={it.field} value={it.field}>
                {it.label}（{it.unit}）
              </option>
            ))}
          </select>
        </div>

        <div style={s.controlBlock}>
          <label style={s.label}>顯示筆數</label>
          <select
            value={limit}
            onChange={(e) => setLimit(Number(e.target.value))}
            style={s.select}
          >
            {[10, 20, 30, 50, 100].map((n) => (
              <option key={n} value={n}>
                Top {n}
              </option>
            ))}
          </select>
        </div>

        <button
          type="button"
          onClick={handleQuery}
          disabled={loading}
          style={loading ? { ...s.btnPrimary, ...s.btnDisabled } : s.btnPrimary}
        >
          {loading ? "查詢中…" : "查詢"}
        </button>
      </div>

      {error && <div style={s.error}>{error}</div>}

      {loading ? (
        <div style={s.center}>
          <LoadingSpinner />
        </div>
      ) : !hasQueried ? (
        <div style={s.placeholder}>請選擇營養素並按「查詢」</div>
      ) : rows.length === 0 ? (
        <div style={s.placeholder}>
          找不到含「{currentField?.label}」的食物（資料庫中此欄位皆為空值或 0）
        </div>
      ) : (
        <>
          <div style={s.summary}>
            「<b>{currentField?.label}</b>」含量最高的前 {rows.length} 筆食物（每 100 g）
          </div>
          <div style={s.tableWrap}>
            <table style={s.table}>
              <thead>
                <tr>
                  <th style={s.th}>排名</th>
                  <th style={s.th}>食物名稱</th>
                  <th style={s.th}>分類</th>
                  <th style={s.th}>來源</th>
                  <th style={{ ...s.th, textAlign: "right" }}>
                    含量（{currentField?.unit || rows[0]?.unit}/100g）
                  </th>
                </tr>
              </thead>
              <tbody>
                {rows.map((r, i) => (
                  <tr key={`${r.source}-${r.id}-${i}`} style={i === 0 ? s.firstRow : {}}>
                    <td style={s.td}>
                      <span style={i === 0 ? s.rankBadgeGold : s.rankBadge}>{i + 1}</span>
                    </td>
                    <td style={s.td}>
                      <button
                        type="button"
                        style={s.linkBtn}
                        onClick={() => onFoodClick(r)}
                        title="點擊查看完整營養詳情"
                      >
                        {r.name || "-"}
                      </button>
                    </td>
                    <td style={s.td}>{r.category || "-"}</td>
                    <td style={s.td}>
                      <span
                        style={
                          r.source === "taiwan_foods"
                            ? s.sourceBadgeTaiwan
                            : s.sourceBadgeFoodb
                        }
                      >
                        {r.source === "taiwan_foods" ? "台灣食品" : "FooDB"}
                      </span>
                    </td>
                    <td style={s.tdValue}>{Number(r.content_per_100g ?? 0).toFixed(2)}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </>
      )}

      {selectedFoodId && (
        <TaiwanFoodModal
          foodId={selectedFoodId}
          onClose={() => setSelectedFoodId(null)}
        />
      )}
      {selectedFoodbId && (
        <FoodbFoodModal
          foodId={selectedFoodbId}
          onClose={() => setSelectedFoodbId(null)}
        />
      )}
    </div>
  );
}

const s = {
  header: { marginBottom: 24 },
  title: { color: theme.text, fontSize: 24, margin: 0 },
  subtitle: { color: theme.textMuted, fontSize: 14, marginTop: 6, lineHeight: 1.6 },

  controls: {
    display: "flex",
    gap: 16,
    alignItems: "flex-end",
    flexWrap: "wrap",
    background: theme.cardBg,
    padding: 16,
    borderRadius: 12,
    border: `1px solid ${theme.border}`,
    marginBottom: 16,
  },
  controlBlock: { display: "flex", flexDirection: "column", gap: 6, minWidth: 180 },
  label: { fontSize: 13, color: theme.textLight },
  select: {
    padding: "8px 12px",
    border: `1px solid ${theme.border}`,
    borderRadius: 8,
    fontSize: 14,
    background: theme.inputBg,
    color: theme.text,
    minHeight: 36,
  },
  btnPrimary: {
    padding: "10px 24px",
    background: theme.accent,
    color: "#fff",
    border: "none",
    borderRadius: 8,
    fontSize: 14,
    fontWeight: 600,
    cursor: "pointer",
    minHeight: 36,
  },
  btnDisabled: { background: theme.textLight, cursor: "not-allowed" },

  error: {
    background: theme.errorBg,
    color: theme.error,
    padding: "12px 16px",
    borderRadius: 8,
    marginBottom: 16,
  },
  placeholder: {
    background: theme.cardBg,
    border: `1px dashed ${theme.border}`,
    borderRadius: 12,
    padding: 40,
    textAlign: "center",
    color: theme.textLight,
  },
  center: { display: "flex", justifyContent: "center", padding: 40 },

  summary: { color: theme.textMuted, fontSize: 14, margin: "8px 4px 12px" },
  tableWrap: {
    background: theme.cardBg,
    borderRadius: 12,
    overflow: "hidden",
    border: `1px solid ${theme.border}`,
  },
  table: { width: "100%", borderCollapse: "collapse" },
  th: {
    background: `linear-gradient(135deg, ${theme.accent}, ${theme.accentHover})`,
    color: "#fff",
    padding: "12px 16px",
    textAlign: "left",
    fontWeight: 600,
    fontSize: 14,
  },
  td: {
    padding: "12px 16px",
    fontSize: 14,
    color: theme.text,
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  tdValue: {
    padding: "12px 16px",
    fontSize: 14,
    textAlign: "right",
    fontWeight: 600,
    fontFamily: "'Courier New', monospace",
    color: theme.accent,
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  firstRow: { background: theme.accentLight },
  rankBadge: {
    display: "inline-block",
    minWidth: 28,
    textAlign: "center",
    padding: "2px 8px",
    background: theme.borderLight,
    borderRadius: 12,
    fontSize: 13,
    color: theme.textMuted,
    fontWeight: 600,
  },
  rankBadgeGold: {
    display: "inline-block",
    minWidth: 28,
    textAlign: "center",
    padding: "2px 8px",
    background: "#ffd54f",
    borderRadius: 12,
    fontSize: 13,
    color: "#5d4037",
    fontWeight: 700,
  },
  linkBtn: {
    background: "none",
    border: "none",
    color: theme.accent,
    cursor: "pointer",
    fontSize: 14,
    fontWeight: 500,
    padding: 0,
    textDecoration: "underline",
  },
  sourceBadgeTaiwan: {
    fontSize: 12,
    padding: "2px 8px",
    borderRadius: 4,
    background: "#e8f5e9",
    color: "#2e7d32",
    fontWeight: 500,
  },
  sourceBadgeFoodb: {
    fontSize: 12,
    padding: "2px 8px",
    borderRadius: 4,
    background: "#e3f2fd",
    color: "#1565c0",
    fontWeight: 500,
  },
};
