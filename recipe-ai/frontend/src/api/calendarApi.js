import client from "./client";

export const listEntries = (startDate, endDate) =>
  client
    .get("/calendar/entries", {
      params: { start_date: startDate, end_date: endDate },
    })
    .then((r) => r.data);

export const addEntry = (entryDate, recipeId, servingsOverride = 1) =>
  client
    .post("/calendar/entries", {
      entry_date: entryDate,
      recipe_id: recipeId,
      servings_override: servingsOverride,
    })
    .then((r) => r.data);

export const updateEntry = (entryId, data) =>
  client.put(`/calendar/entries/${entryId}`, data).then((r) => r.data);

export const deleteEntry = (entryId) =>
  client.delete(`/calendar/entries/${entryId}`).then((r) => r.data);
