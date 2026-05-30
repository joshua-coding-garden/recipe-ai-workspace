import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

// 全域樣式
const style = document.createElement("style");
style.textContent = `
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
         background: #f0f7f0; color: #1a2e1a; }
  a { text-decoration: none; }
  input, textarea, select, button { font-family: inherit; }
`;
document.head.appendChild(style);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
