const DB_NAME = "advisor_store";
const DB_VERSION = 1;

let dbInstance = null;

function openDB() {
  if (dbInstance) return Promise.resolve(dbInstance);

  return new Promise((resolve, reject) => {
    const req = indexedDB.open(DB_NAME, DB_VERSION);

    req.onupgradeneeded = (e) => {
      const db = e.target.result;

      if (!db.objectStoreNames.contains("sessions")) {
        const s = db.createObjectStore("sessions", { keyPath: "id" });
        s.createIndex("updated_at", "updated_at");
      }

      if (!db.objectStoreNames.contains("messages")) {
        const m = db.createObjectStore("messages", { keyPath: "id", autoIncrement: true });
        m.createIndex("session_id", "session_id");
      }

      if (!db.objectStoreNames.contains("state")) {
        db.createObjectStore("state", { keyPath: "key" });
      }

      if (!db.objectStoreNames.contains("pending")) {
        const p = db.createObjectStore("pending", { keyPath: "id", autoIncrement: true });
        p.createIndex("session_id", "session_id");
      }
    };

    req.onsuccess = (e) => {
      dbInstance = e.target.result;
      dbInstance.onclose = () => { dbInstance = null; };
      resolve(dbInstance);
    };

    req.onerror = () => reject(req.error);
  });
}

function tx(storeName, mode = "readonly") {
  return openDB().then((db) => {
    const t = db.transaction(storeName, mode);
    return t.objectStore(storeName);
  });
}

function reqToPromise(req) {
  return new Promise((resolve, reject) => {
    req.onsuccess = () => resolve(req.result);
    req.onerror = () => reject(req.error);
  });
}

export async function saveMessages(sessionId, messages) {
  const db = await openDB();
  const t = db.transaction("messages", "readwrite");
  const store = t.objectStore("messages");

  const idx = store.index("session_id");
  const existing = await reqToPromise(idx.getAllKeys(sessionId));
  for (const key of existing) {
    store.delete(key);
  }

  const trimmed = messages.slice(-30);
  for (const msg of trimmed) {
    store.add({ ...msg, session_id: sessionId });
  }

  return new Promise((resolve, reject) => {
    t.oncomplete = () => resolve();
    t.onerror = () => reject(t.error);
  });
}

export async function loadMessages(sessionId) {
  const store = await tx("messages");
  const idx = store.index("session_id");
  const all = await reqToPromise(idx.getAll(sessionId));
  return all.map(({ id, session_id, ...rest }) => rest);
}

export async function saveState(key, value) {
  const store = await tx("state", "readwrite");
  return reqToPromise(store.put({ key, value }));
}

export async function loadState(key) {
  const store = await tx("state");
  const row = await reqToPromise(store.get(key));
  return row ? row.value : null;
}

export async function saveSession(session) {
  const store = await tx("sessions", "readwrite");
  return reqToPromise(store.put({
    ...session,
    updated_at: new Date().toISOString(),
  }));
}

export async function listSessions() {
  const store = await tx("sessions");
  const all = await reqToPromise(store.getAll());
  return all.sort((a, b) => (b.updated_at || "").localeCompare(a.updated_at || ""));
}

export async function clearSession(sessionId) {
  const db = await openDB();
  const t = db.transaction(["messages", "sessions", "state", "pending"], "readwrite");

  const msgStore = t.objectStore("messages");
  const msgIdx = msgStore.index("session_id");
  const msgKeys = await reqToPromise(msgIdx.getAllKeys(sessionId));
  for (const k of msgKeys) msgStore.delete(k);

  t.objectStore("sessions").delete(sessionId);

  const pendStore = t.objectStore("pending");
  const pendIdx = pendStore.index("session_id");
  const pendKeys = await reqToPromise(pendIdx.getAllKeys(sessionId));
  for (const k of pendKeys) pendStore.delete(k);

  const stateStore = t.objectStore("state");
  for (const key of ["narrative_memory", "structured_store", "workflow_state", "session_id"]) {
    stateStore.delete(key);
  }

  return new Promise((resolve, reject) => {
    t.oncomplete = () => resolve();
    t.onerror = () => reject(t.error);
  });
}

export async function clearAllState() {
  const store = await tx("state", "readwrite");
  return reqToPromise(store.clear());
}

export function isSupported() {
  return !!window.indexedDB;
}

export async function migrateFromLocalStorage() {
  const keys = {
    advisor_messages: "messages_raw",
    advisor_narrative: "narrative_memory",
    advisor_structured_store: "structured_store",
    advisor_workflow_state: "workflow_state",
    advisor_session_id: "session_id",
  };

  let hasData = false;
  for (const lsKey of Object.keys(keys)) {
    if (localStorage.getItem(lsKey) !== null) {
      hasData = true;
      break;
    }
  }
  if (!hasData) return false;

  const raw = localStorage.getItem("advisor_messages");
  const messages = raw ? JSON.parse(raw) : [];
  const narrative = localStorage.getItem("advisor_narrative") || "";
  const storeRaw = localStorage.getItem("advisor_structured_store");
  const store = storeRaw ? JSON.parse(storeRaw) : {};
  const wsRaw = localStorage.getItem("advisor_workflow_state");
  const ws = wsRaw ? JSON.parse(wsRaw) : {};
  const sid = localStorage.getItem("advisor_session_id") || "";

  if (narrative) await saveState("narrative_memory", narrative);
  if (Object.keys(store).length) await saveState("structured_store", store);
  if (Object.keys(ws).length) await saveState("workflow_state", ws);
  if (sid) {
    await saveState("session_id", sid);
    if (messages.length) await saveMessages(sid, messages);
    await saveSession({ id: sid, title: "", created_at: new Date().toISOString() });
  }

  for (const lsKey of Object.keys(keys)) {
    localStorage.removeItem(lsKey);
  }

  return true;
}
