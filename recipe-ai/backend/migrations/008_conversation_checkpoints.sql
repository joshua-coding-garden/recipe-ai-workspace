-- ==================== 008: 對話會話 + 檢查點 ====================
-- Phase 1: Checkpoint/Restore — 讓中斷的對話能從精確斷點恢復

-- conversation_sessions: 對話會話容器
CREATE TABLE IF NOT EXISTS conversation_sessions (
  id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id    INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title      VARCHAR(200) DEFAULT '',
  is_active  BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_sessions_updated_at
  BEFORE UPDATE ON conversation_sessions
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE INDEX IF NOT EXISTS idx_sessions_user_active
  ON conversation_sessions(user_id, is_active);

-- conversation_checkpoints: 每輪對話結束後的狀態快照
CREATE TABLE IF NOT EXISTS conversation_checkpoints (
  id                 SERIAL PRIMARY KEY,
  session_id         UUID NOT NULL REFERENCES conversation_sessions(id) ON DELETE CASCADE,
  user_id            INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  turn_index         INT NOT NULL DEFAULT 0,
  phase              VARCHAR(20) NOT NULL DEFAULT 'idle',
  workflow_state     JSONB NOT NULL DEFAULT '{}',
  pending_tool_calls JSONB NOT NULL DEFAULT '[]',
  completed_results  JSONB NOT NULL DEFAULT '[]',
  narrative_memory   TEXT NOT NULL DEFAULT '',
  structured_store   JSONB NOT NULL DEFAULT '{}',
  message_history    JSONB NOT NULL DEFAULT '[]',
  created_at         TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_checkpoint_session
  ON conversation_checkpoints(session_id, turn_index DESC);
CREATE INDEX IF NOT EXISTS idx_checkpoint_user
  ON conversation_checkpoints(user_id);
