import theme from "../../utils/theme";

export default function LoadingSpinner({ text = "分析中..." }) {
  return (
    <div style={{ textAlign: "center", padding: "40px" }}>
      <div style={styles.spinner} />
      <p style={{ color: theme.textMuted, marginTop: "16px" }}>{text}</p>
    </div>
  );
}

const styles = {
  spinner: {
    width: "40px", height: "40px",
    border: `4px solid ${theme.border}`, borderTop: `4px solid ${theme.accent}`,
    borderRadius: "50%", margin: "0 auto",
    animation: "spin 0.8s linear infinite",
  },
};

// 注入 keyframes
const style = document.createElement("style");
style.textContent = "@keyframes spin { to { transform: rotate(360deg); } }";
document.head.appendChild(style);
