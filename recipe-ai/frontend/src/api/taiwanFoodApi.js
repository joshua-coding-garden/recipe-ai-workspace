import client from "./client";

export const browseTaiwanFoods = (page = 1, limit = 24, search = "", category = "") =>
  client
    .get("/food/taiwan/browse", { params: { page, limit, search, category } })
    .then((r) => r.data);

export const getTaiwanFoodCategories = () =>
  client.get("/food/taiwan/categories").then((r) => r.data);

export const getTaiwanFoodStats = () =>
  client.get("/food/taiwan/stats").then((r) => r.data);

export const getTaiwanFoodDetail = (id) =>
  client.get(`/food/taiwan/${id}`).then((r) => r.data);
