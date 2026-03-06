import client from "./client";

export const listStopwords = () =>
  client.get("/stopwords").then(r => r.data);

export const createStopword = (word, category = "custom", source_context = null) =>
  client.post("/stopwords", { word, category, source_context }).then(r => r.data);

export const createStopwordsBulk = (words, category = "user_flag", source_context = null) =>
  client.post("/stopwords/bulk", { words, category, source_context }).then(r => r.data);

export const updateStopword = (word, { new_word, category }) =>
  client
    .put(`/stopwords/${encodeURIComponent(word)}`, { new_word, category })
    .then(r => r.data);

export const deleteStopword = (word) =>
  client.delete(`/stopwords/${encodeURIComponent(word)}`).then(r => r.data);
