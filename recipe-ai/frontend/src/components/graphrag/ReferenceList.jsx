import theme from "../../utils/theme";
import FigureGallery from "./FigureGallery";

const Q_COLORS = {
  Q1: "#4CAF50",
  Q2: "#2196F3",
  Q3: "#FF9800",
  Q4: "#f44336",
};

function formatAuthors(authors) {
  if (!authors || authors.length === 0) return "";
  if (authors.length <= 3) return authors.join(", ");
  return `${authors[0]}, ${authors[1]}, ${authors[2]}, et al.`;
}

export default function ReferenceList({ sources }) {
  if (!sources || sources.length === 0) return null;

  const communityReports = sources.filter((s) => s.type === "community_report");
  const paperSources = sources.filter((s) => s.paper_meta);

  if (communityReports.length === 0 && paperSources.length === 0) return null;

  return (
    <div style={S.container}>
      <div style={S.header}>參考文獻</div>

      {communityReports.map((cr, idx) => (
        <div key={cr.community_id || idx} style={S.communityCard}>
          <div style={S.communityHeader}>
            <span style={S.communityBadge}>社群報告</span>
            <span style={S.communityTitle}>{cr.title}</span>
          </div>
          <div style={S.communitySummary}>{cr.summary}</div>
          {cr.key_entities?.length > 0 && (
            <div style={S.entityTags}>
              {cr.key_entities.slice(0, 8).map((e) => (
                <span key={e} style={S.entityTag}>{e}</span>
              ))}
            </div>
          )}
          {cr.practical_implications && (
            <div style={S.practicalLine}>
              <span style={S.practicalLabel}>實務建議：</span>
              {cr.practical_implications.slice(0, 200)}
              {cr.practical_implications.length > 200 ? "..." : ""}
            </div>
          )}
        </div>
      ))}

      {paperSources.map((src, idx) => {
        const m = src.paper_meta;
        const qColor = Q_COLORS[m.sjr_quartile] || "#999";
        const isOld = m.year && new Date().getFullYear() - m.year > 5;
        const isPositionStand = m.study_type === "Position Stand";
        const isCommunityPaper = src.type === "community_paper";

        return (
          <div key={src.chunk_id || src.doc_id || idx} style={{ ...S.entry, borderLeftColor: qColor }}>
            <div style={S.refLine}>
              <span style={S.refNum}>[{idx + 1}]</span>
              {isCommunityPaper && <span style={S.fromCommunityBadge}>社群報告來源</span>}
              <span style={S.authors}>{formatAuthors(m.authors)}</span>
              <span style={{ ...S.year, color: isOld ? "#999" : theme.text }}>
                ({m.year})
                {isOld && <span style={S.oldBadge}>&gt;5yr</span>}
              </span>
            </div>
            <div style={S.title}>"{m.title}"</div>
            <div style={S.journalLine}>
              <span style={S.journal}>{m.journal}</span>
              {m.impact_factor && (
                <span style={{ ...S.ifBadge, background: qColor + "20", color: qColor }}>
                  IF: {m.impact_factor} ({m.sjr_quartile})
                </span>
              )}
              {isPositionStand && <span style={S.posBadge}>⭐ Position Stand</span>}
              {m.study_type && m.study_type !== "Position Stand" && (
                <span style={S.typeBadge}>{m.study_type}</span>
              )}
            </div>
            {m.doi && (
              <div style={S.doiLine}>
                DOI:{" "}
                <a
                  href={`https://doi.org/${m.doi}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  style={S.doiLink}
                >
                  {m.doi}
                </a>
              </div>
            )}
            {src.page && (
              <div style={S.pageLine}>
                引用位置：第 {src.page} 頁
                {src.extra_highlights?.length > 0 && (
                  <span style={S.extraPages}>
                    （另見第 {src.extra_highlights.map(h => h.page).join(", ")} 頁）
                  </span>
                )}
                <button
                  onClick={() => {
                    window.open(`/graphrag-api/papers/${src.doc_id}/pdf#page=${src.page}`, "_blank");
                  }}
                  style={S.viewBtn}
                >
                  查看原文 PDF
                </button>
              </div>
            )}
            {src.figures?.length > 0 && (
              <FigureGallery figures={src.figures} docId={src.doc_id} />
            )}
          </div>
        );
      })}
    </div>
  );
}

const S = {
  container: {
    marginTop: 12,
    padding: "12px 16px",
    background: "#fafafa",
    borderRadius: 8,
    border: `1px solid ${theme.borderLight}`,
  },
  header: {
    fontSize: 14,
    fontWeight: 600,
    color: theme.text,
    marginBottom: 10,
  },
  communityCard: {
    padding: "10px 12px",
    marginBottom: 10,
    background: "#F3E5F5",
    borderRadius: 6,
    border: "1px solid #CE93D8",
  },
  communityHeader: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    marginBottom: 6,
  },
  communityBadge: {
    fontSize: 11,
    padding: "2px 8px",
    borderRadius: 4,
    background: "#AB47BC",
    color: "#fff",
    fontWeight: 600,
    flexShrink: 0,
  },
  communityTitle: {
    fontSize: 13,
    fontWeight: 600,
    color: "#4A148C",
    lineHeight: 1.3,
  },
  communitySummary: {
    fontSize: 12,
    color: "#333",
    lineHeight: 1.5,
    marginBottom: 6,
  },
  entityTags: {
    display: "flex",
    flexWrap: "wrap",
    gap: 4,
    marginBottom: 6,
  },
  entityTag: {
    fontSize: 10,
    padding: "1px 6px",
    borderRadius: 3,
    background: "#E1BEE7",
    color: "#6A1B9A",
  },
  practicalLine: {
    fontSize: 11,
    color: "#555",
    lineHeight: 1.4,
    borderTop: "1px solid #E1BEE7",
    paddingTop: 4,
    marginTop: 2,
  },
  practicalLabel: {
    fontWeight: 600,
    color: "#7B1FA2",
  },
  entry: {
    padding: "10px 12px",
    marginBottom: 8,
    background: "#fff",
    borderRadius: 6,
    borderLeft: "4px solid #ccc",
    border: `1px solid ${theme.borderLight}`,
  },
  refLine: {
    display: "flex",
    alignItems: "baseline",
    gap: 6,
    flexWrap: "wrap",
  },
  refNum: {
    fontWeight: 700,
    fontSize: 13,
    color: theme.accent,
    minWidth: 24,
  },
  fromCommunityBadge: {
    fontSize: 10,
    padding: "1px 6px",
    borderRadius: 3,
    background: "#F3E5F5",
    color: "#7B1FA2",
    fontWeight: 500,
  },
  authors: {
    fontSize: 13,
    fontWeight: 500,
    color: theme.text,
  },
  year: {
    fontSize: 13,
    fontWeight: 500,
  },
  oldBadge: {
    marginLeft: 4,
    fontSize: 10,
    padding: "1px 4px",
    borderRadius: 3,
    background: "#eee",
    color: "#999",
  },
  title: {
    fontSize: 13,
    color: "#333",
    fontStyle: "italic",
    margin: "4px 0 4px 24px",
    lineHeight: 1.4,
  },
  journalLine: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    marginLeft: 24,
    flexWrap: "wrap",
  },
  journal: {
    fontSize: 12,
    color: theme.textMuted,
  },
  ifBadge: {
    fontSize: 11,
    padding: "1px 6px",
    borderRadius: 4,
    fontWeight: 600,
  },
  posBadge: {
    fontSize: 11,
    padding: "1px 6px",
    borderRadius: 4,
    background: "#FFF8E1",
    color: "#F57F17",
    fontWeight: 600,
  },
  typeBadge: {
    fontSize: 11,
    padding: "1px 6px",
    borderRadius: 4,
    background: "#E3F2FD",
    color: "#1565C0",
  },
  doiLine: {
    fontSize: 11,
    color: theme.textMuted,
    marginLeft: 24,
    marginTop: 2,
  },
  doiLink: {
    color: theme.accent,
    textDecoration: "none",
  },
  pageLine: {
    fontSize: 12,
    color: theme.textMuted,
    marginLeft: 24,
    marginTop: 4,
    display: "flex",
    alignItems: "center",
    gap: 8,
  },
  extraPages: {
    fontSize: 11,
    color: "#999",
  },
  viewBtn: {
    fontSize: 11,
    padding: "2px 8px",
    borderRadius: 4,
    border: `1px solid ${theme.accent}`,
    background: "transparent",
    color: theme.accent,
    cursor: "pointer",
  },
};
