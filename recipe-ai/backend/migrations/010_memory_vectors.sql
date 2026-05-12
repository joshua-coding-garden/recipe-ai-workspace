-- 010_memory_vectors.sql - 記憶樹向量嵌入 (Semvec)
-- 前置：需先安裝 pgvector 擴展

CREATE EXTENSION IF NOT EXISTS vector;

ALTER TABLE memory_tree_nodes
  ADD COLUMN IF NOT EXISTS embedding vector(1024);

CREATE INDEX IF NOT EXISTS idx_memory_tree_embedding
  ON memory_tree_nodes
  USING ivfflat (embedding vector_cosine_ops)
  WITH (lists = 50);
