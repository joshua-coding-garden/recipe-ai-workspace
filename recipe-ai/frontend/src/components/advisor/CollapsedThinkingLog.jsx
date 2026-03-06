import React from "react";

const PHASE_DEFS = [
  { key: "echo", label: "理解需求" },
  { key: "intent", label: "分析意圖" },
  { key: "toolcall", label: "規劃工具" },
  { key: "execute", label: "工具調用" },
  { key: "analysis", label: "分析結果" },
  { key: "memory", label: "更新記憶" },
];

export default function CollapsedThinkingLog({ steps, phases, thinkingContent }) {
  if (!steps?.length && !phases?.length && !thinkingContent?.length) return null;

  const doneCount = steps?.filter((s) => s.status === "done").length || 0;
  const thinkCount = thinkingContent?.length || 0;
  const totalLabel = thinkCount > 0 ? `${thinkCount} 思考 · ${doneCount} 步` : `${doneCount} 步`;

  return (
    <details style={styles.details}>
      <summary style={styles.summary}>
        <span style={styles.summaryIcon}>🧠</span>
        <span>思考過程</span>
        <span style={styles.badge}>{totalLabel}</span>
      </summary>
      <div style={styles.content}>
        {phases?.length > 0 && (
          <div style={styles.phaseRow}>
            {PHASE_DEFS.map((p) => {
              const done = phases.includes(p.key);
              return (
                <span
                  key={p.key}
                  style={{
                    ...styles.phaseItem,
                    ...(done ? styles.phaseDone : {}),
                  }}
                >
                  {done ? "✓" : "○"} {p.label}
                </span>
              );
            })}
          </div>
        )}
        {thinkingContent?.length > 0 && (
          <div style={styles.thinkingSection}>
            {thinkingContent.map((entry, i) => (
              <div key={i} style={styles.thinkingEntry}>
                <div style={styles.thinkingHeader}>
                  <span style={styles.thinkingIcon}>✓</span>
                  <span style={styles.thinkingLabel}>
                    {entry.label || entry.step}
                  </span>
                </div>
                {entry.content && (
                  <div style={styles.thinkingBody}>
                    {entry.content.split("\n").map((line, j) => (
                      <div key={j}>{line}</div>
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
        {steps?.filter((s) => !s.label.startsWith("💭")).map((step, i) => (
          <div key={i} style={styles.step}>
            <span style={styles.icon}>
              {step.status === "done" ? "✓" : "⏳"}
            </span>
            <span>
              {step.label}
              {step.summary && (
                <span style={styles.stepSummary}>— {step.summary}</span>
              )}
            </span>
          </div>
        ))}
      </div>
    </details>
  );
}

const styles = {
  details: {
    background: "#f8f9fa",
    borderRadius: 8,
    marginBottom: 8,
    border: "1px solid #e9ecef",
    fontSize: 13,
    overflow: "hidden",
  },
  summary: {
    display: "flex",
    alignItems: "center",
    gap: 6,
    padding: "8px 12px",
    cursor: "pointer",
    color: "#6c757d",
    userSelect: "none",
    fontWeight: 500,
    listStyle: "none",
  },
  summaryIcon: {
    fontSize: 14,
  },
  badge: {
    marginLeft: "auto",
    background: "#e9ecef",
    borderRadius: 10,
    padding: "1px 8px",
    fontSize: 11,
    color: "#868e96",
  },
  content: {
    padding: "4px 12px 10px",
    borderTop: "1px solid #e9ecef",
  },
  phaseRow: {
    display: "flex",
    gap: 6,
    flexWrap: "wrap",
    marginBottom: 6,
    paddingBottom: 6,
    borderBottom: "1px solid #f1f3f5",
    fontSize: 12,
  },
  phaseItem: {
    display: "flex",
    alignItems: "center",
    gap: 3,
    color: "#adb5bd",
  },
  phaseDone: {
    color: "#28a745",
  },
  step: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    padding: "3px 0",
    color: "#28a745",
  },
  icon: {
    width: 16,
    textAlign: "center",
    flexShrink: 0,
  },
  stepSummary: {
    marginLeft: 6,
    opacity: 0.7,
  },
  thinkingSection: {
    marginBottom: 6,
    paddingBottom: 6,
    borderBottom: "1px solid #f1f3f5",
  },
  thinkingEntry: {
    marginBottom: 6,
  },
  thinkingHeader: {
    display: "flex",
    alignItems: "center",
    gap: 5,
    marginBottom: 2,
    fontSize: 12,
    fontWeight: 600,
    color: "#28a745",
  },
  thinkingIcon: {
    width: 16,
    textAlign: "center",
    flexShrink: 0,
  },
  thinkingLabel: {},
  thinkingBody: {
    fontSize: 12,
    color: "#5a6570",
    lineHeight: 1.4,
    paddingLeft: 21,
    fontFamily: "'SF Mono', 'Fira Code', monospace",
    whiteSpace: "pre-wrap",
    wordBreak: "break-word",
  },
};
