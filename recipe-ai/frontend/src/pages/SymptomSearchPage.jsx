import { useState } from "react";
import { symptomSearch } from "../api/healthApi";
import LoadingSpinner from "../components/common/LoadingSpinner";
import ErrorMessage from "../components/common/ErrorMessage";
import FoodbFoodModal from "../components/food/FoodbFoodModal";
import ServingReferenceBox from "../components/common/ServingReferenceBox";
import categoryDefaults from "../utils/foodServingDict.json";
import theme from "../utils/theme";

export default function SymptomSearchPage() {
  const [query, setQuery] = useState("");
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [expandedCompounds, setExpandedCompounds] = useState({});
  const [selectedFoodbId, setSelectedFoodbId] = useState(null);

  const handleSearch = async (e) => {
    e.preventDefault();
    if (!query.trim()) return;
    setLoading(true);
    setError("");
    setResult(null);
    setExpandedCompounds({});
    try {
      const data = await symptomSearch(query);
      setResult(data);
    } catch (err) {
      setError("搜尋失敗：" + (err.response?.data?.detail || err.message));
    } finally {
      setLoading(false);
    }
  };

  const toggleCompound = (compoundId) => {
    setExpandedCompounds((prev) => ({
      ...prev,
      [compoundId]: !prev[compoundId],
    }));
  };

  const perServingInfo = (food) => {
    const cat = food.food_group || "";
    const def = categoryDefaults[cat];
    if (!def) return null;
    const content = Number(food.standard_content);
    if (!content || !Number.isFinite(content)) return null;
    const perServing = (content / 100) * def.grams;
    const label = `${perServing < 0.01 ? "<0.01" : perServing < 1 ? perServing.toFixed(2) : perServing.toFixed(1)}`;
    return { value: label, unit: def.unit, grams: def.grams };
  };

  return (
    <div>
      <h1 style={{ color: theme.accent, marginBottom: "8px" }}>症状搜尋</h1>
      <p style={{ color: theme.textLight, marginBottom: "20px", fontSize: "14px" }}>
        輸入症狀關鍵字（如：疲勞、失眠、高血壓），查詢相關健康效果、化合物及推薦食物
      </p>

      <form onSubmit={handleSearch} style={{ display: "flex", gap: "12px", marginBottom: "24px" }}>
        <input
          style={styles.input}
          placeholder="輸入症狀（如：疲勞、失眠、發炎...）"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
        />
        <button style={styles.btn} type="submit" disabled={loading}>
          搜尋
        </button>
      </form>

      <ErrorMessage message={error} />
      {loading && <LoadingSpinner text="搜尋中..." />}

      {result && !loading && (
        <div>
          {/* 搜尋資訊 */}
          <div style={styles.infoBar}>
            <span>搜尋：<strong style={{ color: theme.accent }}>{result.keyword}</strong></span>
            {result.parsed_symptoms && result.parsed_symptoms.length > 1 && (
              <div style={{ marginTop: "6px" }}>
                <span style={{ color: theme.textMuted, fontSize: "12px" }}>LLM 解析：</span>
                {result.parsed_symptoms.map((s, i) => (
                  <span key={i} style={styles.parsedTag}>{s}</span>
                ))}
              </div>
            )}
            {result.matched_symptom && (
              <span style={{ marginLeft: "16px" }}>
                對應症狀：<strong style={{ color: "#1565c0" }}>{result.matched_symptom}</strong>
              </span>
            )}
            {result.effect_names_searched && result.effect_names_searched.length > 0 && (
              <span style={{ marginLeft: "16px", color: theme.textMuted, fontSize: "12px" }}>
                效果關鍵字：{result.effect_names_searched.join(", ")}
              </span>
            )}
          </div>

          {/* 向量語義匹配 */}
          {result.vector_matches && result.vector_matches.length > 0 && (
            <div style={{ marginBottom: "24px" }}>
              <h2 style={styles.sectionTitle}>
                向量語義匹配 ({result.vector_matches.length})
              </h2>
              <div style={{ display: "flex", flexWrap: "wrap", gap: "8px" }}>
                {result.vector_matches.map((vm) => (
                  <div key={vm.id} style={styles.vectorCard}>
                    <div style={{ display: "flex", alignItems: "center", gap: "6px" }}>
                      <span style={{ color: "#00695c", fontWeight: "bold", fontSize: "13px" }}>
                        {vm.name_zh || vm.name}
                      </span>
                      {vm.name_zh && (
                        <span style={{ color: theme.textMuted, fontSize: "11px" }}>{vm.name}</span>
                      )}
                      <span style={styles.scoreBadge}>
                        {(vm.score * 100).toFixed(0)}%
                      </span>
                      <span style={{
                        ...styles.sourceBadge,
                        background: vm.source === "name_exact" ? "#e8f5e9"
                          : vm.source === "name_partial" ? "#fff3e0" : "#e3f2fd",
                        color: vm.source === "name_exact" ? "#2e7d32"
                          : vm.source === "name_partial" ? "#e65100" : "#1565c0",
                      }}>
                        {vm.source === "name_exact" ? "精確"
                          : vm.source === "name_partial" ? "部分" : "語義"}
                      </span>
                    </div>
                    {vm.description && (
                      <div style={{ color: theme.textLight, fontSize: "11px", marginTop: "4px" }}>
                        {vm.description.length > 100
                          ? vm.description.slice(0, 100) + "..."
                          : vm.description}
                      </div>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* 健康效果卡片 */}
          {result.effects && result.effects.length > 0 && (
            <div style={{ marginBottom: "24px" }}>
              <h2 style={styles.sectionTitle}>相關健康效果 ({result.effects.length})</h2>
              <div style={{ display: "flex", flexWrap: "wrap", gap: "8px" }}>
                {result.effects.map((eff) => (
                  <div key={eff.id} style={styles.effectCard}>
                    <span style={{ color: "#7b1fa2", fontWeight: "bold" }}>
                      {eff.name_zh || eff.name}
                    </span>
                    {eff.name_zh && (
                      <span style={{ color: theme.textMuted, fontSize: "11px", marginLeft: "6px" }}>
                        {eff.name}
                      </span>
                    )}
                    {eff.description && (
                      <span style={{ color: theme.textLight, fontSize: "12px", marginLeft: "8px" }}>
                        {eff.description.length > 80
                          ? eff.description.slice(0, 80) + "..."
                          : eff.description}
                      </span>
                    )}
                  </div>
                ))}
              </div>
            </div>
          )}

          {/* 化合物 + 食物推薦 */}
          {result.recommendations && result.recommendations.length > 0 ? (
            <div>
              <h2 style={styles.sectionTitle}>
                推薦化合物與食物 ({result.recommendations.length})
              </h2>
              {result.recommendations.map((rec) => (
                <div key={rec.compound.id} style={styles.compoundCard}>
                  <div
                    style={styles.compoundHeader}
                    onClick={() => toggleCompound(rec.compound.id)}
                  >
                    <div>
                      <span style={{ color: "#1565c0", fontWeight: "bold", fontSize: "15px" }}>
                        {rec.compound.name}
                      </span>
                      {rec.health_effect && (
                        <span style={styles.effectTag}>{rec.health_effect}</span>
                      )}
                      {rec.citation_type && (
                        <span style={styles.citationTag}>{rec.citation_type}</span>
                      )}
                    </div>
                    <span style={{ color: theme.textLight, fontSize: "18px" }}>
                      {expandedCompounds[rec.compound.id] ? "\u25B2" : "\u25BC"}
                    </span>
                  </div>

                  {rec.compound.description && (
                    <p style={{ color: theme.textMuted, fontSize: "12px", margin: "4px 0 8px 0" }}>
                      {rec.compound.description.length > 150
                        ? rec.compound.description.slice(0, 150) + "..."
                        : rec.compound.description}
                    </p>
                  )}

                  {expandedCompounds[rec.compound.id] && rec.top_foods && rec.top_foods.length > 0 && (
                    <div style={styles.foodTable}>
                      <div style={styles.tableHeader}>
                        <span style={{ flex: 2 }}>食物</span>
                        <span style={{ flex: 1 }}>分類</span>
                        <span style={{ flex: 1, textAlign: "right" }}>含量/100g</span>
                        <span style={{ flex: 1, textAlign: "right" }}>每份含量</span>
                      </div>
                      {rec.top_foods.map((food, idx) => {
                        const srv = perServingInfo(food);
                        return (
                        <div key={`${food.id}-${idx}`} style={styles.tableRow}>
                          <span style={{ flex: 2 }}>
                            {food.id ? (
                              <button
                                type="button"
                                onClick={() => setSelectedFoodbId(food.id)}
                                style={styles.foodLinkBtn}
                              >
                                {food.name}
                              </button>
                            ) : (
                              <span style={{ color: theme.text }}>{food.name}</span>
                            )}
                          </span>
                          <span style={{ flex: 1, color: theme.textLight, fontSize: "12px" }}>
                            {food.food_group || "-"}
                          </span>
                          <span style={{ flex: 1, textAlign: "right", color: "#2e7d32", fontWeight: "bold" }}>
                            {food.standard_content != null
                              ? Number(food.standard_content).toFixed(2)
                              : "-"}
                            <span style={{ color: theme.textLight, fontWeight: "normal", fontSize: "11px", marginLeft: 2 }}>
                              {food.orig_unit || "mg/100g"}
                            </span>
                          </span>
                          <span style={{ flex: 1, textAlign: "right", color: theme.primary, fontWeight: 500, fontSize: "12px" }}>
                            {srv ? (
                              <>
                                {srv.value}
                                <span style={{ color: theme.textMuted, fontWeight: "normal", fontSize: "11px", marginLeft: 2 }}>
                                  /{srv.unit}({srv.grams}g)
                                </span>
                              </>
                            ) : "—"}
                          </span>
                        </div>
                        );
                      })}
                    </div>
                  )}
                </div>
              ))}
            </div>
          ) : (
            result.effects &&
            result.effects.length === 0 && (
              <div style={{ color: theme.textLight, textAlign: "center", padding: "40px" }}>
                找不到與「{result.keyword}」相關的健康效果
              </div>
            )
          )}
          <ServingReferenceBox />
        </div>
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

const styles = {
  input: {
    flex: 1,
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: "8px",
    padding: "10px 14px",
    color: theme.text,
    fontSize: "14px",
  },
  btn: {
    background: theme.accent,
    color: "#fff",
    border: "none",
    padding: "10px 24px",
    borderRadius: "8px",
    cursor: "pointer",
    fontSize: "14px",
    fontWeight: "bold",
  },
  infoBar: {
    background: theme.cardBg,
    borderRadius: "8px",
    padding: "12px 16px",
    marginBottom: "20px",
    border: `1px solid ${theme.border}`,
    color: theme.text,
    fontSize: "14px",
  },
  sectionTitle: {
    color: theme.accent,
    fontSize: "16px",
    marginBottom: "12px",
    borderBottom: `1px solid ${theme.border}`,
    paddingBottom: "8px",
  },
  effectCard: {
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: "8px",
    padding: "8px 14px",
    fontSize: "13px",
  },
  compoundCard: {
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: "8px",
    padding: "14px 16px",
    marginBottom: "12px",
  },
  compoundHeader: {
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    cursor: "pointer",
  },
  effectTag: {
    background: "#f3e5f5",
    color: "#7b1fa2",
    padding: "2px 8px",
    borderRadius: "12px",
    fontSize: "11px",
    marginLeft: "8px",
  },
  citationTag: {
    background: "#e3f2fd",
    color: "#1565c0",
    padding: "2px 8px",
    borderRadius: "12px",
    fontSize: "11px",
    marginLeft: "8px",
  },
  foodTable: {
    marginTop: "12px",
    border: `1px solid ${theme.border}`,
    borderRadius: "8px",
    overflow: "hidden",
  },
  tableHeader: {
    display: "flex",
    padding: "8px 12px",
    background: theme.inputBg,
    color: theme.textLight,
    fontSize: "12px",
    fontWeight: "bold",
    borderBottom: `1px solid ${theme.border}`,
  },
  tableRow: {
    display: "flex",
    padding: "8px 12px",
    borderBottom: `1px solid ${theme.borderLight}`,
    fontSize: "13px",
    alignItems: "center",
  },
  foodLinkBtn: {
    background: "transparent",
    border: "none",
    padding: 0,
    color: theme.accent,
    cursor: "pointer",
    fontSize: "13px",
    textDecoration: "underline",
    textAlign: "left",
    font: "inherit",
  },
  parsedTag: {
    display: "inline-block",
    background: "#e8eaf6",
    color: "#283593",
    padding: "2px 10px",
    borderRadius: "12px",
    fontSize: "12px",
    marginLeft: "6px",
    fontWeight: 500,
  },
  vectorCard: {
    background: theme.cardBg,
    border: `1px solid ${theme.border}`,
    borderRadius: "8px",
    padding: "8px 14px",
    fontSize: "13px",
    minWidth: "200px",
    maxWidth: "400px",
  },
  scoreBadge: {
    background: "#e0f2f1",
    color: "#00695c",
    padding: "1px 6px",
    borderRadius: "8px",
    fontSize: "11px",
    fontWeight: "bold",
  },
  sourceBadge: {
    padding: "1px 6px",
    borderRadius: "8px",
    fontSize: "10px",
    fontWeight: "bold",
  },
};
