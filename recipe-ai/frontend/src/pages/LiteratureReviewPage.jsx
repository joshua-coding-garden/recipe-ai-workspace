import { useState, useEffect, useMemo } from "react";
import theme from "../utils/theme";
import { fetchPapersEnriched } from "../api/graphragApi";

const Q_COLORS = { Q1: "#4CAF50", Q2: "#2196F3", Q3: "#FF9800", Q4: "#f44336" };

const STUDY_TYPES = ["Position Stand", "Meta-analysis", "Review", "RCT", "Original Research"];

const SORT_OPTIONS = [
  { value: "year_desc", label: "年份（新→舊）" },
  { value: "year_asc", label: "年份（舊→新）" },
  { value: "if_desc", label: "Impact Factor（高→低）" },
  { value: "cite_desc", label: "被引用數（高→低）" },
  { value: "title_asc", label: "標題 A→Z" },
];

function DetailSection({ title, children, defaultOpen = false }) {
  const [open, setOpen] = useState(defaultOpen);
  return (
    <div style={{ margin: "6px 0", border: `1px solid ${theme.borderLight}`, borderRadius: 6, overflow: "hidden" }}>
      <div
        onClick={() => setOpen(!open)}
        style={{
          padding: "7px 12px", background: theme.accentLight, cursor: "pointer",
          fontWeight: 600, fontSize: 13, color: theme.accent,
          display: "flex", justifyContent: "space-between", alignItems: "center",
        }}
      >
        <span>{title}</span>
        <span style={{ fontSize: 11 }}>{open ? "▲" : "▼"}</span>
      </div>
      {open && (
        <div style={{ padding: "10px 12px", fontSize: 13, color: theme.text, background: "#f9fcf9", lineHeight: 1.7 }}>
          {children}
        </div>
      )}
    </div>
  );
}

function NoData({ text }) {
  return <span style={{ color: theme.textLight, fontStyle: "italic", fontSize: 13 }}>{text}</span>;
}

function Badge({ text, bg, color }) {
  return (
    <span style={{
      display: "inline-block", padding: "2px 8px", borderRadius: 4,
      fontSize: 11, fontWeight: 600, background: bg, color, marginRight: 6,
    }}>
      {text}
    </span>
  );
}

function PaperCard({ paper, isExpanded, onToggle }) {
  const qColor = Q_COLORS[paper.sjr_quartile] || "#999";
  const isOld = paper.year && new Date().getFullYear() - paper.year > 5;

  const uniqueInstitutions = useMemo(() => {
    if (!paper.authors_full?.length) return [];
    const seen = new Set();
    const list = [];
    for (const a of paper.authors_full) {
      if (!a.affiliation) continue;
      const parts = a.affiliation.split(";");
      for (const p of parts) {
        const trimmed = p.trim();
        if (trimmed && !seen.has(trimmed.toLowerCase())) {
          seen.add(trimmed.toLowerCase());
          list.push(trimmed);
        }
      }
    }
    return list;
  }, [paper.authors_full]);

  const scholarUrl = `https://scholar.google.com/scholar?q=${encodeURIComponent(paper.title)}`;
  const pubmedUrl = `https://pubmed.ncbi.nlm.nih.gov/${paper.pmid}/`;
  const doiUrl = paper.doi ? `https://doi.org/${paper.doi}` : null;
  const europmcUrl = `https://europepmc.org/article/MED/${paper.pmid}`;
  const openalexUrl = paper.doi ? `https://openalex.org/works/doi:${paper.doi}` : null;

  return (
    <div style={{ ...S.card, borderLeftColor: qColor }}>
      <div onClick={onToggle} style={S.cardHeader}>
        <div style={{ flex: 1 }}>
          <div style={S.cardMeta}>
            <Badge text={paper.sjr_quartile || "N/A"} bg={qColor + "20"} color={qColor} />
            {paper.impact_factor && (
              <Badge text={`IF: ${paper.impact_factor}`} bg={qColor + "15"} color={qColor} />
            )}
            <Badge text={paper.study_type || "N/A"} bg="#f5f5f5" color="#555" />
            <span style={{ fontSize: 12, color: isOld ? "#999" : theme.text }}>
              ({paper.year}){isOld && <span style={S.oldBadge}>&gt;5yr</span>}
            </span>
            {paper.citation_count != null && (
              <span style={{ fontSize: 12, color: theme.textMuted, marginLeft: 8 }}>
                被引用 {paper.citation_count} 次
              </span>
            )}
          </div>
          <div style={S.cardTitle}>{paper.title}</div>
          <div style={S.cardAuthors}>
            {formatAuthors(paper.authors_short)} — <em>{paper.journal}</em>
          </div>
        </div>
        <span style={{ fontSize: 14, color: theme.accent, marginLeft: 12 }}>{isExpanded ? "▲" : "▼"}</span>
      </div>

      {isExpanded && (
        <div style={S.cardBody}>
          <DetailSection title="論文摘要（Abstract）" defaultOpen={true}>
            {paper.abstract ? (
              <>
                {paper.structured_abstract ? (
                  Object.entries(paper.structured_abstract).map(([key, val]) => (
                    <div key={key} style={{ marginBottom: 8 }}>
                      <strong style={{ textTransform: "capitalize", color: theme.accent }}>{key}:</strong>
                      <div style={{ whiteSpace: "pre-wrap", marginTop: 2 }}>{val}</div>
                    </div>
                  ))
                ) : (
                  <div style={{ whiteSpace: "pre-wrap" }}>{paper.abstract}</div>
                )}
              </>
            ) : (
              <NoData text="摘要資料暫無" />
            )}
          </DetailSection>

          <DetailSection title="作者與機構（Authors & Affiliations）">
            {paper.authors_full?.length > 0 ? (
              <table style={S.authorTable}>
                <thead>
                  <tr>
                    <th style={S.th}>作者</th>
                    <th style={S.th}>機構</th>
                  </tr>
                </thead>
                <tbody>
                  {paper.authors_full.map((a, i) => (
                    <tr key={i} style={i % 2 === 0 ? {} : { background: "#f5f9f5" }}>
                      <td style={S.td}>{a.name}</td>
                      <td style={S.td}>{a.affiliation || <NoData text="機構資訊未公開" />}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            ) : (
              <NoData text="作者詳細資訊暫無" />
            )}
          </DetailSection>

          <DetailSection title="關鍵貢獻（Key Contributions）">
            {paper.key_contributions ? (
              <div style={{ whiteSpace: "pre-wrap" }}>{paper.key_contributions}</div>
            ) : (
              <NoData text="貢獻摘要暫無" />
            )}
          </DetailSection>

          <DetailSection title="被引用數與學術影響（Citations & Impact）">
            <div style={{ display: "flex", flexWrap: "wrap", gap: 20, marginBottom: 8 }}>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>被引用次數</div>
                <div style={{ fontSize: 22, fontWeight: 700, color: theme.accent }}>
                  {paper.citation_count != null ? paper.citation_count : "—"}
                </div>
                {paper.citation_fetched_date && (
                  <div style={{ fontSize: 11, color: theme.textLight }}>
                    資料來源：{paper.citation_source || "Europe PMC"}（{paper.citation_fetched_date}）
                  </div>
                )}
              </div>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>出版類型</div>
                <div style={{ marginTop: 4 }}>
                  {paper.publication_types?.length > 0
                    ? paper.publication_types.map((pt, i) => (
                        <Badge key={i} text={pt} bg="#e3f2fd" color="#1565c0" />
                      ))
                    : <NoData text="未分類" />
                  }
                </div>
              </div>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>MeSH 關鍵詞</div>
                <div style={{ marginTop: 4, display: "flex", flexWrap: "wrap", gap: 4 }}>
                  {paper.mesh_terms?.length > 0
                    ? paper.mesh_terms.map((mt, i) => (
                        <Badge key={i} text={mt} bg="#f3e5f5" color="#7b1fa2" />
                      ))
                    : <NoData text="無 MeSH 標記" />
                  }
                </div>
              </div>
            </div>
          </DetailSection>

          <DetailSection title="機構含金量（Institutions）">
            {uniqueInstitutions.length > 0 ? (
              <ul style={{ margin: 0, paddingLeft: 20 }}>
                {uniqueInstitutions.map((inst, i) => (
                  <li key={i} style={{ marginBottom: 4, fontSize: 13 }}>{inst}</li>
                ))}
              </ul>
            ) : (
              <NoData text="機構資訊未公開" />
            )}
          </DetailSection>

          <DetailSection title="期刊與學術地位（Journal & Ranking）">
            <div style={{ display: "flex", flexWrap: "wrap", gap: 24 }}>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>期刊</div>
                <div style={{ fontSize: 14, fontWeight: 600 }}>{paper.journal}</div>
              </div>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>Impact Factor</div>
                <div style={{ fontSize: 14, fontWeight: 600, color: qColor }}>
                  {paper.impact_factor || "—"}
                </div>
              </div>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>SJR Quartile</div>
                <Badge text={paper.sjr_quartile || "N/A"} bg={qColor + "20"} color={qColor} />
              </div>
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted }}>研究類型</div>
                <div style={{ fontSize: 14 }}>{paper.study_type || "—"}</div>
              </div>
            </div>
          </DetailSection>

          <DetailSection title="研究方法（Methods）">
            {paper.sections?.methods ? (
              <div style={{ whiteSpace: "pre-wrap" }}>{paper.sections.methods}</div>
            ) : paper.structured_abstract?.methods ? (
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted, marginBottom: 4 }}>（來自結構化摘要）</div>
                <div style={{ whiteSpace: "pre-wrap" }}>{paper.structured_abstract.methods}</div>
              </div>
            ) : (
              <NoData text="此論文未提供獨立方法段落（可能為回顧型研究）" />
            )}
          </DetailSection>

          <DetailSection title="研究結論（Conclusions）">
            {paper.sections?.conclusions ? (
              <div style={{ whiteSpace: "pre-wrap" }}>{paper.sections.conclusions}</div>
            ) : paper.structured_abstract?.conclusions ? (
              <div>
                <div style={{ fontSize: 11, color: theme.textMuted, marginBottom: 4 }}>（來自結構化摘要）</div>
                <div style={{ whiteSpace: "pre-wrap" }}>{paper.structured_abstract.conclusions}</div>
              </div>
            ) : (
              <NoData text="此論文未提供獨立結論段落" />
            )}
          </DetailSection>

          <DetailSection title="實驗人群（Study Population）">
            {paper.study_population ? (
              <div style={{ whiteSpace: "pre-wrap" }}>{paper.study_population}</div>
            ) : (
              <NoData text="此論文未明確列出實驗人群（可能為回顧型研究）" />
            )}
          </DetailSection>

          <div style={S.sourceLinks}>
            <div style={{ fontSize: 12, fontWeight: 600, color: theme.textMuted, marginBottom: 6 }}>
              資料來源與引用連結
            </div>
            <div style={{ display: "flex", flexWrap: "wrap", gap: 8 }}>
              <a href={pubmedUrl} target="_blank" rel="noopener noreferrer" style={S.sourceLink}>
                PubMed
              </a>
              {doiUrl && (
                <a href={doiUrl} target="_blank" rel="noopener noreferrer" style={S.sourceLink}>
                  DOI
                </a>
              )}
              <a href={scholarUrl} target="_blank" rel="noopener noreferrer" style={S.sourceLink}>
                Google Scholar
              </a>
              <a href={europmcUrl} target="_blank" rel="noopener noreferrer" style={S.sourceLink}>
                Europe PMC
              </a>
              {openalexUrl && (
                <a href={openalexUrl} target="_blank" rel="noopener noreferrer" style={S.sourceLink}>
                  OpenAlex
                </a>
              )}
              <button
                onClick={() => window.open(`/graphrag-api/papers/${paper.doc_id}/pdf`, "_blank")}
                style={S.pdfBtn}
              >
                查看原文 PDF
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

function formatAuthors(authors) {
  if (!authors?.length) return "";
  if (authors.length <= 3) return authors.join(", ");
  return `${authors[0]}, ${authors[1]}, ${authors[2]}, et al.`;
}

export default function LiteratureReviewPage() {
  const [papers, setPapers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [search, setSearch] = useState("");
  const [sortBy, setSortBy] = useState("cite_desc");
  const [filterQ, setFilterQ] = useState([]);
  const [filterType, setFilterType] = useState([]);
  const [expandedId, setExpandedId] = useState(null);

  useEffect(() => {
    fetchPapersEnriched()
      .then((data) => {
        const list = Object.entries(data).map(([id, p]) => ({ ...p, doc_id: id }));
        setPapers(list);
      })
      .catch((e) => setError(e.message))
      .finally(() => setLoading(false));
  }, []);

  const filtered = useMemo(() => {
    let list = [...papers];
    if (search.trim()) {
      const q = search.toLowerCase();
      list = list.filter(
        (p) =>
          p.title?.toLowerCase().includes(q) ||
          p.abstract?.toLowerCase().includes(q) ||
          p.authors_short?.some((a) => a.toLowerCase().includes(q)) ||
          p.journal?.toLowerCase().includes(q) ||
          p.topic?.toLowerCase().includes(q)
      );
    }
    if (filterQ.length > 0) {
      list = list.filter((p) => filterQ.includes(p.sjr_quartile));
    }
    if (filterType.length > 0) {
      list = list.filter((p) => filterType.includes(p.study_type));
    }
    switch (sortBy) {
      case "year_desc": list.sort((a, b) => (b.year || 0) - (a.year || 0)); break;
      case "year_asc": list.sort((a, b) => (a.year || 0) - (b.year || 0)); break;
      case "if_desc": list.sort((a, b) => (b.impact_factor || 0) - (a.impact_factor || 0)); break;
      case "cite_desc": list.sort((a, b) => (b.citation_count ?? -1) - (a.citation_count ?? -1)); break;
      case "title_asc": list.sort((a, b) => (a.title || "").localeCompare(b.title || "")); break;
    }
    return list;
  }, [papers, search, sortBy, filterQ, filterType]);

  const stats = useMemo(() => {
    if (!papers.length) return null;
    const q1 = papers.filter((p) => p.sjr_quartile === "Q1").length;
    const ifs = papers.filter((p) => p.impact_factor).map((p) => p.impact_factor);
    const avgIF = ifs.length ? (ifs.reduce((a, b) => a + b, 0) / ifs.length).toFixed(1) : "—";
    const years = papers.map((p) => p.year).filter(Boolean);
    const totalCites = papers.reduce((sum, p) => sum + (p.citation_count || 0), 0);
    return {
      total: papers.length,
      q1,
      q1Pct: ((q1 / papers.length) * 100).toFixed(0),
      avgIF,
      yearRange: years.length ? `${Math.min(...years)}–${Math.max(...years)}` : "—",
      totalCites,
    };
  }, [papers]);

  const toggleQ = (q) => setFilterQ((prev) => prev.includes(q) ? prev.filter((x) => x !== q) : [...prev, q]);
  const toggleType = (t) => setFilterType((prev) => prev.includes(t) ? prev.filter((x) => x !== t) : [...prev, t]);

  if (loading) return <div style={{ textAlign: "center", padding: 40 }}>載入論文資料中...</div>;
  if (error) return <div style={{ textAlign: "center", padding: 40, color: theme.error }}>載入失敗：{error}</div>;

  return (
    <div>
      <h1 style={{ fontSize: 22, fontWeight: 700, color: theme.text, marginBottom: 16 }}>
        文獻回顧
      </h1>

      {stats && (
        <div style={S.statsBar}>
          <div style={S.statItem}>
            <div style={S.statValue}>{stats.total}</div>
            <div style={S.statLabel}>總論文數</div>
          </div>
          <div style={S.statItem}>
            <div style={{ ...S.statValue, color: Q_COLORS.Q1 }}>{stats.q1Pct}%</div>
            <div style={S.statLabel}>Q1 期刊比例</div>
          </div>
          <div style={S.statItem}>
            <div style={S.statValue}>{stats.avgIF}</div>
            <div style={S.statLabel}>平均 IF</div>
          </div>
          <div style={S.statItem}>
            <div style={S.statValue}>{stats.yearRange}</div>
            <div style={S.statLabel}>年份跨度</div>
          </div>
          <div style={S.statItem}>
            <div style={S.statValue}>{stats.totalCites.toLocaleString()}</div>
            <div style={S.statLabel}>總被引用數</div>
          </div>
        </div>
      )}

      <div style={S.toolbar}>
        <input
          type="text"
          placeholder="搜尋標題、摘要、作者、期刊..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          style={S.searchInput}
        />
        <select value={sortBy} onChange={(e) => setSortBy(e.target.value)} style={S.sortSelect}>
          {SORT_OPTIONS.map((o) => (
            <option key={o.value} value={o.value}>{o.label}</option>
          ))}
        </select>
      </div>

      <div style={S.filterRow}>
        <span style={{ fontSize: 12, color: theme.textMuted, marginRight: 8 }}>Quartile:</span>
        {["Q1", "Q2", "Q3"].map((q) => (
          <button
            key={q}
            onClick={() => toggleQ(q)}
            style={{
              ...S.filterPill,
              background: filterQ.includes(q) ? Q_COLORS[q] + "30" : "#f5f5f5",
              color: filterQ.includes(q) ? Q_COLORS[q] : "#777",
              borderColor: filterQ.includes(q) ? Q_COLORS[q] : "#ddd",
            }}
          >
            {q}
          </button>
        ))}
        <span style={{ fontSize: 12, color: theme.textMuted, margin: "0 8px 0 16px" }}>研究類型:</span>
        {STUDY_TYPES.map((t) => (
          <button
            key={t}
            onClick={() => toggleType(t)}
            style={{
              ...S.filterPill,
              background: filterType.includes(t) ? theme.accentLight : "#f5f5f5",
              color: filterType.includes(t) ? theme.accent : "#777",
              borderColor: filterType.includes(t) ? theme.accent : "#ddd",
            }}
          >
            {t}
          </button>
        ))}
      </div>

      <div style={{ fontSize: 13, color: theme.textMuted, marginBottom: 12 }}>
        顯示 {filtered.length} / {papers.length} 篇
      </div>

      {filtered.map((p) => (
        <PaperCard
          key={p.doc_id}
          paper={p}
          isExpanded={expandedId === p.doc_id}
          onToggle={() => setExpandedId(expandedId === p.doc_id ? null : p.doc_id)}
        />
      ))}

      {filtered.length === 0 && (
        <div style={{ textAlign: "center", padding: 40, color: theme.textLight }}>
          無符合條件的論文
        </div>
      )}
    </div>
  );
}

const S = {
  statsBar: {
    display: "flex", flexWrap: "wrap", gap: 16, marginBottom: 16,
    padding: "14px 20px", background: theme.cardBg, borderRadius: 10,
    border: `1px solid ${theme.borderLight}`,
  },
  statItem: { textAlign: "center", flex: "1 1 100px" },
  statValue: { fontSize: 20, fontWeight: 700, color: theme.accent },
  statLabel: { fontSize: 11, color: theme.textMuted, marginTop: 2 },
  toolbar: {
    display: "flex", gap: 10, marginBottom: 10, flexWrap: "wrap",
  },
  searchInput: {
    flex: "1 1 300px", padding: "8px 12px", borderRadius: 6,
    border: `1px solid ${theme.border}`, fontSize: 14, outline: "none",
    background: theme.inputBg,
  },
  sortSelect: {
    padding: "8px 12px", borderRadius: 6, border: `1px solid ${theme.border}`,
    fontSize: 13, background: theme.inputBg, cursor: "pointer",
  },
  filterRow: {
    display: "flex", flexWrap: "wrap", alignItems: "center", gap: 6,
    marginBottom: 12,
  },
  filterPill: {
    padding: "3px 10px", borderRadius: 12, border: "1px solid #ddd",
    fontSize: 11, cursor: "pointer", background: "#f5f5f5", fontWeight: 500,
  },
  card: {
    marginBottom: 12, background: theme.cardBg, borderRadius: 10,
    border: `1px solid ${theme.borderLight}`, borderLeft: "5px solid #999",
    overflow: "hidden",
  },
  cardHeader: {
    padding: "12px 16px", cursor: "pointer", display: "flex", alignItems: "flex-start",
  },
  cardMeta: {
    display: "flex", flexWrap: "wrap", alignItems: "center", gap: 6, marginBottom: 4,
  },
  cardTitle: { fontSize: 15, fontWeight: 600, color: theme.text, lineHeight: 1.4 },
  cardAuthors: { fontSize: 12, color: theme.textMuted, marginTop: 4 },
  oldBadge: {
    display: "inline-block", marginLeft: 4, padding: "1px 5px",
    borderRadius: 3, fontSize: 10, background: "#eee", color: "#999",
  },
  cardBody: { padding: "0 16px 14px" },
  authorTable: {
    width: "100%", borderCollapse: "collapse", fontSize: 13,
  },
  th: {
    textAlign: "left", padding: "6px 8px", borderBottom: `2px solid ${theme.border}`,
    fontSize: 12, color: theme.textMuted, fontWeight: 600,
  },
  td: {
    padding: "5px 8px", borderBottom: `1px solid ${theme.borderLight}`, verticalAlign: "top",
  },
  sourceLinks: {
    marginTop: 12, padding: "10px 12px", background: "#f5f8f5",
    borderRadius: 6, border: `1px solid ${theme.borderLight}`,
  },
  sourceLink: {
    display: "inline-block", padding: "4px 12px", borderRadius: 4,
    fontSize: 12, fontWeight: 500, color: theme.accent, textDecoration: "none",
    background: theme.accentLight, border: `1px solid ${theme.accent}30`,
  },
  pdfBtn: {
    padding: "4px 12px", borderRadius: 4, fontSize: 12, fontWeight: 500,
    color: "#fff", background: theme.accent, border: "none", cursor: "pointer",
  },
};
