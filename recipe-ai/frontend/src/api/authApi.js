import client from "./client";

export const login = (email, password) =>
  client.post("/auth/login", { email, password }).then((r) => r.data);

export const register = (email, password, name) =>
  client.post("/auth/register", { email, password, name }).then((r) => r.data);

export const getMe = () =>
  client.get("/auth/me").then((r) => r.data);

export const getProfile = () =>
  client.get("/profile").then((r) => r.data);

export const updateProfile = (data) =>
  client.put("/profile", data).then((r) => r.data);
