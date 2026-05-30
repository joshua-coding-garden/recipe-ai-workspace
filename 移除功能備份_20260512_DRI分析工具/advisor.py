"""advisor.py - AI 營養顧問（4-Step LLM Pipeline）

Architecture:
  Step 1 (Echo):     LLM 根據訊息生成確認回應 → 立即 SSE 送出（前台渲染）
  Step 2 (Intent):   LLM 分析對話意圖 → 結構化 JSON（後台分析）
  Step 3 (ToolCall): LLM 根據意圖生成工具參數 → JSON 陣列（後台生成）
  Step 4 (Analysis): LLM 根據工具結果生成分析 → 回覆文字（前台渲染）

每步獨立 prompt，每步最多 20,000 字 context。
"""
import json
import re
import httpx
from dataclasses import dataclass, field as dc_field
from datetime import datetime, date, timedelta
from typing import Any, AsyncGenerator
from fastapi import APIRouter, Depends, Request
from fastapi.responses import StreamingResponse
from pydantic import BaseModel
from loguru import logger

from app.config import settings
from app.middleware.auth_middleware import require_auth

router = APIRouter(prefix="/advisor", tags=["advisor"])

_GEMMA_TIMEOUT = httpx.Timeout(120.0, connect=10.0)
_BACKEND_TIMEOUT = httpx.Timeout(30.0)
_CONTROL_URL = "http://localhost:8000"
_GRAPHRAG_URL = "http://localhost:8002"
_MAX_ROUNDS = 3


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Step 1: Echo Prompt（前台渲染 — 立即回應）
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROMPT_ECHO = """請你根據使用者的訊息和對話脈絡，用繁體中文回應。

## 規則
- 一到兩句話，30-80 字
- 如果使用者的訊息需要查詢工具（記錄飲食、查營養、查症狀等）：概括需求，表達「已收到、正在處理」
- 如果是一般對話（打招呼、感謝、閒聊）：直接給出友善回應
- 不要回答營養問題本身，不要提供營養數據或建議
- 語氣親切自然

## 範例
使用者：「營養夠嗎」
→ 收到，我先查看你的個人資料，再幫你分析今天的營養攝取是否達標。

使用者：「最近常覺得疲勞」
→ 了解，我來查詢與疲勞相關的營養素和推薦食物。

使用者：「為什麼蛋白質對肌肉修復很重要？」
→ 好問題，我來搜尋相關的學術文獻幫你找答案。

使用者：「你好」
→ 你好！我是你的 AI 營養顧問，有什麼飲食或營養問題可以幫你的嗎？

使用者：「謝謝」
→ 不客氣！如果之後有其他營養問題，隨時問我。

---

{memory_block}

對話歷史：
{history}

使用者訊息：{message}

請直接輸出回應（不要加引號或其他格式）："""


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Step 2: Intent Detection Prompt（後台分析 — 結構化意圖）
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROMPT_INTENT = """請你根據對話內容，分析使用者的意圖，輸出嚴格 JSON。

## 可辨識的意圖類型

| intent | 觸發條件 | 需要的 entities |
|--------|----------|-----------------|
| query_dri | 問營養是否充足、DRI 缺口 | age, gender, activity_level（若已知） |
| search_symptom | 提到健康症狀 | symptom_en（英文） |
| search_graphrag | 問「為什麼」、要學術根據 | query_en（英文學術查詢） |
| nutrient_ranking | 問某營養素哪些食物最多 | nutrient_field |
| get_recipes | 查看儲存的食譜 | — |
| get_calendar | 查看行事曆 | start_date, end_date |
| search_food | 問特定食物的營養成分 | food_name |
| browse_food_database | 想瀏覽台灣食品資料庫、問某分類有什麼食物 | search(可選), category(可選) |
| analyze_recipe | 貼食譜文字想分析營養成分 | recipe_text |
| browse_literature | 想看學術論文、列出文獻 | search(可選) |
| get_profile | 查看個人資料 | — |
| update_profile | 更新個人資料 | profile_fields |
| general_chat | 不需要工具的一般對話 | — |

## 症狀翻譯對照
疲勞=fatigue、失眠=insomnia、頭痛=headache、掉髮=hair loss、
便秘=constipation、抽筋=muscle cramp、皮膚差=poor skin health、
貧血=anemia、骨質疏鬆=osteoporosis、免疫力差=weak immunity、
眼睛乾=dry eyes、口角炎=angular cheilitis、水腫=edema

## 營養素欄位名對照
蛋白質=protein_per_100g、鈣=calcium_per_100g、鐵=iron_per_100g、
鋅=zinc_per_100g、鎂=magnesium_per_100g、維生素C=vitamin_c_mg、
膳食纖維=dietary_fiber_per_100g、維生素A=retinol_ug、維生素D=vitamin_d_ug、
維生素E=vitamin_e_mg、鉀=potassium_per_100g、鈉=sodium_per_100g、
熱量=cal_per_100g、碳水化合物=carbon_per_100g、脂肪=fats_per_100g

## 確認詞處理
使用者說「好」「好啊」「可以」「對」「嗯」「幫我查」= 確認上一輪 AI 提議的動作。
請從對話歷史中找出上一輪 AI 建議了什麼，將其轉為對應的 intent。

## 輸出格式
嚴格 JSON（不要用 ``` 包裹，不要加任何其他文字）：
{{
  "intents": ["query_dri"],
  "entities": {{
    "food_name": "",
    "recipe_text": "",
    "search": "",
    "category": "",
    "symptom_en": "",
    "query_en": "",
    "nutrient_field": "",
    "profile_fields": {{}},
    "start_date": "",
    "end_date": "",
    "age": null,
    "gender": "",
    "activity_level": ""
  }},
  "needs_profile": false
}}

## 重要規則
- intents 可以有多個（例如 ["update_profile", "query_dri"]）
- needs_profile = true：當 intent 需要年齡/性別但不知道時（query_dri 且記憶中無此資訊）
- 所有 entities 欄位都可選，沒有的留空字串或 null

## 範例

使用者：「營養夠嗎」
{{"intents":["query_dri"],"entities":{{}},"needs_profile":true}}

使用者：「我25歲女性，幫我看看營養是否充足」
{{"intents":["update_profile","query_dri"],"entities":{{"profile_fields":{{"age":25,"gender":"female"}},"age":25,"gender":"female"}},"needs_profile":false}}

使用者：「最近常覺得疲勞」
{{"intents":["search_symptom"],"entities":{{"symptom_en":"fatigue"}},"needs_profile":false}}

使用者：「為什麼蛋白質對肌肉修復很重要？」
{{"intents":["search_graphrag"],"entities":{{"query_en":"protein importance muscle repair recovery"}},"needs_profile":false}}

使用者：「哪些食物鎂含量最高？」
{{"intents":["nutrient_ranking"],"entities":{{"nutrient_field":"magnesium_per_100g"}},"needs_profile":false}}

使用者：「查看我的食譜」
{{"intents":["get_recipes"],"entities":{{}},"needs_profile":false}}

使用者：「雞胸肉的營養成分是什麼？」
{{"intents":["search_food"],"entities":{{"food_name":"雞胸肉"}},"needs_profile":false}}

使用者：「台灣食品資料庫有什麼水果」
{{"intents":["browse_food_database"],"entities":{{"category":"水果類"}},"needs_profile":false}}

使用者：「幫我分析這個食譜：雞蛋3顆、牛奶200ml」
{{"intents":["analyze_recipe"],"entities":{{"recipe_text":"雞蛋3顆、牛奶200ml"}},"needs_profile":false}}

使用者：「有什麼學術論文」
{{"intents":["browse_literature"],"entities":{{}},"needs_profile":false}}

使用者：「你好」
{{"intents":["general_chat"],"entities":{{}},"needs_profile":false}}

使用者（上一輪 AI 建議查 DRI）：「好」
{{"intents":["query_dri"],"entities":{{}},"needs_profile":true}}

---

{memory_block}

對話歷史：
{history}

{previous_results_block}

使用者最新訊息：{message}

JSON："""


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Step 3: Tool Call Generation Prompt（後台生成 — 工具指令）
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROMPT_TOOLCALL = """請你根據需求分析結果，生成工具呼叫指令。

## 可用工具

| 工具名 | 參數 | 說明 |
|--------|------|------|
| query_dri | age(必填,int), gender(必填,"male"/"female"), activity_level(預設"moderate") | DRI 缺口分析 |
| search_symptom | symptom(必填,英文) | 症狀相關營養素 |
| search_graphrag | query(必填,英文學術詞) | 學術文獻搜尋 |
| get_nutrient_ranking | nutrient_field(必填), top_n(預設10) | 營養素排名 |
| get_saved_recipes | （無參數） | 查詢食譜 |
| get_calendar_entries | start_date(必填,YYYY-MM-DD), end_date(必填) | 行事曆查詢 |
| search_food | food_name(必填) | 搜尋食物營養成分 |
| browse_taiwan_food | search(可選), category(可選) | 瀏覽台灣食品資料庫 |
| analyze_recipe | recipe_text(必填,可用原始訊息) | 分析食譜營養成分 |
| get_literature_papers | search(可選) | 瀏覽學術論文 |
| get_user_profile | （無參數） | 讀取個人資料 |
| update_user_profile | age(int), gender, height_cm, weight_kg, activity_level, goal | 更新個人資料 |

## 規則
- 若 needs_profile 為 true → 輸出 [{{"tool":"get_user_profile","args":{{}}}}]（只做這一步，下一輪再做實際查詢）
- query_dri → 從 entities 或 profile 取得 age/gender，activity_level 預設 "moderate"
- update_profile + query_dri → 先 update_user_profile 再 query_dri（同一批）
- 若完全不需要工具 → 輸出空陣列 []

## 輸出格式
嚴格 JSON 陣列（不要用 ``` 包裹，不要加其他文字）：
[{{"tool":"工具名","args":{{"參數":"值"}}}}]

## 範例

需求：{{"intents":["query_dri"],"needs_profile":true}}
[{{"tool":"get_user_profile","args":{{}}}}]

需求：{{"intents":["query_dri"],"entities":{{"age":25,"gender":"female"}}}}
profile：{{"age":25,"gender":"female","activity_level":"moderate"}}
[{{"tool":"query_dri","args":{{"age":25,"gender":"female","activity_level":"moderate"}}}}]

需求：{{"intents":["update_profile","query_dri"],"entities":{{"profile_fields":{{"age":25,"gender":"female"}},"age":25,"gender":"female"}}}}
[{{"tool":"update_user_profile","args":{{"age":25,"gender":"female"}}}},{{"tool":"query_dri","args":{{"age":25,"gender":"female","activity_level":"moderate"}}}}]

需求：{{"intents":["search_symptom"],"entities":{{"symptom_en":"fatigue"}}}}
[{{"tool":"search_symptom","args":{{"symptom":"fatigue"}}}}]

需求：{{"intents":["search_graphrag"],"entities":{{"query_en":"protein muscle repair"}}}}
[{{"tool":"search_graphrag","args":{{"query":"protein muscle repair"}}}}]

需求：{{"intents":["nutrient_ranking"],"entities":{{"nutrient_field":"magnesium_per_100g"}}}}
[{{"tool":"get_nutrient_ranking","args":{{"nutrient_field":"magnesium_per_100g","top_n":10}}}}]

需求：{{"intents":["search_food"],"entities":{{"food_name":"雞胸肉"}}}}
[{{"tool":"search_food","args":{{"food_name":"雞胸肉"}}}}]

需求：{{"intents":["browse_food_database"],"entities":{{"category":"水果類"}}}}
[{{"tool":"browse_taiwan_food","args":{{"category":"水果類"}}}}]

需求：{{"intents":["analyze_recipe"],"entities":{{"recipe_text":"雞蛋3顆、牛奶200ml"}}}}
[{{"tool":"analyze_recipe","args":{{"recipe_text":"雞蛋3顆、牛奶200ml"}}}}]

需求：{{"intents":["browse_literature"],"entities":{{}}}}
[{{"tool":"get_literature_papers","args":{{}}}}]

需求：{{"intents":["general_chat"]}}
[]

---

需求分析結果：
{intent_json}

使用者個人資料：
{profile_json}

JSON 陣列："""


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Step 4: Analysis Prompt（前台渲染 — 分析回覆）
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROMPT_ANALYSIS = """請你根據工具查詢結果，用繁體中文提供專業營養分析回覆。

## 核心規則
- 所有數據必須來自下方的「工具執行結果」，禁止從訓練資料引用任何營養數字
- 沒有查到相關數據就明確說「目前沒有查到相關數據」
- 禁止使用「根據一般營養學原理」「通常建議」「一般而言」等包裝語句
- 前端已自動渲染工具結果的表格和卡片，你不需要列出原始數據清單
- 你的角色是「分析師」：解讀數據的意義，不是複述數據

## 回覆結構

### 搜尋類工具（search_graphrag / search_symptom / search_food / nutrient_ranking / browse_taiwan_food / get_literature_papers）
前端已渲染完整互動式卡片，使用者可以直接展開查看詳情。你的回覆必須極簡短（2-4 句）：
- 一句說找到什麼（例：「找到 8 篇相關文獻」）
- 一句指出最重要的洞見或結論（例：「研究共識是 3-6 mg/kg 咖啡因可提升耐力表現」）
- 可選一句建議下一步
禁止逐條列出結果、禁止重複標題和數字、禁止超過 100 字。

### 分析類工具（query_dri）
使用三段結構：
① 數據摘要：簡述關鍵數字（例：「共 5 項達標、3 項不足」）
② 分析觀點：指出值得注意的發現
③ 下一步建議：具體可執行的行動

## 特殊情境指引
- DRI 分析後：指出最嚴重的 2-3 個缺口，推薦具體食物來源
- 症狀搜尋後：一句話指出重點化合物，詳細內容由前端卡片展示，不要逐條列出
- **GraphRAG 學術文獻搜尋後（search_graphrag）**：結果中有 `context_text`，這是從學術論文檢索到的原始文本。你必須根據 context_text 的內容，用 3-5 句話綜合回答使用者的問題，引用具體的研究發現和數據。這是你最重要的工作——不是只說「找到幾篇文獻」，而是要提煉文獻中的關鍵結論。前端卡片會顯示來源文獻列表。
- 食物搜尋後：一句話說找到幾筆食物，前端會顯示營養卡片
- 台灣食品資料庫瀏覽後：一句話說找到什麼分類或數量，前端會展示完整列表
- 食譜分析後：簡述總熱量和主要營養素，指出是否均衡
- 學術論文瀏覽後：一句話說論文數量和主題分布，前端會顯示完整論文卡片
- 營養素排名後：一句話說排名結果重點，前端會顯示完整表格

## 重要：搜尋類工具
前端已經自動渲染完整的互動式結果卡片（含圖表、連結、展開詳情）。
- search_graphrag 例外：你必須根據 context_text 做內容綜合分析（3-5 句），這才是學術問答的價值
- 其他搜尋工具（search_symptom/search_food/nutrient_ranking/browse_taiwan_food/get_literature_papers）：2-3 句話指出關鍵洞見即可
禁止逐條列出搜尋結果、禁止重複卡片已顯示的標題和數字。

---

使用者原始問題：{message}

{memory_block}

工具執行結果：
{tool_results}

請用繁體中文輸出分析回覆："""


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Memory Compression Prompt
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

MEMORY_PROMPT = """你是記憶壓縮器。根據舊記憶和這一輪對話，輸出更新後的使用者記憶。

規則：
- 記錄使用者的個人事實（年齡、性別、活動量、目標、飲食內容、健康狀況等）
- 記錄工具查到的關鍵數據（如「DRI 熱量目標 2150kcal」「鎂排名第一：乾海茸芯 899mg/100g」）
- 記錄使用者的飲食日誌摘要（今日已記錄的食物、總熱量等）
- 如果使用者的查詢被中斷或尚未完成，記下來（如「曾想查 DRI 但中斷，尚未提供年齡性別」）
- 新資訊覆蓋舊資訊；已完成的中斷記錄可移除
- 不記 AI 的建議內容，只記使用者的事實和查詢結果
- 用分號分段，條理清晰
- 最多 1000 字"""


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Request Model & Helpers
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class AdvisorRequest(BaseModel):
    message: str
    history: list[dict] = []
    user_profile: dict = {}
    memory: str = ""
    workflow_state: dict = {}


class WorkflowState(BaseModel):
    phase: str = "idle"
    active_intent: str = ""
    collected: dict[str, Any] = {}
    missing: list[str] = []
    pending_intents: list[str] = []
    auto_fetch_done: list[str] = []
    turn_count: int = 0
    interrupted_from: str = ""


@dataclass
class ParamSpec:
    name: str
    type: type
    required: bool = True
    default: Any = None
    profile_key: str | None = None
    ask_zh: str = ""


WORKFLOW_DEFS: dict[str, list[ParamSpec]] = {
    "query_dri": [
        ParamSpec("age", int, required=True, profile_key="age",
                  ask_zh="請問你幾歲呢？我需要年齡來計算建議攝取量。"),
        ParamSpec("gender", str, required=True, profile_key="gender",
                  ask_zh="請問你的性別是？（男性/女性）"),
        ParamSpec("activity_level", str, required=False, default="moderate",
                  profile_key="activity_level"),
    ],
    "search_symptom": [
        ParamSpec("symptom", str, required=True,
                  ask_zh="請問你有什麼症狀？（例如：疲勞、失眠、頭痛）"),
    ],
    "search_graphrag": [
        ParamSpec("query", str, required=True,
                  ask_zh="請問你想查詢什麼營養學主題？"),
    ],
    "nutrient_ranking": [
        ParamSpec("nutrient_field", str, required=True,
                  ask_zh="請問你想查詢哪種營養素的排名？（例如：鈣、鐵、蛋白質）"),
    ],
    "get_recipes": [],
    "get_calendar": [
        ParamSpec("start_date", str, required=True,
                  ask_zh="請問你要查看哪段時間的行事曆？（例如：這週、上個月）"),
        ParamSpec("end_date", str, required=True),
    ],
    "get_profile": [],
    "update_profile": [],
    "search_food": [
        ParamSpec("food_name", str, required=True,
                  ask_zh="請問你想查詢哪種食物的營養成分？"),
    ],
    "browse_food_database": [
        ParamSpec("search", str, required=False, default=""),
        ParamSpec("category", str, required=False, default=""),
    ],
    "analyze_recipe": [
        ParamSpec("recipe_text", str, required=True,
                  ask_zh="請提供你想分析的食譜內容（包含食材和份量）。"),
    ],
    "browse_literature": [
        ParamSpec("search", str, required=False, default=""),
    ],
}

_INTENT_TO_TOOL: dict[str, str] = {
    "query_dri": "query_dri",
    "search_food": "search_food",
    "browse_food_database": "browse_taiwan_food",
    "analyze_recipe": "analyze_recipe",
    "browse_literature": "get_literature_papers",
    "search_symptom": "search_symptom",
    "search_graphrag": "search_graphrag",
    "nutrient_ranking": "get_nutrient_ranking",
    "get_recipes": "get_saved_recipes",
    "get_calendar": "get_calendar_entries",
    "get_profile": "get_user_profile",
    "update_profile": "update_user_profile",
}


def _sse_event(event_type: str, data: dict) -> str:
    return f"event: {event_type}\ndata: {json.dumps(data, ensure_ascii=False)}\n\n"


def _strip_thinking(text: str) -> str:
    text = re.sub(r"<think>.*?</think>", "", text, flags=re.DOTALL)
    return text.strip()


async def _call_gemma(messages: list[dict], temperature: float = 0.3,
                      max_tokens: int = 4096) -> str:
    payload = {
        "model": settings.gemma_model_name,
        "messages": messages,
        "temperature": temperature,
        "max_tokens": max_tokens,
    }
    async with httpx.AsyncClient(timeout=_GEMMA_TIMEOUT) as client:
        resp = await client.post(settings.gemma_url, json=payload)
        resp.raise_for_status()
    data = resp.json()
    content = data.get("choices", [{}])[0].get("message", {}).get("content", "")
    return _strip_thinking(content)


def _parse_llm_json(text: str):
    text = text.strip()
    if text.startswith("```"):
        lines = text.split("\n")
        end = len(lines) - 1 if lines[-1].strip().startswith("```") else len(lines)
        text = "\n".join(lines[1:end]).strip()
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        pass
    for start_c, end_c in [("{", "}"), ("[", "]")]:
        start = text.find(start_c)
        end = text.rfind(end_c)
        if start != -1 and end > start:
            try:
                return json.loads(text[start:end + 1])
            except json.JSONDecodeError:
                continue
    return None


def _headers(token: str) -> dict:
    return {"Authorization": f"Bearer {token}"} if token else {}


def _format_history(history: list[dict], limit: int = 8) -> str:
    lines = []
    for msg in history[-limit:]:
        role = "使用者" if msg.get("role") == "user" else "AI"
        content = (msg.get("content") or "")[:400]
        lines.append(f"{role}：{content}")
    return "\n".join(lines) if lines else "（無歷史對話）"


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Validation — Pure Validator Functions
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

def _has_cjk(text: str) -> bool:
    return any("一" <= c <= "鿿" for c in text)


def _coerce_type(value, expected_type, arg_name: str, corrections: list[str]):
    if isinstance(expected_type, tuple):
        if isinstance(value, expected_type):
            return value
        target = expected_type[0]
    else:
        if isinstance(value, expected_type):
            return value
        target = expected_type
    try:
        if target == int:
            coerced = int(float(value))
        elif target == float:
            coerced = float(value)
        elif target == str:
            coerced = str(value)
        else:
            return value
        corrections.append(f"coerced {arg_name}: {type(value).__name__}->{target.__name__}")
        return coerced
    except (ValueError, TypeError):
        return value


def _try_fill_missing_args(tool_name: str, args: dict, missing: list[str],
                           intent: dict, profile: dict) -> list[str]:
    entities = intent.get("entities", {})
    filled: list[str] = []
    _entity_sources = {
        "food_name": ["food_name"], "symptom": ["symptom_en"],
        "query": ["query_en"], "nutrient_field": ["nutrient_field"],
        "log_id": ["log_id"], "age": ["age"], "gender": ["gender"],
        "start_date": ["start_date"], "end_date": ["end_date"],
    }
    for arg in missing:
        for src in _entity_sources.get(arg, [arg]):
            val = entities.get(src)
            if val:
                args[arg] = val
                filled.append(arg)
                break
        if arg not in args or not args[arg]:
            if arg in profile and profile[arg]:
                args[arg] = profile[arg]
                filled.append(arg)
    return filled


def _validate_intent_result(result: dict) -> tuple[dict, list[str]]:
    corrections: list[str] = []

    if "intents" not in result:
        result["intents"] = ["general_chat"]
        corrections.append("missing intents -> general_chat")
    if "entities" not in result:
        result["entities"] = {}
        corrections.append("missing entities -> {}")

    raw = result["intents"]
    valid = [i for i in raw if i in _VALID_INTENTS]
    removed = set(raw) - set(valid)
    if removed:
        corrections.append(f"removed invalid intents: {removed}")
    if not valid:
        valid = ["general_chat"]
        corrections.append("no valid intents -> general_chat")

    action = [i for i in valid if i != "general_chat"]
    if action and "general_chat" in valid:
        valid = action
        corrections.append("dropped general_chat (conflicts with action)")

    result["intents"] = valid
    ent = result["entities"]

    if "search_symptom" in valid:
        sym = ent.get("symptom_en", "")
        if sym and _has_cjk(sym):
            translated = _SYMPTOM_ZH_TO_EN.get(sym)
            if translated:
                ent["symptom_en"] = translated
                corrections.append(f"symptom '{sym}'->'{translated}'")

    if "nutrient_ranking" in valid:
        nf = ent.get("nutrient_field", "")
        if nf:
            resolved = _NUTRIENT_ZH_TO_FIELD.get(nf) or _NUTRIENT_FIELD_ALIASES.get(nf)
            if resolved:
                corrections.append(f"nutrient '{nf}'->'{resolved}'")
                ent["nutrient_field"] = resolved

    if "needs_profile" not in result:
        result["needs_profile"] = False

    return result, corrections


def _validate_toolcalls(tool_calls: list[dict], intent: dict,
                        profile: dict) -> tuple[list[dict], list[str]]:
    corrections: list[str] = []
    validated: list[dict] = []
    seen: set[str] = set()

    for tc in tool_calls:
        name = tc.get("tool", "")
        args = dict(tc.get("args", {}))

        if name not in _TOOL_DISPATCH:
            corrections.append(f"unknown tool '{name}'")
            continue

        required = _TOOL_REQUIRED_ARGS.get(name, [])
        missing = [r for r in required if not args.get(r)]
        if missing:
            _try_fill_missing_args(name, args, missing, intent, profile)
            still = [r for r in required if not args.get(r)]
            if still:
                corrections.append(f"dropped '{name}': missing {still}")
                continue
            corrections.append(f"filled args for '{name}': {missing}")

        if name == "update_user_profile" and not args:
            corrections.append("dropped update_user_profile: no fields")
            continue

        for arg_name, exp_type in _TOOL_ARG_TYPES.get(name, {}).items():
            if arg_name in args:
                args[arg_name] = _coerce_type(args[arg_name], exp_type, arg_name, corrections)

        if name == "get_nutrient_ranking":
            nf = args.get("nutrient_field", "")
            resolved = _NUTRIENT_ZH_TO_FIELD.get(nf) or _NUTRIENT_FIELD_ALIASES.get(nf)
            if resolved:
                corrections.append(f"nutrient '{nf}'->'{resolved}'")
                args["nutrient_field"] = resolved

        if name == "search_symptom":
            sym = args.get("symptom", "")
            if _has_cjk(sym):
                translated = _SYMPTOM_ZH_TO_EN.get(sym)
                if translated:
                    args["symptom"] = translated
                    corrections.append(f"symptom '{sym}'->'{translated}'")

        sig = json.dumps({"tool": name, "args": args}, sort_keys=True)
        if sig in seen:
            corrections.append(f"dedup '{name}'")
            continue
        seen.add(sig)

        validated.append({"tool": name, "args": args})

    return validated, corrections


_MIN_ANALYSIS_LEN = 50

def _validate_analysis(text: str) -> tuple[str, bool, list[str]]:
    corrections: list[str] = []
    needs_retry = False
    stripped = text.strip()
    if len(stripped) < _MIN_ANALYSIS_LEN:
        needs_retry = True
        corrections.append(f"too short ({len(stripped)} chars)")
    return text, needs_retry, corrections


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Validation — Deterministic ToolCall Generator
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

def _system_generate_toolcalls(intent: dict, profile: dict) -> list[dict] | None:
    intents = intent.get("intents", [])
    ent = intent.get("entities", {})

    if intent.get("needs_profile"):
        return [{"tool": "get_user_profile", "args": {}}]

    if intents == ["general_chat"]:
        return []
    if intents == ["get_profile"]:
        return [{"tool": "get_user_profile", "args": {}}]
    if intents == ["get_recipes"]:
        return [{"tool": "get_saved_recipes", "args": {}}]

    if intents == ["search_symptom"] and ent.get("symptom_en"):
        return [{"tool": "search_symptom", "args": {"symptom": ent["symptom_en"]}}]
    if intents == ["search_graphrag"] and ent.get("query_en"):
        return [{"tool": "search_graphrag", "args": {"query": ent["query_en"]}}]
    if intents == ["nutrient_ranking"] and ent.get("nutrient_field"):
        return [{"tool": "get_nutrient_ranking",
                 "args": {"nutrient_field": ent["nutrient_field"], "top_n": 10}}]

    if intents == ["get_calendar"] and ent.get("start_date") and ent.get("end_date"):
        return [{"tool": "get_calendar_entries",
                 "args": {"start_date": ent["start_date"], "end_date": ent["end_date"]}}]

    if intents == ["query_dri"]:
        age = ent.get("age") or profile.get("age")
        gender = ent.get("gender") or profile.get("gender")
        if age and gender:
            return [{"tool": "query_dri", "args": {
                "age": age, "gender": gender,
                "activity_level": ent.get("activity_level") or profile.get("activity_level", "moderate"),
            }}]

    if set(intents) == {"update_profile", "query_dri"}:
        calls = []
        pf = ent.get("profile_fields", {})
        if pf:
            calls.append({"tool": "update_user_profile", "args": pf})
        age = (pf.get("age") if pf else None) or ent.get("age") or profile.get("age")
        gender = (pf.get("gender") if pf else None) or ent.get("gender") or profile.get("gender")
        if age and gender:
            calls.append({"tool": "query_dri", "args": {
                "age": age, "gender": gender,
                "activity_level": ent.get("activity_level", "moderate"),
            }})
        return calls if calls else None

    if intents == ["search_food"] and ent.get("food_name"):
        return [{"tool": "search_food", "args": {"food_name": ent["food_name"]}}]

    if intents == ["browse_food_database"]:
        args = {}
        if ent.get("search"):
            args["search"] = ent["search"]
        if ent.get("category"):
            args["category"] = ent["category"]
        return [{"tool": "browse_taiwan_food", "args": args}]

    if intents == ["analyze_recipe"]:
        recipe_text = ent.get("recipe_text", "")
        if recipe_text:
            return [{"tool": "analyze_recipe", "args": {"recipe_text": recipe_text}}]
        return None

    if intents == ["browse_literature"]:
        args = {}
        if ent.get("search"):
            args["search"] = ent["search"]
        return [{"tool": "get_literature_papers", "args": args}]

    return None


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# LLM Pipeline Steps
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

async def _step_echo(message: str, history: list[dict], memory: str) -> str:
    memory_block = f"使用者記憶：{memory}" if memory else "使用者記憶：（新對話，尚無記憶）"
    prompt = PROMPT_ECHO.format(
        message=message,
        history=_format_history(history),
        memory_block=memory_block,
    )
    try:
        result = await _call_gemma(
            [{"role": "user", "content": prompt}],
            temperature=0.5, max_tokens=128,
        )
        return result or "收到，正在處理你的問題..."
    except Exception as e:
        logger.warning("Echo step failed: {}", str(e))
        return "收到，正在處理你的問題..."


_PROMPT_INTENT_RETRY = """上次回應格式不正確。請只輸出嚴格 JSON，不要加任何其他文字。

使用者訊息：{message}

可用 intent: query_dri, search_food, browse_food_database, analyze_recipe, browse_literature, search_symptom, search_graphrag, nutrient_ranking, get_recipes, get_calendar, get_profile, update_profile, general_chat

輸出格式：
{{"intents":["intent"],"entities":{{}},"needs_profile":false}}

JSON："""


async def _step_intent(message: str, history: list[dict], memory: str,
                       previous_results: list[dict] | None = None) -> dict | None:
    memory_block = f"使用者記憶：{memory}" if memory else ""
    prev_block = ""
    if previous_results:
        prev_text = json.dumps(previous_results, ensure_ascii=False)[:5000]
        prev_block = f"上一輪工具結果（供參考）：\n{prev_text}"
    full_prompt = PROMPT_INTENT.format(
        message=message,
        history=_format_history(history, limit=8),
        memory_block=memory_block,
        previous_results_block=prev_block,
    )

    for attempt in range(2):
        prompt = full_prompt if attempt == 0 else _PROMPT_INTENT_RETRY.format(message=message)
        try:
            text = await _call_gemma(
                [{"role": "user", "content": prompt}],
                temperature=0.1, max_tokens=512,
            )
            result = _parse_llm_json(text)
            if not isinstance(result, dict):
                logger.warning("Intent attempt {}: not dict, raw={}", attempt + 1, text[:200])
                continue

            result, corrections = _validate_intent_result(result)
            if corrections:
                logger.info("Intent corrections({}): {}", attempt + 1, corrections)

            if result.get("intents"):
                logger.info("Intent parsed({}): {}", attempt + 1,
                            json.dumps(result, ensure_ascii=False)[:200])
                return result
        except Exception as e:
            logger.error("Intent attempt {} failed: {}", attempt + 1, str(e))
    return None


async def _step_toolcall(intent: dict, profile: dict) -> tuple[list[dict], list[str]]:
    all_corrections: list[str] = []

    sys_calls = _system_generate_toolcalls(intent, profile)
    if sys_calls is not None:
        validated, v_corr = _validate_toolcalls(sys_calls, intent, profile)
        all_corrections.extend(v_corr)
        all_corrections.append("system-generated (no LLM)")
        logger.info("ToolCall system: {}", [tc["tool"] for tc in validated])
        return validated, all_corrections

    prompt = PROMPT_TOOLCALL.format(
        intent_json=json.dumps(intent, ensure_ascii=False),
        profile_json=json.dumps(profile, ensure_ascii=False) if profile else "（尚未取得）",
    )

    for attempt in range(2):
        try:
            text = await _call_gemma(
                [{"role": "user", "content": prompt}],
                temperature=0.1, max_tokens=512,
            )
            result = _parse_llm_json(text)
            if not isinstance(result, list):
                logger.warning("ToolCall attempt {}: not list, raw={}", attempt + 1, text[:200])
                continue

            raw = [{"tool": tc["tool"], "args": tc.get("args", {})}
                   for tc in result if isinstance(tc, dict) and "tool" in tc]

            validated, v_corr = _validate_toolcalls(raw, intent, profile)
            all_corrections.extend(v_corr)

            if validated:
                logger.info("ToolCall parsed({}): {}", attempt + 1,
                            [tc["tool"] for tc in validated])
                return validated, all_corrections
            logger.warning("ToolCall attempt {}: all invalid", attempt + 1)
        except Exception as e:
            logger.error("ToolCall attempt {} failed: {}", attempt + 1, str(e))

    all_corrections.append("LLM toolcall failed")
    return [], all_corrections


async def _step_analysis(message: str, memory: str,
                         tool_results: list[dict]) -> tuple[str, list[str]]:
    all_corrections: list[str] = []
    memory_block = f"使用者記憶：{memory}" if memory else ""
    results_text = json.dumps(tool_results, ensure_ascii=False)[:12000]
    base_prompt = PROMPT_ANALYSIS.format(
        message=message,
        memory_block=memory_block,
        tool_results=results_text,
    )

    for attempt in range(2):
        prompt = base_prompt
        if attempt == 1:
            prompt += "\n\n（請用更詳細的方式分析，至少包含數據摘要、分析觀點和下一步建議。）"
        try:
            result = await _call_gemma(
                [{"role": "user", "content": prompt}],
                temperature=0.3, max_tokens=2048,
            )
            if not result:
                all_corrections.append(f"empty reply (attempt {attempt + 1})")
                continue

            text, needs_retry, v_corr = _validate_analysis(result)
            all_corrections.extend(v_corr)

            if not needs_retry or attempt == 1:
                return text, all_corrections
            logger.info("Analysis too short ({}), retrying", len(text.strip()))
        except Exception as e:
            logger.error("Analysis attempt {} failed: {}", attempt + 1, str(e))
            all_corrections.append(f"exception: {str(e)}")

    return "工具已執行完成，請查看上方的結果卡片。", all_corrections


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Tool Implementations
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

async def _execute_tool(name: str, arguments: dict, auth_token: str = "",
                        user_message: str = "") -> dict:
    try:
        fn = _TOOL_DISPATCH.get(name)
        if not fn:
            return {"error": f"Unknown tool: {name}"}
        return await fn(arguments, auth_token, user_message)
    except Exception as e:
        logger.error("Tool {} failed: {}", name, str(e))
        return {"error": f"工具執行失敗: {str(e)}"}


def _extract_nutrition_from_memory(memory: str) -> dict:
    if not memory:
        return {}
    intake = {}
    patterns = {
        "cal_per_100g": [r"熱量\s*[:：]?\s*(\d+\.?\d*)\s*(?:kcal|大卡)", r"calories?\s*[:：]?\s*(\d+\.?\d*)"],
        "protein_per_100g": [r"蛋白質\s*[:：]?\s*(\d+\.?\d*)\s*g", r"protein\s*[:：]?\s*(\d+\.?\d*)"],
        "carbon_per_100g": [r"碳水\S*\s*[:：]?\s*(\d+\.?\d*)\s*g", r"carbs?\s*[:：]?\s*(\d+\.?\d*)"],
        "fats_per_100g": [r"脂肪\s*[:：]?\s*(\d+\.?\d*)\s*g", r"fat\s*[:：]?\s*(\d+\.?\d*)"],
        "dietary_fiber_per_100g": [r"(?:膳食)?纖維\s*[:：]?\s*(\d+\.?\d*)\s*g", r"fiber\s*[:：]?\s*(\d+\.?\d*)"],
    }
    for field, pats in patterns.items():
        for pat in pats:
            m = re.search(pat, memory, re.IGNORECASE)
            if m:
                val = float(m.group(1))
                if val > 0:
                    intake[field] = intake.get(field, 0) + val
                break
    return intake


async def _tool_query_dri(args, token, user_msg):
    from app.services.dri_gap_service import analyze_dri_gap

    daily_intake = args.get("daily_intake", {})

    memory_text = args.pop("_memory", "")
    if not daily_intake:
        memory_intake = _extract_nutrition_from_memory(memory_text)
        if memory_intake:
            for k, v in memory_intake.items():
                daily_intake[k] = daily_intake.get(k, 0) + v
            logger.info("DRI: injected nutrition from memory: {}", memory_intake)

    if not daily_intake and token:
        try:
            async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
                resp = await c.get(f"{_CONTROL_URL}/diet/logs", headers=_headers(token))
                if resp.status_code == 200:
                    today = date.today().isoformat()
                    for log in resp.json():
                        logged = (log.get("logged_at") or "")[:10]
                        if logged == today or not logged:
                            nd = log.get("nutrition_detail") or {}
                            for k, v in nd.items():
                                if isinstance(v, (int, float)) and v > 0:
                                    daily_intake[k] = daily_intake.get(k, 0) + v
        except Exception as e:
            logger.warning("Auto-fetch diet logs for DRI failed: {}", str(e))

    result = await analyze_dri_gap(
        age=args.get("age", 30),
        sex=args.get("gender", "male"),
        daily_intake=daily_intake,
    )
    if "error" in result:
        return result
    gaps = result.get("gaps", [])
    return {
        "profile": result.get("profile", ""),
        "anthropometry": result.get("anthropometry"),
        "gaps": [{
            "nutrient_zh": g.get("nutrient_zh", ""),
            "unit": g.get("unit", ""),
            "target": g.get("target", 0),
            "actual": g.get("actual", 0),
            "ratio": g.get("ratio", 0),
            "deficit": g.get("deficit", 0),
            "status": g.get("status", ""),
            "recommended_foods": [{
                "name": f.get("name", ""),
                "content_per_100g": f.get("content_per_100g"),
                "source": f.get("source", ""),
                "unit": f.get("unit", ""),
            } for f in g.get("recommended_foods", [])[:5]],
        } for g in gaps],
    }


_NUTRIENT_FIELD_ALIASES = {
    "magnesium_mg": "magnesium_per_100g", "iron_mg": "iron_per_100g",
    "calcium_mg": "calcium_per_100g", "zinc_mg": "zinc_per_100g",
    "potassium_mg": "potassium_per_100g", "sodium_mg": "sodium_per_100g",
    "protein_g": "protein_per_100g", "fiber_g": "dietary_fiber_per_100g",
    "magnesium": "magnesium_per_100g", "iron": "iron_per_100g",
    "calcium": "calcium_per_100g", "zinc": "zinc_per_100g",
}


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# System Validation — Lookup Tables
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

_VALID_INTENTS: set[str] = {
    "query_dri", "search_food", "browse_food_database", "analyze_recipe",
    "browse_literature", "search_symptom", "search_graphrag", "nutrient_ranking",
    "get_recipes", "get_calendar", "get_profile", "update_profile", "general_chat",
}


def _build_symptom_map() -> dict[str, str]:
    import pathlib
    path = pathlib.Path(__file__).resolve().parent.parent.parent / "resources" / "symptom_mapping.json"
    mapping: dict[str, str] = {}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        for zh_key, info in data.items():
            en_primary = info["en"][0] if info.get("en") else zh_key
            mapping[zh_key] = en_primary
            for syn in info.get("synonyms", []):
                mapping[syn] = en_primary
    except Exception:
        mapping = {
            "疲勞": "fatigue", "失眠": "insomnia", "頭痛": "headache",
            "掉髮": "hair loss", "便秘": "constipation", "抽筋": "muscle cramp",
            "皮膚差": "poor skin health", "貧血": "anemia",
            "骨質疏鬆": "osteoporosis", "免疫力差": "weak immunity",
            "眼睛乾": "dry eyes", "口角炎": "angular cheilitis", "水腫": "edema",
        }
    return mapping


_SYMPTOM_ZH_TO_EN: dict[str, str] = _build_symptom_map()


def _build_nutrient_zh_map() -> dict[str, str]:
    import pathlib
    path = pathlib.Path(__file__).resolve().parent.parent.parent / "resources" / "hpa_dri_v8.json"
    mapping: dict[str, str] = {}
    try:
        data = json.loads(path.read_text(encoding="utf-8"))
        for field in data.get("fields", []):
            mapping[field["label_zh"]] = field["key"]
    except Exception:
        pass
    mapping.update({
        "蛋白質": "protein_per_100g", "鈣": "calcium_per_100g",
        "鐵": "iron_per_100g", "鋅": "zinc_per_100g",
        "鎂": "magnesium_per_100g", "維生素C": "vitamin_c_mg",
        "膳食纖維": "dietary_fiber_per_100g", "維生素A": "retinol_equivalent_ug",
        "維生素D": "vitamin_d_total_ug", "維生素E": "alpha_vitamin_e_te_mg",
        "鉀": "potassium_per_100g", "鈉": "sodium_per_100g",
        "熱量": "cal_per_100g", "碳水化合物": "carbon_per_100g",
        "脂肪": "fats_per_100g",
    })
    return mapping


_NUTRIENT_ZH_TO_FIELD: dict[str, str] = _build_nutrient_zh_map()

_TOOL_REQUIRED_ARGS: dict[str, list[str]] = {
    "query_dri": ["age", "gender"],
    "search_food": ["food_name"],
    "browse_taiwan_food": [],
    "analyze_recipe": ["recipe_text"],
    "get_literature_papers": [],
    "search_symptom": ["symptom"],
    "search_graphrag": ["query"],
    "get_nutrient_ranking": ["nutrient_field"],
    "get_user_profile": [],
    "get_saved_recipes": [],
    "get_calendar_entries": ["start_date", "end_date"],
    "update_user_profile": [],
}

_TOOL_ARG_TYPES: dict[str, dict[str, type]] = {
    "query_dri": {"age": int},
    "get_nutrient_ranking": {"top_n": int},
}


async def _tool_get_nutrient_ranking(args, token, user_msg):
    field = _NUTRIENT_FIELD_ALIASES.get(args.get("nutrient_field", ""), args.get("nutrient_field", ""))
    top_n = args.get("top_n", 10)
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.get(f"{_CONTROL_URL}/health/nutrients/{field}/top-foods",
                           params={"limit": top_n})
        if resp.status_code == 200:
            return {"nutrient": field, "top_foods": resp.json()[:top_n]}
        return {"error": f"Nutrient ranking failed: {resp.status_code} for '{field}'"}


async def _tool_search_symptom(args, token, user_msg):
    symptom_en = args.get("symptom", "")
    zh_candidates = re.findall(r"[一-鿿]{2,6}", user_msg or "")

    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        best_data = None
        best_score = 0

        for keyword in zh_candidates + [symptom_en]:
            if not keyword:
                continue
            resp = await c.post(f"{_CONTROL_URL}/health/symptom-search",
                                json={"keyword": keyword})
            if resp.status_code != 200:
                continue
            data = resp.json()
            score = len(data.get("effects", [])) + len(data.get("recommendations", []))
            if score > best_score:
                best_score = score
                best_data = data
            if score > 0:
                break

        if not best_data:
            best_data = {"effects": [], "recommendations": []}

        return {
            "symptom": best_data.get("matched_symptom", "") or symptom_en,
            "effects": best_data.get("effects", [])[:8],
            "recommendations": best_data.get("recommendations", [])[:10],
        }


async def _tool_search_graphrag(args, token, user_msg):
    try:
        async with httpx.AsyncClient(timeout=httpx.Timeout(60.0)) as c:
            resp = await c.post(f"{_GRAPHRAG_URL}/retrieve-only",
                                json={"query": args.get("query", ""), "methods": ["B", "C"]})
            if resp.status_code != 200:
                return {"error": f"GraphRAG failed: {resp.status_code}"}
            raw = resp.json()
            sources = []
            seen_ids = set()
            context_parts = []
            for method_key in ["B", "C"]:
                method_data = raw.get(method_key, {})
                ctx = method_data.get("context_preview", "")
                if ctx:
                    context_parts.append(ctx)
                for src in method_data.get("sources", []):
                    src_type = src.get("type", "")
                    if src_type == "community_report":
                        cid = src.get("community_id", "")
                        if cid in seen_ids:
                            continue
                        seen_ids.add(cid)
                        sources.append({
                            "type": "community_report",
                            "community_id": cid,
                            "title": src.get("title", ""),
                            "summary": src.get("summary", "")[:600],
                            "key_entities": src.get("key_entities", [])[:8],
                            "practical_implications": src.get("practical_implications", "")[:300],
                        })
                    else:
                        doc_id = src.get("doc_id", "")
                        if not doc_id or doc_id in seen_ids:
                            continue
                        seen_ids.add(doc_id)
                        item = {
                            "type": src_type or "paper",
                            "doc_id": doc_id,
                            "chunk_id": src.get("chunk_id", ""),
                            "page": src.get("page"),
                            "text_preview": src.get("text_preview", "")[:800],
                            "paper_meta": src.get("paper_meta") or {},
                            "figures": src.get("figures", [])[:5],
                            "extra_highlights": src.get("extra_highlights", [])[:3],
                        }
                        sources.append(item)
            combined_context = "\n\n".join(context_parts)[:3000]
            return {
                "query": args.get("query", ""),
                "sources": sources[:10],
                "context_text": combined_context,
            }
    except httpx.ConnectError:
        return {"error": "GraphRAG 服務未啟動（port 8002）"}


# --- 食譜、行事曆、個人資料 ---

async def _tool_get_saved_recipes(args, token, user_msg):
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.get(f"{_CONTROL_URL}/recipe/list", headers=_headers(token))
        if resp.status_code != 200:
            return {"error": f"Failed: {resp.status_code}"}
        recipes = resp.json()
        trimmed = []
        for r in recipes[:20]:
            nd = r.get("nutrition_detail") or r.get("nutrition") or {}
            trimmed.append({
                "id": r.get("id"),
                "name": r.get("name"),
                "servings": r.get("servings"),
                "created_at": r.get("created_at"),
                "ingredients": [
                    ing.get("ingredient_name", "") for ing in (r.get("ingredients") or [])[:10]
                ],
                "nutrition": {
                    "calories": nd.get("calories") or nd.get("cal_per_100g"),
                    "protein": nd.get("protein") or nd.get("protein_per_100g"),
                    "carbs": nd.get("carbs") or nd.get("carbon_per_100g"),
                    "fat": nd.get("fat") or nd.get("fats_per_100g"),
                    "fiber": nd.get("fiber") or nd.get("dietary_fiber_per_100g"),
                },
            })
        return {"recipes": trimmed, "total": len(recipes)}


async def _tool_get_calendar_entries(args, token, user_msg):
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.get(f"{_CONTROL_URL}/calendar/entries",
                           params={"start_date": args.get("start_date", ""),
                                   "end_date": args.get("end_date", "")},
                           headers=_headers(token))
        if resp.status_code == 200:
            return {"entries": resp.json()[:30]}
        return {"error": f"Failed: {resp.status_code}"}


async def _tool_get_user_profile(args, token, user_msg):
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.get(f"{_CONTROL_URL}/profile", headers=_headers(token))
        if resp.status_code == 200:
            return resp.json()
        return {"error": f"Failed: {resp.status_code}"}


async def _tool_update_user_profile(args, token, user_msg):
    payload = {k: v for k, v in args.items() if v is not None}
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.put(f"{_CONTROL_URL}/profile", json=payload, headers=_headers(token))
        if resp.status_code == 200:
            return {"success": True, "profile": resp.json()}
        return {"error": f"Failed: {resp.status_code}"}


async def _tool_search_food(args, token, user_msg):
    food_name = args.get("food_name", "")
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.get(f"{_CONTROL_URL}/food/search",
                           params={"q": food_name, "lang": "auto", "limit": 8})
        if resp.status_code != 200:
            return {"error": f"Food search failed: {resp.status_code}"}
        data = resp.json()
        candidates = data.get("candidates", data) if isinstance(data, dict) else data
        results = []
        for item in candidates[:8]:
            matches = item.get("candidates") or item.get("matches") or [item]
            for m in matches[:2]:
                nut = m.get("nutrition") or {}
                results.append({
                    "id": m.get("id"),
                    "name": m.get("name") or m.get("food_name", ""),
                    "category": m.get("category", ""),
                    "source": m.get("source", ""),
                    "nutrition": {
                        "calories": nut.get("calories") or m.get("cal_per_100g"),
                        "protein": nut.get("protein") or m.get("protein_per_100g"),
                        "carbs": nut.get("carbs") or m.get("carbon_per_100g"),
                        "fat": nut.get("fat") or m.get("fats_per_100g"),
                        "fiber": nut.get("fiber") or m.get("dietary_fiber_per_100g"),
                    },
                })
        return {"food_name": food_name, "results": results[:8]}


async def _tool_browse_taiwan_food(args, token, user_msg):
    params = {"limit": 10}
    if args.get("search"):
        params["search"] = args["search"]
    if args.get("category"):
        params["category"] = args["category"]
    async with httpx.AsyncClient(timeout=_BACKEND_TIMEOUT) as c:
        resp = await c.get(f"{_CONTROL_URL}/food/taiwan/browse", params=params)
        if resp.status_code != 200:
            return {"error": f"Browse Taiwan foods failed: {resp.status_code}"}
        data = resp.json()
        foods = data.get("foods", [])
        trimmed = []
        for f in foods[:10]:
            trimmed.append({
                "id": f.get("id"),
                "food_name": f.get("food_name", ""),
                "category": f.get("category", ""),
                "cal_per_100g": f.get("cal_per_100g"),
                "protein_per_100g": f.get("protein_per_100g"),
                "carbon_per_100g": f.get("carbon_per_100g"),
                "fats_per_100g": f.get("fats_per_100g"),
                "dietary_fiber_per_100g": f.get("dietary_fiber_per_100g"),
            })
        return {
            "foods": trimmed,
            "search": args.get("search", ""),
            "category": args.get("category", ""),
            "pagination": data.get("pagination", {}),
        }


async def _tool_analyze_recipe(args, token, user_msg):
    recipe_text = args.get("recipe_text") or user_msg or ""
    if not recipe_text.strip():
        return {"error": "未提供食譜內容"}
    import re as _re
    recipe_text = _re.sub(r"[、，,;；]\s*", "\n", recipe_text)
    try:
        async with httpx.AsyncClient(timeout=httpx.Timeout(60.0)) as c:
            resp1 = await c.post(f"{_CONTROL_URL}/recipe/extract-with-amounts",
                                 json={"recipe_text": recipe_text}, headers=_headers(token))
            if resp1.status_code != 200:
                return {"error": f"食材提取失敗: {resp1.status_code}"}
            extract_data = resp1.json()
            ingredients = extract_data.get("ingredients", [])
            if not ingredients:
                return {"error": "未能從食譜中提取到任何食材"}

            ingredient_names = [
                ing.get("name") or ing.get("ingredient", "") for ing in ingredients
            ]
            resp2 = await c.post(f"{_CONTROL_URL}/recipe/lookup",
                                 json={"ingredients": ingredient_names, "top_n": 1},
                                 headers=_headers(token))
            if resp2.status_code != 200:
                return {"error": f"食材匹配失敗: {resp2.status_code}"}
            lookup_data = resp2.json()

            calc_items = []
            for i, result in enumerate(lookup_data.get("results", [])):
                matches = result.get("matches", [])
                if not matches:
                    continue
                m = matches[0]
                best = m.get("tw") or m.get("en") or m if isinstance(m, dict) else {}
                if not best or not best.get("id"):
                    continue
                orig = ingredients[i] if i < len(ingredients) else {}
                amount = orig.get("amount", "")
                grams = orig.get("grams")
                calc_items.append({
                    "food_id": best.get("id", 0),
                    "source": best.get("source", "taiwan_foods"),
                    "food_name": best.get("name") or best.get("food_name", ""),
                    "amount": str(amount) if amount else "",
                    "grams": grams,
                })
            if not calc_items:
                return {
                    "ingredients": [{"name": n, "matched": False} for n in ingredient_names],
                    "total": {}, "item_count": 0,
                }

            resp3 = await c.post(f"{_CONTROL_URL}/recipe/calculate-nutrition",
                                 json={"ingredients": calc_items}, headers=_headers(token))
            if resp3.status_code != 200:
                return {"error": f"營養計算失敗: {resp3.status_code}"}
            nutrition_data = resp3.json()
            items = nutrition_data.get("items", [])
            total = nutrition_data.get("total", {})

            ingredient_summary = []
            for item in items:
                nutr = item.get("nutrition", {})
                ingredient_summary.append({
                    "name": item.get("food_name") or item.get("input_food_name", ""),
                    "amount": item.get("input_amount") or item.get("amount", ""),
                    "grams": item.get("grams"),
                    "calories": nutr.get("cal_per_100g"),
                    "protein": nutr.get("protein_per_100g"),
                    "carbs": nutr.get("carbon_per_100g"),
                    "fat": nutr.get("fats_per_100g"),
                    "fiber": nutr.get("dietary_fiber_per_100g"),
                    "sodium": nutr.get("sodium_per_100g"),
                    "calcium": nutr.get("calcium_per_100g"),
                    "iron": nutr.get("iron_per_100g"),
                })
            return {
                "recipe_text": recipe_text[:200],
                "ingredients": ingredient_summary,
                "total": {
                    "calories": total.get("cal_per_100g") or total.get("calories"),
                    "protein": total.get("protein_per_100g") or total.get("protein"),
                    "carbs": total.get("carbon_per_100g") or total.get("carbs"),
                    "fat": total.get("fats_per_100g") or total.get("fat"),
                    "fiber": total.get("dietary_fiber_per_100g") or total.get("fiber"),
                    "sodium": total.get("sodium_per_100g"),
                    "calcium": total.get("calcium_per_100g"),
                    "iron": total.get("iron_per_100g"),
                    "zinc": total.get("zinc_per_100g"),
                    "vitamin_c": total.get("vitamin_c_mg"),
                    "vitamin_b1": total.get("vitamin_b1_mg"),
                    "vitamin_b2": total.get("vitamin_b2_mg"),
                },
                "item_count": len(items),
            }
    except httpx.ConnectError:
        return {"error": "後端服務未啟動"}
    except Exception as e:
        logger.error("analyze_recipe failed: {}", str(e))
        return {"error": f"食譜分析失敗: {str(e)[:100]}"}


async def _tool_get_literature_papers(args, token, user_msg):
    try:
        async with httpx.AsyncClient(timeout=httpx.Timeout(30.0)) as c:
            resp = await c.get(f"{_GRAPHRAG_URL}/papers/enriched")
            if resp.status_code != 200:
                return {"error": f"GraphRAG papers API failed: {resp.status_code}"}
            all_papers = resp.json()
            search = (args.get("search") or "").lower().strip()
            papers = []
            for doc_id, info in all_papers.items():
                kc_raw = info.get("key_contributions", "")
                kc_text = " ".join(kc_raw) if isinstance(kc_raw, list) else str(kc_raw or "")
                if search:
                    searchable = " ".join([
                        info.get("title", ""), info.get("topic", ""),
                        info.get("journal", ""), kc_text,
                    ]).lower()
                    if search not in searchable:
                        continue
                if isinstance(kc_raw, list):
                    kc_out = kc_raw[:3]
                else:
                    kc_out = str(kc_raw or "")[:300]
                papers.append({
                    "doc_id": doc_id,
                    "title": info.get("title", ""),
                    "journal": info.get("journal", ""),
                    "year": info.get("year"),
                    "impact_factor": info.get("impact_factor"),
                    "sjr_quartile": info.get("sjr_quartile", ""),
                    "study_type": info.get("study_type", ""),
                    "citation_count": info.get("citation_count"),
                    "key_contributions": kc_out,
                    "doi": info.get("doi", ""),
                    "topic": info.get("topic", ""),
                })
            papers.sort(key=lambda p: (-(p.get("year") or 0), -(p.get("impact_factor") or 0)))
            return {"papers": papers[:20], "total": len(papers), "search": search}
    except httpx.ConnectError:
        return {"error": "GraphRAG 服務未啟動（port 8002）"}
    except Exception as e:
        logger.error("get_literature_papers failed: {}", str(e))
        return {"error": f"論文查詢失敗: {str(e)[:100]}"}


_TOOL_DISPATCH = {
    "query_dri": _tool_query_dri,
    "get_nutrient_ranking": _tool_get_nutrient_ranking,
    "search_food": _tool_search_food,
    "browse_taiwan_food": _tool_browse_taiwan_food,
    "analyze_recipe": _tool_analyze_recipe,
    "get_literature_papers": _tool_get_literature_papers,
    "search_symptom": _tool_search_symptom,
    "search_graphrag": _tool_search_graphrag,
    "get_saved_recipes": _tool_get_saved_recipes,
    "get_calendar_entries": _tool_get_calendar_entries,
    "get_user_profile": _tool_get_user_profile,
    "update_user_profile": _tool_update_user_profile,
}


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Memory Compression
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

async def _compress_memory(old_memory: str, user_msg: str, reply_content: str,
                           tools_used: list[str], interrupted_from: str = "") -> str:
    tools_info = f"（本輪使用工具：{', '.join(tools_used)}）" if tools_used else ""
    interrupt_info = f"（本輪中斷了先前的查詢：{interrupted_from}）" if interrupted_from else ""
    prompt = (
        f"{MEMORY_PROMPT}\n\n"
        f"舊記憶：{old_memory or '（空）'}\n"
        f"本輪使用者說：{user_msg[:500]}\n"
        f"本輪AI回覆摘要：{reply_content[:800]}\n"
        f"{tools_info}\n"
        f"{interrupt_info}\n"
        f"請輸出更新後的記憶（最多1000字）："
    )
    try:
        content = await _call_gemma(
            [{"role": "user", "content": prompt}],
            temperature=0.2, max_tokens=1024,
        )
        return content.strip()[:1500]
    except Exception as e:
        logger.error("Memory compression failed: {}", str(e))
        return old_memory


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Workflow State Machine — Flow Controller
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

def _detect_interruption(message: str, ws: WorkflowState) -> bool:
    text = message.strip()
    if text in ("好", "好啊", "可以", "對", "嗯", "是", "ok", "OK", "好的"):
        return False
    for param_name in ws.missing:
        if param_name == "age" and re.search(r"\d{1,3}\s*歲?", text):
            return False
        if param_name == "gender" and re.search(r"男|女|male|female", text, re.IGNORECASE):
            return False
        if param_name == "activity_level" and re.search(r"高|中|低|運動|久坐", text):
            return False
        if param_name in ("food_name", "symptom", "query", "nutrient_field"):
            if len(text) < 30:
                return False
        if param_name in ("start_date", "end_date") and re.search(r"這週|上週|本週|本月|今天|\d{4}", text):
            return False
        if param_name == "recipe_text":
            if re.search(r"\d+\s*(g|ml|克|毫升|顆|杯|匙)", text) or len(text) > 10:
                return False
        if param_name in ("search", "category") and len(text) < 30:
            return False
    abandon = re.search(r"算了|跳過|不要了|沒關係|忘了|取消", text)
    if abandon:
        return True
    new_intent = re.search(r"幫我記錄|我吃了|幫我查|幫我看|幫我搜|幫我刪|幫我改", text)
    if new_intent:
        return True
    return False


def _extract_params_deterministic(message: str, missing: list[str],
                                  intent: str) -> dict[str, Any]:
    result: dict[str, Any] = {}
    text = message.strip()

    if "age" in missing:
        m = re.search(r"(\d{1,3})\s*歲", text)
        if m:
            result["age"] = int(m.group(1))
        else:
            m2 = re.search(r"(\d{1,3})", text)
            if m2:
                num = int(m2.group(1))
                if 1 <= num <= 120:
                    result["age"] = num

    if "gender" in missing:
        if re.search(r"女性|女生|女", text):
            result["gender"] = "female"
        elif re.search(r"男性|男生|男", text):
            result["gender"] = "male"

    if "activity_level" in missing:
        if re.search(r"高|常運動|健身|重訓", text):
            result["activity_level"] = "high"
        elif re.search(r"低|不運動|久坐|少動", text):
            result["activity_level"] = "low"
        elif re.search(r"中|偶爾運動|一般", text):
            result["activity_level"] = "moderate"

    if "food_name" in missing:
        if len(text) < 30 and not re.search(r"[？?]", text):
            result["food_name"] = text

    if "symptom" in missing:
        for zh, en in _SYMPTOM_ZH_TO_EN.items():
            if zh in text:
                result["symptom"] = en
                break
        if "symptom" not in result and len(text) < 20:
            result["symptom"] = text

    if "nutrient_field" in missing:
        for zh, field_name in _NUTRIENT_ZH_TO_FIELD.items():
            if zh in text:
                result["nutrient_field"] = field_name
                break

    if "recipe_text" in missing:
        if re.search(r"\d+\s*(g|ml|克|毫升|顆|杯|匙|碗|片|條)", text):
            result["recipe_text"] = text
        elif len(text) > 10 and not re.search(r"^(幫我|請|查|什麼|為什麼)", text):
            result["recipe_text"] = text

    if "category" in missing:
        _CAT_MAP = {
            "水果": "水果類", "蔬菜": "蔬菜類", "乳品": "乳品類", "穀物": "穀物類",
            "肉": "肉類", "魚": "魚貝類", "蛋": "蛋類", "豆": "豆類",
            "油脂": "油脂類", "堅果": "堅果種子類", "飲料": "飲料類", "調味": "調味料類",
        }
        for zh, cat_name in _CAT_MAP.items():
            if zh in text:
                result["category"] = cat_name
                break

    if "search" in missing:
        if len(text) < 20 and not re.search(r"[？?]|有什麼|列出|瀏覽|查看", text):
            result["search"] = text

    if "start_date" in missing or "end_date" in missing:
        today = date.today()
        if "今天" in text:
            result["start_date"] = today.isoformat()
            result["end_date"] = today.isoformat()
        elif "這週" in text or "本週" in text:
            start = today - timedelta(days=today.weekday())
            result["start_date"] = start.isoformat()
            result["end_date"] = today.isoformat()
        elif "上週" in text:
            start = today - timedelta(days=today.weekday() + 7)
            end = today - timedelta(days=today.weekday() + 1)
            result["start_date"] = start.isoformat()
            result["end_date"] = end.isoformat()
        elif "這個月" in text or "本月" in text:
            result["start_date"] = today.replace(day=1).isoformat()
            result["end_date"] = today.isoformat()

    return result


PROMPT_EXTRACT_PARAMS = """從使用者訊息中提取以下欄位的值。
只輸出嚴格 JSON，不要加其他文字。找不到的欄位填 null。

需要提取的欄位：
{fields_desc}

使用者訊息：{message}

JSON："""

_PARAM_DESCRIPTIONS: dict[str, str] = {
    "age": "年齡（整數）",
    "gender": "性別（輸出 male 或 female）",
    "activity_level": "活動量（high / moderate / low）",
    "food_name": "食物名稱（中文或英文）",
    "recipe_text": "食譜文字（包含食材和份量）",
    "search": "搜尋關鍵字",
    "category": "食物分類名稱（如「水果類」「乳品類」）",
    "symptom": "症狀（英文，如 fatigue, insomnia, headache）",
    "query": "學術查詢（英文）",
    "nutrient_field": "營養素欄位名（如 protein_per_100g, calcium_per_100g）",
    "start_date": "開始日期（YYYY-MM-DD 格式）",
    "end_date": "結束日期（YYYY-MM-DD 格式）",
}


async def _extract_params_llm(message: str, missing: list[str],
                               intent: str) -> dict[str, Any]:
    fields_desc = "\n".join(
        f"- {p}: {_PARAM_DESCRIPTIONS.get(p, p)}" for p in missing
    )
    prompt = PROMPT_EXTRACT_PARAMS.format(fields_desc=fields_desc, message=message)
    try:
        text = await _call_gemma(
            [{"role": "user", "content": prompt}],
            temperature=0.1, max_tokens=128,
        )
        parsed = _parse_llm_json(text)
        if isinstance(parsed, dict):
            return {k: v for k, v in parsed.items() if v is not None and k in missing}
    except Exception as e:
        logger.warning("Focused extraction LLM failed: {}", str(e))
    return {}


def _calc_missing(intent: str, collected: dict) -> list[str]:
    specs = WORKFLOW_DEFS.get(intent, [])
    return [s.name for s in specs if s.required and not collected.get(s.name)]


def _prefill_from_entities(ws: WorkflowState, entities: dict, intent: str):
    _entity_map = {
        "age": "age", "gender": "gender", "activity_level": "activity_level",
        "food_name": "food_name", "recipe_text": "recipe_text",
        "search": "search", "category": "category",
        "symptom_en": "symptom", "query_en": "query",
        "nutrient_field": "nutrient_field",
        "start_date": "start_date", "end_date": "end_date",
    }
    for entity_key, param_name in _entity_map.items():
        val = entities.get(entity_key)
        if val and param_name not in ws.collected:
            ws.collected[param_name] = val
    pf = entities.get("profile_fields", {})
    if isinstance(pf, dict):
        for k, v in pf.items():
            if v and k not in ws.collected:
                ws.collected[k] = v


def _prefill_from_profile(ws: WorkflowState, profile: dict, intent: str):
    specs = WORKFLOW_DEFS.get(intent, [])
    for spec in specs:
        if spec.profile_key and spec.name not in ws.collected:
            val = profile.get(spec.profile_key)
            if val:
                ws.collected[spec.name] = val


async def _auto_fetch_profile_if_needed(
    intent: str, remaining: list[str], ws: WorkflowState, auth_token: str
) -> dict | None:
    specs = WORKFLOW_DEFS.get(intent, [])
    needs_profile = any(s.profile_key and s.name in remaining for s in specs)
    if needs_profile and "profile" not in ws.auto_fetch_done:
        ws.auto_fetch_done.append("profile")
        result = await _execute_tool("get_user_profile", {}, auth_token, "")
        if "error" not in result:
            return result
    return None


def _build_ask_message(intent: str, missing: list[str]) -> str:
    specs = WORKFLOW_DEFS.get(intent, [])
    spec_map = {s.name: s for s in specs}
    questions = [spec_map[p].ask_zh for p in missing
                 if p in spec_map and spec_map[p].ask_zh]
    if not questions:
        return "請提供更多資訊，讓我完成這項查詢。"
    if len(questions) == 1:
        return questions[0]
    return "為了完成查詢，我需要以下資訊：\n" + "\n".join(f"• {q}" for q in questions)


def _build_tool_calls_from_state(intent: str, collected: dict,
                                 entities: dict) -> list[dict]:
    if intent == "update_profile":
        pf = collected.get("profile_fields") or entities.get("profile_fields", {})
        if pf:
            return [{"tool": "update_user_profile", "args": pf}]
        return []

    tool_name = _INTENT_TO_TOOL.get(intent)
    if not tool_name:
        return []

    specs = WORKFLOW_DEFS.get(intent, [])
    args: dict[str, Any] = {}
    for spec in specs:
        if spec.name in collected:
            args[spec.name] = collected[spec.name]
        elif spec.default is not None:
            args[spec.name] = spec.default
    if intent == "nutrient_ranking":
        args.setdefault("top_n", 10)

    return [{"tool": tool_name, "args": args}]


async def _flow_controller(
    message: str, history: list[dict], memory: str,
    ws: WorkflowState, profile_data: dict, auth_token: str,
) -> AsyncGenerator[str, None]:
    """
    Yields SSE events. Updates ws in-place.
    Sets ws._flow_result with tool_results and tools_used when execution completes.
    """
    # ── Branch A: Active collection ──
    if ws.phase == "collecting":
        if _detect_interruption(message, ws):
            logger.info("Workflow interrupted: {} -> new intent", ws.active_intent)
            missing_zh = ", ".join(ws.missing) if ws.missing else ""
            ws.interrupted_from = f"{ws.active_intent}（缺 {missing_zh}）" if missing_zh else ws.active_intent
            ws.phase = "idle"
            ws.active_intent = ""
            ws.collected = {}
            ws.missing = []
            ws.turn_count = 0
            # Fall through to Branch B
        else:
            ws.turn_count += 1
            extracted = _extract_params_deterministic(message, ws.missing, ws.active_intent)
            if not extracted and ws.missing:
                extracted = await _extract_params_llm(message, ws.missing, ws.active_intent)
            for k, v in extracted.items():
                if v is not None:
                    ws.collected[k] = v
            ws.missing = _calc_missing(ws.active_intent, ws.collected)
            logger.info("Workflow collect turn={} extracted={} missing={}",
                        ws.turn_count, list(extracted.keys()), ws.missing)
            if not ws.missing:
                ws.phase = "ready"
            elif ws.turn_count >= 3:
                yield _sse_event("reply", {
                    "content": "抱歉，我無法取得所需資訊。請提供完整資料後再試一次。"
                })
                ws.phase = "idle"
                ws.active_intent = ""
                ws.collected = {}
                ws.missing = []
                return
            else:
                ask_text = _build_ask_message(ws.active_intent, ws.missing)
                yield _sse_event("reply", {"content": ask_text})
                return

    # ── Branch B: Idle — detect intent ──
    if ws.phase in ("idle", "done"):
        yield _sse_event("thinking", {"status": "analyzing"})
        intent = await _step_intent(message, history, memory)
        logger.info("FlowCtrl intent: {}",
                    json.dumps(intent, ensure_ascii=False)[:200] if intent else "None")

        if not intent or intent.get("intents") == ["general_chat"]:
            ws.phase = "idle"
            return
        intents = intent.get("intents", [])
        if not intents:
            ws.phase = "idle"
            return

        entities = intent.get("entities", {})
        current_intent = intents[0]
        ws.pending_intents = intents[1:] if len(intents) > 1 else []
        ws.active_intent = current_intent
        ws.collected = {}
        ws.turn_count = 0
        ws.auto_fetch_done = []

        _prefill_from_entities(ws, entities, current_intent)
        _prefill_from_profile(ws, profile_data, current_intent)

        remaining = _calc_missing(current_intent, ws.collected)
        if remaining:
            fetched_profile = await _auto_fetch_profile_if_needed(
                current_intent, remaining, ws, auth_token,
            )
            if fetched_profile:
                _prefill_from_profile(ws, fetched_profile, current_intent)
                profile_data.update(fetched_profile)

        ws.missing = _calc_missing(current_intent, ws.collected)
        if ws.missing:
            ws.phase = "collecting"
            ask_text = _build_ask_message(current_intent, ws.missing)
            yield _sse_event("reply", {"content": ask_text})
            return
        else:
            ws.phase = "ready"

    # ── Branch C: Ready — execute tools ──
    if ws.phase == "ready":
        ws.phase = "executing"
        entities = {}  # entities already absorbed into collected

        all_tool_results: list[dict] = []
        tools_used: list[str] = []

        # Process current intent
        tool_calls = _build_tool_calls_from_state(ws.active_intent, ws.collected, ws.collected)
        for tc in tool_calls:
            tool_name = tc["tool"]
            tool_args = tc.get("args", {})
            if tool_name == "query_dri":
                tool_args["_memory"] = memory
            yield _sse_event("tool_start", {"name": tool_name, "args": tool_args})
            result = await _execute_tool(tool_name, tool_args, auth_token, message)
            summary = _summarize_result(tool_name, result)
            yield _sse_event("tool_result", {"name": tool_name, "data": result})
            yield _sse_event("tool_done", {"name": tool_name, "summary": summary})
            tools_used.append(tool_name)
            all_tool_results.append({"tool": tool_name, "result": result})
            if tool_name == "get_user_profile" and "error" not in result:
                profile_data.update(result)

        # Process pending intents if they can execute immediately
        while ws.pending_intents:
            next_intent = ws.pending_intents.pop(0)
            ws.active_intent = next_intent
            prev_collected = dict(ws.collected)
            ws.collected = {}
            for spec in WORKFLOW_DEFS.get(next_intent, []):
                if spec.name in prev_collected:
                    ws.collected[spec.name] = prev_collected[spec.name]
            _prefill_from_profile(ws, profile_data, next_intent)
            if _calc_missing(next_intent, ws.collected):
                break
            next_calls = _build_tool_calls_from_state(next_intent, ws.collected, ws.collected)
            for tc in next_calls:
                tool_name = tc["tool"]
                tool_args = tc.get("args", {})
                if tool_name == "query_dri":
                    tool_args["_memory"] = memory
                yield _sse_event("tool_start", {"name": tool_name, "args": tool_args})
                result = await _execute_tool(tool_name, tool_args, auth_token, message)
                summary = _summarize_result(tool_name, result)
                yield _sse_event("tool_result", {"name": tool_name, "data": result})
                yield _sse_event("tool_done", {"name": tool_name, "summary": summary})
                tools_used.append(tool_name)
                all_tool_results.append({"tool": tool_name, "result": result})

        ws.phase = "done"
        ws.collected = {}
        ws.missing = []
        ws.active_intent = ""

        # Attach results to ws for the main endpoint to use
        ws._tool_results = all_tool_results  # type: ignore[attr-defined]
        ws._tools_used = tools_used  # type: ignore[attr-defined]


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Main Endpoint
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

@router.post("/chat")
async def advisor_chat(body: AdvisorRequest, request: Request,
                       user: dict = Depends(require_auth)):
    logger.info("advisor_chat user={} msg={} hist={} mem={} ws_phase={}",
                user["sub"], len(body.message), len(body.history), len(body.memory),
                body.workflow_state.get("phase", "idle"))
    auth_header = request.headers.get("authorization", "")
    auth_token = auth_header.replace("Bearer ", "") if auth_header.startswith("Bearer ") else ""

    try:
        ws = WorkflowState(**body.workflow_state) if body.workflow_state else WorkflowState()
    except Exception:
        ws = WorkflowState()

    async def event_stream():
        nonlocal ws
        profile_data: dict = {}

        # ── Step 1: Echo（蒐集階段跳過）──
        if ws.phase != "collecting":
            yield _sse_event("thinking", {"status": "understanding"})
            echo_text = await _step_echo(body.message, body.history, body.memory)
            yield _sse_event("echo", {"content": echo_text})
            logger.info("Step1 Echo: {}", echo_text[:80])
        else:
            echo_text = ""

        # ── Flow Controller（取代 Steps 2+3 loop）──
        flow_replied = False
        all_tool_results: list[dict] = []
        tools_used: list[str] = []

        async for event in _flow_controller(
            body.message, body.history, body.memory, ws, profile_data, auth_token,
        ):
            if '"content"' in event and "event: reply" in event:
                flow_replied = True
            yield event

        # Retrieve tool results attached by flow controller
        all_tool_results = getattr(ws, "_tool_results", [])
        tools_used = getattr(ws, "_tools_used", [])

        # ── Step 4: Analysis（前台渲染）──
        if all_tool_results and not flow_replied:
            yield _sse_event("thinking", {"status": "composing"})
            reply_content, analysis_corrections = await _step_analysis(
                body.message, body.memory, all_tool_results,
            )
            logger.info("Step4 Analysis: {}...", reply_content[:80])
            if analysis_corrections:
                yield _sse_event("validation", {
                    "step": "analysis", "corrections": analysis_corrections,
                })
            yield _sse_event("reply", {"content": reply_content})
        elif not flow_replied:
            reply_content = echo_text
            if reply_content:
                yield _sse_event("reply", {"content": reply_content})
        else:
            reply_content = ""

        # ── Memory Compression（蒐集階段跳過，省 LLM call）──
        if all_tool_results or (flow_replied and ws.phase != "collecting"):
            yield _sse_event("thinking", {"status": "compressing_memory"})
            new_memory = await _compress_memory(
                body.memory, body.message, reply_content, tools_used,
                interrupted_from=ws.interrupted_from,
            )
            logger.info("Memory: {}", new_memory[:100])
            yield _sse_event("memory", {"summary": new_memory})

        # ── Always emit workflow_state ──
        ws_data = ws.model_dump()
        for k in ("_tool_results", "_tools_used"):
            ws_data.pop(k, None)
        yield _sse_event("workflow_state", ws_data)

    return StreamingResponse(
        event_stream(),
        media_type="text/event-stream",
        headers={"Cache-Control": "no-cache", "X-Accel-Buffering": "no"},
    )


# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Helpers
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

def _summarize_result(tool_name: str, result: dict) -> str:
    if "error" in result:
        return f"⚠️ {result['error'][:50]}"
    summaries = {
        "query_dri": lambda r: f"取得 {r.get('profile', '')} 的 DRI（{sum(1 for g in r.get('gaps', []) if g.get('status') == 'deficient')} 項缺口）",
        "search_symptom": lambda r: f"找到 {len(r.get('effects', []))} 個效果、{len(r.get('recommendations', []))} 個推薦",
        "search_graphrag": lambda r: f"找到 {len(r.get('sources', []))} 篇文獻",
        "get_nutrient_ranking": lambda r: f"取得前 {len(r.get('top_foods', []))} 名",
        "search_food": lambda r: f"找到 {len(r.get('results', []))} 筆食物",
        "browse_taiwan_food": lambda r: f"找到 {r.get('pagination', {}).get('total', len(r.get('foods', [])))} 筆台灣食品",
        "analyze_recipe": lambda r: f"分析完成（{r.get('item_count', len(r.get('ingredients', [])))} 種食材）",
        "get_literature_papers": lambda r: f"找到 {r.get('total', len(r.get('papers', [])))} 篇論文",
        "get_saved_recipes": lambda r: f"取得 {r.get('total', 0)} 份食譜",
        "get_calendar_entries": lambda r: f"取得 {len(r.get('entries', []))} 筆",
        "get_user_profile": lambda r: f"個人資料（{r.get('gender', '')} {r.get('age', '')}歲）",
        "update_user_profile": lambda r: "個人資料已更新",
    }
    fn = summaries.get(tool_name)
    return fn(result) if fn else "完成"
