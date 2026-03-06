export async function fetchPapersEnriched() {
  const resp = await fetch("/graphrag-api/papers/enriched");
  if (!resp.ok) throw new Error(`HTTP ${resp.status}`);
  return resp.json();
}
