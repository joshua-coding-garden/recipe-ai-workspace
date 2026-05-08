import { useState, useRef, useEffect, useCallback, useMemo } from "react";
import theme from "../utils/theme";
import ReferenceList from "../components/graphrag/ReferenceList";
import TraversalGraph3D from "../components/graphrag/TraversalGraph3D";
import useStreamBuffer from "../hooks/useStreamBuffer";

function renderMarkdown(md) {
  if (!md) return "";
  const esc = (s) => s.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
  const lines = md.split("\n");
  const out = [];
  let inList = false;

  for (let i = 0; i < lines.length; i++) {
    let line = lines[i];

    const hMatch = line.match(/^(#{1,4})\s+(.+)$/);
    if (hMatch) {
      if (inList) { out.push("</ul>"); inList = false; }
      const lvl = hMatch[1].length;
      const sizes = { 1: "1.3em", 2: "1.15em", 3: "1.05em", 4: "1em" };
      const mt = lvl <= 2 ? "16px" : "10px";
      out.push(`<div style="font-weight:700;font-size:${sizes[lvl]};margin-top:${mt};margin-bottom:6px;color:#1a1a2e">${inline(esc(hMatch[2]))}</div>`);
      continue;
    }

    const liMatch = line.match(/^(\s*)[-*]\s+(.+)$/);
    if (liMatch) {
      if (!inList) { out.push('<ul style="margin:4px 0 4px 8px;padding-left:16px">'); inList = true; }
      out.push(`<li style="margin-bottom:3px">${inline(esc(liMatch[2]))}</li>`);
      continue;
    }

    if (inList && line.trim() === "") { out.push("</ul>"); inList = false; }

    if (line.trim() === "") {
      out.push('<div style="height:8px"></div>');
    } else {
      if (inList) { out.push("</ul>"); inList = false; }
      out.push(`<div>${inline(esc(line))}</div>`);
    }
  }
  if (inList) out.push("</ul>");
  return out.join("");
}

function inline(s) {
  return s
    .replace(/\*\*(.+?)\*\*/g, '<strong style="color:#1565C0">$1</strong>')
    .replace(/\*(.+?)\*/g, "<em>$1</em>")
    .replace(/`(.+?)`/g, '<code style="background:#f0f0f0;padding:1px 4px;border-radius:3px;font-size:0.9em">$1</code>');
}

function MarkdownBlock({ text, style }) {
  const html = useMemo(() => renderMarkdown(text), [text]);
  return <div style={style} dangerouslySetInnerHTML={{ __html: html }} />;
}

const METHODS = {
  A: { name: "Vector RAG", desc: "Chunk 向量搜尋 → LLM", color: "#2196F3" },
  B: { name: "Local Search", desc: "Entity → 圖遍歷 → chunk + report", color: "#4CAF50" },
  C: { name: "Global Search", desc: "社群報告搜尋 → LLM", color: "#FF9800" },
  D: { name: "Drift Search", desc: "假設答案 → 子問題 → 深入", color: "#9C27B0" },
};

const EXAMPLES = [
  "How does leucine trigger muscle protein synthesis?",
  "What are the major research themes in sports nutrition?",
  "How do omega-3 and antioxidants interact in reducing EIMD?",
  "What is the recommended daily protein intake for athletes?",
  "How does creatine supplementation affect performance?",
];

function GraphPanel({ traversalGraph, methodColor }) {
  const [open, setOpen] = useState(false);
  return (
    <div style={{ marginBottom: 10 }}>
      <button
        onClick={() => setOpen(!open)}
        style={{
          padding: "5px 14px",
          borderRadius: 6,
          border: `1px solid ${methodColor}50`,
          background: open ? methodColor + "18" : "transparent",
          color: methodColor,
          cursor: "pointer",
          fontSize: 12,
          fontWeight: 500,
        }}
      >
        {open ? "▼ 隱藏搜尋路徑圖" : "▶ 搜尋路徑 3D 圖"}
        <span style={{ marginLeft: 6, opacity: 0.6, fontSize: 11 }}>
          ({traversalGraph.nodes.length} nodes)
        </span>
      </button>
      {open && (
        <TraversalGraph3D
          traversalGraph={traversalGraph}
          methodColor={methodColor}
        />
      )}
    </div>
  );
}

export default function GraphRAGPage() {
  const [query, setQuery] = useState("");
  const [selectedMethods, setSelectedMethods] = useState(["A", "B", "C", "D"]);
  const [results, setResults] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const [activeMethod, setActiveMethod] = useState(null);
  const [serverStatus, setServerStatus] = useState(null);
  const abortRef = useRef(null);
  const scrollRef = useRef(null);

  const handleDrain = useCallback((batch) => {
    setResults((prev) => {
      const next = { ...prev };
      for (const [key, chars] of Object.entries(batch)) {
        const [method, field] = key.split(":");
        if (next[method]) {
          next[method] = {
            ...next[method],
            [field]: (next[method][field] || "") + chars,
          };
        }
      }
      return next;
    });
  }, []);

  const buffer = useStreamBuffer(handleDrain);

  useEffect(() => {
    fetch("/graphrag-api/health")
      .then((r) => r.json())
      .then((d) => setServerStatus(d))
      .catch(() => setServerStatus({ status: "error" }));
  }, []);

  const toggleMethod = (m) => {
    setSelectedMethods((prev) =>
      prev.includes(m) ? prev.filter((x) => x !== m) : [...prev, m]
    );
  };

  const handleSubmit = async (e) => {
    e?.preventDefault();
    const q = query.trim();
    if (!q || isLoading) return;

    buffer.clear();
    setResults({});
    setIsLoading(true);
    setActiveMethod(null);

    const controller = new AbortController();
    abortRef.current = controller;

    try {
      const resp = await fetch("/graphrag-api/query", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ query: q, methods: selectedMethods }),
        signal: controller.signal,
      });

      if (!resp.ok) throw new Error(`HTTP ${resp.status}`);

      const reader = resp.body.getReader();
      const decoder = new TextDecoder();
      let sseBuf = "";

      while (true) {
        const { done, value } = await reader.read();
        if (done) break;

        sseBuf += decoder.decode(value, { stream: true });
        const lines = sseBuf.split("\n");
        sseBuf = lines.pop() || "";

        for (const line of lines) {
          if (!line.startsWith("data: ")) continue;
          try {
            const data = JSON.parse(line.slice(6));

            if (data.type === "retrieval_done") {
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  meta: data,
                  traversalGraph: data.traversal_graph || null,
                  tokens: "",
                  done: false,
                  sources: data.sources || [],
                },
              }));
            } else if (data.type === "all_retrieved") {
              // all retrievals done, LLM phase begins
            } else if (data.type === "llm_start") {
              setActiveMethod(data.method);
            } else if (data.type === "reasoning") {
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  thinking: true,
                },
              }));
              buffer.push(`${data.method}:reasoning`, data.content);
            } else if (data.type === "answer_start") {
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  thinking: false,
                },
              }));
            } else if (data.type === "token") {
              buffer.push(`${data.method}:tokens`, data.content);
            } else if (data.type === "method_done") {
              const remTok = buffer.flush(`${data.method}:tokens`);
              const remReas = buffer.flush(`${data.method}:reasoning`);
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  tokens: (prev[data.method]?.tokens || "") + remTok,
                  reasoning: (prev[data.method]?.reasoning || "") + remReas,
                  done: true,
                  skipped: data.skipped,
                  llmTime: data.llm_time,
                  tokenCount: data.tokens,
                },
              }));
              setActiveMethod(null);
            } else if (data.type === "evidence_start") {
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  evidenceStarted: true,
                  evidence: "",
                  evidenceDone: false,
                },
              }));
            } else if (data.type === "evidence_reasoning") {
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  evidenceThinking: true,
                },
              }));
              buffer.push(`${data.method}:evidenceReasoning`, data.content);
            } else if (data.type === "evidence_answer_start") {
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  evidenceThinking: false,
                },
              }));
            } else if (data.type === "evidence_token") {
              buffer.push(`${data.method}:evidence`, data.content);
            } else if (data.type === "evidence_done") {
              const remEv = buffer.flush(`${data.method}:evidence`);
              const remEvR = buffer.flush(`${data.method}:evidenceReasoning`);
              setResults((prev) => ({
                ...prev,
                [data.method]: {
                  ...prev[data.method],
                  evidence: (prev[data.method]?.evidence || "") + remEv,
                  evidenceReasoning: (prev[data.method]?.evidenceReasoning || "") + remEvR,
                  evidenceDone: true,
                  evidenceLlmTime: data.llm_time,
                  evidenceTokenCount: data.tokens,
                },
              }));
            }
          } catch {}
        }
      }
    } catch (err) {
      if (err.name !== "AbortError") {
        setResults((prev) => ({
          ...prev,
          _error: err.message,
        }));
      }
    } finally {
      setIsLoading(false);
      setActiveMethod(null);
    }
  };

  const handleStop = () => {
    abortRef.current?.abort();
    abortRef.current = null;
    buffer.clear();
    setIsLoading(false);
    setActiveMethod(null);
    fetch("/graphrag-api/abort", { method: "POST" }).catch(() => {});
  };

  const handleSkip = () => {
    fetch("/graphrag-api/skip", { method: "POST" }).catch(() => {});
  };

  useEffect(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
    }
  }, [results]);

  const allMethods = Object.keys(METHODS);
  const hasResults = Object.keys(results).filter((k) => k !== "_error").length > 0;

  return (
    <div>
      <h2 style={S.title}>GraphRAG 知識圖譜問答</h2>
      <p style={S.subtitle}>
        基於 65 篇運動營養論文建構的知識圖譜，比較四種檢索方法的回答品質
      </p>

      {serverStatus && (
        <div style={{
          ...S.statusBar,
          background: serverStatus.gemma_server ? theme.successBg : theme.errorBg,
          color: serverStatus.gemma_server ? theme.success : theme.error,
        }}>
          <span>
            {serverStatus.gemma_server ? "✓" : "✗"} Gemma 4 LLM：
            {serverStatus.gemma_server ? "已連線" : "未啟動"}
          </span>
          {serverStatus.collections && (
            <span style={{ marginLeft: 16 }}>
              圖譜：{serverStatus.graph_nodes} nodes｜
              Entities: {serverStatus.collections.entities}｜
              Chunks: {serverStatus.collections.chunks}｜
              Reports: {serverStatus.collections.reports}｜
              Papers: {serverStatus.papers}
            </span>
          )}
        </div>
      )}

      <div style={S.methodSelector}>
        <span style={S.methodLabel}>檢索方法：</span>
        {allMethods.map((m) => (
          <button
            key={m}
            onClick={() => toggleMethod(m)}
            disabled={isLoading}
            style={{
              ...S.methodBtn,
              background: selectedMethods.includes(m) ? METHODS[m].color : "#e0e0e0",
              color: selectedMethods.includes(m) ? "#fff" : "#666",
              opacity: isLoading ? 0.6 : 1,
            }}
          >
            {m}. {METHODS[m].name}
          </button>
        ))}
      </div>

      <form onSubmit={handleSubmit} style={S.form}>
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="輸入運動營養相關問題（英文效果較佳）..."
          style={S.input}
          disabled={isLoading}
        />
        <button
          type="submit"
          disabled={!query.trim() || selectedMethods.length === 0 || isLoading}
          style={{
            ...S.submitBtn,
            opacity: !query.trim() || selectedMethods.length === 0 || isLoading ? 0.5 : 1,
          }}
        >
          搜尋
        </button>
        {isLoading && (
          <button type="button" onClick={handleStop} style={S.stopBtn}>
            停止
          </button>
        )}
      </form>

      <div style={S.examples}>
        <span style={{ color: theme.textMuted, fontSize: 13 }}>範例：</span>
        {EXAMPLES.map((ex, i) => (
          <button
            key={i}
            onClick={() => { setQuery(ex); }}
            style={S.exampleBtn}
            disabled={isLoading}
          >
            {ex.length > 50 ? ex.slice(0, 50) + "..." : ex}
          </button>
        ))}
      </div>

      {results._error && (
        <div style={{ ...S.card, background: theme.errorBg, color: theme.error }}>
          錯誤：{results._error}
        </div>
      )}

      <div ref={scrollRef} style={S.resultsArea}>
        {selectedMethods.map((mk) => {
          const r = results[mk];
          if (!r) return null;
          const info = METHODS[mk];
          return (
            <div key={mk} style={{ ...S.card, borderLeft: `4px solid ${info.color}` }}>
              <div style={S.cardHeader}>
                <div style={{ display: "flex", alignItems: "center", gap: 8 }}>
                  <span style={{ ...S.methodBadge, background: info.color }}>
                    {mk}
                  </span>
                  <strong>{info.name}</strong>
                  <span style={{ color: theme.textMuted, fontSize: 13 }}>
                    {info.desc}
                  </span>
                </div>
                {activeMethod === mk && !r.done && (
                  <button onClick={handleSkip} style={S.skipBtn}>
                    跳過此方法 →
                  </button>
                )}
                {r.meta && (
                  <div style={S.metaRow}>
                    <span>檢索 {r.meta.retrieval_time}s</span>
                    <span>Context {r.meta.context_chars.toLocaleString()} chars</span>
                    <span>{r.meta.sources_count} sources</span>
                    {r.meta.seed_entities?.length > 0 && (
                      <span>Seeds: {r.meta.seed_entities.join(", ")}</span>
                    )}
                    {r.meta.n_neighbors && <span>{r.meta.n_neighbors} neighbors</span>}
                    {r.meta.n_sub_queries && <span>{r.meta.n_sub_queries} sub-queries</span>}
                  </div>
                )}
              </div>

              {/* Traversal Graph (Methods B/C/D only) */}
              {r.traversalGraph && mk !== "A" && (
                <GraphPanel
                  traversalGraph={r.traversalGraph}
                  methodColor={info.color}
                />
              )}

              {/* Reasoning (Call 1) */}
              {r.reasoning && (
                <details style={S.reasoningBox} open={r.thinking}>
                  <summary style={S.reasoningSummary}>
                    {r.thinking ? "Gemma 4 思考中..." : "思考過程 (chain-of-thought)"}
                  </summary>
                  <MarkdownBlock text={r.reasoning} style={S.reasoningText} />
                </details>
              )}

              {/* Main Answer (Call 1) */}
              <div style={S.answer}>
                {!r.reasoning && !r.tokens && !r.done && !r.skipped && (
                  <span style={{ color: theme.textMuted }}>
                    {activeMethod === mk ? "LLM 生成中..." : "等待排隊..."}
                  </span>
                )}
                {r.done && r.skipped && !r.tokens && (
                  <span style={{ color: theme.textMuted, fontStyle: "italic" }}>已跳過</span>
                )}
                {r.tokens && <strong style={{ color: theme.accent, fontSize: 13 }}>回答：</strong>}
                {r.tokens && <MarkdownBlock text={r.tokens} style={S.mdBody} />}
                {!r.done && activeMethod === mk && r.tokens && <span style={S.cursor}>|</span>}
              </div>

              {r.done && (
                <div style={S.footer}>
                  LLM {r.llmTime}s ・ ~{r.tokenCount} tokens ・
                  ~{(r.tokenCount / r.llmTime).toFixed(1)} tok/s
                </div>
              )}

              {/* Evidence Section (Call 2) */}
              {r.evidenceStarted && (
                <div style={S.evidenceSection}>
                  <div style={S.evidenceHeader}>
                    方法論與實驗證據
                    {!r.evidenceDone && <span style={S.cursor}>|</span>}
                  </div>
                  {r.evidenceReasoning && (
                    <details style={S.evidenceReasoningBox} open={r.evidenceThinking}>
                      <summary style={S.reasoningSummary}>
                        {r.evidenceThinking ? "分析實驗方法中..." : "思考過程"}
                      </summary>
                      <MarkdownBlock text={r.evidenceReasoning} style={S.reasoningText} />
                    </details>
                  )}
                  <MarkdownBlock text={r.evidence} style={S.evidenceText} />
                  {r.evidenceDone && (
                    <div style={S.evidenceFooter}>
                      方法論分析 {r.evidenceLlmTime}s ・ ~{r.evidenceTokenCount} tokens
                    </div>
                  )}
                </div>
              )}

              {/* Reference List (bibliography) */}
              {r.done && r.sources && r.sources.length > 0 && (
                <ReferenceList sources={r.sources} />
              )}
            </div>
          );
        })}

        {isLoading && !hasResults && (
          <div style={{ textAlign: "center", padding: 40, color: theme.textMuted }}>
            檢索中... 嵌入模型載入可能需要數秒
          </div>
        )}
      </div>
    </div>
  );
}

const S = {
  title: {
    margin: 0,
    fontSize: 22,
    color: theme.text,
  },
  subtitle: {
    margin: "4px 0 16px",
    fontSize: 14,
    color: theme.textMuted,
  },
  statusBar: {
    padding: "8px 16px",
    borderRadius: 6,
    fontSize: 13,
    marginBottom: 16,
    display: "flex",
    flexWrap: "wrap",
    gap: 8,
  },
  methodSelector: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    marginBottom: 12,
    flexWrap: "wrap",
  },
  methodLabel: {
    fontSize: 14,
    color: theme.textMuted,
    marginRight: 4,
  },
  methodBtn: {
    border: "none",
    padding: "6px 14px",
    borderRadius: 20,
    cursor: "pointer",
    fontSize: 13,
    fontWeight: 500,
    transition: "all 0.2s",
  },
  form: {
    display: "flex",
    gap: 8,
    marginBottom: 8,
  },
  input: {
    flex: 1,
    padding: "10px 16px",
    border: `1px solid ${theme.border}`,
    borderRadius: 8,
    fontSize: 15,
    background: theme.inputBg,
    outline: "none",
  },
  submitBtn: {
    padding: "10px 24px",
    background: theme.accent,
    color: "#fff",
    border: "none",
    borderRadius: 8,
    cursor: "pointer",
    fontSize: 15,
    fontWeight: 500,
  },
  stopBtn: {
    padding: "10px 24px",
    background: theme.error,
    color: "#fff",
    border: "none",
    borderRadius: 8,
    cursor: "pointer",
    fontSize: 15,
    fontWeight: 500,
  },
  skipBtn: {
    float: "right",
    padding: "4px 12px",
    background: "#FF9800",
    color: "#fff",
    border: "none",
    borderRadius: 4,
    cursor: "pointer",
    fontSize: 12,
    fontWeight: 500,
  },
  examples: {
    display: "flex",
    flexWrap: "wrap",
    gap: 6,
    marginBottom: 20,
    alignItems: "center",
  },
  exampleBtn: {
    background: theme.accentLight,
    border: "none",
    padding: "4px 10px",
    borderRadius: 12,
    cursor: "pointer",
    fontSize: 12,
    color: theme.accent,
  },
  resultsArea: {
    display: "flex",
    flexDirection: "column",
    gap: 16,
  },
  card: {
    background: theme.cardBg,
    borderRadius: 8,
    padding: 16,
    border: `1px solid ${theme.borderLight}`,
  },
  cardHeader: {
    marginBottom: 12,
  },
  methodBadge: {
    color: "#fff",
    padding: "2px 8px",
    borderRadius: 4,
    fontSize: 12,
    fontWeight: 600,
  },
  metaRow: {
    display: "flex",
    gap: 12,
    marginTop: 6,
    fontSize: 12,
    color: theme.textMuted,
    flexWrap: "wrap",
  },
  reasoningBox: {
    marginBottom: 10,
    background: "#f8f4ff",
    border: "1px solid #e0d4f0",
    borderRadius: 6,
    padding: "8px 12px",
  },
  reasoningSummary: {
    cursor: "pointer",
    fontSize: 13,
    color: "#7b1fa2",
    fontWeight: 500,
  },
  reasoningText: {
    fontSize: 12,
    color: "#555",
    lineHeight: 1.5,
    marginTop: 6,
    maxHeight: 200,
    overflow: "auto",
  },
  answer: {
    lineHeight: 1.6,
    fontSize: 14,
    color: theme.text,
  },
  mdBody: {
    lineHeight: 1.7,
    fontSize: 14,
    color: theme.text,
    marginTop: 4,
  },
  cursor: {
    animation: "blink 1s infinite",
    color: theme.accent,
    fontWeight: "bold",
  },
  footer: {
    marginTop: 8,
    paddingTop: 8,
    borderTop: `1px solid ${theme.borderLight}`,
    fontSize: 12,
    color: theme.textMuted,
  },
  evidenceSection: {
    marginTop: 12,
    padding: "12px 16px",
    background: "#F0F8FF",
    borderLeft: "3px solid #1976D2",
    borderRadius: 6,
  },
  evidenceHeader: {
    fontSize: 13,
    fontWeight: 600,
    color: "#1976D2",
    marginBottom: 8,
  },
  evidenceReasoningBox: {
    marginBottom: 8,
    background: "#E8F4FD",
    border: "1px solid #BBDEFB",
    borderRadius: 4,
    padding: "6px 10px",
  },
  evidenceText: {
    lineHeight: 1.6,
    fontSize: 13,
    color: "#333",
  },
  evidenceFooter: {
    marginTop: 6,
    fontSize: 11,
    color: theme.textMuted,
  },
};
