import { useState, useEffect } from "react";
import { getFoodbFoodDetail } from "../../api/foodbFoodApi";
import theme from "../../utils/theme";

function fmt(v) {
  const n = parseFloat(v);
  return isNaN(n) ? "0.00" : n.toFixed(2);
}

function MetaRow({ label, value, mono = false }) {
  if (value === null || value === undefined || value === "") return null;
  return (
    <div style={s.metaRow}>
      <span style={s.metaLabel}>{label}</span>
      <span style={mono ? { ...s.metaValue, ...s.metaMono } : s.metaValue}>{value}</span>
    </div>
  );
}

function ItemCard({ item, rank }) {
  const hasMin = item.orig_min !== null && item.orig_min !== undefined;
  const hasMax = item.orig_max !== null && item.orig_max !== undefined;
  let rangeText = null;
  if (hasMin && hasMax) {
    rangeText = `${fmt(item.orig_min)} – ${fmt(item.orig_max)} ${item.orig_unit || ""}`.trim();
  } else if (hasMin) {
    rangeText = `≥ ${fmt(item.orig_min)} ${item.orig_unit || ""}`.trim();
  } else if (hasMax) {
    rangeText = `≤ ${fmt(item.orig_max)} ${item.orig_unit || ""}`.trim();
  }

  return (
    <div style={s.itemCard}>
      <div style={s.itemHeader}>
        <span style={s.itemRank}>#{rank}</span>
        <span style={s.itemName}>{item.name || "-"}</span>
        {item.public_id && <span style={s.itemPublicId}>{item.public_id}</span>}
        {item.citation_type && (
          <span style={s.citationTag}>{item.citation_type}</span>
        )}
      </div>

      <div style={s.itemContentGrid}>
        <MetaRow
          label="標準含量"
          value={`${fmt(item.standard_content)} ${item.orig_unit || ""}`.trim()}
          mono
        />
        {item.orig_content !== null && item.orig_content !== undefined && (
          <MetaRow
            label="原始含量"
            value={`${fmt(item.orig_content)} ${
              item.orig_unit_expression || item.orig_unit || ""
            }`.trim()}
            mono
          />
        )}
        {rangeText && <MetaRow label="範圍" value={rangeText} mono />}
        <MetaRow label="製備方式" value={item.preparation_type} />
        <MetaRow label="食物部位" value={item.orig_food_part} />
        <MetaRow label="檢測方法" value={item.orig_method} />
        <MetaRow label="原始來源名稱" value={item.orig_source_name} />
      </div>

      {item.description && (
        <div style={s.itemDescription}>
          <div style={s.metaLabel}>化合物描述</div>
          <div style={s.itemDescriptionText}>{item.description}</div>
        </div>
      )}

      {(item.citation || item.orig_citation) && (
        <div style={s.citationBox}>
          <div style={s.metaLabel}>
            來源資料
            {item.citation_type ? `（${item.citation_type}）` : ""}
          </div>
          {item.citation && (
            <div style={s.citationText}>
              <span style={s.citationLabel}>citation：</span>
              <span>{item.citation}</span>
            </div>
          )}
          {item.orig_citation && (
            <div style={s.citationText}>
              <span style={s.citationLabel}>原始 citation：</span>
              <span>{item.orig_citation}</span>
            </div>
          )}
        </div>
      )}
    </div>
  );
}

function ItemList({ items, emptyText }) {
  if (!items || items.length === 0) {
    return <p style={s.emptyText}>{emptyText}</p>;
  }
  return (
    <div style={s.itemList}>
      {items.map((it, idx) => (
        <ItemCard key={it.id ?? idx} item={it} rank={idx + 1} />
      ))}
    </div>
  );
}

export default function FoodbFoodModal({ foodId, onClose }) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState("compounds");

  useEffect(() => {
    if (!foodId) return;
    setLoading(true);
    getFoodbFoodDetail(foodId)
      .then((d) => setData(d))
      .catch(console.error)
      .finally(() => setLoading(false));
  }, [foodId]);

  if (!foodId) return null;

  const handleOverlayClick = (e) => {
    if (e.target === e.currentTarget) onClose();
  };

  const food = data?.food;
  const compounds = data?.compounds || [];
  const nutrients = data?.nutrients || [];
  const stats = data?.stats || {};

  const tabs = [
    { key: "compounds", label: "化合物" },
    { key: "nutrients", label: "營養素" },
  ];

  return (
    <div style={s.overlay} onClick={handleOverlayClick}>
      <div style={s.modal}>
        {/* Header */}
        <div style={s.header}>
          <div style={{ flex: 1 }}>
            <h2 style={s.title}>
              {loading ? "載入中..." : food?.name || "-"}
            </h2>
            {food?.name_scientific && (
              <p style={s.commonName}>學名:{food.name_scientific}</p>
            )}
            <div style={s.headerMeta}>
              {food?.food_group && (
                <span style={s.badge}>{food.food_group}</span>
              )}
              {food?.food_subgroup && (
                <span style={s.badge}>{food.food_subgroup}</span>
              )}
              {food?.food_type && (
                <span style={s.badge}>{food.food_type}</span>
              )}
              {food?.public_id && (
                <span style={s.badge}>{food.public_id}</span>
              )}
            </div>
          </div>
          <button style={s.closeBtn} onClick={onClose}>
            &times;
          </button>
        </div>

        {loading ? (
          <div style={s.loadingBody}>載入中...</div>
        ) : data ? (
          <div style={s.body}>
            {/* Stats row */}
            <div style={s.statsRow}>
              <div style={s.statCard}>
                <div style={s.statLabel}>化合物總數</div>
                <div style={s.statValue}>
                  {stats.total_compounds ?? compounds.length}
                </div>
              </div>
              <div style={s.statCard}>
                <div style={s.statLabel}>營養素總數</div>
                <div style={s.statValue}>
                  {stats.total_nutrients ?? nutrients.length}
                </div>
              </div>
            </div>

            {/* Description */}
            {food?.description && (
              <div style={s.sampleDesc}>{food.description}</div>
            )}

            {/* Tabs */}
            <div style={s.tabBar}>
              {tabs.map((t) => (
                <button
                  key={t.key}
                  style={
                    activeTab === t.key
                      ? { ...s.tabBtn, ...s.tabActive }
                      : s.tabBtn
                  }
                  onClick={() => setActiveTab(t.key)}
                >
                  {t.label}
                </button>
              ))}
            </div>

            <div style={s.tabContent}>
              {activeTab === "compounds" && (
                <ItemList
                  items={compounds}
                  emptyText="此食物 FooDB 尚無化合物資料"
                />
              )}
              {activeTab === "nutrients" && (
                <ItemList
                  items={nutrients}
                  emptyText="此食物 FooDB 尚無營養素資料"
                />
              )}
            </div>

            <button style={s.closeBottom} onClick={onClose}>
              關閉
            </button>
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
    position: "fixed",
    top: 0,
    left: 0,
    width: "100%",
    height: "100%",
    background: "rgba(0,0,0,0.4)",
    zIndex: 1000,
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    padding: 20,
    backdropFilter: "blur(4px)",
  },
  modal: {
    background: theme.cardBg,
    borderRadius: 16,
    maxWidth: 900,
    width: "100%",
    maxHeight: "90vh",
    overflow: "hidden",
    display: "flex",
    flexDirection: "column",
    boxShadow: "0 8px 32px rgba(0,0,0,0.15)",
  },
  header: {
    background: `linear-gradient(135deg, ${theme.accent} 0%, ${theme.accentHover} 100%)`,
    padding: "24px 32px",
    color: "#fff",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "flex-start",
  },
  title: { margin: 0, fontSize: 22, color: "#fff" },
  commonName: {
    color: "rgba(255,255,255,0.85)",
    fontSize: 13,
    margin: "4px 0 0",
    fontStyle: "italic",
  },
  headerMeta: { display: "flex", gap: 12, marginTop: 12, flexWrap: "wrap" },
  badge: {
    background: "rgba(255,255,255,0.2)",
    color: "#fff",
    padding: "6px 12px",
    borderRadius: 20,
    fontSize: 13,
    fontWeight: 500,
  },
  closeBtn: {
    background: "none",
    border: "none",
    color: "#fff",
    fontSize: 36,
    cursor: "pointer",
    width: 40,
    height: 40,
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    borderRadius: "50%",
  },
  body: { padding: 24, overflowY: "auto", flex: 1 },
  loadingBody: { padding: 64, textAlign: "center", color: theme.textLight },
  statsRow: {
    display: "grid",
    gridTemplateColumns: "repeat(2, 1fr)",
    gap: 16,
    marginBottom: 20,
  },
  statCard: {
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: 12,
    padding: 16,
    textAlign: "center",
    boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
  },
  statLabel: {
    fontSize: 13,
    color: theme.textLight,
    marginBottom: 6,
    fontWeight: 500,
  },
  statValue: {
    fontSize: 24,
    fontWeight: 700,
    color: theme.accent,
  },
  sampleDesc: {
    background: theme.accentLight,
    borderLeft: `4px solid ${theme.accent}`,
    padding: "12px 16px",
    marginBottom: 20,
    borderRadius: 6,
    fontSize: 13,
    color: theme.textMuted,
    lineHeight: 1.5,
  },
  tabBar: {
    display: "flex",
    gap: 8,
    borderBottom: `2px solid ${theme.border}`,
    marginBottom: 24,
  },
  tabBtn: {
    background: "none",
    border: "none",
    padding: "12px 24px",
    fontSize: 15,
    fontWeight: 500,
    color: theme.textLight,
    cursor: "pointer",
    borderBottom: "3px solid transparent",
    position: "relative",
    top: 2,
  },
  tabActive: { color: theme.accent, borderBottomColor: theme.accent },
  tabContent: { minHeight: 200 },
  emptyText: {
    textAlign: "center",
    color: theme.textLight,
    padding: "40px 0",
    fontSize: 14,
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
    background: theme.cardBg,
    borderRadius: 8,
    overflow: "hidden",
    boxShadow: "0 2px 4px rgba(0,0,0,0.05)",
    marginBottom: 24,
  },
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
    color: theme.textMuted,
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  tdValue: {
    padding: "12px 16px",
    fontSize: 14,
    textAlign: "right",
    fontWeight: 500,
    fontFamily: "'Courier New', monospace",
    color: theme.accent,
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  citationTag: {
    background: theme.inputBg,
    color: theme.textMuted,
    padding: "2px 8px",
    borderRadius: 10,
    fontSize: 11,
    fontWeight: 500,
    border: `1px solid ${theme.borderLight}`,
  },
  itemList: {
    display: "flex",
    flexDirection: "column",
    gap: 12,
    marginBottom: 16,
  },
  itemCard: {
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: 8,
    padding: 16,
    boxShadow: "0 1px 3px rgba(0,0,0,0.04)",
  },
  itemHeader: {
    display: "flex",
    alignItems: "center",
    gap: 10,
    flexWrap: "wrap",
    marginBottom: 12,
    paddingBottom: 10,
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  itemRank: {
    fontSize: 13,
    fontWeight: 700,
    color: theme.accent,
    background: theme.accentLight,
    padding: "2px 10px",
    borderRadius: 12,
    minWidth: 36,
    textAlign: "center",
  },
  itemName: {
    fontSize: 15,
    fontWeight: 600,
    color: theme.text,
    flex: 1,
  },
  itemPublicId: {
    fontSize: 11,
    color: theme.textLight,
    fontFamily: "'Courier New', monospace",
    background: theme.inputBg,
    padding: "2px 6px",
    borderRadius: 4,
    border: `1px solid ${theme.borderLight}`,
  },
  itemContentGrid: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fit, minmax(220px, 1fr))",
    gap: "8px 16px",
    marginBottom: 8,
  },
  metaRow: {
    display: "flex",
    flexDirection: "column",
    gap: 2,
  },
  metaLabel: {
    fontSize: 11,
    color: theme.textLight,
    fontWeight: 500,
    textTransform: "none",
    letterSpacing: 0.2,
  },
  metaValue: {
    fontSize: 13,
    color: theme.text,
    wordBreak: "break-word",
  },
  metaMono: {
    fontFamily: "'Courier New', monospace",
    color: theme.accent,
    fontWeight: 500,
  },
  itemDescription: {
    marginTop: 10,
    paddingTop: 10,
    borderTop: `1px dashed ${theme.borderLight}`,
  },
  itemDescriptionText: {
    fontSize: 12,
    color: theme.textMuted,
    lineHeight: 1.6,
    marginTop: 4,
    whiteSpace: "pre-wrap",
    wordBreak: "break-word",
  },
  citationBox: {
    marginTop: 10,
    padding: "10px 12px",
    background: theme.inputBg,
    borderRadius: 6,
    border: `1px solid ${theme.borderLight}`,
  },
  citationText: {
    fontSize: 12,
    color: theme.textMuted,
    lineHeight: 1.6,
    marginTop: 6,
    whiteSpace: "pre-wrap",
    wordBreak: "break-word",
  },
  citationLabel: {
    fontWeight: 600,
    color: theme.text,
    marginRight: 4,
  },
  closeBottom: {
    width: "100%",
    padding: 16,
    background: theme.accent,
    color: "#fff",
    border: "none",
    borderRadius: 8,
    fontSize: 16,
    fontWeight: 500,
    cursor: "pointer",
    marginTop: 16,
  },
};
