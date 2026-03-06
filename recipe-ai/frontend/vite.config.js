import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  server: {
    host: "10.22.22.187",
    port: 3001,
    allowedHosts: ["aiia.csie.ncnu.edu.tw"],
    proxy: {
      // 所有 /api 請求代理到 control/ FastAPI
      "/api": {
        target: "http://localhost:8000",
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ""),
      },
      // GraphRAG API server
      "/graphrag-api": {
        target: "http://localhost:8002",
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/graphrag-api/, ""),
      },
    },
  },
});
