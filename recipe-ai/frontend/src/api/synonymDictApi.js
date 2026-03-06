import client from "./client";

export const listEntries = (language = "", limit = 50, offset = 0) =>
  client.get("/synonym-dict/entries", { params: { language, limit, offset } }).then(r => r.data);

export const getEntry = (canonical) =>
  client.get(`/synonym-dict/entries/${encodeURIComponent(canonical)}`).then(r => r.data);

export const createEntry = (data) =>
  client.post("/synonym-dict/entries", data).then(r => r.data);

export const updateEntry = (canonical, data) =>
  client.put(`/synonym-dict/entries/${encodeURIComponent(canonical)}`, data).then(r => r.data);

export const deleteEntry = (canonical) =>
  client.delete(`/synonym-dict/entries/${encodeURIComponent(canonical)}`).then(r => r.data);

export const lookupSynonym = (term) =>
  client.get("/synonym-dict/lookup", { params: { term } }).then(r => r.data);

export const searchEntries = (q, limit = 20) =>
  client.get("/synonym-dict/search", { params: { q, limit } }).then(r => r.data);

export const getStats = () =>
  client.get("/synonym-dict/stats").then(r => r.data);

export const expandIngredient = (ingredient) =>
  client.post("/synonym-dict/expand", { ingredient }).then(r => r.data);
