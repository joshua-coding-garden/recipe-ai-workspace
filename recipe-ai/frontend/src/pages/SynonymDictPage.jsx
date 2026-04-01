import { useState, useEffect, useCallback } from "react";
import {
  listEntries, createEntry, updateEntry, deleteEntry,
  searchEntries, lookupSynonym, getStats,
} from "../api/synonymDictApi";
import theme from "../utils/theme";

const LIMIT = 50;

export default function SynonymDictPage() {
  // --- Stats ---
  const [stats, setStats] = useState(null);

  // --- Entry list ---
  const [entries, setEntries] = useState([]);
  const [offset, setOffset] = useState(0);
  const [total, setTotal] = useState(0);
  const [listLoading, setListLoading] = useState(false);

  // --- Search ---
  const [searchQ, setSearchQ] = useState("");
  const [isSearchMode, setIsSearchMode] = useState(false);

  // --- Reverse lookup ---
  const [lookupTerm, setLookupTerm] = useState("");
  const [lookupResult, setLookupResult] = useState(null);
  const [lookupSteps, setLookupSteps] = useState([]);
  const [lookupLoading, setLookupLoading] = useState(false);

  // --- Form (add / edit) ---
  const [showForm, setShowForm] = useState(false);
  const [editingCanonical, setEditingCanonical] = useState(null); // null = add mode
  const [formData, setFormData] = useState({ canonical: "", language: "zh", synonyms: [], sources: [] });
  const [synInput, setSynInput] = useState("");
  const [srcInput, setSrcInput] = useState("");
  const [formLoading, setFormLoading] = useState(false);
  const [formError, setFormError] = useState("");

  // --- Delete ---
  const [deleteTarget, setDeleteTarget] = useState(null);
  const [deleteLoading, setDeleteLoading] = useState(false);

  // --- Error ---
  const [error, setError] = useState("");

  // ========== Load Stats ==========
  const loadStats = useCallback(async () => {
    try {
      const d = await getStats();
      setStats(d);
    } catch { /* ignore */ }
  }, []);

  // ========== Load Entries ==========
  const loadEntries = useCallback(async (off = 0) => {
    setListLoading(true);
    setError("");
    try {
      if (isSearchMode && searchQ.trim()) {
        const d = await searchEntries(searchQ.trim(), 100);
        setEntries(d.results || d || []);
        setTotal(d.results?.length || 0);
        setOffset(0);
      } else {
        const d = await listEntries("", LIMIT, off);
        setEntries(d.entries || []);
        setTotal(d.total || 0);
        setOffset(off);
      }
    } catch (e) {
      setError("載入條目失敗: " + (e.response?.data?.detail || e.message));
    } finally {
      setListLoading(false);
    }
  }, [isSearchMode, searchQ]);

  useEffect(() => { loadStats(); }, [loadStats]);
  useEffect(() => { loadEntries(0); }, [loadEntries]);

  // ========== Search ==========
  const handleSearch = () => {
    if (searchQ.trim()) {
      setIsSearchMode(true);
    } else {
      setIsSearchMode(false);
    }
  };

  const clearSearch = () => {
    setSearchQ("");
    setIsSearchMode(false);
  };

  // ========== Reverse Lookup ==========
  const handleLookup = async () => {
    if (!lookupTerm.trim()) return;
    setLookupLoading(true);
    setLookupResult(null);
    setLookupSteps([]);
    const steps = [];
    steps.push({ label: "收到查詢", detail: lookupTerm.trim() });
    try {
      const d = await lookupSynonym(lookupTerm.trim());
      steps.push({ label: "精確比對 canonical", detail: d.canonical ? `找到: ${d.canonical}` : "未找到" });
      steps.push({ label: "同義詞反向索引", detail: d.synonyms ? `同義詞: ${d.synonyms.join(", ")}` : "無" });
      steps.push({ label: "結果", detail: d.canonical ? `對應標準名: ${d.canonical}` : "無匹配結果" });
      setLookupResult(d);
    } catch (e) {
      steps.push({ label: "精確比對 canonical", detail: "未找到" });
      steps.push({ label: "同義詞反向索引", detail: "未找到" });
      steps.push({ label: "結果", detail: "無匹配結果" });
      setLookupResult(null);
    } finally {
      setLookupSteps(steps);
      setLookupLoading(false);
    }
  };

  // ========== Form ==========
  const openAddForm = () => {
    setEditingCanonical(null);
    setFormData({ canonical: "", language: "zh", synonyms: [], sources: [] });
    setSynInput("");
    setSrcInput("");
    setFormError("");
    setShowForm(true);
  };

  const openEditForm = (entry) => {
    setEditingCanonical(entry.canonical);
    setFormData({
      canonical: entry.canonical,
      language: entry.language || "zh",
      synonyms: [...(entry.synonyms || [])],
      sources: [...(entry.sources || [])],
    });
    setSynInput("");
    setSrcInput("");
    setFormError("");
    setShowForm(true);
  };

  const addSynonym = () => {
    const val = synInput.trim();
    if (val && !formData.synonyms.includes(val)) {
      setFormData(prev => ({ ...prev, synonyms: [...prev.synonyms, val] }));
    }
    setSynInput("");
  };

  const removeSynonym = (s) => {
    setFormData(prev => ({ ...prev, synonyms: prev.synonyms.filter(x => x !== s) }));
  };

  const addSource = () => {
    const val = srcInput.trim();
    if (val && !formData.sources.includes(val)) {
      setFormData(prev => ({ ...prev, sources: [...prev.sources, val] }));
    }
    setSrcInput("");
  };

  const removeSource = (s) => {
    setFormData(prev => ({ ...prev, sources: prev.sources.filter(x => x !== s) }));
  };

  const handleSave = async () => {
    if (!formData.canonical.trim()) {
      setFormError("請輸入標準名稱");
      return;
    }
    setFormLoading(true);
    setFormError("");
    try {
      if (editingCanonical) {
        await updateEntry(editingCanonical, {
          synonyms: formData.synonyms,
          sources: formData.sources,
        });
      } else {
        await createEntry({
          canonical: formData.canonical.trim(),
          language: formData.language,
          synonyms: formData.synonyms,
          sources: formData.sources,
        });
      }
      setShowForm(false);
      loadEntries(offset);
      loadStats();
    } catch (e) {
      setFormError("儲存失敗: " + (e.response?.data?.detail || e.message));
    } finally {
      setFormLoading(false);
    }
  };

  // ========== Delete ==========
  const confirmDelete = async () => {
    if (!deleteTarget) return;
    setDeleteLoading(true);
    try {
      await deleteEntry(deleteTarget);
      setDeleteTarget(null);
      loadEntries(offset);
      loadStats();
    } catch (e) {
      setError("刪除失敗: " + (e.response?.data?.detail || e.message));
      setDeleteTarget(null);
    } finally {
      setDeleteLoading(false);
    }
  };

  // ========== Pagination ==========
  const totalPages = Math.ceil(total / LIMIT);
  const currentPage = Math.floor(offset / LIMIT) + 1;
  const goPage = (p) => loadEntries((p - 1) * LIMIT);

  // ==================== RENDER ====================
  return (
    <div style={s.page}>
      <h1 style={s.title}>同義詞辭典管理</h1>

      {/* ===== Stats Bar ===== */}
      {stats && (
        <div style={s.statsBar}>
          <div style={s.statItem}>
            <span style={s.statLabel}>總條目數</span>
            <span style={s.statValue}>{stats.total_entries ?? stats.totalEntries ?? "-"}</span>
          </div>
          <div style={s.statItem}>
            <span style={s.statLabel}>總同義詞數</span>
            <span style={s.statValue}>{stats.total_synonyms ?? stats.totalSynonyms ?? "-"}</span>
          </div>
        </div>
      )}

      {/* ===== Search Bar ===== */}
      <div style={s.searchBar}>
        <input
          style={s.searchInput}
          placeholder="搜尋條目..."
          value={searchQ}
          onChange={e => setSearchQ(e.target.value)}
          onKeyDown={e => e.key === "Enter" && handleSearch()}
        />
        <button style={s.btn} onClick={handleSearch}>搜尋</button>
        {isSearchMode && <button style={s.btnOutline} onClick={clearSearch}>清除</button>}
        <button style={s.btnAccent} onClick={openAddForm}>新增條目</button>
      </div>

      {/* ===== Reverse Lookup ===== */}
      <div style={s.card}>
        <h3 style={s.cardTitle}>反向查詢測試</h3>
        <div style={s.lookupRow}>
          <input
            style={s.searchInput}
            placeholder="輸入食材名稱..."
            value={lookupTerm}
            onChange={e => setLookupTerm(e.target.value)}
            onKeyDown={e => e.key === "Enter" && handleLookup()}
          />
          <button style={s.btn} onClick={handleLookup} disabled={lookupLoading}>
            {lookupLoading ? "查詢中..." : "查詢"}
          </button>
        </div>
        {lookupSteps.length > 0 && (
          <div style={s.stepsContainer}>
            {lookupSteps.map((step, i) => (
              <div key={i} style={s.stepRow}>
                <span style={s.stepBadge}>{i + 1}</span>
                <span style={s.stepLabel}>{step.label}</span>
                <span style={s.stepArrow}>→</span>
                <span style={s.stepDetail}>{step.detail}</span>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* ===== Error ===== */}
      {error && <div style={s.errorBox}>{error}</div>}

      {/* ===== Entry List ===== */}
      <div style={s.card}>
        <h3 style={s.cardTitle}>
          條目列表 {total > 0 && <span style={s.totalBadge}>共 {total} 筆</span>}
        </h3>
        {listLoading ? (
          <div style={s.loading}>載入中...</div>
        ) : entries.length === 0 ? (
          <div style={s.empty}>尚無條目</div>
        ) : (
          <>
            <div style={s.tableWrap}>
              <table style={s.table}>
                <thead>
                  <tr>
                    <th style={s.th}>標準名稱</th>
                    <th style={s.th}>語言</th>
                    <th style={s.th}>同義詞數</th>
                    <th style={s.th}>來源</th>
                    <th style={{ ...s.th, textAlign: "center" }}>操作</th>
                  </tr>
                </thead>
                <tbody>
                  {entries.map((e, idx) => (
                    <tr key={e.canonical || idx} style={idx % 2 === 0 ? s.trEven : s.trOdd}>
                      <td style={s.td}>{e.canonical}</td>
                      <td style={s.td}>{e.language || "-"}</td>
                      <td style={s.td}>{e.synonyms?.length ?? 0}</td>
                      <td style={s.td}>{(e.sources || []).join(", ") || "-"}</td>
                      <td style={{ ...s.td, textAlign: "center" }}>
                        <button style={s.actionBtn} onClick={() => openEditForm(e)}>編輯</button>
                        <button style={s.deleteBtn} onClick={() => setDeleteTarget(e.canonical)}>刪除</button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* Pagination */}
            {!isSearchMode && totalPages > 1 && (
              <div style={s.pagination}>
                <button style={s.pageBtn} disabled={currentPage <= 1} onClick={() => goPage(currentPage - 1)}>
                  « 上一頁
                </button>
                {Array.from({ length: Math.min(totalPages, 7) }, (_, i) => {
                  let p;
                  if (totalPages <= 7) {
                    p = i + 1;
                  } else if (currentPage <= 4) {
                    p = i + 1;
                  } else if (currentPage >= totalPages - 3) {
                    p = totalPages - 6 + i;
                  } else {
                    p = currentPage - 3 + i;
                  }
                  return (
                    <button
                      key={p}
                      style={p === currentPage ? { ...s.pageBtn, ...s.pageBtnActive } : s.pageBtn}
                      onClick={() => goPage(p)}
                    >
                      {p}
                    </button>
                  );
                })}
                <button style={s.pageBtn} disabled={currentPage >= totalPages} onClick={() => goPage(currentPage + 1)}>
                  下一頁 »
                </button>
              </div>
            )}
          </>
        )}
      </div>

      {/* ===== Add / Edit Form Modal ===== */}
      {showForm && (
        <div style={s.overlay} onClick={() => setShowForm(false)}>
          <div style={s.modal} onClick={e => e.stopPropagation()}>
            <h3 style={s.modalTitle}>{editingCanonical ? "編輯條目" : "新增條目"}</h3>

            {formError && <div style={s.errorBox}>{formError}</div>}

            <label style={s.label}>標準名稱</label>
            <input
              style={s.input}
              value={formData.canonical}
              onChange={e => setFormData(prev => ({ ...prev, canonical: e.target.value }))}
              disabled={!!editingCanonical}
              placeholder="例：雞胸肉"
            />

            <label style={s.label}>語言</label>
            <select
              style={s.input}
              value={formData.language}
              onChange={e => setFormData(prev => ({ ...prev, language: e.target.value }))}
              disabled={!!editingCanonical}
            >
              <option value="zh">zh (中文)</option>
              <option value="en">en (English)</option>
            </select>

            <label style={s.label}>同義詞</label>
            <div style={s.tagInputRow}>
              <input
                style={{ ...s.input, flex: 1, marginBottom: 0 }}
                placeholder="輸入同義詞後按 Enter 或點擊新增"
                value={synInput}
                onChange={e => setSynInput(e.target.value)}
                onKeyDown={e => { if (e.key === "Enter") { e.preventDefault(); addSynonym(); } }}
              />
              <button style={s.smallBtn} onClick={addSynonym}>新增</button>
            </div>
            <div style={s.tagList}>
              {formData.synonyms.map(syn => (
                <span key={syn} style={s.tag}>
                  {syn}
                  <span style={s.tagRemove} onClick={() => removeSynonym(syn)}>x</span>
                </span>
              ))}
            </div>

            <label style={s.label}>來源</label>
            <div style={s.tagInputRow}>
              <input
                style={{ ...s.input, flex: 1, marginBottom: 0 }}
                placeholder="輸入來源後按 Enter 或點擊新增"
                value={srcInput}
                onChange={e => setSrcInput(e.target.value)}
                onKeyDown={e => { if (e.key === "Enter") { e.preventDefault(); addSource(); } }}
              />
              <button style={s.smallBtn} onClick={addSource}>新增</button>
            </div>
            <div style={s.tagList}>
              {formData.sources.map(src => (
                <span key={src} style={s.tag}>
                  {src}
                  <span style={s.tagRemove} onClick={() => removeSource(src)}>x</span>
                </span>
              ))}
            </div>

            <div style={s.modalActions}>
              <button style={s.btnOutline} onClick={() => setShowForm(false)}>取消</button>
              <button style={s.btnAccent} onClick={handleSave} disabled={formLoading}>
                {formLoading ? "儲存中..." : "儲存"}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* ===== Delete Confirmation ===== */}
      {deleteTarget && (
        <div style={s.overlay} onClick={() => setDeleteTarget(null)}>
          <div style={s.modal} onClick={e => e.stopPropagation()}>
            <h3 style={s.modalTitle}>確認刪除</h3>
            <p style={{ color: theme.text, marginBottom: 24 }}>
              確定要刪除條目 <strong>{deleteTarget}</strong> 嗎？此操作無法復原。
            </p>
            <div style={s.modalActions}>
              <button style={s.btnOutline} onClick={() => setDeleteTarget(null)}>取消</button>
              <button style={s.deleteBtnLg} onClick={confirmDelete} disabled={deleteLoading}>
                {deleteLoading ? "刪除中..." : "確認刪除"}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}

// ==================== STYLES ====================
const s = {
  page: {
    padding: 24, maxWidth: 1100, margin: "0 auto",
    background: theme.bg, minHeight: "80vh",
  },
  title: {
    fontSize: 24, fontWeight: "bold", color: theme.text, marginBottom: 16,
  },

  // Stats
  statsBar: {
    display: "flex", gap: 24, marginBottom: 20,
  },
  statItem: {
    background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: 8,
    padding: "12px 24px", display: "flex", flexDirection: "column", alignItems: "center",
  },
  statLabel: { fontSize: 13, color: theme.textMuted },
  statValue: { fontSize: 22, fontWeight: "bold", color: theme.accent },

  // Search
  searchBar: {
    display: "flex", gap: 8, marginBottom: 20, alignItems: "center", flexWrap: "wrap",
  },
  searchInput: {
    flex: 1, minWidth: 180, padding: "8px 12px", border: `1px solid ${theme.border}`,
    borderRadius: 6, fontSize: 14, background: theme.inputBg, color: theme.text,
    outline: "none",
  },

  // Buttons
  btn: {
    padding: "8px 16px", background: theme.accent, color: "#fff", border: "none",
    borderRadius: 6, cursor: "pointer", fontSize: 14, fontWeight: 500,
  },
  btnOutline: {
    padding: "8px 16px", background: "transparent", color: theme.accent,
    border: `1px solid ${theme.accent}`, borderRadius: 6, cursor: "pointer", fontSize: 14,
  },
  btnAccent: {
    padding: "8px 16px", background: theme.accent, color: "#fff", border: "none",
    borderRadius: 6, cursor: "pointer", fontSize: 14, fontWeight: 600,
  },
  smallBtn: {
    padding: "8px 12px", background: theme.accent, color: "#fff", border: "none",
    borderRadius: 6, cursor: "pointer", fontSize: 13,
  },

  // Card
  card: {
    background: theme.cardBg, border: `1px solid ${theme.border}`, borderRadius: 8,
    padding: 20, marginBottom: 20,
  },
  cardTitle: {
    fontSize: 16, fontWeight: 600, color: theme.text, marginTop: 0, marginBottom: 12,
  },

  // Lookup
  lookupRow: { display: "flex", gap: 8, marginBottom: 12 },
  stepsContainer: {
    background: theme.accentLight, borderRadius: 6, padding: 12,
  },
  stepRow: {
    display: "flex", alignItems: "center", gap: 8, padding: "6px 0",
    borderBottom: `1px solid ${theme.borderLight}`,
  },
  stepBadge: {
    width: 22, height: 22, borderRadius: "50%", background: theme.accent, color: "#fff",
    display: "flex", alignItems: "center", justifyContent: "center",
    fontSize: 12, fontWeight: 600, flexShrink: 0,
  },
  stepLabel: { fontWeight: 600, color: theme.text, fontSize: 13, minWidth: 120 },
  stepArrow: { color: theme.textMuted, fontSize: 14 },
  stepDetail: { color: theme.textMuted, fontSize: 13 },

  // Error
  errorBox: {
    background: theme.errorBg, color: theme.error, padding: "10px 16px",
    borderRadius: 6, marginBottom: 16, fontSize: 14,
  },

  // Table
  tableWrap: { overflowX: "auto" },
  table: { width: "100%", borderCollapse: "collapse", fontSize: 14 },
  th: {
    textAlign: "left", padding: "10px 12px", borderBottom: `2px solid ${theme.border}`,
    color: theme.textMuted, fontSize: 13, fontWeight: 600,
  },
  td: { padding: "10px 12px", borderBottom: `1px solid ${theme.borderLight}`, color: theme.text },
  trEven: { background: theme.cardBg },
  trOdd: { background: theme.inputBg },
  actionBtn: {
    padding: "4px 10px", background: theme.accentLight, color: theme.accent,
    border: `1px solid ${theme.accent}`, borderRadius: 4, cursor: "pointer",
    fontSize: 12, marginRight: 6,
  },
  deleteBtn: {
    padding: "4px 10px", background: theme.errorBg, color: theme.error,
    border: `1px solid ${theme.error}`, borderRadius: 4, cursor: "pointer", fontSize: 12,
  },
  deleteBtnLg: {
    padding: "8px 16px", background: theme.error, color: "#fff", border: "none",
    borderRadius: 6, cursor: "pointer", fontSize: 14, fontWeight: 600,
  },

  // Loading / empty
  loading: { textAlign: "center", padding: 40, color: theme.textMuted },
  empty: { textAlign: "center", padding: 40, color: theme.textLight },
  totalBadge: {
    fontSize: 12, fontWeight: 400, color: theme.textMuted, marginLeft: 8,
  },

  // Pagination
  pagination: {
    display: "flex", justifyContent: "center", gap: 4, marginTop: 16, flexWrap: "wrap",
  },
  pageBtn: {
    padding: "6px 12px", background: theme.cardBg, border: `1px solid ${theme.border}`,
    borderRadius: 4, cursor: "pointer", fontSize: 13, color: theme.text,
  },
  pageBtnActive: {
    background: theme.accent, color: "#fff", borderColor: theme.accent,
  },

  // Modal
  overlay: {
    position: "fixed", top: 0, left: 0, right: 0, bottom: 0,
    background: "rgba(0,0,0,0.4)", display: "flex", alignItems: "center",
    justifyContent: "center", zIndex: 1000,
  },
  modal: {
    background: theme.cardBg, borderRadius: 12, padding: 28, width: "90%",
    maxWidth: 520, maxHeight: "85vh", overflowY: "auto",
    boxShadow: "0 8px 32px rgba(0,0,0,0.15)",
  },
  modalTitle: {
    fontSize: 18, fontWeight: 600, color: theme.text, marginTop: 0, marginBottom: 20,
  },
  modalActions: {
    display: "flex", justifyContent: "flex-end", gap: 10, marginTop: 20,
  },

  // Form
  label: {
    display: "block", fontSize: 13, fontWeight: 600, color: theme.textMuted,
    marginBottom: 4, marginTop: 12,
  },
  input: {
    width: "100%", padding: "8px 12px", border: `1px solid ${theme.border}`,
    borderRadius: 6, fontSize: 14, background: theme.inputBg, color: theme.text,
    outline: "none", marginBottom: 4, boxSizing: "border-box",
  },
  tagInputRow: { display: "flex", gap: 8, alignItems: "center" },
  tagList: { display: "flex", flexWrap: "wrap", gap: 6, marginTop: 8, minHeight: 28 },
  tag: {
    background: theme.accentLight, color: theme.accent, padding: "4px 10px",
    borderRadius: 14, fontSize: 13, display: "flex", alignItems: "center", gap: 6,
  },
  tagRemove: {
    cursor: "pointer", fontWeight: "bold", fontSize: 14, color: theme.error,
    marginLeft: 2,
  },
};
