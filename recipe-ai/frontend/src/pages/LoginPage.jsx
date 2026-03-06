import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import { login } from "../api/authApi";
import useAuthStore from "../store/authStore";
import ErrorMessage from "../components/common/ErrorMessage";
import theme from "../utils/theme";

export default function LoginPage() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const { setAuth } = useAuthStore();
  const navigate = useNavigate();

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    try {
      const data = await login(email, password);
      setAuth(data.access_token, data.user);
      navigate("/advisor");
    } catch (e) {
      setError(e.response?.data?.detail || "登入失敗");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={styles.center}>
      <div style={styles.card}>
        <h1 style={{ color: theme.accent, textAlign: "center", marginBottom: "24px" }}>
          運動員營養分析
        </h1>
        <form onSubmit={handleSubmit}>
          <label style={styles.label}>Email</label>
          <input style={styles.input} type="email" value={email}
            onChange={(e) => setEmail(e.target.value)} required />

          <label style={styles.label}>密碼</label>
          <input style={styles.input} type="password" value={password}
            onChange={(e) => setPassword(e.target.value)} required />

          <ErrorMessage message={error} />

          <button style={styles.btn} type="submit" disabled={loading}>
            {loading ? "登入中..." : "登入"}
          </button>
        </form>
        <p style={{ textAlign: "center", marginTop: "16px", color: theme.textLight, fontSize: "13px" }}>
          還沒帳號？<Link to="/register" style={{ color: theme.accent }}>註冊</Link>
        </p>
      </div>
    </div>
  );
}

const styles = {
  center: { display: "flex", justifyContent: "center", alignItems: "center", minHeight: "80vh" },
  card: { background: theme.cardBg, borderRadius: "12px", padding: "32px", width: "360px", boxShadow: "0 2px 12px rgba(0,0,0,0.08)", border: `1px solid ${theme.border}` },
  label: { display: "block", color: theme.textMuted, fontSize: "13px", marginBottom: "4px", marginTop: "16px" },
  input: { width: "100%", background: theme.inputBg, border: `1px solid ${theme.border}`,
           borderRadius: "8px", padding: "10px", color: theme.text, fontSize: "14px",
           boxSizing: "border-box" },
  btn: { width: "100%", background: theme.accent, color: "#fff", border: "none",
         padding: "12px", borderRadius: "8px", cursor: "pointer",
         fontSize: "15px", fontWeight: "bold", marginTop: "20px" },
};
