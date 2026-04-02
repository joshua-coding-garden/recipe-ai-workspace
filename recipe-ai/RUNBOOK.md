# Recipe AI 啟動/關閉操作筆記（Windows + Docker）

這份文件是給自己快速查操作用。

## 實驗室公開 IP 跳板映射（2026-03-31）

目前沒有 public IP，採用「內網 IP + 端口映射」方式掛到實驗室網站下。

- 內網服務位址：http://10.22.22.187:3001
- 對外入口：https://aiia.csie.ncnu.edu.tw:9987
- 對外登入頁：https://aiia.csie.ncnu.edu.tw:9987/pages/login/login.html

驗證重點：

1. `http://10.22.22.187:3001` 可在內網連線。
2. `https://aiia.csie.ncnu.edu.tw:9987` 可正常開啟前端。
3. `https://aiia.csie.ncnu.edu.tw:9987/pages/login/login.html` 可導到登入頁。

Linux 端重跑（本機）：

```bash
cd /home/aiiauser/JM/0325new/recipe-ai
docker-compose up -d --build
docker-compose ps
```

## 1) 啟動服務

在專案根目錄執行：

```powershell
cd C:\Users\jackw\Downloads\0323new\recipe-ai
docker compose up -d
```

如果你有改 Dockerfile 或 compose 設定，改用重建啟動：

```powershell
docker compose up -d --build
```

## 2) 檢查服務是否正常

```powershell
docker compose ps
```

健康檢查網址：

- Frontend: http://localhost:3001
- Control: http://localhost:8000/health
- Backend: http://localhost:8001/health

## 3) 看日誌（排錯用）

全部服務最近日誌：

```powershell
docker compose logs --tail=200
```

只看 control（AI/匹配問題最常看這個）：

```powershell
docker compose logs -f control
```

只看 backend（資料查詢問題）：

```powershell
docker compose logs -f backend
```

backend 寫檔日誌（本機資料夾）：

- 路徑：`backend/logs`
- 主檔名：`backend.log`（每小時輪替）
- 時區：UTC+8（Asia/Taipei）
- 保留策略：僅保留近 3 小時，超出會自動刪除最舊檔案
- 可手動刪除：backend 會在下一次寫入時自動重建

## 4) 停止 / 重啟服務

停止並移除容器（推薦）：

```powershell
docker compose down
```

只暫停（不移除）：

```powershell
docker compose stop
```

恢復暫停容器：

```powershell
docker compose start
```

重啟全部服務：

```powershell
docker compose restart
```

重啟單一服務：

```powershell
docker compose restart control
docker compose restart backend
docker compose restart frontend
```

## 5) 完全釋放 WSL/Docker 記憶體

當你看到工作管理員 `VmmemWSL` 很高時：

1. 先停專案容器

```powershell
docker compose down
```

2. 關閉 Docker Desktop

3. 關閉 WSL VM

```powershell
wsl --shutdown
```

## 6) 目前已知問題備忘

- 若畫面顯示「未找到匹配」，先確認資料表是否有資料。
- 你目前曾遇到 `foods` 與 `taiwan_foods` 筆數為 0 的情況，這會導致所有食材都無法匹配。

快速查詢：

```powershell
docker exec -i recipe_ai_db psql -U postgres -d recipe_ai -c "SELECT COUNT(*) AS taiwan_count FROM taiwan_foods;"
docker exec -i recipe_ai_db psql -U postgres -d recipe_ai -c "SELECT COUNT(*) AS foodb_count FROM foods;"
```

如果都是 0，需先匯入資料，再測匹配功能。

## 7) 匯入 foods/taiwan_foods 原始資料（Windows）

先確認你手邊有兩個檔案：

- foodb.sql
- taiwan_foods_data.sql

把兩個檔案放在同一個資料夾，例如：

- C:\Users\jackw\Downloads\db_source

然後在專案根目錄執行：

```powershell
cd C:\Users\jackw\Downloads\0323new\recipe-ai
$env:RECIPE_AI_OLD_DB = "C:\Users\jackw\Downloads\db_source"
$env:RECIPE_AI_FOODB_SQL = "C:\Users\jackw\Downloads\db_source\foodb.sql"
python scripts\reload_data.py
```

匯入後檢查筆數：

```powershell
docker exec -i recipe_ai_db psql -U postgres -d recipe_ai -c "SELECT COUNT(*) AS taiwan_count FROM taiwan_foods;"
docker exec -i recipe_ai_db psql -U postgres -d recipe_ai -c "SELECT COUNT(*) AS foodb_count FROM foods;"
```

若筆數仍是 0（且確定 SQL 檔案沒問題），可重建資料庫 volume 後再匯入：

```powershell
docker compose down -v
docker compose up -d
$env:RECIPE_AI_OLD_DB = "C:\Users\jackw\Downloads\db_source"
$env:RECIPE_AI_FOODB_SQL = "C:\Users\jackw\Downloads\db_source\foodb.sql"
python scripts\reload_data.py
```

## 8) 食材抓取/匹配/分數診斷日誌（調參必看）

本專案現在有兩層關鍵診斷：

- control: 文字抓取、同義詞展開、候選清單、最終選擇
- backend: 每個候選的分數拆解（sim/contains/exact）

### A. 即時看 control 端診斷

```powershell
docker compose logs -f control
```

建議關鍵字：

- `extract_with_amounts_*`：看文字抓取與合併模式
- `lookup_terms`：看 zh/en 展開詞
- `lookup_tw_top` / `lookup_en_top`：看每個候選與分數
- `calculate_nutrition_*`：看最後送入結算的內容

### B. 看 control JSON 檔案日誌（可回放）

```powershell
docker compose exec control sh -lc "ls -lah /app/logs"
docker compose exec control sh -lc 'tail -n 200 /app/logs/app_$(date +%F).log'
```

### C. 看 backend 候選分數拆解

```powershell
docker compose logs -f backend
```

或直接看 backend 檔案日誌（可回放）：

```powershell
docker compose exec backend sh -lc "ls -lah /app/logs"
docker compose exec backend sh -lc 'tail -n 200 /app/logs/backend.log'
```

Windows 直接看本機 `backend/logs`（推薦，較好閱讀）：

```powershell
Get-Content -Encoding UTF8 -Tail 200 .\backend\logs\backend.log
Get-Content -Encoding UTF8 -Wait .\backend\logs\backend.log
```

建議關鍵字：

- `search_zh_top5`
- `search_en_top5`

你會看到每筆候選的：

- `score`
- `score_parts.sim`
- `score_parts.contains`
- `score_parts.exact`
- `score_parts.formula`（目前為 `0.5*sim + 0.3*contains + 0.2*exact`）

### D. 快速篩選今天關鍵日誌

```powershell
docker compose logs control | Select-String "extract_with_amounts|lookup_terms|lookup_tw_top|lookup_en_top|calculate_nutrition"
docker compose logs backend | Select-String "search_zh_top5|search_en_top5"
```

### E. 比較乾淨的調參視圖（推薦）

```powershell
docker compose logs control | Select-String "extract_with_amounts|UNIT_CONVERT|NUTRI_CALC|lookup_terms|lookup_tw_top|lookup_en_top"
docker compose logs backend | Select-String "search_zh_top5|search_en_top5|AGG_NUTRI"
```

如果你只想看「單位轉換」：

```powershell
docker compose logs control | Select-String "UNIT_CONVERT"
```

## 9) 單位換算表位置（英文與中文）

- 位置：`control/app/services/unit_converter.py`
- 關鍵配置：
	- `VOLUME_UNITS`：杯、tablespoon、teaspoon、ml、cc 等
	- `WEIGHT_UNITS`：g、kg、oz、lb 等
	- `PIECE_WEIGHTS`：顆/片/條 與 tortilla/wrap 等每份重量
	- `DENSITY_G_PER_ML`：液體/部分食材密度
