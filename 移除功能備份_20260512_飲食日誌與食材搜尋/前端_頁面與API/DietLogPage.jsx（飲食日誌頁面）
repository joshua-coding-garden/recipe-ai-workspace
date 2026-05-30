import { useState, useEffect } from "react";
import { getDietLogs, createDietLog, deleteDietLog } from "../api/dietApi";
import LoadingSpinner from "../components/common/LoadingSpinner";
import ErrorMessage from "../components/common/ErrorMessage";
import theme from "../utils/theme";

export default function DietLogPage() {
  const [logs, setLogs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showForm, setShowForm] = useState(false);
  const [form, setForm] = useState({
    food_name: "",
    amount_g: "",
    meal_type: "lunch",
    logged_at: new Date().toISOString().slice(0, 16),
  });
  const [submitting, setSubmitting] = useState(false);

  useEffect(() => {
    fetchLogs();
  }, []);

  async function fetchLogs() {
    try {
      setLoading(true);
      setError(null);
      const data = await getDietLogs();
      setLogs(data);
    } catch (err) {
      setError(err.message || "載入飲食記錄失敗");
    } finally {
      setLoading(false);
    }
  }

  async function handleSubmit(e) {
    e.preventDefault();
    if (!form.food_name.trim() || !form.amount_g) return;
    try {
      setSubmitting(true);
      await createDietLog({
        ...form,
        amount_g: parseFloat(form.amount_g),
      });
      setForm({
        food_name: "",
        amount_g: "",
        meal_type: "lunch",
        logged_at: new Date().toISOString().slice(0, 16),
      });
      setShowForm(false);
      await fetchLogs();
    } catch (err) {
      setError(err.message || "新增記錄失敗");
    } finally {
      setSubmitting(false);
    }
  }

  async function handleDelete(id) {
    if (!confirm("確定刪除此筆記錄？")) return;
    try {
      await deleteDietLog(id);
      setLogs((prev) => prev.filter((l) => l.id !== id));
    } catch (err) {
      setError(err.message || "刪除失敗");
    }
  }

  const mealLabels = {
    breakfast: "早餐",
    lunch: "午餐",
    dinner: "晚餐",
    snack: "點心",
  };

  const mealColors = {
    breakfast: "#f59e0b",
    lunch: "#10b981",
    dinner: "#6366f1",
    snack: "#ec4899",
  };

  if (loading) return <LoadingSpinner message="載入飲食記錄中..." />;

  return (
    <div style={{ maxWidth: 800, margin: "0 auto", padding: "24px 16px" }}>
      <div
        style={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
          marginBottom: 24,
        }}
      >
        <h1 style={{ fontSize: 28, fontWeight: 700, color: theme.text }}>
          飲食記錄
        </h1>
        <button
          onClick={() => setShowForm(!showForm)}
          style={{
            padding: "10px 20px",
            background: theme.accent,
            color: "#fff",
            border: "none",
            borderRadius: 8,
            cursor: "pointer",
            fontWeight: 600,
          }}
        >
          {showForm ? "取消" : "+ 新增記錄"}
        </button>
      </div>

      {error && (
        <ErrorMessage message={error} onDismiss={() => setError(null)} />
      )}

      {showForm && (
        <form
          onSubmit={handleSubmit}
          style={{
            background: theme.cardBg,
            border: `1px solid ${theme.border}`,
            borderRadius: 12,
            padding: 24,
            marginBottom: 24,
            boxShadow: "0 2px 8px rgba(0,0,0,0.06)",
          }}
        >
          <h2 style={{ fontSize: 18, fontWeight: 600, marginBottom: 16, color: theme.text }}>
            新增飲食記錄
          </h2>
          <div
            style={{
              display: "grid",
              gridTemplateColumns: "1fr 1fr",
              gap: 16,
            }}
          >
            <div>
              <label style={{ display: "block", marginBottom: 6, fontWeight: 500, color: theme.text }}>
                食物名稱
              </label>
              <input
                type="text"
                value={form.food_name}
                onChange={(e) => setForm({ ...form, food_name: e.target.value })}
                placeholder="例：雞胸肉"
                required
                style={{
                  width: "100%",
                  padding: "10px 12px",
                  border: `1px solid ${theme.border}`,
                  borderRadius: 8,
                  fontSize: 14,
                  boxSizing: "border-box",
                  background: theme.inputBg,
                  color: theme.text,
                }}
              />
            </div>
            <div>
              <label style={{ display: "block", marginBottom: 6, fontWeight: 500, color: theme.text }}>
                份量（克）
              </label>
              <input
                type="number"
                value={form.amount_g}
                onChange={(e) => setForm({ ...form, amount_g: e.target.value })}
                placeholder="100"
                min="1"
                required
                style={{
                  width: "100%",
                  padding: "10px 12px",
                  border: `1px solid ${theme.border}`,
                  borderRadius: 8,
                  fontSize: 14,
                  boxSizing: "border-box",
                  background: theme.inputBg,
                  color: theme.text,
                }}
              />
            </div>
            <div>
              <label style={{ display: "block", marginBottom: 6, fontWeight: 500, color: theme.text }}>
                餐別
              </label>
              <select
                value={form.meal_type}
                onChange={(e) => setForm({ ...form, meal_type: e.target.value })}
                style={{
                  width: "100%",
                  padding: "10px 12px",
                  border: `1px solid ${theme.border}`,
                  borderRadius: 8,
                  fontSize: 14,
                  background: theme.cardBg,
                  boxSizing: "border-box",
                  color: theme.text,
                }}
              >
                <option value="breakfast">早餐</option>
                <option value="lunch">午餐</option>
                <option value="dinner">晚餐</option>
                <option value="snack">點心</option>
              </select>
            </div>
            <div>
              <label style={{ display: "block", marginBottom: 6, fontWeight: 500, color: theme.text }}>
                記錄時間
              </label>
              <input
                type="datetime-local"
                value={form.logged_at}
                onChange={(e) => setForm({ ...form, logged_at: e.target.value })}
                style={{
                  width: "100%",
                  padding: "10px 12px",
                  border: `1px solid ${theme.border}`,
                  borderRadius: 8,
                  fontSize: 14,
                  boxSizing: "border-box",
                  background: theme.inputBg,
                  color: theme.text,
                }}
              />
            </div>
          </div>
          <button
            type="submit"
            disabled={submitting}
            style={{
              marginTop: 16,
              padding: "10px 24px",
              background: submitting ? "#94a3b8" : theme.accent,
              color: "#fff",
              border: "none",
              borderRadius: 8,
              cursor: submitting ? "not-allowed" : "pointer",
              fontWeight: 600,
            }}
          >
            {submitting ? "儲存中..." : "儲存"}
          </button>
        </form>
      )}

      {logs.length === 0 ? (
        <div
          style={{
            textAlign: "center",
            padding: 60,
            color: theme.textLight,
            background: theme.cardBg,
            borderRadius: 12,
            border: `1px dashed ${theme.border}`,
          }}
        >
          <div style={{ fontSize: 48, marginBottom: 12 }}>🍽️</div>
          <p style={{ fontSize: 16 }}>尚無飲食記錄，點選「新增記錄」開始追蹤！</p>
        </div>
      ) : (
        <div style={{ display: "flex", flexDirection: "column", gap: 12 }}>
          {logs.map((log) => (
            <div
              key={log.id}
              style={{
                background: theme.cardBg,
                border: `1px solid ${theme.border}`,
                borderRadius: 12,
                padding: "16px 20px",
                display: "flex",
                alignItems: "center",
                justifyContent: "space-between",
              }}
            >
              <div style={{ display: "flex", alignItems: "center", gap: 16 }}>
                <span
                  style={{
                    padding: "4px 10px",
                    borderRadius: 20,
                    fontSize: 12,
                    fontWeight: 600,
                    color: "#fff",
                    background: mealColors[log.meal_type] || "#6366f1",
                  }}
                >
                  {mealLabels[log.meal_type] || log.meal_type}
                </span>
                <div>
                  <p style={{ fontWeight: 600, fontSize: 16, margin: 0, color: theme.text }}>
                    {log.food_name}
                  </p>
                  <p style={{ color: theme.textLight, fontSize: 13, margin: "2px 0 0" }}>
                    {log.amount_g} 克
                    {log.calories ? ` · ${Math.round(log.calories)} kcal` : ""}
                  </p>
                </div>
              </div>
              <div style={{ display: "flex", alignItems: "center", gap: 16 }}>
                <span style={{ color: theme.textLight, fontSize: 13 }}>
                  {new Date(log.logged_at).toLocaleString("zh-TW", {
                    month: "numeric",
                    day: "numeric",
                    hour: "2-digit",
                    minute: "2-digit",
                  })}
                </span>
                <button
                  onClick={() => handleDelete(log.id)}
                  style={{
                    background: "none",
                    border: `1px solid #ef9a9a`,
                    borderRadius: 6,
                    color: theme.error,
                    padding: "4px 10px",
                    cursor: "pointer",
                    fontSize: 13,
                  }}
                >
                  刪除
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
