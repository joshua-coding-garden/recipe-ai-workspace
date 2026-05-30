import { useState } from "react";
import { searchFood } from "../api/foodApi";
import LoadingSpinner from "../components/common/LoadingSpinner";
import ErrorMessage from "../components/common/ErrorMessage";
import theme from "../utils/theme";

export default function FoodSearchPage() {
  const [query, setQuery] = useState("");
  const [lang, setLang] = useState("auto");
  const [results, setResults] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSearch = async (e) => {
    e.preventDefault();
    if (!query.trim()) return;
    setLoading(true);
    setError("");
    try {
      const data = await searchFood(query, lang);
      setResults(data.candidates || []);
    } catch (e) {
      setError("搜尋失敗：" + (e.response?.data?.detail || e.message));
    } finally {
      setLoading(false);
    }
  };

  return (
    <div>
      <h1 style={{ color: theme.accent, marginBottom: "20px" }}>食物搜尋</h1>
      <form onSubmit={handleSearch} style={{ display: "flex", gap: "12px", marginBottom: "20px" }}>
        <input
          style={styles.input} placeholder="搜尋食物（中文或英文）..."
          value={query} onChange={(e) => setQuery(e.target.value)}
        />
        <select style={styles.select} value={lang} onChange={(e) => setLang(e.target.value)}>
          <option value="auto">自動偵測</option>
          <option value="zh">中文</option>
          <option value="en">英文</option>
        </select>
        <button style={styles.btn} type="submit" disabled={loading}>搜尋</button>
      </form>
      <ErrorMessage message={error} />
      {loading && <LoadingSpinner text="搜尋中..." />}
      {!loading && results.length > 0 && (
        <div style={{ display: "flex", flexDirection: "column", gap: "8px" }}>
          {results.map((item) => (
            <div key={`${item.source}-${item.id}`} style={styles.row}>
              <div>
                <span style={{ color: theme.text }}>{item.name}</span>
                <span style={{ color: theme.textLight, fontSize: "12px", marginLeft: "8px" }}>
                  {item.category}
                </span>
              </div>
              <div style={{ display: "flex", gap: "12px", alignItems: "center" }}>
                {item.nutrition && (
                  <span style={{ color: theme.textMuted, fontSize: "12px" }}>
                    {item.nutrition.calories?.toFixed(0)} kcal
                  </span>
                )}
                <span style={item.source === "taiwan_foods" ? styles.tagTw : styles.tagFoodb}>
                  {item.source === "taiwan_foods" ? "台灣" : "FooDB"}
                </span>
                <span style={{ color: theme.textLight, fontSize: "12px" }}>
                  {(item.score * 100).toFixed(0)}%
                </span>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

const styles = {
  input: { flex: 1, background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: "8px",
           padding: "10px 14px", color: theme.text, fontSize: "14px" },
  select: { background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: "8px",
            padding: "10px", color: theme.text, fontSize: "14px" },
  btn: { background: theme.accent, color: "#fff", border: "none", padding: "10px 20px",
         borderRadius: "8px", cursor: "pointer", fontSize: "14px" },
  row: { display: "flex", justifyContent: "space-between", alignItems: "center",
         background: theme.cardBg, borderRadius: "8px", padding: "12px 16px",
         border: `1px solid ${theme.border}` },
  tagTw: { background: "#e3f2fd", color: "#1565c0", padding: "2px 8px",
           borderRadius: "12px", fontSize: "11px" },
  tagFoodb: { background: "#f3e5f5", color: "#7b1fa2", padding: "2px 8px",
              borderRadius: "12px", fontSize: "11px" },
};
