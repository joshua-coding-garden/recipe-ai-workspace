import React, { useState, useRef, useEffect, useCallback } from "react";
import ThinkingPanel from "../components/advisor/ThinkingPanel";
import MessageBubble from "../components/advisor/MessageBubble";
import ToolResultCard from "../components/advisor/ToolResultCard";
import { streamAdvisorChat } from "../api/advisorApi";

const TOOL_LABELS = {
  query_dri: "查詢 DRI 建議攝取量",
  search_symptom: "搜尋症狀相關營養素",
  search_graphrag: "查詢學術文獻",
  get_nutrient_ranking: "查詢營養素排名",
  search_food: "搜尋食物資訊",
  get_diet_logs: "查詢飲食日誌",
  add_diet_log: "新增飲食記錄",
  update_diet_log: "修改飲食記錄",
  delete_diet_log: "刪除飲食記錄",
  get_saved_recipes: "查詢已儲存食譜",
  get_calendar_entries: "查詢行事曆",
  get_user_profile: "讀取個人資料",
  update_user_profile: "更新個人資料",
};

const STORAGE_KEY = "advisor_messages";

function loadMessages() {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function saveMessages(messages) {
  const trimmed = messages.slice(-30);
  localStorage.setItem(STORAGE_KEY, JSON.stringify(trimmed));
}

export default function AdvisorPage() {
  const [messages, setMessages] = useState(loadMessages);
  const [input, setInput] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const [steps, setSteps] = useState([]);
  const [isThinking, setIsThinking] = useState(false);
  const [memory, setMemory] = useState("");
  const [workflowState, setWorkflowState] = useState({});
  const chatEndRef = useRef(null);
  const abortRef = useRef(null);

  useEffect(() => {
    chatEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages, steps]);

  useEffect(() => {
    saveMessages(messages);
  }, [messages]);

  const handleSend = useCallback(() => {
    const text = input.trim();
    if (!text || isLoading) return;

    const userMsg = { role: "user", content: text };
    const newMessages = [...messages, userMsg];
    setMessages(newMessages);
    setInput("");
    setIsLoading(true);
    setIsThinking(true);
    setSteps([]);

    let turnTools = [];
    let turnToolResults = [];

    const history = newMessages.slice(0, -1).map((m) => ({
      role: m.role,
      content: m.content,
      tools_used: m.tools_used || [],
    }));

    let echoMsgAdded = false;

    const { abort } = streamAdvisorChat(text, history, {}, {
      onThinking() {
        setIsThinking(true);
      },
      onEcho(data) {
        if (data.content && !echoMsgAdded) {
          echoMsgAdded = true;
          setMessages((prev) => [...prev, {
            role: "assistant",
            content: data.content,
            _isEcho: true,
          }]);
          setIsThinking(false);
        }
      },
      onToolStart(data) {
        const label = TOOL_LABELS[data.name] || data.name;
        setSteps((prev) => [
          ...prev.map((s) => ({ ...s, status: "done" })),
          { label, status: "active", summary: "" },
        ]);
      },
      onToolDone(data) {
        turnTools.push({ name: data.name, summary: data.summary });
        setSteps((prev) =>
          prev.map((s) =>
            s.status === "active" ? { ...s, status: "done", summary: data.summary } : s
          )
        );
      },
      onToolResult(data) {
        turnToolResults.push({ name: data.name, data: data.data });
      },
      onMemory(data) {
        if (data.summary) setMemory(data.summary);
      },
      onWorkflowState(data) {
        setWorkflowState(data || {});
      },
      onReply(data) {
        const snapshotResults = [...turnToolResults];
        const snapshotTools = [...turnTools];
        setMessages((prev) => {
          const filtered = echoMsgAdded
            ? prev.filter((m) => !m._isEcho)
            : prev;
          return [...filtered, {
            role: "assistant",
            content: data.content,
            tools_used: snapshotTools,
            tool_results: snapshotResults,
          }];
        });
        turnTools = [];
        turnToolResults = [];
        setIsLoading(false);
        setIsThinking(false);
      },
      onError(errMsg) {
        setMessages((prev) => [
          ...prev,
          { role: "assistant", content: `⚠️ ${errMsg}` },
        ]);
        setIsLoading(false);
        setIsThinking(false);
      },
      onComplete() {
        setIsLoading(false);
        setIsThinking(false);
      },
    }, memory, workflowState);

    abortRef.current = abort;
  }, [input, isLoading, messages, memory, workflowState]);

  const handleKeyDown = (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  const handleClear = () => {
    setMessages([]);
    setSteps([]);
    setMemory("");
    setWorkflowState({});
    localStorage.removeItem(STORAGE_KEY);
  };

  return (
    <div style={pageStyles.container}>
      <div style={pageStyles.header}>
        <h2 style={pageStyles.title}>🤖 AI 營養顧問</h2>
        <p style={pageStyles.subtitle}>
          告訴我你的飲食、症狀、或營養問題，我會幫你分析並給出建議。
        </p>
      </div>

      <div style={pageStyles.chatArea}>
        {messages.length === 0 && (
          <div style={pageStyles.placeholder}>
            <div style={pageStyles.welcomeBubble}>
              <p style={{ margin: "0 0 8px", fontWeight: 600 }}>你好！我是你的 AI 營養顧問 👋</p>
              <p style={{ margin: 0, lineHeight: 1.6 }}>
                我可以幫你：記錄飲食並自動計算營養、分析你的 DRI 缺口、搜尋食物營養成分、根據症狀推薦營養素與食物、查詢學術文獻佐證，以及管理你的飲食日誌和食譜。
              </p>
              <p style={{ margin: "8px 0 0", color: "#718096", fontSize: 13 }}>點擊下方按鈕快速開始，或直接輸入你的問題：</p>
            </div>
            <div style={pageStyles.suggestionGroups}>
              <div style={pageStyles.suggestionGroup}>
                <span style={pageStyles.groupLabel}>📋 記錄飲食</span>
                <button style={pageStyles.suggestionBtn} onClick={() => { setInput("今天午餐吃了雞腿便當、青菜、荷包蛋"); }}>今天午餐吃了雞腿便當、青菜、荷包蛋</button>
              </div>
              <div style={pageStyles.suggestionGroup}>
                <span style={pageStyles.groupLabel}>📊 營養分析</span>
                <button style={pageStyles.suggestionBtn} onClick={() => { setInput("我25歲女性，幫我看看營養是否充足"); }}>我25歲女性，幫我看看營養是否充足</button>
                <button style={pageStyles.suggestionBtn} onClick={() => { setInput("哪些食物鎂含量最高？"); }}>哪些食物鎂含量最高？</button>
              </div>
              <div style={pageStyles.suggestionGroup}>
                <span style={pageStyles.groupLabel}>🩺 症狀查詢</span>
                <button style={pageStyles.suggestionBtn} onClick={() => { setInput("最近常覺得疲勞，有什麼營養建議？"); }}>最近常覺得疲勞，有什麼營養建議？</button>
              </div>
              <div style={pageStyles.suggestionGroup}>
                <span style={pageStyles.groupLabel}>📚 學術文獻</span>
                <button style={pageStyles.suggestionBtn} onClick={() => { setInput("為什麼蛋白質對肌肉修復很重要？"); }}>為什麼蛋白質對肌肉修復很重要？</button>
              </div>
              <div style={pageStyles.suggestionGroup}>
                <span style={pageStyles.groupLabel}>🔍 食物搜尋</span>
                <button style={pageStyles.suggestionBtn} onClick={() => { setInput("雞胸肉的營養成分是什麼？"); }}>雞胸肉的營養成分是什麼？</button>
              </div>
            </div>
          </div>
        )}

        {messages.map((msg, i) => (
          <React.Fragment key={i}>
            {msg.role === "assistant" && msg.tool_results?.length > 0 && (
              msg.tool_results.map((tr, j) => (
                <ToolResultCard key={`tr-${i}-${j}`} name={tr.name} data={tr.data} />
              ))
            )}
            <MessageBubble role={msg.role} content={msg.content} />
          </React.Fragment>
        ))}

        {(steps.length > 0 || isThinking) && (
          <ThinkingPanel steps={steps} isThinking={isThinking} />
        )}

        <div ref={chatEndRef} />
      </div>

      <div style={pageStyles.inputArea}>
        <textarea
          style={pageStyles.input}
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          placeholder="輸入你的問題...（Enter 送出，Shift+Enter 換行）"
          rows={2}
          disabled={isLoading}
        />
        <div style={pageStyles.actions}>
          <button
            style={{
              ...pageStyles.sendBtn,
              opacity: isLoading || !input.trim() ? 0.5 : 1,
            }}
            onClick={handleSend}
            disabled={isLoading || !input.trim()}
          >
            {isLoading ? "思考中..." : "送出 ▶"}
          </button>
          {messages.length > 0 && (
            <button style={pageStyles.clearBtn} onClick={handleClear}>
              清除對話
            </button>
          )}
        </div>
      </div>
    </div>
  );
}

const pageStyles = {
  container: {
    display: "flex",
    flexDirection: "column",
    height: "calc(100vh - 80px)",
    maxWidth: 800,
    margin: "0 auto",
    padding: "16px 20px",
  },
  header: {
    textAlign: "center",
    marginBottom: 16,
  },
  title: {
    margin: 0,
    fontSize: 22,
  },
  subtitle: {
    margin: "4px 0 0",
    color: "#6c757d",
    fontSize: 14,
  },
  chatArea: {
    flex: 1,
    overflowY: "auto",
    padding: "8px 0",
  },
  placeholder: {
    padding: "20px 0",
    color: "#6c757d",
  },
  welcomeBubble: {
    background: "#f8f9fa",
    border: "1px solid #e2e8f0",
    borderRadius: 12,
    padding: "16px 20px",
    marginBottom: 16,
    fontSize: 14,
    color: "#2d3748",
    lineHeight: 1.5,
    maxWidth: 600,
  },
  suggestionGroups: {
    display: "flex",
    flexDirection: "column",
    gap: 10,
  },
  suggestionGroup: {
    display: "flex",
    flexWrap: "wrap",
    alignItems: "center",
    gap: 6,
  },
  groupLabel: {
    fontSize: 12,
    color: "#4a5568",
    fontWeight: 600,
    minWidth: 80,
  },
  suggestionBtn: {
    background: "#e9ecef",
    border: "none",
    borderRadius: 20,
    padding: "6px 14px",
    fontSize: 13,
    cursor: "pointer",
    transition: "background 0.2s",
    color: "#495057",
    textAlign: "left",
  },
  inputArea: {
    borderTop: "1px solid #dee2e6",
    paddingTop: 12,
  },
  input: {
    width: "100%",
    padding: "10px 14px",
    borderRadius: 8,
    border: "1px solid #ced4da",
    fontSize: 15,
    resize: "none",
    fontFamily: "inherit",
    outline: "none",
    boxSizing: "border-box",
  },
  actions: {
    display: "flex",
    justifyContent: "space-between",
    marginTop: 8,
  },
  sendBtn: {
    background: "#007bff",
    color: "#fff",
    border: "none",
    borderRadius: 6,
    padding: "8px 20px",
    fontSize: 14,
    cursor: "pointer",
    fontWeight: 500,
  },
  clearBtn: {
    background: "transparent",
    border: "1px solid #ced4da",
    borderRadius: 6,
    padding: "8px 14px",
    fontSize: 13,
    cursor: "pointer",
    color: "#6c757d",
  },
};
