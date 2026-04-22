import { useCallback, useEffect, useMemo, useState } from "react";
import {
  listStopwords, createStopword, updateStopword, deleteStopword,
} from "../api/stopwordsApi";
import theme from "../utils/theme";

const CATEGORY_ORDER = ["general", "cooking", "user_flag", "custom"];
const CATEGORY_LABEL = {
  general: "一般停用詞",
  cooking: "烹飪動作詞",
  user_flag: "使用者標記",
  custom: "自訂",
};

export default function StopwordsPage() {
  const [entries, setEntries] = useState([]);
  const [stats, setStats] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  // 新增表單
  const [addOpen, setAddOpen] = useState(false);
  const [addWord, setAddWord] = useState("");
  const [addCategory, setAddCategory] = useState("custom");

  // 編輯
  const [editWord, setEditWord] = useState(null);
  const [editNewWord, setEditNewWord] = useState("");
  const [editCategory, setEditCategory] = useState("custom");

  // 刪除確認
  const [deleteTarget, setDeleteTarget] = useState(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError("");
    try {
      const data = await listStopwords();
      setEntries(data.entries || []);
      setStats(data.stats || null);
    } catch (e) {
      setError(e?.response?.data?.detail || e.message || "載入失敗");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { load(); }, [load]);

  const grouped = useMemo(() => {
    const out = {};
    for (const cat of CATEGORY_ORDER) out[cat] = [];
    for (const e of entries) {
      const c = e.category || "custom";
      if (!out[c]) out[c] = [];
      out[c].push(e);
    }
    for (const c of Object.keys(out)) {
      out[c].sort((a, b) => (a.word || "").localeCompare(b.word || "", "zh"));
    }
    return out;
  }, [entries]);

  const handleAdd = async () => {
    const w = addWord.trim();
    if (!w) return;
    try {
      await createStopword(w, addCategory || "custom");
      setAddWord("");
      setAddOpen(false);
      await load();
    } catch (e) {
      setError(e?.response?.data?.detail || "新增失敗");
    }
  };

  const handleEditStart = (entry) => {
    setEditWord(entry.word);
    setEditNewWord(entry.word);
    setEditCategory(entry.category || "custom");
  };

  const handleEditSave = async () => {
    try {
      await updateStopword(editWord, {
        new_word: editNewWord !== editWord ? editNewWord : null,
        category: editCategory,
      });
      setEditWord(null);
      await load();
    } catch (e) {
      setError(e?.response?.data?.detail || "更新失敗");
    }
  };

  const handleDelete = async () => {
    if (!deleteTarget) return;
    try {
      await deleteStopword(deleteTarget);
      setDeleteTarget(null);
      await load();
    } catch (e) {
      setError(e?.response?.data?.detail || "刪除失敗");
    }
  };

  return (
    <div style={S.page}>
      <div style={S.header}>
        <div>
          <h1 style={S.title}>停用詞管理</h1>
          <p style={S.sub}>
            全系統共用 · 一次顯示全部 · 所有變更皆記入審計日誌
            {stats && ` · 共 ${stats.total} 筆`}
          </p>
        </div>
        <button style={S.primaryBtn} onClick={() => setAddOpen(v => !v)}>
          {addOpen ? "取消" : "＋ 新增停用詞"}
        </button>
      </div>

      {addOpen && (
        <div style={S.addForm}>
          <input
            style={S.input}
            placeholder="輸入詞彙 (例如:切末)"
            value={addWord}
            onChange={e => setAddWord(e.target.value)}
            autoFocus
          />
          <select
            style={S.input}
            value={addCategory}
            onChange={e => setAddCategory(e.target.value)}
          >
            {CATEGORY_ORDER.map(c => (
              <option key={c} value={c}>{CATEGORY_LABEL[c] || c}</option>
            ))}
          </select>
          <button style={S.primaryBtn} onClick={handleAdd}>儲存</button>
        </div>
      )}

      {error && <div style={S.error}>{error}</div>}
      {loading && <div style={S.muted}>載入中…</div>}

      {CATEGORY_ORDER.map(cat => {
        const list = grouped[cat] || [];
        if (list.length === 0) return null;
        return (
          <section key={cat} style={S.section}>
            <h2 style={S.sectionTitle}>
              {CATEGORY_LABEL[cat] || cat}
              <span style={S.countBadge}>{list.length}</span>
            </h2>
            <div style={S.grid}>
              {list.map(entry => (
                <div key={entry.word} style={S.card}>
                  {editWord === entry.word ? (
                    <div style={S.editRow}>
                      <input
                        style={S.inputSmall}
                        value={editNewWord}
                        onChange={e => setEditNewWord(e.target.value)}
                      />
                      <select
                        style={S.inputSmall}
                        value={editCategory}
                        onChange={e => setEditCategory(e.target.value)}
                      >
                        {CATEGORY_ORDER.map(c => (
                          <option key={c} value={c}>{CATEGORY_LABEL[c] || c}</option>
                        ))}
                      </select>
                      <button style={S.smallBtn} onClick={handleEditSave}>儲存</button>
                      <button style={S.smallBtnGhost} onClick={() => setEditWord(null)}>取消</button>
                    </div>
                  ) : (
                    <>
                      <span style={S.word}>{entry.word}</span>
                      <div style={S.meta}>
                        {entry.created_by_email || entry.created_by || "system"}
                      </div>
                      <div style={S.actions}>
                        <button style={S.iconBtn} onClick={() => handleEditStart(entry)}>
                          編輯
                        </button>
                        <button
                          style={{ ...S.iconBtn, color: theme.error }}
                          onClick={() => setDeleteTarget(entry.word)}
                        >
                          刪除
                        </button>
                      </div>
                    </>
                  )}
                </div>
              ))}
            </div>
          </section>
        );
      })}

      {/* 其他類別 (非預設分類) */}
      {Object.keys(grouped)
        .filter(k => !CATEGORY_ORDER.includes(k) && grouped[k].length > 0)
        .map(cat => (
          <section key={cat} style={S.section}>
            <h2 style={S.sectionTitle}>{cat}<span style={S.countBadge}>{grouped[cat].length}</span></h2>
            <div style={S.grid}>
              {grouped[cat].map(entry => (
                <div key={entry.word} style={S.card}>
                  <span style={S.word}>{entry.word}</span>
                  <div style={S.actions}>
                    <button style={S.iconBtn} onClick={() => handleEditStart(entry)}>編輯</button>
                    <button
                      style={{ ...S.iconBtn, color: theme.error }}
                      onClick={() => setDeleteTarget(entry.word)}
                    >刪除</button>
                  </div>
                </div>
              ))}
            </div>
          </section>
      ))}

      {deleteTarget && (
        <div style={S.modalBackdrop} onClick={() => setDeleteTarget(null)}>
          <div style={S.modal} onClick={e => e.stopPropagation()}>
            <p>確定刪除停用詞「<strong>{deleteTarget}</strong>」?</p>
            <p style={S.muted}>刪除後斷詞將再次放行此詞彙。</p>
            <div style={{ display: "flex", gap: 8, justifyContent: "flex-end" }}>
              <button style={S.smallBtnGhost} onClick={() => setDeleteTarget(null)}>取消</button>
              <button style={{ ...S.smallBtn, background: theme.error }} onClick={handleDelete}>
                確定刪除
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

const S = {
  page: { padding: 24, maxWidth: 1200, margin: "0 auto", background: theme.bg, minHeight: "100vh" },
  header: {
    display: "flex", justifyContent: "space-between", alignItems: "center",
    marginBottom: 16, flexWrap: "wrap", gap: 12,
  },
  title: { margin: 0, color: theme.text, fontSize: 24 },
  sub: { margin: "4px 0 0", color: theme.textMuted, fontSize: 13 },
  primaryBtn: {
    padding: "8px 16px", background: theme.accent, color: "#fff",
    border: "none", borderRadius: 6, cursor: "pointer", fontSize: 14,
  },
  addForm: {
    display: "flex", gap: 8, padding: 12,
    background: theme.cardBg, borderRadius: 8, marginBottom: 16, flexWrap: "wrap",
  },
  input: {
    padding: "6px 10px", borderRadius: 4, border: `1px solid ${theme.border}`,
    fontSize: 14, minWidth: 120,
  },
  inputSmall: {
    padding: "4px 6px", borderRadius: 4, border: `1px solid ${theme.border}`,
    fontSize: 13, minWidth: 60,
  },
  error: {
    background: theme.errorBg, color: theme.error, padding: 10, borderRadius: 6, marginBottom: 12,
  },
  muted: { color: theme.textMuted, fontSize: 13 },
  section: { marginBottom: 24 },
  sectionTitle: {
    margin: "0 0 12px", color: theme.text, fontSize: 16,
    display: "flex", alignItems: "center", gap: 8,
  },
  countBadge: {
    background: theme.accentLight, color: theme.accent,
    borderRadius: 10, padding: "1px 8px", fontSize: 12, fontWeight: 600,
  },
  grid: {
    display: "grid",
    gridTemplateColumns: "repeat(auto-fill, minmax(160px, 1fr))",
    gap: 8,
  },
  card: {
    background: theme.cardBg, padding: "8px 10px", borderRadius: 6,
    border: `1px solid ${theme.borderLight}`,
    display: "flex", flexDirection: "column", gap: 4,
  },
  word: { fontSize: 15, color: theme.text, fontWeight: 500 },
  meta: { fontSize: 11, color: theme.textLight },
  actions: { display: "flex", gap: 4, marginTop: 4 },
  iconBtn: {
    background: "transparent", border: "none",
    color: theme.accent, cursor: "pointer", fontSize: 12, padding: "2px 4px",
  },
  editRow: { display: "flex", gap: 4, flexWrap: "wrap", alignItems: "center" },
  smallBtn: {
    padding: "4px 8px", background: theme.accent, color: "#fff",
    border: "none", borderRadius: 4, cursor: "pointer", fontSize: 12,
  },
  smallBtnGhost: {
    padding: "4px 8px", background: "transparent", color: theme.textMuted,
    border: `1px solid ${theme.border}`, borderRadius: 4, cursor: "pointer", fontSize: 12,
  },
  modalBackdrop: {
    position: "fixed", inset: 0, background: "rgba(0,0,0,0.4)",
    display: "flex", alignItems: "center", justifyContent: "center", zIndex: 1000,
  },
  modal: {
    background: "#fff", padding: 20, borderRadius: 8, maxWidth: 400, width: "90%",
  },
};
