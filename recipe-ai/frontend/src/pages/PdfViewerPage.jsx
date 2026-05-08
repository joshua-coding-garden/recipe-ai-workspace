import { useEffect, useRef, useState, useCallback } from "react";
import { useSearchParams } from "react-router-dom";
import * as pdfjsLib from "pdfjs-dist";

pdfjsLib.GlobalWorkerOptions.workerSrc = new URL(
  "pdfjs-dist/build/pdf.worker.min.mjs",
  import.meta.url
).href;

function normalize(s) {
  return s.replace(/[\s \r\n-]+/g, "").toLowerCase();
}

function tryHighlight(container, rawText) {
  if (!rawText) return false;

  const spans = Array.from(container.querySelectorAll("span"));
  const normed = spans.map((s) => normalize(s.textContent));
  const fullPageText = normed.join("");

  const FRAG_LEN = 120;
  const STEP = 80;
  const fragments = [];
  const normalizedFull = normalize(rawText);
  for (let off = 0; off < normalizedFull.length && fragments.length < 8; off += STEP) {
    const frag = normalizedFull.slice(off, off + FRAG_LEN);
    if (frag.length >= 30 && fullPageText.includes(frag)) {
      fragments.push(frag);
    }
  }
  if (fragments.length === 0) return false;

  let firstMatch = null;
  for (const needle of fragments) {
    let accum = "";
    let startIdx = 0;
    for (let i = 0; i < spans.length; i++) {
      accum += normed[i];
      while (accum.length > needle.length * 4 && startIdx < i) {
        accum = accum.slice(normed[startIdx].length);
        startIdx++;
      }
      const pos = accum.indexOf(needle);
      if (pos !== -1) {
        let charCount = 0;
        let matchStart = -1;
        for (let j = startIdx; j <= i; j++) {
          const prevCount = charCount;
          charCount += normed[j].length;
          if (matchStart === -1 && charCount > pos) matchStart = j;
          if (matchStart !== -1 && prevCount < pos + needle.length) {
            spans[j].style.background = "rgba(255, 235, 59, 0.55)";
            spans[j].style.borderRadius = "2px";
            spans[j].style.mixBlendMode = "multiply";
          }
        }
        if (!firstMatch && matchStart !== -1) firstMatch = spans[matchStart];
        break;
      }
    }
  }

  if (firstMatch) firstMatch.scrollIntoView({ behavior: "smooth", block: "center" });
  return !!firstMatch;
}

async function textMatchesPage(doc, pageNum, rawText) {
  if (pageNum < 1 || pageNum > doc.numPages) return false;
  const needle = normalize(rawText.slice(0, 150));
  const pg = await doc.getPage(pageNum);
  const tc = await pg.getTextContent();
  const fullText = normalize(tc.items.map((it) => it.str || "").join(""));
  return fullText.includes(needle);
}

export default function PdfViewerPage() {
  const [params] = useSearchParams();
  const docId = params.get("doc");
  const targetPage = parseInt(params.get("page")) || 1;
  const hlKey = params.get("hlkey") || "";
  const hlDataRaw = hlKey ? sessionStorage.getItem(hlKey) : null;
  const hlData = hlDataRaw ? JSON.parse(hlDataRaw) : null;
  const highlightText = hlData?.primary || params.get("highlight") || "";
  const extraHighlights = hlData?.extra || [];

  const canvasRef = useRef(null);
  const textLayerRef = useRef(null);
  const [status, setStatus] = useState("loading");
  const [currentPage, setCurrentPage] = useState(targetPage);
  const [numPages, setNumPages] = useState(0);
  const [hlFound, setHlFound] = useState(false);
  const pdfDocRef = useRef(null);
  const renderTaskRef = useRef(null);

  const pdfUrl = `/graphrag-api/papers/${docId}/pdf`;

  const renderPage = useCallback(
    async (pageNum) => {
      const doc = pdfDocRef.current;
      if (!doc) return;

      if (renderTaskRef.current) {
        renderTaskRef.current.cancel();
        renderTaskRef.current = null;
      }

      try {
        setStatus("loading");
        const pg = await doc.getPage(pageNum);

        const baseWidth = window.innerWidth - 80;
        const origViewport = pg.getViewport({ scale: 1 });
        const scale = Math.min(baseWidth / origViewport.width, 3);
        const viewport = pg.getViewport({ scale });

        const canvas = canvasRef.current;
        if (!canvas) return;
        canvas.width = viewport.width;
        canvas.height = viewport.height;

        const ctx = canvas.getContext("2d");
        const task = pg.render({ canvasContext: ctx, viewport });
        renderTaskRef.current = task;
        await task.promise;
        renderTaskRef.current = null;

        const textContent = await pg.getTextContent();
        const textDiv = textLayerRef.current;
        if (!textDiv) return;
        textDiv.innerHTML = "";
        textDiv.style.width = viewport.width + "px";
        textDiv.style.height = viewport.height + "px";

        const fragment = document.createDocumentFragment();
        for (const item of textContent.items) {
          if (!item.str) continue;
          const tx = pdfjsLib.Util.transform(viewport.transform, item.transform);
          const span = document.createElement("span");
          span.textContent = item.str;
          span.style.position = "absolute";
          span.style.left = tx[4] + "px";
          span.style.top = tx[5] - item.height * scale + "px";
          span.style.fontSize = Math.abs(tx[3]) + "px";
          span.style.fontFamily = item.fontName || "sans-serif";
          span.style.whiteSpace = "pre";
          span.style.color = "transparent";
          span.style.lineHeight = "1";
          fragment.appendChild(span);
        }
        textDiv.appendChild(fragment);

        let found = false;
        if (highlightText && pageNum === targetPage) {
          found = tryHighlight(textDiv, highlightText);
        }
        for (const eh of extraHighlights) {
          if (eh.page === pageNum && eh.text) {
            found = tryHighlight(textDiv, eh.text) || found;
          }
        }
        setHlFound(found);

        setStatus("ready");
      } catch (err) {
        if (err.name !== "RenderingCancelledException") {
          setStatus("error");
        }
      }
    },
    [highlightText, extraHighlights, targetPage]
  );

  useEffect(() => {
    if (!docId) {
      setStatus("error");
      return;
    }
    let cancelled = false;

    (async () => {
      try {
        setStatus("loading");
        const doc = await pdfjsLib.getDocument(pdfUrl).promise;
        if (cancelled) {
          doc.destroy();
          return;
        }
        pdfDocRef.current = doc;
        setNumPages(doc.numPages);
        const startPage = Math.min(targetPage, doc.numPages);
        setCurrentPage(startPage);
        await renderPage(startPage);

        if (highlightText) {
          const textDiv = textLayerRef.current;
          const spans = textDiv ? textDiv.querySelectorAll("span") : [];
          const anyHighlighted = Array.from(spans).some(
            (s) => s.style.background && s.style.background.includes("255")
          );

          if (!anyHighlighted) {
            const searchOrder = [1, -1, 2, -2, 3, -3];
            for (const delta of searchOrder) {
              const p = startPage + delta;
              if (p < 1 || p > doc.numPages) continue;
              const match = await textMatchesPage(doc, p, highlightText);
              if (match) {
                if (!cancelled) setCurrentPage(p);
                break;
              }
            }
          }
        }
      } catch {
        if (!cancelled) setStatus("error");
      }
    })();

    return () => {
      cancelled = true;
      if (renderTaskRef.current) renderTaskRef.current.cancel();
      if (pdfDocRef.current) {
        pdfDocRef.current.destroy();
        pdfDocRef.current = null;
      }
    };
  }, [pdfUrl]);

  useEffect(() => {
    if (pdfDocRef.current) renderPage(currentPage);
  }, [currentPage, renderPage]);

  const goPage = (delta) => {
    setCurrentPage((p) => Math.max(1, Math.min(numPages, p + delta)));
  };

  useEffect(() => {
    const onKey = (e) => {
      if (e.key === "ArrowLeft" || e.key === "ArrowUp") goPage(-1);
      else if (e.key === "ArrowRight" || e.key === "ArrowDown") goPage(1);
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [numPages]);

  return (
    <div style={S.page}>
      <div style={S.toolbar}>
        <button
          style={S.navBtn}
          onClick={() => goPage(-1)}
          disabled={currentPage <= 1}
        >
          ◀ 上一頁
        </button>
        <span style={S.pageInfo}>
          第 {currentPage} / {numPages || "?"} 頁
          {highlightText && hlFound && (
            <span style={S.hlBadge}>螢光標記</span>
          )}
        </span>
        <button
          style={S.navBtn}
          onClick={() => goPage(1)}
          disabled={currentPage >= numPages}
        >
          下一頁 ▶
        </button>
      </div>

      <div style={S.viewport}>
        {status === "loading" && <div style={S.loading}>載入 PDF 中...</div>}
        {status === "error" && <div style={S.loading}>PDF 載入失敗</div>}
        <div style={S.canvasWrap}>
          <canvas ref={canvasRef} style={S.canvas} />
          <div ref={textLayerRef} style={S.textLayer} />
        </div>
      </div>
    </div>
  );
}

const S = {
  page: {
    display: "flex",
    flexDirection: "column",
    height: "100vh",
    background: "#525659",
    fontFamily: "system-ui, sans-serif",
  },
  toolbar: {
    display: "flex",
    alignItems: "center",
    justifyContent: "center",
    gap: 16,
    padding: "8px 16px",
    background: "#323639",
    flexShrink: 0,
  },
  navBtn: {
    padding: "6px 16px",
    border: "1px solid #555",
    borderRadius: 6,
    background: "#424649",
    color: "#ddd",
    cursor: "pointer",
    fontSize: 13,
  },
  pageInfo: {
    fontSize: 14,
    color: "#e0e0e0",
    fontWeight: 500,
    display: "flex",
    alignItems: "center",
    gap: 10,
  },
  hlBadge: {
    fontSize: 11,
    padding: "2px 8px",
    borderRadius: 4,
    background: "rgba(255, 235, 59, 0.3)",
    color: "#FFEB3B",
  },
  viewport: {
    flex: 1,
    overflow: "auto",
    display: "flex",
    justifyContent: "center",
    padding: "20px 0",
  },
  loading: {
    position: "absolute",
    top: "50%",
    left: "50%",
    transform: "translate(-50%, -50%)",
    fontSize: 16,
    color: "#aaa",
  },
  canvasWrap: {
    position: "relative",
    display: "inline-block",
  },
  canvas: {
    display: "block",
    boxShadow: "0 2px 16px rgba(0,0,0,0.4)",
  },
  textLayer: {
    position: "absolute",
    top: 0,
    left: 0,
    overflow: "hidden",
    pointerEvents: "none",
  },
};
