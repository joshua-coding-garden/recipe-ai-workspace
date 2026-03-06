import client from "./client";

export const getDietLogs = () =>
  client.get("/diet/logs").then((r) => r.data);

// 別名保持向後相容
export const listDietLogs = getDietLogs;

export const createDietLog = (data) =>
  client.post("/diet/logs", data).then((r) => r.data);

export const deleteDietLog = (id) =>
  client.delete(`/diet/logs/${id}`).then((r) => r.data);
