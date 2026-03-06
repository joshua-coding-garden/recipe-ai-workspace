import React from "react";
import ReferenceList from "../graphrag/ReferenceList";
import {
  vitaminFields, mineralFields, sugarFields,
} from "../../utils/nutrientMappings";

const MACRO_FIELDS = [
  { field: "cal_per_100g", name: "熱量", unit: "kcal" },
  { field: "moisture_per_100g", name: "水分", unit: "g" },
  { field: "protein_per_100g", name: "蛋白質", unit: "g" },
  { field: "carbon_per_100g", name: "碳水化合物", unit: "g" },
  { field: "fats_per_100g", name: "脂肪", unit: "g" },
  { field: "dietary_fiber_per_100g", name: "膳食纖維", unit: "g" },
  { field: "total_sugar_per_100g", name: "糖質總量", unit: "g" },
  { field: "cholesterol_per_100g", name: "膽固醇", unit: "mg" },
  { field: "sodium_per_100g", name: "鈉", unit: "mg" },
  { field: "potassium_per_100g", name: "鉀", unit: "mg" },
  { field: "calcium_per_100g", name: "鈣", unit: "mg" },
  { field: "iron_per_100g", name: "鐵", unit: "mg" },
  { field: "zinc_per_100g", name: "鋅", unit: "mg" },
];

function FoodDetailInline({ foodId, source }) {
  const [detail, setDetail] = React.useState(null);
  const [loading, setLoading] = React.useState(true);
  const [tab, setTab] = React.useState("basic");

  React.useEffect(() => {
    if (!foodId) { setLoading(false); return; }
    const token = localStorage.getItem("token");
    const headers = token ? { Authorization: `Bearer ${token}` } : {};
    const url = source === "foodb"
      ? `/api/food/foodb/${foodId}`
      : `/api/food/taiwan/${foodId}`;
    fetch(url, { headers })
      .then((r) => (r.ok ? r.json() : null))
      .then((d) => setDetail(d))
      .catch(() => setDetail(null))
      .finally(() => setLoading(false));
  }, [foodId, source]);

  if (loading) return <div style={{ padding: 6, color: "#718096", fontSize: 12 }}>載入完整營養資料中…</div>;
  if (!detail) return <div style={{ padding: 6, color: "#a0aec0", fontSize: 12 }}>此食品無完整詳細資料</div>;

  const renderGrid = (fields) => {
    const valid = fields.filter((f) => { const v = parseFloat(detail[f.field]); return !isNaN(v) && v !== 0; });
    if (valid.length === 0) return <div style={{ fontSize: 12, color: "#a0aec0" }}>無資料</div>;
    return (
      <div style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(150px, 1fr))", gap: "2px 12px" }}>
        {valid.map((f) => (
          <div key={f.field} style={{ fontSize: 12, padding: "2px 0", display: "flex", justifyContent: "space-between" }}>
            <span style={{ color: "#718096" }}>{f.name}</span>
            <span style={{ fontWeight: 500 }}>{parseFloat(detail[f.field]).toFixed(2)} {f.unit}</span>
          </div>
        ))}
      </div>
    );
  };

  const tabs = [
    { key: "basic", label: "基本+礦物質" },
    { key: "vitamins", label: "維生素" },
    { key: "sugars", label: "糖類" },
  ];

  return (
    <div>
      <div style={{ display: "flex", gap: 4, marginBottom: 6 }}>
        {tabs.map((t) => (
          <button key={t.key} onClick={() => setTab(t.key)} style={{
            padding: "2px 10px", borderRadius: 4, fontSize: 11, cursor: "pointer",
            border: "1px solid #cbd5e0",
            background: tab === t.key ? "#2b6cb0" : "#fff",
            color: tab === t.key ? "#fff" : "#4a5568",
          }}>{t.label}</button>
        ))}
      </div>
      {tab === "basic" && renderGrid(MACRO_FIELDS)}
      {tab === "vitamins" && renderGrid(vitaminFields)}
      {tab === "sugars" && renderGrid(sugarFields)}
    </div>
  );
}

export default function ToolResultCard({ name, data, onAction }) {
  if (!data || data.error) {
    return (
      <div style={styles.card}>
        <div style={styles.errorBanner}>
          ⚠️ {data?.error || "工具執行失敗"}
        </div>
      </div>
    );
  }

  if (name === "analyze_recipe" && data.phase === "confirm_ingredients") {
    return (
      <div style={styles.card}>
        <IngredientConfirmCard data={data} onAction={onAction} />
      </div>
    );
  }

  const renderer = RENDERERS[name];
  if (!renderer) return null;

  return (
    <div style={styles.card}>
      {renderer(data)}
    </div>
  );
}

function NutrientRankingTable({ data }) {
  const foods = data.top_foods || [];
  const nutrient = data.nutrient || "";

  return (
    <div>
      <div style={styles.header}>🏆 營養素排名 — {nutrient}</div>
      <table style={styles.table}>
        <thead>
          <tr>
            <th style={styles.th}>#</th>
            <th style={styles.th}>食物名稱</th>
            <th style={styles.th}>分類</th>
            <th style={styles.th}>含量</th>
            <th style={styles.th}>來源</th>
          </tr>
        </thead>
        <tbody>
          {foods.map((f, i) => {
            const val = f.content_per_100g ?? f.value;
            return (
              <tr key={i} style={i % 2 === 0 ? styles.rowEven : styles.rowOdd}>
                <td style={styles.td}>{i + 1}</td>
                <td style={styles.td}>{f.name || f.food_name || "—"}</td>
                <td style={{ ...styles.td, color: "#718096", fontSize: 12 }}>{f.category || "—"}</td>
                <td style={{ ...styles.td, textAlign: "right" }}>
                  {val != null ? `${Number(val).toFixed(2)} ${f.unit || ""}` : "—"}
                </td>
                <td style={styles.td}>{f.source || "—"}</td>
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
}

function SearchFoodCard({ data }) {
  const results = data.results || [];
  const [expandedId, setExpandedId] = React.useState(null);

  const flat = [];
  results.forEach((item) => {
    const foods = item.candidates || item.matches || (Array.isArray(item) ? item : [item]);
    foods.forEach((f) => flat.push(f));
  });

  return (
    <div>
      <div style={styles.header}>🔍 食物搜尋 — {data.food_name}（{flat.length} 筆）</div>
      {flat.length === 0 ? (
        <div style={styles.emptyMsg}>未找到匹配的食物</div>
      ) : (
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.th}>食品名稱</th>
              <th style={styles.th}>來源</th>
              <th style={styles.th}>分類</th>
              <th style={styles.th}>熱量</th>
              <th style={styles.th}>蛋白質</th>
              <th style={styles.th}>碳水</th>
              <th style={styles.th}>脂肪</th>
              <th style={styles.th}>纖維</th>
            </tr>
          </thead>
          <tbody>
            {flat.map((f, i) => {
              const n = f.nutrition || {};
              const fid = f.id || i;
              const isOpen = expandedId === fid;
              const name = f.name || f.food_name || "—";
              return (
                <React.Fragment key={fid}>
                  <tr
                    style={{ ...(i % 2 === 0 ? styles.rowEven : styles.rowOdd), cursor: "pointer" }}
                    onClick={() => setExpandedId(isOpen ? null : fid)}
                  >
                    <td style={{ ...styles.td, color: "#2b6cb0", fontWeight: 500 }}>{isOpen ? "▼" : "▶"} {name}</td>
                    <td style={styles.td}>
                      <span style={{ background: f.source === "foodb" ? "#bee3f8" : "#c6f6d5", padding: "1px 6px", borderRadius: 4, fontSize: 11 }}>{f.source || "—"}</span>
                    </td>
                    <td style={{ ...styles.td, color: "#718096", fontSize: 12 }}>{f.category || "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{n.calories != null ? Number(n.calories).toFixed(0) : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{n.protein != null ? `${Number(n.protein).toFixed(1)}g` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{n.carbs != null ? `${Number(n.carbs).toFixed(1)}g` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{n.fat != null ? `${Number(n.fat).toFixed(1)}g` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{n.fiber != null ? `${Number(n.fiber).toFixed(1)}g` : "—"}</td>
                  </tr>
                  {isOpen && (
                    <tr style={{ background: "#edf2f7" }}>
                      <td colSpan={8} style={{ padding: "10px 14px" }}>
                        {f.id && f.source === "taiwan_foods" ? (
                          <FoodDetailInline foodId={f.id} source={f.source} />
                        ) : f.id && f.source === "foodb" ? (
                          <FoodDetailInline foodId={f.id} source="foodb" />
                        ) : (
                          <div style={{ display: "flex", flexWrap: "wrap", gap: 12, fontSize: 13 }}>
                            {n.calories != null && <span><strong>熱量</strong> {Number(n.calories).toFixed(1)} kcal</span>}
                            {n.protein != null && <span><strong>蛋白質</strong> {Number(n.protein).toFixed(2)} g</span>}
                            {n.carbs != null && <span><strong>碳水化合物</strong> {Number(n.carbs).toFixed(2)} g</span>}
                            {n.fat != null && <span><strong>脂肪</strong> {Number(n.fat).toFixed(2)} g</span>}
                            {n.fiber != null && <span><strong>膳食纖維</strong> {Number(n.fiber).toFixed(2)} g</span>}
                          </div>
                        )}
                      </td>
                    </tr>
                  )}
                </React.Fragment>
              );
            })}
          </tbody>
        </table>
      )}
    </div>
  );
}

function SymptomResultCard({ data }) {
  const recommendations = data.recommendations || [];
  const effects = data.effects || [];
  const parsedSymptoms = data.parsed_symptoms || [];
  const vectorMatches = data.vector_matches || [];

  return (
    <div>
      <div style={styles.header}>🩺 症狀搜尋 — {data.symptom}</div>
      {parsedSymptoms.length > 1 && (
        <div style={{ marginBottom: 8, display: "flex", alignItems: "center", gap: 6, flexWrap: "wrap" }}>
          <span style={{ fontSize: 12, color: "#718096" }}>LLM 解析：</span>
          {parsedSymptoms.map((s, i) => (
            <span key={i} style={{ ...styles.adequateTag, background: "#e8eaf6", color: "#283593" }}>{s}</span>
          ))}
        </div>
      )}
      {vectorMatches.length > 0 && (
        <div style={{ marginBottom: 8 }}>
          <span style={{ fontSize: 12, color: "#718096" }}>語義匹配（{vectorMatches.length}）：</span>
          <div style={styles.tagContainer}>
            {vectorMatches.slice(0, 8).map((vm, i) => (
              <span key={i} style={{ ...styles.adequateTag, background: "#e0f2f1", color: "#00695c" }}>
                {vm.name_zh || vm.name} {(vm.score * 100).toFixed(0)}%
              </span>
            ))}
          </div>
        </div>
      )}
      {effects.length > 0 && (
        <div style={{ marginBottom: 8 }}>
          <span style={{ fontSize: 12, color: "#718096" }}>相關健康效果：</span>
          <div style={styles.tagContainer}>
            {effects.slice(0, 6).map((e, i) => (
              <span key={i} style={{ ...styles.adequateTag, background: "#e9d8fd", color: "#553c9a" }}>
                {e.name_zh || e.name || e}
              </span>
            ))}
          </div>
        </div>
      )}
      {recommendations.length === 0 ? (
        <div style={styles.emptyMsg}>未找到相關營養素與食物推薦</div>
      ) : (
        recommendations.map((rec, i) => (
          <div key={i} style={styles.effectCard}>
            <div style={{ display: "flex", alignItems: "center", gap: 8, marginBottom: 6 }}>
              <span style={styles.effectName}>{rec.compound?.name || "—"}</span>
              {rec.health_effect && (
                <span style={{ fontSize: 11, color: "#718096", background: "#f7fafc", padding: "1px 6px", borderRadius: 4 }}>
                  {rec.health_effect}
                </span>
              )}
            </div>
            {rec.compound?.description && (
              <div style={{ fontSize: 12, color: "#4a5568", marginBottom: 6, lineHeight: 1.4 }}>
                {rec.compound.description.slice(0, 150)}{rec.compound.description.length > 150 ? "..." : ""}
              </div>
            )}
            {rec.top_foods && rec.top_foods.length > 0 && (
              <div style={{ paddingLeft: 4 }}>
                <span style={{ fontSize: 11, color: "#276749", fontWeight: 500 }}>推薦食物：</span>
                <table style={{ ...styles.table, marginTop: 4 }}>
                  <thead>
                    <tr>
                      <th style={{ ...styles.th, fontSize: 11 }}>食物</th>
                      <th style={{ ...styles.th, fontSize: 11 }}>分類</th>
                      <th style={{ ...styles.th, fontSize: 11 }}>含量</th>
                    </tr>
                  </thead>
                  <tbody>
                    {rec.top_foods.slice(0, 5).map((f, j) => (
                      <tr key={j} style={j % 2 === 0 ? styles.rowEven : styles.rowOdd}>
                        <td style={{ ...styles.td, fontSize: 12 }}>{f.name}</td>
                        <td style={{ ...styles.td, fontSize: 12, color: "#718096" }}>{f.food_group || "—"}</td>
                        <td style={{ ...styles.td, fontSize: 12, textAlign: "right" }}>
                          {f.standard_content != null ? `${Number(f.standard_content).toFixed(2)} ${f.orig_unit || ""}` : "—"}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        ))
      )}
    </div>
  );
}

function GraphRagResultCard({ data }) {
  const sources = data.sources || data.results || [];

  return (
    <div>
      <div style={styles.header}>📚 學術文獻 — {data.query}（{sources.length} 篇）</div>
      {sources.length === 0 ? (
        <div style={styles.emptyMsg}>未找到相關文獻</div>
      ) : (
        <ReferenceList sources={sources} />
      )}
    </div>
  );
}

function DietLogsTable({ data }) {
  const logs = data.logs || [];
  const hasNutrition = logs.some((l) => l.protein != null || l.carbs != null || l.fat != null);
  const mealLabels = { breakfast: "早餐", lunch: "午餐", dinner: "晚餐", snack: "點心" };

  return (
    <div>
      <div style={styles.header}>📋 飲食記錄（共 {data.total || logs.length} 筆）</div>
      {logs.length === 0 ? (
        <div style={styles.emptyMsg}>尚無飲食記錄</div>
      ) : (
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.th}>ID</th>
              <th style={styles.th}>食物</th>
              <th style={styles.th}>份量(g)</th>
              <th style={styles.th}>餐別</th>
              <th style={styles.th}>時間</th>
              <th style={styles.th}>熱量</th>
              {hasNutrition && <th style={styles.th}>蛋白質</th>}
              {hasNutrition && <th style={styles.th}>碳水</th>}
              {hasNutrition && <th style={styles.th}>脂肪</th>}
            </tr>
          </thead>
          <tbody>
            {logs.map((log, i) => (
              <tr key={i} style={i % 2 === 0 ? styles.rowEven : styles.rowOdd}>
                <td style={styles.td}>{log.id}</td>
                <td style={styles.td}>{log.food_name}</td>
                <td style={{ ...styles.td, textAlign: "right" }}>{log.amount_g || "—"}</td>
                <td style={styles.td}>{mealLabels[log.meal_type] || log.meal_type || "—"}</td>
                <td style={styles.td}>
                  {log.logged_at ? new Date(log.logged_at).toLocaleDateString("zh-TW") : "—"}
                </td>
                <td style={{ ...styles.td, textAlign: "right" }}>
                  {log.calories != null ? `${Number(log.calories).toFixed(0)} kcal` : "—"}
                </td>
                {hasNutrition && (
                  <td style={{ ...styles.td, textAlign: "right" }}>
                    {log.protein != null ? `${Number(log.protein).toFixed(1)}g` : "—"}
                  </td>
                )}
                {hasNutrition && (
                  <td style={{ ...styles.td, textAlign: "right" }}>
                    {log.carbs != null ? `${Number(log.carbs).toFixed(1)}g` : "—"}
                  </td>
                )}
                {hasNutrition && (
                  <td style={{ ...styles.td, textAlign: "right" }}>
                    {log.fat != null ? `${Number(log.fat).toFixed(1)}g` : "—"}
                  </td>
                )}
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}

function DietLogActionCard({ data, action }) {
  const nut = data.nutrition || {};
  const hasNut = nut.calories != null || nut.protein != null;
  return (
    <div>
      <div style={styles.header}>
        {action === "add" && "✅ 已新增飲食記錄"}
        {action === "update" && "✏️ 已更新飲食記錄"}
        {action === "delete" && "🗑️ 已刪除飲食記錄"}
      </div>
      <div style={styles.actionDetail}>
        {data.food_name && <span>食物：{data.food_name}</span>}
        {data.id && <span style={styles.idTag}>#{data.id}</span>}
        {data.message && <span>{data.message}</span>}
      </div>
      {hasNut && (
        <div style={{ ...styles.nutritionGrid, marginTop: 6, fontSize: 12, color: "#276749" }}>
          <span style={{ fontWeight: 500 }}>自動計算營養：</span>
          {nut.calories != null && <span>熱量 {Number(nut.calories).toFixed(0)} kcal</span>}
          {nut.protein != null && <span>蛋白質 {Number(nut.protein).toFixed(1)}g</span>}
          {nut.carbs != null && <span>碳水 {Number(nut.carbs).toFixed(1)}g</span>}
          {nut.fat != null && <span>脂肪 {Number(nut.fat).toFixed(1)}g</span>}
        </div>
      )}
    </div>
  );
}

function SavedRecipesCard({ data }) {
  const recipes = data.recipes || [];

  return (
    <div>
      <div style={styles.header}>📖 已儲存食譜（共 {data.total || recipes.length} 份）</div>
      {recipes.length === 0 ? (
        <div style={styles.emptyMsg}>尚無儲存的食譜</div>
      ) : (
        <div style={styles.recipeGrid}>
          {recipes.map((r, i) => {
            const nut = r.nutrition || {};
            const ings = r.ingredients || [];
            return (
              <div key={i} style={styles.recipeCard}>
                <div style={styles.recipeName}>{r.name || "未命名食譜"}</div>
                <div style={styles.recipeMeta}>
                  {r.servings && <span>{r.servings} 人份</span>}
                  {r.created_at && <span>{new Date(r.created_at).toLocaleDateString("zh-TW")}</span>}
                </div>
                {ings.length > 0 && (
                  <div style={{ display: "flex", flexWrap: "wrap", gap: 4, marginTop: 4 }}>
                    {ings.filter(Boolean).map((ing, j) => (
                      <span key={j} style={{ background: "#edf2f7", padding: "1px 6px", borderRadius: 4, fontSize: 11, color: "#4a5568" }}>
                        {ing}
                      </span>
                    ))}
                  </div>
                )}
                {(nut.calories != null || nut.protein != null) && (
                  <div style={{ ...styles.nutritionGrid, marginTop: 4, fontSize: 12 }}>
                    {nut.calories != null && <span>熱量 {Number(nut.calories).toFixed(0)} kcal</span>}
                    {nut.protein != null && <span>蛋白質 {Number(nut.protein).toFixed(1)}g</span>}
                    {nut.carbs != null && <span>碳水 {Number(nut.carbs).toFixed(1)}g</span>}
                    {nut.fat != null && <span>脂肪 {Number(nut.fat).toFixed(1)}g</span>}
                    {nut.fiber != null && <span>纖維 {Number(nut.fiber).toFixed(1)}g</span>}
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}
    </div>
  );
}

function CalendarEntriesCard({ data }) {
  const entries = data.entries || [];
  const totals = data.totals || {};
  const dri = data.dri_analysis;
  const t = (key) => totals[key];

  return (
    <div>
      <div style={styles.header}>📅 行事曆紀錄（{entries.length} 筆）</div>
      {entries.length === 0 ? (
        <div style={styles.emptyMsg}>該期間無紀錄</div>
      ) : (
        entries.map((e, i) => (
          <div key={i} style={styles.calendarEntry}>
            <span style={styles.calendarDate}>
              {e.date || e.entry_date || "—"}
            </span>
            <span>{e.recipe_name || e.title || e.summary || JSON.stringify(e).slice(0, 80)}</span>
          </div>
        ))
      )}
      {(t("cal_per_100g") != null || t("protein_per_100g") != null) && (
        <div style={{ marginTop: 10, padding: "8px 12px", background: "#f0fff4", borderRadius: 6, border: "1px solid #c6f6d5" }}>
          <span style={{ fontWeight: 600, fontSize: 13, color: "#276749" }}>營養總計：</span>
          <div style={{ ...styles.nutritionGrid, marginTop: 4 }}>
            {t("cal_per_100g") != null && <span>熱量 {Number(t("cal_per_100g")).toFixed(0)} kcal</span>}
            {t("protein_per_100g") != null && <span>蛋白質 {Number(t("protein_per_100g")).toFixed(1)}g</span>}
            {t("carbon_per_100g") != null && <span>碳水 {Number(t("carbon_per_100g")).toFixed(1)}g</span>}
            {t("fats_per_100g") != null && <span>脂肪 {Number(t("fats_per_100g")).toFixed(1)}g</span>}
            {t("dietary_fiber_per_100g") != null && <span>纖維 {Number(t("dietary_fiber_per_100g")).toFixed(1)}g</span>}
          </div>
        </div>
      )}
      {dri?.missing_profile && (
        <div style={{ marginTop: 10, padding: "10px 14px", background: "#fffaf0", borderRadius: 6, border: "1px solid #feebc8", color: "#c05621", fontSize: 13 }}>
          ⚠️ 尚未設定個人資料（年齡/性別），無法進行 DRI 缺口分析。請至「個人資料」頁面填寫，或直接告訴我你的年齡和性別。
        </div>
      )}
      {dri && !dri.missing_profile && (
        <div style={{ marginTop: 12 }}>
          <div style={{ fontWeight: 600, fontSize: 14, color: "#2d3748", marginBottom: 6, display: "flex", alignItems: "center", gap: 8 }}>
            📊 DRI 缺口分析
            <span style={{ fontSize: 12, fontWeight: 400, color: "#718096" }}>
              {dri.age_group} · {dri.sex}
            </span>
            {dri.deficient_count > 0 && (
              <span style={{ fontSize: 11, background: "#fed7d7", color: "#e53e3e", padding: "1px 8px", borderRadius: 10, fontWeight: 600 }}>
                {dri.deficient_count} 項不足
              </span>
            )}
            {dri.slightly_low_count > 0 && (
              <span style={{ fontSize: 11, background: "#feebc8", color: "#dd6b20", padding: "1px 8px", borderRadius: 10, fontWeight: 600 }}>
                {dri.slightly_low_count} 項略低
              </span>
            )}
          </div>
          <div style={{ overflowX: "auto" }}>
            <table style={styles.table}>
              <thead>
                <tr>
                  <th style={styles.th}>營養素</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>建議量</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>攝取量</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>差額</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>建議攝取量(%)</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>上限攝取量</th>
                  <th style={{ ...styles.th, textAlign: "center" }}>狀態</th>
                </tr>
              </thead>
              <tbody>
                {(dri.rows || []).map((row, i) => {
                  const st = DRI_STATUS_STYLE[row.status] || DRI_STATUS_STYLE.no_data;
                  return (
                    <tr key={i} style={{ background: i % 2 === 0 ? "#fff" : "#f7fafc" }}>
                      <td style={styles.td}>{row.nutrient_zh}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.target}{row.unit ? ` ${row.unit}` : ""}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.actual}</td>
                      <td style={{ ...styles.td, textAlign: "right", color: row.deficit > 0 ? "#e53e3e" : "#38a169" }}>
                        {row.status === "no_data" ? "—" : (row.deficit > 0 ? `-${row.deficit}` : `+${Math.abs(row.deficit)}`)}
                      </td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.status === "no_data" ? "—" : `${row.ratio_pct}%`}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.upper_limit != null ? `${row.upper_limit}` : "—"}</td>
                      <td style={{ ...styles.td, textAlign: "center" }}>
                        <span style={{ fontSize: 11, fontWeight: 600, padding: "2px 8px", borderRadius: 10, background: st.bg, color: st.color }}>
                          {st.label}
                        </span>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </div>
      )}
      {data.food_recommendations && Object.keys(data.food_recommendations).length > 0 && (
        <div style={{ marginTop: 12 }}>
          <div style={{ fontWeight: 600, fontSize: 14, color: "#2d3748", marginBottom: 8 }}>
            🍽️ 缺口推薦食物
          </div>
          {Object.entries(data.food_recommendations).map(([field, rec]) => (
            <div key={field} style={{ marginBottom: 10, padding: "8px 12px", background: "#fffff0", borderRadius: 6, border: "1px solid #fefcbf" }}>
              <div style={{ fontWeight: 600, fontSize: 13, color: "#744210", marginBottom: 4 }}>
                {rec.nutrient_zh} <span style={{ fontWeight: 400, color: "#975a16", fontSize: 12 }}>(缺口 {rec.deficit} {rec.unit})</span>
              </div>
              {rec.foods && rec.foods.length > 0 ? (
                <div style={{ display: "flex", flexDirection: "column", gap: 3 }}>
                  {rec.foods.slice(0, 5).map((f, i) => {
                    const val = Number(f.content_per_100g ?? f.value ?? 0);
                    return (
                      <div key={i} style={{ display: "flex", justifyContent: "space-between", alignItems: "center", fontSize: 12, padding: "2px 0" }}>
                        <span style={{ color: "#2d3748" }}>{f.name || f.food_name || "—"}</span>
                        <span style={{ color: "#718096", whiteSpace: "nowrap" }}>{Number(val).toFixed(2)} {rec.unit}/100g</span>
                      </div>
                    );
                  })}
                </div>
              ) : (
                <div style={{ fontSize: 12, color: "#a0aec0" }}>暫無推薦食物</div>
              )}
            </div>
          ))}
        </div>
      )}
    </div>
  );
}

function UserProfileCard({ data }) {
  const fields = [
    ["使用者", data.username || data.email || "—"],
    ["性別", data.gender === "male" ? "男性" : data.gender === "female" ? "女性" : data.gender || "—"],
    ["年齡", data.age ? `${data.age} 歲` : "—"],
    ["身高", data.height_cm ? `${data.height_cm} cm` : "—"],
    ["體重", data.weight_kg ? `${data.weight_kg} kg` : "—"],
    ["活動量", data.activity_level || "—"],
    ["目標", data.goal || "—"],
  ];

  return (
    <div>
      <div style={styles.header}>👤 個人資料</div>
      <div style={styles.profileGrid}>
        {fields.map(([label, value], i) => (
          <div key={i} style={styles.profileField}>
            <span style={styles.profileLabel}>{label}</span>
            <span style={styles.profileValue}>{value}</span>
          </div>
        ))}
      </div>
    </div>
  );
}

function ProfileUpdatedCard({ data }) {
  const profile = data.profile || data;
  return (
    <div>
      <div style={styles.header}>✅ 個人資料已更新</div>
      <UserProfileCard data={profile} />
    </div>
  );
}

function TaiwanFoodBrowseCard({ data }) {
  const foods = data.foods || [];
  const search = data.search || "";
  const category = data.category || "";
  const total = data.pagination?.total || foods.length;
  const label = [search, category].filter(Boolean).join(" / ") || "全部";
  const [expandedId, setExpandedId] = React.useState(null);
  return (
    <div>
      <div style={styles.header}>🗃️ 台灣食品資料庫 — {label}（共 {total} 筆，顯示 {foods.length} 筆）</div>
      {foods.length === 0 ? (
        <div style={styles.emptyMsg}>未找到符合條件的食品</div>
      ) : (
        <table style={styles.table}>
          <thead>
            <tr>
              <th style={styles.th}>食品名稱</th>
              <th style={styles.th}>分類</th>
              <th style={styles.th}>熱量</th>
              <th style={styles.th}>蛋白質</th>
              <th style={styles.th}>碳水</th>
              <th style={styles.th}>脂肪</th>
              <th style={styles.th}>纖維</th>
            </tr>
          </thead>
          <tbody>
            {foods.map((f, i) => {
              const fid = f.id || i;
              const isOpen = expandedId === fid;
              return (
                <React.Fragment key={fid}>
                  <tr style={{ ...(i % 2 === 0 ? styles.rowEven : styles.rowOdd), cursor: "pointer" }}
                      onClick={() => setExpandedId(isOpen ? null : fid)}>
                    <td style={{ ...styles.td, color: "#2b6cb0", fontWeight: 500 }}>{isOpen ? "▼" : "▶"} {f.food_name || "—"}</td>
                    <td style={{ ...styles.td, color: "#718096", fontSize: 12 }}>{f.category || "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{f.cal_per_100g != null ? `${Number(f.cal_per_100g).toFixed(0)}` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{f.protein_per_100g != null ? `${Number(f.protein_per_100g).toFixed(1)}g` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{f.carbon_per_100g != null ? `${Number(f.carbon_per_100g).toFixed(1)}g` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{f.fats_per_100g != null ? `${Number(f.fats_per_100g).toFixed(1)}g` : "—"}</td>
                    <td style={{ ...styles.td, textAlign: "right" }}>{f.dietary_fiber_per_100g != null ? `${Number(f.dietary_fiber_per_100g).toFixed(1)}g` : "—"}</td>
                  </tr>
                  {isOpen && f.id && (
                    <tr style={{ background: "#edf2f7" }}>
                      <td colSpan={7} style={{ padding: "10px 14px" }}>
                        <FoodDetailInline foodId={f.id} source="taiwan_foods" />
                      </td>
                    </tr>
                  )}
                </React.Fragment>
              );
            })}
          </tbody>
        </table>
      )}
    </div>
  );
}

const DRI_STATUS_STYLE = {
  deficient:   { bg: "#fff5f5", color: "#e53e3e", label: "嚴重不足" },
  slightly_low:{ bg: "#fffaf0", color: "#dd6b20", label: "略低" },
  sufficient:  { bg: "#f0fff4", color: "#38a169", label: "充足" },
  near_limit:  { bg: "#fffff0", color: "#d69e2e", label: "接近上限" },
  excess:      { bg: "#fff5f5", color: "#c53030", label: "超過上限" },
  no_data:     { bg: "#f7fafc", color: "#a0aec0", label: "無資料" },
};

function RecipeAnalysisCard({ data }) {
  const ingredients = data.ingredients || [];
  const total = data.total || {};
  const dri = data.dri_analysis;
  const matchReasons = data.match_reasons || {};
  const [expandedIdx, setExpandedIdx] = React.useState(null);
  const [showReasons, setShowReasons] = React.useState(false);
  const fmtN = (v, u) => v != null ? `${Number(v).toFixed(1)}${u}` : "—";
  const t = (key) => total[key];
  const hasReasons = Object.keys(matchReasons).length > 0;
  return (
    <div>
      <div style={styles.header}>🍳 食譜分析（{data.item_count || ingredients.length} 種食材）</div>
      {data.error_partial && (
        <div style={{ color: "#dd6b20", fontSize: 12, marginBottom: 8 }}>⚠️ {data.error_partial}</div>
      )}
      {hasReasons && (
        <div style={{ marginBottom: 8 }}>
          <button
            onClick={() => setShowReasons(!showReasons)}
            style={{ background: "none", border: "none", color: "#4a90d9", cursor: "pointer", fontSize: 12, padding: 0 }}
          >
            {showReasons ? "▼" : "▶"} AI 匹配理由
          </button>
          {showReasons && (
            <div style={{ marginTop: 4, padding: "6px 10px", background: "#f7fafc", borderRadius: 6, fontSize: 12, color: "#4a5568" }}>
              {Object.entries(matchReasons).map(([ing, reason]) => (
                <div key={ing}><b>{ing}</b>：{reason}</div>
              ))}
            </div>
          )}
        </div>
      )}
      {ingredients.length > 0 && (
        <div style={{ overflowX: "auto" }}>
          <table style={styles.table}>
            <thead>
              <tr>
                <th style={styles.th}>食材</th>
                <th style={styles.th}>份量</th>
                <th style={styles.th}>重量(g)</th>
                <th style={styles.th}>熱量</th>
                <th style={styles.th}>蛋白質</th>
                <th style={styles.th}>碳水</th>
                <th style={styles.th}>脂肪</th>
                <th style={styles.th}>纖維</th>
              </tr>
            </thead>
            <tbody>
              {ingredients.map((ing, i) => {
                const n = ing.nutrition || {};
                const isOpen = expandedIdx === i;
                return (
                <React.Fragment key={i}>
                <tr style={{ ...(i % 2 === 0 ? styles.rowEven : styles.rowOdd), cursor: ing.food_id ? "pointer" : "default" }}
                    onClick={() => ing.food_id && setExpandedIdx(isOpen ? null : i)}>
                  <td style={{ ...styles.td, color: ing.food_id ? "#2b6cb0" : undefined, fontWeight: ing.food_id ? 500 : undefined }}>
                    {ing.food_id ? (isOpen ? "▼ " : "▶ ") : ""}{ing.name || "—"}
                  </td>
                  <td style={styles.td}>{ing.amount || "—"}</td>
                  <td style={{ ...styles.td, textAlign: "right" }}>{ing.grams != null ? Number(ing.grams).toFixed(0) : "—"}</td>
                  <td style={{ ...styles.td, textAlign: "right" }}>{fmtN(n.cal_per_100g ?? ing.calories, " kcal")}</td>
                  <td style={{ ...styles.td, textAlign: "right" }}>{fmtN(n.protein_per_100g ?? ing.protein, "g")}</td>
                  <td style={{ ...styles.td, textAlign: "right" }}>{fmtN(n.carbon_per_100g ?? ing.carbs, "g")}</td>
                  <td style={{ ...styles.td, textAlign: "right" }}>{fmtN(n.fats_per_100g ?? ing.fat, "g")}</td>
                  <td style={{ ...styles.td, textAlign: "right" }}>{fmtN(n.dietary_fiber_per_100g ?? ing.fiber, "g")}</td>
                </tr>
                {isOpen && ing.food_id && (
                  <tr style={{ background: "#edf2f7" }}>
                    <td colSpan={8} style={{ padding: "10px 14px" }}>
                      <FoodDetailInline foodId={ing.food_id} source={ing.source || "taiwan_foods"} />
                    </td>
                  </tr>
                )}
                </React.Fragment>
                );
              })}
            </tbody>
          </table>
        </div>
      )}
      {(t("cal_per_100g") != null || t("protein_per_100g") != null) && (
        <div style={{ marginTop: 10, padding: "8px 12px", background: "#f0fff4", borderRadius: 6, border: "1px solid #c6f6d5" }}>
          <span style={{ fontWeight: 600, fontSize: 13, color: "#276749" }}>營養總計：</span>
          <div style={{ ...styles.nutritionGrid, marginTop: 4 }}>
            {t("cal_per_100g") != null && <span>熱量 {Number(t("cal_per_100g")).toFixed(0)} kcal</span>}
            {t("protein_per_100g") != null && <span>蛋白質 {Number(t("protein_per_100g")).toFixed(1)}g</span>}
            {t("carbon_per_100g") != null && <span>碳水 {Number(t("carbon_per_100g")).toFixed(1)}g</span>}
            {t("fats_per_100g") != null && <span>脂肪 {Number(t("fats_per_100g")).toFixed(1)}g</span>}
            {t("dietary_fiber_per_100g") != null && <span>纖維 {Number(t("dietary_fiber_per_100g")).toFixed(1)}g</span>}
          </div>
          <div style={{ ...styles.nutritionGrid, marginTop: 4, fontSize: 12, color: "#4a5568" }}>
            {t("sodium_per_100g") != null && <span>鈉 {Number(t("sodium_per_100g")).toFixed(1)}mg</span>}
            {t("calcium_per_100g") != null && <span>鈣 {Number(t("calcium_per_100g")).toFixed(1)}mg</span>}
            {t("iron_per_100g") != null && <span>鐵 {Number(t("iron_per_100g")).toFixed(2)}mg</span>}
            {t("zinc_per_100g") != null && <span>鋅 {Number(t("zinc_per_100g")).toFixed(2)}mg</span>}
            {t("vitamin_c_per_100g") != null && <span>維C {Number(t("vitamin_c_per_100g")).toFixed(1)}mg</span>}
            {t("vitamin_b1_per_100g") != null && <span>B1 {Number(t("vitamin_b1_per_100g")).toFixed(2)}mg</span>}
            {t("vitamin_b2_per_100g") != null && <span>B2 {Number(t("vitamin_b2_per_100g")).toFixed(2)}mg</span>}
          </div>
        </div>
      )}
      {dri?.missing_profile && (
        <div style={{ marginTop: 10, padding: "10px 14px", background: "#fffaf0", borderRadius: 6, border: "1px solid #feebc8", color: "#c05621", fontSize: 13 }}>
          ⚠️ 尚未設定個人資料（年齡/性別），無法進行 DRI 缺口分析。請至「個人資料」頁面填寫，或直接告訴我你的年齡和性別。
        </div>
      )}
      {dri && !dri.missing_profile && (
        <div style={{ marginTop: 12 }}>
          <div style={{ fontWeight: 600, fontSize: 14, color: "#2d3748", marginBottom: 6, display: "flex", alignItems: "center", gap: 8 }}>
            📊 DRI 缺口分析
            <span style={{ fontSize: 12, fontWeight: 400, color: "#718096" }}>
              {dri.age_group} · {dri.sex}
            </span>
            {dri.deficient_count > 0 && (
              <span style={{ fontSize: 11, background: "#fed7d7", color: "#e53e3e", padding: "1px 8px", borderRadius: 10, fontWeight: 600 }}>
                {dri.deficient_count} 項不足
              </span>
            )}
            {dri.slightly_low_count > 0 && (
              <span style={{ fontSize: 11, background: "#feebc8", color: "#dd6b20", padding: "1px 8px", borderRadius: 10, fontWeight: 600 }}>
                {dri.slightly_low_count} 項略低
              </span>
            )}
          </div>
          <div style={{ overflowX: "auto" }}>
            <table style={styles.table}>
              <thead>
                <tr>
                  <th style={styles.th}>營養素</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>建議量</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>攝取量</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>差額</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>建議攝取量(%)</th>
                  <th style={{ ...styles.th, textAlign: "right" }}>上限攝取量</th>
                  <th style={{ ...styles.th, textAlign: "center" }}>狀態</th>
                </tr>
              </thead>
              <tbody>
                {(dri.rows || []).map((row, i) => {
                  const st = DRI_STATUS_STYLE[row.status] || DRI_STATUS_STYLE.no_data;
                  return (
                    <tr key={i} style={{ background: i % 2 === 0 ? "#fff" : "#f7fafc" }}>
                      <td style={styles.td}>{row.nutrient_zh}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.target}{row.unit ? ` ${row.unit}` : ""}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.actual}</td>
                      <td style={{ ...styles.td, textAlign: "right", color: row.deficit > 0 ? "#e53e3e" : "#38a169" }}>
                        {row.status === "no_data" ? "—" : (row.deficit > 0 ? `-${row.deficit}` : `+${Math.abs(row.deficit)}`)}
                      </td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.status === "no_data" ? "—" : `${row.ratio_pct}%`}</td>
                      <td style={{ ...styles.td, textAlign: "right" }}>{row.upper_limit != null ? `${row.upper_limit}` : "—"}</td>
                      <td style={{ ...styles.td, textAlign: "center" }}>
                        <span style={{ fontSize: 11, fontWeight: 600, padding: "2px 8px", borderRadius: 10, background: st.bg, color: st.color }}>
                          {st.label}
                        </span>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </div>
      )}
    </div>
  );
}

function LiteraturePapersCard({ data }) {
  const papers = data.papers || [];
  const total = data.total || papers.length;
  const search = data.search || "";
  const Q_COLORS = { Q1: "#4CAF50", Q2: "#2196F3", Q3: "#FF9800", Q4: "#f44336" };
  return (
    <div>
      <div style={styles.header}>📚 學術論文{search ? ` — "${search}"` : ""}（共 {total} 篇，顯示 {papers.length} 篇）</div>
      {papers.length === 0 ? (
        <div style={styles.emptyMsg}>未找到相關論文</div>
      ) : (
        papers.map((p, i) => (
          <div key={p.doc_id || i} style={styles.citationCard}>
            <div style={styles.citationDoc}>{p.title || "Untitled"}</div>
            <div style={{ fontSize: 12, color: "#718096", marginBottom: 4, display: "flex", flexWrap: "wrap", gap: 6, alignItems: "center" }}>
              {p.journal && <span>{p.journal}</span>}
              {p.year && <span>({p.year})</span>}
              {p.impact_factor != null && (
                <span style={{ background: "#e2e8f0", padding: "1px 6px", borderRadius: 4, fontSize: 11, fontWeight: 600 }}>IF {Number(p.impact_factor).toFixed(1)}</span>
              )}
              {p.sjr_quartile && (
                <span style={{ background: Q_COLORS[p.sjr_quartile] || "#999", color: "#fff", padding: "1px 6px", borderRadius: 4, fontSize: 11, fontWeight: 600 }}>{p.sjr_quartile}</span>
              )}
              {p.study_type && (
                <span style={{ background: "#e9d8fd", color: "#553c9a", padding: "1px 6px", borderRadius: 4, fontSize: 11 }}>{p.study_type}</span>
              )}
              {p.citation_count != null && <span style={{ fontSize: 11, color: "#4a5568" }}>被引 {p.citation_count}</span>}
            </div>
            {p.key_contributions && (
              <div style={{ fontSize: 12, color: "#4a5568", lineHeight: 1.5 }}>
                {Array.isArray(p.key_contributions)
                  ? p.key_contributions.slice(0, 2).map((c, j) => (
                      <div key={j}>• {typeof c === "string" ? c.slice(0, 120) : JSON.stringify(c).slice(0, 120)}</div>
                    ))
                  : <div>• {String(p.key_contributions).slice(0, 200)}</div>
                }
              </div>
            )}
            {p.doi && (
              <div style={{ fontSize: 11, marginTop: 4 }}>
                <a href={`https://doi.org/${p.doi}`} target="_blank" rel="noopener noreferrer" style={{ color: "#2b6cb0", textDecoration: "none" }}>DOI: {p.doi}</a>
              </div>
            )}
          </div>
        ))
      )}
    </div>
  );
}

function CalendarAddedCard({ data }) {
  if (data.error) return <div style={styles.emptyMsg}>⚠️ {data.error}</div>;
  return (
    <div>
      <div style={styles.header}>📅 已加入行事曆</div>
      <div style={{ fontSize: 13, lineHeight: 1.8 }}>
        <div>✅ 食譜「{data.recipe_name || "食譜"}」已加到 <strong>{data.entry_date}</strong></div>
        {data.recipe_saved && <div style={{ color: "#718096", fontSize: 12 }}>（食譜同時已儲存，ID: {data.recipe_id}）</div>}
      </div>
    </div>
  );
}

function CalendarDeletedCard({ data }) {
  if (data.error) return <div style={styles.emptyMsg}>⚠️ {data.error}</div>;
  return (
    <div>
      <div style={styles.header}>🗑️ 已刪除行事曆紀錄</div>
      <div style={{ fontSize: 13, lineHeight: 1.8 }}>
        <div>✅ 已從 <strong>{data.entry_date}</strong> 刪除 {data.deleted_count} 筆紀錄{data.recipe_name ? `（${data.recipe_name}）` : ""}</div>
        {data.failed_count > 0 && <div style={{ color: "#e53e3e", fontSize: 12 }}>⚠️ {data.failed_count} 筆刪除失敗</div>}
      </div>
    </div>
  );
}

function RecipeDeletedCard({ data }) {
  if (data.error) {
    return (
      <div>
        <div style={styles.emptyMsg}>⚠️ {data.error}</div>
        {data.existing_recipes && (
          <div style={{ fontSize: 12, color: "#718096", marginTop: 6 }}>
            <div>現有食譜：</div>
            {data.existing_recipes.map((r, i) => <div key={i}>• {r}</div>)}
          </div>
        )}
      </div>
    );
  }

  if (data.confirmed === false) {
    return (
      <div>
        <div style={styles.header}>📋 找到 {data.matched_count} 筆食譜{data.created_date ? `（${data.created_date}）` : ""}</div>
        <div style={{ fontSize: 13, lineHeight: 1.9, maxHeight: 320, overflowY: "auto" }}>
          {(data.matched_recipes || []).map((r, i) => (
            <div key={r.id} style={{ display: "flex", gap: 8, alignItems: "baseline", padding: "2px 0" }}>
              <span style={{ color: "#a0aec0", fontSize: 12, minWidth: 28 }}>#{i + 1}</span>
              <span style={{ fontWeight: 500 }}>{r.name}</span>
              <span style={{ color: "#a0aec0", fontSize: 12 }}>{r.created_at}</span>
            </div>
          ))}
        </div>
        <div style={{ marginTop: 8, padding: "8px 10px", background: "#fffbeb", borderRadius: 6, fontSize: 12, color: "#92400e" }}>
          請回覆「全部刪除」或指定要刪除的食譜（例如「刪除第 1、3 個」）
        </div>
      </div>
    );
  }

  return (
    <div>
      <div style={styles.header}>🗑️ 已刪除食譜</div>
      <div style={{ fontSize: 13, lineHeight: 1.8 }}>
        <div>✅ 成功刪除 {data.deleted_count} 筆食譜{data.created_date ? `（${data.created_date}）` : ""}{data.recipe_name ? `（名稱含「${data.recipe_name}」）` : ""}</div>
        {(data.deleted_recipes || []).map((r, i) => (
          <div key={i} style={{ fontSize: 12, color: "#718096" }}>• {r.name}{r.created_at ? ` (${r.created_at})` : ""}</div>
        ))}
        {data.failed_count > 0 && <div style={{ color: "#e53e3e", fontSize: 12 }}>⚠️ {data.failed_count} 筆刪除失敗</div>}
      </div>
    </div>
  );
}

function IngredientConfirmCard({ data, onAction }) {
  const [ingredients, setIngredients] = React.useState(
    () => (data.extracted_ingredients || []).map((ing) => ({
      name: ing.name || ing.ingredient || "",
      amount: ing.amount || "",
    }))
  );
  const [addInput, setAddInput] = React.useState("");
  const [confirmed, setConfirmed] = React.useState(false);

  const handleRemove = (idx) => {
    const removed = ingredients[idx];
    const next = ingredients.filter((_, i) => i !== idx);
    setIngredients(next);
    if (onAction) {
      onAction({ action: "remove", names: [removed.name] });
    }
  };

  const handleAdd = () => {
    const name = addInput.trim();
    if (!name) return;
    const next = [...ingredients, { name, amount: "" }];
    setIngredients(next);
    setAddInput("");
    if (onAction) {
      onAction({ action: "add", items: [{ name, amount: "" }] });
    }
  };

  const handleConfirm = () => {
    setConfirmed(true);
    if (onAction) {
      onAction({ action: "confirm", ingredients });
    }
  };

  const handleAbort = () => {
    setConfirmed(true);
    if (onAction) {
      onAction({ action: "abort" });
    }
  };

  const confidence = data.confidence || 0;
  const corrections = data.corrections || [];
  const confColor = confidence > 0.6 ? "#dd6b20" : "#e53e3e";

  return (
    <div>
      <div style={styles.header}>
        📋 食材確認（信心分數：<span style={{ color: confColor }}>{confidence}</span>）
      </div>
      {corrections.length > 0 && (
        <div style={{ fontSize: 12, color: "#718096", marginBottom: 8 }}>
          Gemma 校正了 {corrections.length} 項
        </div>
      )}
      <div style={{ display: "flex", flexWrap: "wrap", gap: 6, marginBottom: 10 }}>
        {ingredients.map((ing, i) => (
          <span key={i} style={{
            display: "inline-flex", alignItems: "center", gap: 4,
            background: "#ebf8ff", color: "#2b6cb0", padding: "4px 10px",
            borderRadius: 16, fontSize: 13,
          }}>
            {ing.name}{ing.amount ? ` (${ing.amount})` : ""}
            {!confirmed && (
              <button onClick={() => handleRemove(i)} style={{
                background: "none", border: "none", color: "#e53e3e",
                cursor: "pointer", fontWeight: 700, fontSize: 14, padding: 0, lineHeight: 1,
              }}>×</button>
            )}
          </span>
        ))}
      </div>
      {!confirmed && (
        <>
          <div style={{ display: "flex", gap: 6, marginBottom: 10 }}>
            <input
              value={addInput}
              onChange={(e) => setAddInput(e.target.value)}
              onKeyDown={(e) => e.key === "Enter" && handleAdd()}
              placeholder="新增食材…"
              style={{
                flex: 1, padding: "6px 10px", borderRadius: 6,
                border: "1px solid #cbd5e0", fontSize: 13, outline: "none",
              }}
            />
            <button onClick={handleAdd} disabled={!addInput.trim()} style={{
              padding: "6px 14px", borderRadius: 6, border: "none",
              background: addInput.trim() ? "#48bb78" : "#e2e8f0",
              color: addInput.trim() ? "#fff" : "#a0aec0",
              cursor: addInput.trim() ? "pointer" : "default", fontSize: 13, fontWeight: 600,
            }}>+ 新增</button>
          </div>
          <div style={{ display: "flex", gap: 8 }}>
            <button onClick={handleConfirm} disabled={ingredients.length === 0} style={{
              padding: "8px 20px", borderRadius: 8, border: "none",
              background: ingredients.length > 0 ? "#3182ce" : "#e2e8f0",
              color: ingredients.length > 0 ? "#fff" : "#a0aec0",
              cursor: ingredients.length > 0 ? "pointer" : "default",
              fontSize: 14, fontWeight: 600,
            }}>確認分析</button>
            <button onClick={handleAbort} style={{
              padding: "8px 20px", borderRadius: 8,
              border: "1px solid #e2e8f0", background: "#fff",
              color: "#718096", cursor: "pointer", fontSize: 14,
            }}>取消</button>
          </div>
        </>
      )}
      {confirmed && (
        <div style={{ fontSize: 13, color: "#38a169", fontWeight: 500 }}>
          ✓ 已送出
        </div>
      )}
    </div>
  );
}

const RENDERERS = {
  get_nutrient_ranking: (d) => <NutrientRankingTable data={d} />,
  search_food: (d) => <SearchFoodCard data={d} />,
  search_symptom: (d) => <SymptomResultCard data={d} />,
  search_graphrag: (d) => <GraphRagResultCard data={d} />,
  browse_taiwan_food: (d) => <TaiwanFoodBrowseCard data={d} />,
  analyze_recipe: (d) => <RecipeAnalysisCard data={d} />,
  get_literature_papers: (d) => <LiteraturePapersCard data={d} />,
  get_saved_recipes: (d) => <SavedRecipesCard data={d} />,
  delete_saved_recipe: (d) => <RecipeDeletedCard data={d} />,
  get_calendar_entries: (d) => <CalendarEntriesCard data={d} />,
  add_to_calendar: (d) => <CalendarAddedCard data={d} />,
  delete_calendar_entry: (d) => <CalendarDeletedCard data={d} />,
  get_user_profile: (d) => <UserProfileCard data={d} />,
  update_user_profile: (d) => <ProfileUpdatedCard data={d} />,
};

const styles = {
  card: {
    background: "#f8f9fa",
    border: "1px solid #e2e8f0",
    borderRadius: 10,
    padding: "14px 16px",
    margin: "8px 0",
    fontSize: 14,
    maxWidth: 720,
  },
  header: {
    fontWeight: 600,
    fontSize: 15,
    marginBottom: 10,
    color: "#1a202c",
  },
  subHeader: {
    fontWeight: 500,
    fontSize: 13,
    color: "#e53e3e",
    margin: "8px 0 4px",
  },
  table: {
    width: "100%",
    borderCollapse: "collapse",
    fontSize: 13,
  },
  th: {
    textAlign: "left",
    padding: "6px 8px",
    borderBottom: "2px solid #cbd5e0",
    color: "#4a5568",
    fontWeight: 600,
    fontSize: 12,
    whiteSpace: "nowrap",
  },
  td: {
    padding: "5px 8px",
    borderBottom: "1px solid #e2e8f0",
    color: "#2d3748",
  },
  rowEven: { background: "#fff" },
  rowOdd: { background: "#f7fafc" },
  tagContainer: {
    display: "flex",
    flexWrap: "wrap",
    gap: 6,
    marginTop: 4,
  },
  adequateTag: {
    background: "#c6f6d5",
    color: "#276749",
    padding: "2px 8px",
    borderRadius: 12,
    fontSize: 12,
  },
  errorBanner: {
    color: "#c53030",
    background: "#fff5f5",
    padding: "8px 12px",
    borderRadius: 6,
    fontSize: 13,
  },
  emptyMsg: {
    color: "#a0aec0",
    fontStyle: "italic",
    padding: "8px 0",
  },
  foodCard: {
    background: "#fff",
    border: "1px solid #e2e8f0",
    borderRadius: 8,
    padding: "10px 12px",
    marginBottom: 8,
  },
  foodName: {
    fontWeight: 600,
    fontSize: 14,
    marginBottom: 4,
  },
  foodMeta: {
    fontSize: 12,
    color: "#718096",
    display: "flex",
    gap: 8,
    marginBottom: 6,
  },
  sourceTag: {
    background: "#bee3f8",
    color: "#2b6cb0",
    padding: "1px 6px",
    borderRadius: 4,
    fontSize: 11,
  },
  nutritionGrid: {
    display: "flex",
    flexWrap: "wrap",
    gap: 10,
    fontSize: 13,
    color: "#4a5568",
  },
  effectCard: {
    background: "#fff",
    border: "1px solid #e2e8f0",
    borderRadius: 8,
    padding: "10px 12px",
    marginBottom: 8,
  },
  effectName: {
    fontWeight: 600,
    fontSize: 14,
    marginBottom: 6,
    color: "#553c9a",
  },
  compoundList: { paddingLeft: 8 },
  compoundItem: {
    marginBottom: 4,
    fontSize: 13,
  },
  compoundName: { fontWeight: 500 },
  compoundFoods: { color: "#718096", marginLeft: 6 },
  citationCard: {
    background: "#fff",
    border: "1px solid #e2e8f0",
    borderRadius: 8,
    padding: "10px 12px",
    marginBottom: 8,
  },
  citationDoc: {
    fontWeight: 600,
    fontSize: 13,
    color: "#2b6cb0",
    marginBottom: 4,
  },
  citationText: {
    fontSize: 13,
    color: "#4a5568",
    lineHeight: 1.5,
  },
  recipeGrid: {
    display: "flex",
    flexDirection: "column",
    gap: 6,
  },
  recipeCard: {
    background: "#fff",
    border: "1px solid #e2e8f0",
    borderRadius: 8,
    padding: "8px 12px",
  },
  recipeName: { fontWeight: 600, fontSize: 14 },
  recipeMeta: {
    fontSize: 12,
    color: "#718096",
    display: "flex",
    gap: 10,
    marginTop: 2,
  },
  calendarEntry: {
    display: "flex",
    gap: 10,
    padding: "4px 0",
    borderBottom: "1px solid #edf2f7",
    fontSize: 13,
  },
  calendarDate: {
    fontWeight: 500,
    color: "#2b6cb0",
    minWidth: 90,
  },
  profileGrid: {
    display: "grid",
    gridTemplateColumns: "1fr 1fr",
    gap: "4px 16px",
  },
  profileField: {
    display: "flex",
    gap: 8,
    padding: "3px 0",
    fontSize: 13,
  },
  profileLabel: {
    color: "#718096",
    minWidth: 50,
  },
  profileValue: {
    fontWeight: 500,
    color: "#2d3748",
  },
  actionDetail: {
    display: "flex",
    gap: 12,
    fontSize: 14,
    color: "#2d3748",
    alignItems: "center",
  },
  idTag: {
    background: "#e2e8f0",
    padding: "1px 6px",
    borderRadius: 4,
    fontSize: 12,
    color: "#4a5568",
  },
};
