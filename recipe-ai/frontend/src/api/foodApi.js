import client from "./client";

export const searchFood = (q, lang = "auto", limit = 20) =>
  client.get("/food/search", { params: { q, lang, limit } }).then((r) => r.data);
