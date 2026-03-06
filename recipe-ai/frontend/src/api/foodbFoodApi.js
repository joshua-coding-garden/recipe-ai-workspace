import client from "./client";

export const getFoodbFoodDetail = (id, compoundLimit = 50) =>
  client
    .get(`/food/foodb/${id}`, { params: { compound_limit: compoundLimit } })
    .then((r) => r.data);
