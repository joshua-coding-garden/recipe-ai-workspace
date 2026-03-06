import React from "react";
import { useNavigate } from "react-router-dom";

const styles = {
  container: {
    display: "flex",
    marginBottom: 16,
  },
  userContainer: {
    justifyContent: "flex-end",
  },
  bubble: {
    maxWidth: "80%",
    padding: "12px 16px",
    borderRadius: 12,
    fontSize: 15,
    lineHeight: 1.6,
    whiteSpace: "pre-wrap",
  },
  userBubble: {
    background: "#007bff",
    color: "#fff",
    borderBottomRightRadius: 4,
  },
  assistantBubble: {
    background: "#f1f3f5",
    color: "#212529",
    borderBottomLeftRadius: 4,
  },
  link: {
    color: "#007bff",
    textDecoration: "underline",
    cursor: "pointer",
  },
};

function renderMarkdownSegment(text, keyPrefix) {
  const boldRegex = /\*\*([^*]+)\*\*/g;
  const parts = [];
  let lastIndex = 0;
  let match;

  while ((match = boldRegex.exec(text)) !== null) {
    if (match.index > lastIndex) {
      parts.push(text.slice(lastIndex, match.index));
    }
    parts.push(
      <strong key={`${keyPrefix}-b-${match.index}`}>{match[1]}</strong>
    );
    lastIndex = match.index + match[0].length;
  }
  if (lastIndex < text.length) {
    parts.push(text.slice(lastIndex));
  }
  return parts.length ? parts : [text];
}

function renderContent(text, navigate) {
  if (!text) return null;

  const linkRegex = /\[([^\]]+)\]\(([^)]+)\)/g;
  const parts = [];
  let lastIndex = 0;
  let match;

  while ((match = linkRegex.exec(text)) !== null) {
    if (match.index > lastIndex) {
      parts.push(...renderMarkdownSegment(text.slice(lastIndex, match.index), `s-${match.index}`));
    }

    const linkText = match[1];
    const linkHref = match[2];
    const isInternal = linkHref.startsWith("/");

    parts.push(
      <span
        key={match.index}
        style={styles.link}
        onClick={() => {
          if (isInternal) {
            navigate(linkHref);
          } else {
            window.open(linkHref, "_blank");
          }
        }}
      >
        {linkText}
      </span>
    );
    lastIndex = match.index + match[0].length;
  }

  if (lastIndex < text.length) {
    parts.push(...renderMarkdownSegment(text.slice(lastIndex), `s-end`));
  }

  return parts.length ? parts : text;
}

export default function MessageBubble({ role, content }) {
  const navigate = useNavigate();
  const isUser = role === "user";

  return (
    <div style={{ ...styles.container, ...(isUser ? styles.userContainer : {}) }}>
      <div
        style={{
          ...styles.bubble,
          ...(isUser ? styles.userBubble : styles.assistantBubble),
        }}
      >
        {isUser ? content : renderContent(content, navigate)}
      </div>
    </div>
  );
}
