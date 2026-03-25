import { useState, useEffect, useCallback } from "react";
import { browseTaiwanFoods, getTaiwanFoodCategories, getTaiwanFoodStats } from "../api/taiwanFoodApi";
import TaiwanFoodModal from "../components/food/TaiwanFoodModal";
import LoadingSpinner from "../components/common/LoadingSpinner";
import theme from "../utils/theme";

export default function TaiwanFoodDatabasePage() {
  const [foods, setFoods] = useState([]);
  const [pagination, setPagination] = useState({ page: 1, limit: 24, total: 0, totalPages: 0 });
  const [categories, setCategories] = useState([]);
  const [stats, setStats] = useState(null);
  const [search, setSearch] = useState("");
  const [category, setCategory] = useState("");
  const [loading, setLoading] = useState(true);
  const [selectedFoodId, setSelectedFoodId] = useState(null);

  const loadFoods = useCallback(async (page = 1) => {
    setLoading(true);
    try {
      const data = await browseTaiwanFoods(page, 24, search, category);
      setFoods(data.foods || []);
      setPagination(data.pagination || { page: 1, limit: 24, total: 0, totalPages: 0 });
    } catch (e) {
      console.error("載入失敗:", e);
    } finally {
      setLoading(false);
    }
  }, [search, category]);

  useEffect(() => {
    getTaiwanFoodCategories().then((d) => setCategories(d.categories || [])).catch(console.error);
    getTaiwanFoodStats().then((d) => setStats(d.stats)).catch(console.error);
  }, []);

  useEffect(() => {
    const timer = setTimeout(() => loadFoods(1), 300);
    return () => clearTimeout(timer);
  }, [loadFoods]);

  const changePage = (p) => {
    loadFoods(p);
    window.scrollTo({ top: 0, behavior: "smooth" });
  };

  const renderPagination = () => {
    const { page, totalPages } = pagination;
    if (totalPages <= 1) return null;

    const maxVisible = 5;
    let start = Math.max(1, page - Math.floor(maxVisible / 2));
    let end = Math.min(totalPages, start + maxVisible - 1);
    if (end - start < maxVisible - 1) start = Math.max(1, end - maxVisible + 1);

    const buttons = [];
    if (page > 1) {
      buttons.push(<button key="prev" style={s.pageBtn} onClick={() => changePage(page - 1)}>« 上一頁</button>);
    }
    if (start > 1) {
      buttons.push(<button key={1} style={s.pageBtn} onClick={() => changePage(1)}>1</button>);
      if (start > 2) buttons.push(<span key="e1" style={s.ellipsis}>...</span>);
    }
    for (let i = start; i <= end; i++) {
      buttons.push(
        <button key={i} style={i === page ? { ...s.pageBtn, ...s.pageBtnActive } : s.pageBtn}
          onClick={() => changePage(i)}>{i}</button>
      );
    }
    if (end < totalPages) {
      if (end < totalPages - 1) buttons.push(<span key="e2" style={s.ellipsis}>...</span>);
      buttons.push(<button key={totalPages} style={s.pageBtn} onClick={() => changePage(totalPages)}>{totalPages}</button>);
    }
    if (page < totalPages) {
      buttons.push(<button key="next" style={s.pageBtn} onClick={() => changePage(page + 1)}>下一頁 »</button>);
    }
    return <div style={s.pagination}>{buttons}</div>;
  };

  return (
    <div>
      {/* Header */}
      <div style={s.header}>
        <div>
          <h1 style={s.title}>Taiwan 食物資料庫</h1>
          <p style={s.subtitle}>探索全球最完整的食物成分資料庫</p>
        </div>
        {stats && (
          <div style={s.statsGrid}>
            <div style={{ ...s.statCard, background: "#e3f2fd" }}>
              <div style={{ fontSize: 28, fontWeight: "bold", color: "#1565c0" }}>
                {stats.totalFoods?.toLocaleString() || "-"}
              </div>
              <div style={{ fontSize: 12, color: theme.textMuted }}>食物種類</div>
            </div>
            <div style={{ ...s.statCard, background: "#f3e5f5" }}>
              <div style={{ fontSize: 28, fontWeight: "bold", color: "#7b1fa2" }}>
                {stats.totalNutrients || "25+"}
              </div>
              <div style={{ fontSize: 12, color: theme.textMuted }}>營養素</div>
            </div>
            <div style={{ ...s.statCard, background: theme.accentLight }}>
              <div style={{ fontSize: 28, fontWeight: "bold", color: theme.accent }}>
                {stats.totalCategories || "-"}
              </div>
              <div style={{ fontSize: 12, color: theme.textMuted }}>分類</div>
            </div>
          </div>
        )}
      </div>

      {/* Search & Filter */}
      <div style={s.searchSection}>
        <div style={s.searchRow}>
          <input
            style={s.searchInput}
            placeholder="搜尋食物名稱..."
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />
          <select style={s.filterSelect} value={category} onChange={(e) => setCategory(e.target.value)}>
            <option value="">所有分類</option>
            {categories.map((c) => (
              <option key={c.category} value={c.category}>
                {c.category} ({c.count})
              </option>
            ))}
          </select>
        </div>
        <div style={s.resultInfo}>
          <span>顯示 {Math.min(pagination.limit, pagination.total)} / {pagination.total} 筆資料</span>
          <button style={s.refreshBtn} onClick={() => loadFoods(1)}>重新載入</button>
        </div>
      </div>

      {/* Food grid */}
      {loading ? (
        <LoadingSpinner text="載入中..." />
      ) : foods.length === 0 ? (
        <div style={{ textAlign: "center", padding: 40, color: theme.textLight }}>無符合的食物資料</div>
      ) : (
        <div style={s.foodGrid}>
          {foods.map((food) => (
            <div key={food.id} style={s.foodCard}>
              <div style={s.cardHeader}>
                <h3 style={s.foodName}>{food.food_name}</h3>
                {food.sample_name && (
                  <p style={s.sampleName}>{food.sample_name}</p>
                )}
              </div>
              <div style={s.cardBody}>
                <div style={s.tags}>
                  {food.category && <span style={s.tagCategory}>{food.category}</span>}
                  <span style={s.tagTw}>台灣食品</span>
                </div>
                <p style={s.nutrients}>
                  {food.cal_per_100g != null && `熱量 ${Number(food.cal_per_100g).toFixed(2)} kcal`}
                  {food.protein_per_100g != null && ` | 蛋白質 ${Number(food.protein_per_100g).toFixed(2)}g`}
                  {food.carbon_per_100g != null && ` | 碳水 ${Number(food.carbon_per_100g).toFixed(2)}g`}
                  {food.fats_per_100g != null && ` | 脂肪 ${Number(food.fats_per_100g).toFixed(2)}g`}
                </p>
              </div>
              <div style={s.cardFooter}>
                <span style={s.foodId}>TW{String(food.id).padStart(5, "0")}</span>
                <button style={s.detailBtn} onClick={() => setSelectedFoodId(food.id)}>
                  查看詳情 →
                </button>
              </div>
            </div>
          ))}
        </div>
      )}

      {renderPagination()}

      {selectedFoodId && (
        <TaiwanFoodModal foodId={selectedFoodId} onClose={() => setSelectedFoodId(null)} />
      )}
    </div>
  );
}

const s = {
  header: {
    display: "flex", justifyContent: "space-between", alignItems: "center",
    flexWrap: "wrap", gap: 16, marginBottom: 24,
    background: theme.cardBg, borderRadius: 16, padding: "24px 32px",
    border: `1px solid ${theme.border}`, boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
  },
  title: { color: theme.accent, margin: 0, fontSize: 28 },
  subtitle: { color: theme.textLight, fontSize: 14, marginTop: 4 },
  statsGrid: { display: "flex", gap: 16 },
  statCard: {
    padding: "16px 24px", borderRadius: 12, textAlign: "center", minWidth: 100,
  },
  searchSection: {
    background: theme.cardBg, borderRadius: 16, padding: 20,
    marginBottom: 24, border: `1px solid ${theme.border}`,
  },
  searchRow: { display: "grid", gridTemplateColumns: "2fr 1fr", gap: 16, marginBottom: 12 },
  searchInput: {
    width: "100%", padding: "12px 16px", background: theme.inputBg,
    border: `1px solid ${theme.border}`, borderRadius: 8, color: theme.text, fontSize: 16,
  },
  filterSelect: {
    width: "100%", padding: "12px 16px", background: theme.inputBg,
    border: `1px solid ${theme.border}`, borderRadius: 8, color: theme.text, fontSize: 16,
  },
  resultInfo: {
    display: "flex", justifyContent: "space-between", alignItems: "center",
    fontSize: 14, color: theme.textLight,
  },
  refreshBtn: {
    background: "none", border: "none", color: theme.accent, cursor: "pointer",
    fontSize: 14, fontWeight: 500, padding: "4px 8px", borderRadius: 4,
  },
  foodGrid: {
    display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(320px, 1fr))",
    gap: 20, marginBottom: 24,
  },
  foodCard: {
    background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: 16,
    padding: 24, transition: "all 0.3s", cursor: "default",
    boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
  },
  cardHeader: { marginBottom: 12 },
  foodName: { fontSize: 20, fontWeight: 600, margin: 0, color: theme.accent },
  sampleName: { fontSize: 13, color: theme.textLight, margin: "6px 0 0", fontStyle: "italic" },
  cardBody: { marginBottom: 16 },
  tags: { display: "flex", flexWrap: "wrap", gap: 8, marginBottom: 8 },
  tagCategory: {
    display: "inline-block", padding: "4px 10px", borderRadius: 20,
    fontSize: 12, fontWeight: 500, background: "#e3f2fd", color: "#1565c0",
  },
  tagTw: {
    display: "inline-block", padding: "4px 10px", borderRadius: 20,
    fontSize: 12, fontWeight: 600, background: `linear-gradient(135deg, ${theme.accent}, ${theme.accentHover})`,
    color: "#fff",
  },
  nutrients: { fontSize: 13, lineHeight: 1.6, color: theme.textMuted, margin: 0 },
  cardFooter: {
    display: "flex", justifyContent: "space-between", alignItems: "center",
    paddingTop: 16, borderTop: `1px solid ${theme.borderLight}`,
  },
  foodId: { fontSize: 13, fontWeight: 500, color: theme.textLight },
  detailBtn: {
    background: theme.accent, color: "#fff", border: "none", padding: "8px 16px",
    borderRadius: 8, fontSize: 14, fontWeight: 500, cursor: "pointer",
  },
  pagination: {
    display: "flex", justifyContent: "center", gap: 8, padding: "20px 0",
    flexWrap: "wrap",
  },
  pageBtn: {
    background: theme.cardBg, border: `1px solid ${theme.border}`, color: theme.text,
    padding: "8px 16px", borderRadius: 8, cursor: "pointer", fontSize: 14,
  },
  pageBtnActive: {
    background: theme.accent, borderColor: theme.accent, color: "#fff", fontWeight: 600,
  },
  ellipsis: { color: theme.textLight, padding: "8px 4px" },
};
