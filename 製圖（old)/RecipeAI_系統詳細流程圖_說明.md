# Recipe-AI 系統詳細流程圖（16:9）

## 產出檔案

- 主圖（SVG, 1920x1080）：[製圖/RecipeAI_系統詳細流程圖_16x9.svg](製圖/RecipeAI_系統詳細流程圖_16x9.svg)

## LLM 使用狀態（先確認）

目前程式主流程**未啟用外部 LLM**，是規則式與檢索式流程：

- `ai_service` 檔頭註明「純規則解析」：[recipe-ai/control/app/services/ai_service.py](recipe-ai/control/app/services/ai_service.py#L2)
- `extract_keywords` 顯示 `rule-based` 日誌：[recipe-ai/control/app/services/ai_service.py](recipe-ai/control/app/services/ai_service.py#L650)
- `select_best_match` 註解為「無 AI」：[recipe-ai/control/app/services/ai_service.py](recipe-ai/control/app/services/ai_service.py#L753)
- chat 路由固定回傳「AI 功能已停用」：[recipe-ai/control/app/routers/chat.py](recipe-ai/control/app/routers/chat.py#L18)

## 系統主流程摘要

1. 使用者在前端頁面操作（食譜分析/營養/健康）。
2. 前端透過 `/api` 呼叫 control（proxy 轉發）。
3. control 做 JWT 驗證、流程編排（抽取、同義詞、搜尋、營養換算）。
4. control 以 HTTP 呼叫 backend 查詢候選與計算營養。
5. backend 查 PostgreSQL（taiwan_foods / foodb 等），回傳結果。
6. control 回組合結果給前端顯示。

## 主要實作依據

- 服務拓樸（postgres/backend/control/frontend）：[recipe-ai/docker-compose.yml](recipe-ai/docker-compose.yml#L1-L69)
- Control 路由掛載：[recipe-ai/control/main.py](recipe-ai/control/main.py#L59-L66)
- Frontend API baseURL 與 JWT 攔截器：[recipe-ai/frontend/src/api/client.js](recipe-ai/frontend/src/api/client.js#L3-L26)
- Vite proxy `/api -> :8000`：[recipe-ai/frontend/vite.config.js](recipe-ai/frontend/vite.config.js#L7-L15)
- 營養計算 control -> backend aggregate API：[recipe-ai/control/app/services/nutrition_service.py](recipe-ai/control/app/services/nutrition_service.py#L97-L101)
- Backend 食物搜尋與營養端點：[recipe-ai/backend/routers/food.py](recipe-ai/backend/routers/food.py#L1-L164)
