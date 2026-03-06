import theme from "../../utils/theme";

export default function ErrorMessage({ message }) {
  if (!message) return null;
  return (
    <div style={{
      background: theme.errorBg, border: `1px solid ${theme.error}`,
      borderRadius: "8px", padding: "12px 16px", color: theme.error,
      margin: "12px 0",
    }}>
      {message}
    </div>
  );
}
