-- 009_memory_tree.sql - 分層記憶樹 (TiMem)
-- level: 0=leaf(單輪), 1=session(會話), 2=daily(日), 3=weekly(週), 4=profile(長期畫像)

CREATE TABLE IF NOT EXISTS memory_tree_nodes (
  id         SERIAL PRIMARY KEY,
  user_id    INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  session_id UUID REFERENCES conversation_sessions(id) ON DELETE SET NULL,
  level      SMALLINT NOT NULL DEFAULT 0,
  parent_id  INT REFERENCES memory_tree_nodes(id) ON DELETE SET NULL,
  content    TEXT NOT NULL DEFAULT '',
  metadata   JSONB NOT NULL DEFAULT '{}',
  token_count INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_memory_tree_updated_at
  BEFORE UPDATE ON memory_tree_nodes
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE INDEX IF NOT EXISTS idx_memory_tree_user_level
  ON memory_tree_nodes(user_id, level);
CREATE INDEX IF NOT EXISTS idx_memory_tree_parent
  ON memory_tree_nodes(parent_id);
CREATE INDEX IF NOT EXISTS idx_memory_tree_session
  ON memory_tree_nodes(session_id);
