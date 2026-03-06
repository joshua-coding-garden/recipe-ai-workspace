import { useState, useEffect, useCallback } from "react";
import theme from "../../utils/theme";

export default function FigureGallery({ figures, docId }) {
  const [lightbox, setLightbox] = useState(null);

  const closeLightbox = useCallback(() => setLightbox(null), []);

  useEffect(() => {
    if (!lightbox) return;
    const onKey = (e) => {
      if (e.key === "Escape") closeLightbox();
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [lightbox, closeLightbox]);

  if (!figures || figures.length === 0) return null;

  return (
    <div style={S.container}>
      <div style={S.label}>相關圖表</div>
      <div style={S.thumbRow}>
        {figures.map((fig) => (
          <button
            key={fig.fig_key}
            style={S.thumbBtn}
            onClick={() => setLightbox(fig)}
            title={fig.caption}
          >
            <img
              src={`/graphrag-api/figures/${docId}/${fig.fig_key}`}
              alt={fig.fig_key}
              style={S.thumbImg}
              loading="lazy"
            />
            <span style={S.thumbLabel}>{fig.fig_key.replace("_", " ")}</span>
          </button>
        ))}
      </div>

      {lightbox && (
        <div style={S.overlay} onClick={closeLightbox}>
          <div style={S.modal} onClick={(e) => e.stopPropagation()}>
            <button style={S.closeBtn} onClick={closeLightbox}>✕</button>
            <img
              src={`/graphrag-api/figures/${docId}/${lightbox.fig_key}`}
              alt={lightbox.fig_key}
              style={S.modalImg}
            />
            {lightbox.caption && (
              <div style={S.caption}>{lightbox.caption}</div>
            )}
            <div style={S.pageNote}>第 {lightbox.page} 頁</div>
          </div>
        </div>
      )}
    </div>
  );
}

const S = {
  container: {
    marginTop: 6,
    marginLeft: 24,
    padding: "6px 0",
  },
  label: {
    fontSize: 11,
    color: theme.textMuted,
    marginBottom: 4,
    fontWeight: 500,
  },
  thumbRow: {
    display: "flex",
    gap: 8,
    flexWrap: "wrap",
  },
  thumbBtn: {
    border: `1px solid ${theme.borderLight}`,
    borderRadius: 4,
    background: "#fff",
    padding: 3,
    cursor: "pointer",
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    transition: "box-shadow 0.15s",
  },
  thumbImg: {
    width: 120,
    height: 80,
    objectFit: "cover",
    borderRadius: 2,
  },
  thumbLabel: {
    fontSize: 9,
    color: theme.textMuted,
    marginTop: 2,
  },
  overlay: {
    position: "fixed",
    top: 0,
    left: 0,
    right: 0,
    bottom: 0,
    background: "rgba(0,0,0,0.7)",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    zIndex: 9999,
  },
  modal: {
    position: "relative",
    background: "#fff",
    borderRadius: 8,
    padding: 16,
    maxWidth: "90vw",
    maxHeight: "90vh",
    overflow: "auto",
    boxShadow: "0 8px 32px rgba(0,0,0,0.3)",
  },
  closeBtn: {
    position: "absolute",
    top: 8,
    right: 8,
    border: "none",
    background: "rgba(0,0,0,0.6)",
    color: "#fff",
    width: 28,
    height: 28,
    borderRadius: "50%",
    fontSize: 14,
    cursor: "pointer",
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    zIndex: 1,
  },
  modalImg: {
    maxWidth: "85vw",
    maxHeight: "70vh",
    display: "block",
    margin: "0 auto",
  },
  caption: {
    fontSize: 13,
    color: "#333",
    lineHeight: 1.5,
    marginTop: 12,
    padding: "8px 12px",
    background: "#f5f5f5",
    borderRadius: 4,
    maxWidth: 700,
  },
  pageNote: {
    fontSize: 11,
    color: theme.textMuted,
    marginTop: 4,
    textAlign: "right",
  },
};
