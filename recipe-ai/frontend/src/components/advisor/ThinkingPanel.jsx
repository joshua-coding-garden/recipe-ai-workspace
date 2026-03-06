import React, { useRef, useEffect, useState } from "react";

const PHASE_DEFS = [
  { key: "echo", label: "理解需求" },
  { key: "intent", label: "分析意圖" },
  { key: "toolcall", label: "規劃工具" },
  { key: "execute", label: "工具調用" },
  { key: "analysis", label: "分析結果" },
  { key: "memory", label: "更新記憶" },
];

const STEP_LABELS = {
  intent: "分析意圖",
  toolcall: "規劃工具",
  analysis: "生成分析",
};

function ThinkingContent({ entries }) {
  const scrollRef = useRef(null);

  useEffect(() => {
    if (scrollRef.current) {
      scrollRef.current.scrollTop = scrollRef.current.scrollHeight;
    }
  }, [entries]);

  if (!entries || entries.length === 0) return null;

  return (
    <div ref={scrollRef} style={styles.thinkingScroll}>
      {entries.map((entry, i) => (
        <div key={i} style={styles.thinkingEntry}>
          <div style={styles.thinkingHeader}>
            <span style={entry.done ? styles.thinkingIconDone : styles.thinkingIconActive}>
              {entry.done ? "✓" : <span style={styles.spinner} />}
            </span>
            <span style={styles.thinkingLabel}>
              {entry.label || STEP_LABELS[entry.step] || entry.step}
            </span>
          </div>
          {entry.content && (
            <div style={styles.thinkingBody}>
              {entry.content.split("\n").map((line, j) => (
                <div key={j}>{line}</div>
              ))}
              {!entry.done && <span style={styles.cursor}>|</span>}
            </div>
          )}
        </div>
      ))}
    </div>
  );
}

function ElapsedTimer({ startTime }) {
  const [elapsed, setElapsed] = useState(0);
  useEffect(() => {
    const id = setInterval(() => setElapsed(Math.floor((Date.now() - startTime) / 1000)), 1000);
    return () => clearInterval(id);
  }, [startTime]);
  if (elapsed < 2) return null;
  return <span style={styles.elapsed}>{elapsed}秒</span>;
}

export default function ThinkingPanel({ steps, isThinking, phaseSteps, thinkingContent }) {
  if (!steps?.length && !isThinking && !phaseSteps?.length && !thinkingContent?.length) return null;

  const activeIdx = phaseSteps?.length
    ? PHASE_DEFS.findIndex((p) => p.key === phaseSteps[phaseSteps.length - 1])
    : -1;

  const hasThinking = thinkingContent && thinkingContent.length > 0;

  return (
    <div style={styles.container}>
      <div style={styles.title}>
        <span style={styles.titleIcon}><span style={styles.spinner} /></span>
        深度思考中...
      </div>

      {phaseSteps && phaseSteps.length > 0 && (
        <div style={styles.phaseRow}>
          {PHASE_DEFS.map((p, i) => {
            const done = i < activeIdx;
            const active = i === activeIdx;
            return (
              <span
                key={p.key}
                style={{
                  ...styles.phaseItem,
                  ...(done ? styles.phaseDone : {}),
                  ...(active ? styles.phaseActive : {}),
                }}
              >
                {done ? "✓" : active ? "⏳" : "○"} {p.label}
              </span>
            );
          })}
        </div>
      )}

      {hasThinking && <ThinkingContent entries={thinkingContent} />}

      {steps && steps.filter((s) => !s.label.startsWith("💭")).length > 0 && (
        <div style={styles.toolSteps}>
          {steps.filter((s) => !s.label.startsWith("💭")).map((step, i) => (
            <div key={i}>
              <div
                style={{
                  ...styles.step,
                  ...(step.status === "done" ? styles.stepDone : {}),
                  ...(step.status === "active" ? styles.stepActive : {}),
                }}
              >
                <span style={styles.stepIcon}>
                  {step.status === "done" ? "✓" : step.status === "active" ? <span style={styles.spinner} /> : "○"}
                </span>
                <span style={{ flex: 1 }}>
                  {step.label}
                  {step.status === "active" && step.progressLabel && (
                    <span style={styles.progressLabel}>— {step.progressLabel}</span>
                  )}
                  {step.status === "done" && step.summary && (
                    <span style={{ marginLeft: 6, opacity: 0.7 }}>— {step.summary}</span>
                  )}
                </span>
                {step.status === "active" && step.progress != null && step.progress > 0 && (
                  <span style={styles.progressPct}>{Math.round(step.progress * 100)}%</span>
                )}
                {step.status === "active" && step.startTime && (
                  <ElapsedTimer startTime={step.startTime} />
                )}
              </div>
              {step.status === "active" && step.progress != null && step.progress > 0 && (
                <div style={styles.progressBar}>
                  <div style={{ ...styles.progressFill, width: `${Math.round(step.progress * 100)}%` }} />
                  <div style={styles.progressShimmer} />
                </div>
              )}
              {step.status === "active" && (step.progress == null || step.progress === 0) && (
                <div style={styles.progressBar}>
                  <div style={styles.progressIndeterminate} />
                </div>
              )}
            </div>
          ))}
        </div>
      )}

      {isThinking && !hasThinking && !steps?.some((s) => s.status === "active") && (
        <div style={{ ...styles.step, ...styles.stepActive }}>
          <span style={styles.stepIcon}><span style={styles.spinner} /></span>
          <span>正在思考...</span>
        </div>
      )}

      <style>{`
        @keyframes spin { to { transform: rotate(360deg); } }
        @keyframes blink { 0%,100% { opacity: 1; } 50% { opacity: 0; } }
        @keyframes shimmer { 0% { transform: translateX(-100%); } 100% { transform: translateX(300%); } }
        @keyframes indeterminate { 0% { left: -30%; } 100% { left: 100%; } }
        @keyframes pulse { 0%,100% { opacity: 0.6; } 50% { opacity: 1; } }
      `}</style>
    </div>
  );
}

const styles = {
  container: {
    background: "linear-gradient(135deg, #f0f4f8 0%, #e8edf2 100%)",
    borderRadius: 12,
    padding: "14px 18px",
    marginBottom: 12,
    border: "1px solid #d0d7de",
    fontSize: 14,
  },
  title: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    fontWeight: 600,
    marginBottom: 10,
    color: "#3d4f60",
    fontSize: 14,
  },
  titleIcon: {
    display: "inline-flex",
    alignItems: "center",
  },
  phaseRow: {
    display: "flex",
    gap: 6,
    flexWrap: "wrap",
    marginBottom: 10,
    paddingBottom: 8,
    borderBottom: "1px solid #d0d7de",
    fontSize: 12,
  },
  phaseItem: {
    display: "flex",
    alignItems: "center",
    gap: 3,
    color: "#adb5bd",
  },
  phaseDone: { color: "#28a745" },
  phaseActive: { color: "#007bff", fontWeight: 600 },
  thinkingScroll: {
    maxHeight: 240,
    overflowY: "auto",
    marginBottom: 8,
    padding: "8px 12px",
    background: "rgba(255,255,255,0.7)",
    borderRadius: 8,
    border: "1px solid #e1e5e9",
  },
  thinkingEntry: {
    marginBottom: 8,
  },
  thinkingHeader: {
    display: "flex",
    alignItems: "center",
    gap: 6,
    marginBottom: 4,
    fontSize: 12,
    fontWeight: 600,
    color: "#4a5568",
  },
  thinkingIconDone: {
    color: "#28a745",
    fontSize: 12,
  },
  thinkingIconActive: {
    display: "inline-flex",
    alignItems: "center",
    color: "#007bff",
  },
  thinkingLabel: {
    textTransform: "capitalize",
  },
  thinkingBody: {
    fontSize: 13,
    color: "#5a6570",
    lineHeight: 1.5,
    paddingLeft: 20,
    fontFamily: "'SF Mono', 'Fira Code', monospace",
    whiteSpace: "pre-wrap",
    wordBreak: "break-word",
  },
  cursor: {
    animation: "blink 1s step-end infinite",
    color: "#007bff",
    fontWeight: 700,
  },
  toolSteps: {
    borderTop: "1px solid #e1e5e9",
    paddingTop: 6,
    marginTop: 4,
  },
  step: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    padding: "4px 0",
    color: "#6c757d",
  },
  stepDone: { color: "#28a745" },
  stepActive: { color: "#007bff" },
  stepIcon: {
    width: 18,
    textAlign: "center",
    display: "inline-flex",
    alignItems: "center",
    justifyContent: "center",
  },
  spinner: {
    display: "inline-block",
    width: 14,
    height: 14,
    border: "2px solid #007bff",
    borderTopColor: "transparent",
    borderRadius: "50%",
    animation: "spin 0.8s linear infinite",
  },
  progressLabel: {
    marginLeft: 8,
    fontSize: 12,
    opacity: 0.85,
    fontWeight: 400,
  },
  progressPct: {
    marginLeft: 8,
    fontSize: 12,
    fontWeight: 700,
    color: "#007bff",
    minWidth: 36,
    textAlign: "right",
  },
  elapsed: {
    marginLeft: 8,
    fontSize: 11,
    color: "#8899a6",
    fontVariantNumeric: "tabular-nums",
    animation: "pulse 2s ease-in-out infinite",
  },
  progressBar: {
    width: "calc(100% - 26px)",
    height: 6,
    background: "#e1e5e9",
    borderRadius: 3,
    marginTop: 4,
    marginLeft: 26,
    marginBottom: 6,
    overflow: "hidden",
    position: "relative",
  },
  progressFill: {
    height: "100%",
    background: "linear-gradient(90deg, #007bff, #28a745)",
    borderRadius: 3,
    transition: "width 0.5s ease",
  },
  progressShimmer: {
    position: "absolute",
    top: 0,
    left: 0,
    width: "30%",
    height: "100%",
    background: "linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent)",
    animation: "shimmer 1.5s ease-in-out infinite",
  },
  progressIndeterminate: {
    position: "absolute",
    top: 0,
    width: "30%",
    height: "100%",
    background: "linear-gradient(90deg, transparent, #007bff, transparent)",
    borderRadius: 3,
    animation: "indeterminate 1.2s ease-in-out infinite",
  },
};
