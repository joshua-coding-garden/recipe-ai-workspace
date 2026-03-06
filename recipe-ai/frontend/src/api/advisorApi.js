/**
 * advisorApi.js - AI 營養顧問 SSE 串流連線
 */

export function streamAdvisorChat(message, history, userProfile, callbacks, memory = "", workflowState = {}, narrativeMemory = "", structuredStore = {}, sessionId = "", resumeCheckpoint = false) {
  const token = localStorage.getItem("token");
  const controller = new AbortController();

  const body = JSON.stringify({
    message,
    history,
    user_profile: userProfile,
    memory,
    workflow_state: workflowState,
    narrative_memory: narrativeMemory,
    structured_store: structuredStore,
    session_id: sessionId,
    resume_checkpoint: resumeCheckpoint,
  });

  fetch("/api/advisor/chat", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${token}`,
    },
    body,
    signal: controller.signal,
  })
    .then(async (response) => {
      if (!response.ok) {
        const errText = await response.text();
        callbacks.onError?.(`HTTP ${response.status}: ${errText}`);
        return;
      }

      const reader = response.body.getReader();
      const decoder = new TextDecoder();
      let buffer = "";
      let eventType = null;

      while (true) {
        const { done, value } = await reader.read();
        if (done) break;

        buffer += decoder.decode(value, { stream: true });
        const lines = buffer.split("\n");
        buffer = lines.pop() || "";

        for (const line of lines) {
          if (line.startsWith("event: ")) {
            eventType = line.slice(7).trim();
          } else if (line.startsWith("data: ") && eventType) {
            try {
              const data = JSON.parse(line.slice(6));
              switch (eventType) {
                case "thinking":
                  callbacks.onThinking?.(data);
                  break;
                case "thinking_start":
                  callbacks.onThinkingStart?.(data);
                  break;
                case "thinking_delta":
                  callbacks.onThinkingDelta?.(data);
                  break;
                case "thinking_end":
                  callbacks.onThinkingEnd?.(data);
                  break;
                case "echo":
                  callbacks.onEcho?.(data);
                  break;
                case "tool_start":
                  callbacks.onToolStart?.(data);
                  break;
                case "tool_done":
                  callbacks.onToolDone?.(data);
                  break;
                case "tool_result":
                  callbacks.onToolResult?.(data);
                  break;
                case "reply":
                  callbacks.onReply?.(data);
                  break;
                case "memory":
                  callbacks.onMemory?.(data);
                  break;
                case "workflow_state":
                  callbacks.onWorkflowState?.(data);
                  break;
                case "collecting_state":
                  callbacks.onCollectingState?.(data);
                  break;
                case "phase_status":
                  callbacks.onPhaseStatus?.(data);
                  break;
                case "narrative_memory":
                  callbacks.onNarrativeMemory?.(data);
                  break;
                case "structured_store":
                  callbacks.onStructuredStore?.(data);
                  break;
                case "session_id":
                  callbacks.onSessionId?.(data);
                  break;
                case "checkpoint_saved":
                  callbacks.onCheckpointSaved?.(data);
                  break;
                case "recovery_attempt":
                  callbacks.onRecoveryAttempt?.(data);
                  break;
                case "recovery_result":
                  callbacks.onRecoveryResult?.(data);
                  break;
                case "tool_progress":
                  callbacks.onToolProgress?.(data);
                  break;
                case "error":
                  callbacks.onError?.(data.message);
                  break;
              }
            } catch (e) {
              // skip malformed JSON
            }
            eventType = null;
          }
        }
      }

      callbacks.onComplete?.();
    })
    .catch((err) => {
      if (err.name !== "AbortError") {
        callbacks.onError?.(err.message);
      }
    });

  return { abort: () => controller.abort() };
}
