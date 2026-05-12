-- 011_cognitive_facts.sql - 認知事實三元組 (AgentKeeper)
-- (subject, predicate, object) 格式儲存使用者畫像事實

CREATE TABLE IF NOT EXISTS cognitive_facts (
  id            SERIAL PRIMARY KEY,
  user_id       INT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  subject       VARCHAR(200) NOT NULL,
  predicate     VARCHAR(100) NOT NULL,
  object        TEXT NOT NULL,
  confidence    REAL NOT NULL DEFAULT 1.0,
  source_session UUID REFERENCES conversation_sessions(id) ON DELETE SET NULL,
  is_active     BOOLEAN DEFAULT TRUE,
  superseded_by INT REFERENCES cognitive_facts(id),
  created_at    TIMESTAMP DEFAULT NOW(),
  updated_at    TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE TRIGGER trg_facts_updated_at
  BEFORE UPDATE ON cognitive_facts
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

CREATE INDEX IF NOT EXISTS idx_facts_user_active
  ON cognitive_facts(user_id, is_active);
CREATE INDEX IF NOT EXISTS idx_facts_predicate
  ON cognitive_facts(user_id, predicate);
