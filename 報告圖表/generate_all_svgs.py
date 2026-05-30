#!/usr/bin/env python3
"""
Generate 9 SVG diagrams for the Recipe AI Advisor technical report.
All text in Traditional Chinese where appropriate.
Uses svgwrite library.
"""

import svgwrite
import os

OUTPUT_DIR = os.path.dirname(os.path.abspath(__file__))

# ── Shared constants ──────────────────────────────────────────────
BLUE = "#4A90D9"
GREEN = "#50C878"
ORANGE = "#F5A623"
RED = "#E74C3C"
PURPLE = "#9B59B6"
TEAL = "#1ABC9C"
LIGHT_GRAY = "#F7F8FA"
MID_GRAY = "#E0E0E0"
DARK_TEXT = "#2C3E50"
WHITE = "#FFFFFF"
FONT = '"Microsoft JhengHei", "PingFang TC", "Noto Sans TC", sans-serif'
W = 1000
RX = 8
ARROW_STROKE = 2
PAD = 20  # padding inside boxes


def _marker(dwg, color=DARK_TEXT, marker_id="arrow"):
    """Add an arrowhead marker definition to the drawing."""
    marker = dwg.marker(
        id=marker_id, insert=(10, 5), size=(10, 10),
        orient="auto", markerUnits="strokeWidth"
    )
    marker.add(dwg.polygon(
        points=[(0, 0), (10, 5), (0, 10)],
        fill=color
    ))
    dwg.defs.add(marker)
    return f"url(#{marker_id})"


def _arrow(dwg, start, end, color=DARK_TEXT, marker_ref="url(#arrow)", stroke_width=ARROW_STROKE, dashed=False):
    """Draw an arrow line from start to end."""
    extra = {}
    if dashed:
        extra["stroke_dasharray"] = "6,4"
    line = dwg.line(
        start=start, end=end,
        stroke=color, stroke_width=stroke_width,
        **extra
    )
    line["marker-end"] = marker_ref
    dwg.add(line)


def _rounded_rect(dwg, x, y, w, h, fill, stroke=None, opacity=1.0):
    """Draw a rounded rectangle."""
    dwg.add(dwg.rect(
        insert=(x, y), size=(w, h),
        rx=RX, ry=RX,
        fill=fill, fill_opacity=opacity,
        stroke=stroke or "none", stroke_width=1.5
    ))


def _text(dwg, x, y, label, size=14, color=DARK_TEXT, anchor="middle", weight="normal"):
    """Add text."""
    dwg.add(dwg.text(
        label, insert=(x, y),
        font_family=FONT, font_size=size,
        fill=color, text_anchor=anchor,
        font_weight=weight,
        dominant_baseline="central"
    ))


def _box_with_title(dwg, x, y, w, h, title, subtitle, color, title_size=16, sub_size=12):
    """Draw a colored box with title and subtitle centered."""
    _rounded_rect(dwg, x, y, w, h, color, stroke=color)
    _text(dwg, x + w / 2, y + h / 2 - 12, title, size=title_size, color=WHITE, weight="bold")
    if subtitle:
        _text(dwg, x + w / 2, y + h / 2 + 14, subtitle, size=sub_size, color=WHITE)


# ══════════════════════════════════════════════════════════════════
# SVG 1: System Architecture
# ══════════════════════════════════════════════════════════════════
def svg_01_system_architecture():
    H = 620
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "01_系統架構圖.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    # Title
    _text(dwg, W / 2, 35, "系統架構圖 — Recipe AI Advisor", size=22, weight="bold")

    # ── Service boxes ──
    bw, bh = 260, 90

    # Frontend — top center
    fx, fy = (W - bw) / 2, 80
    _box_with_title(dwg, fx, fy, bw, bh, "Frontend", "React / Vite — port 3001", BLUE)

    # Control — middle left
    cx, cy = 140, 240
    _box_with_title(dwg, cx, cy, bw, bh, "Control", "FastAPI — port 8000", GREEN)

    # Backend — middle right
    bx, by = 600, 240
    _box_with_title(dwg, bx, by, bw, bh, "Backend", "FastAPI — port 8001", ORANGE)

    # GraphRAG API — bottom left
    gx, gy = 80, 430
    _box_with_title(dwg, gx, gy, bw, bh, "GraphRAG API", "FastAPI — port 8002", PURPLE)

    # Gemma LLM — bottom right
    lx, ly = 660, 430
    _box_with_title(dwg, lx, ly, bw, bh, "Gemma LLM", "llama-server — port 8080", TEAL)

    # ── Arrows ──
    # Frontend → Control
    _arrow(dwg, (fx + bw / 2 - 40, fy + bh), (cx + bw / 2, cy), color=BLUE, marker_ref=marker_ref)
    _text(dwg, 310, 195, "nginx /api proxy", size=11, color=BLUE, anchor="middle")

    # Control → Backend
    _arrow(dwg, (cx + bw, cy + bh / 2), (bx, by + bh / 2), color=GREEN, marker_ref=marker_ref)
    _text(dwg, W / 2, cy + bh / 2 - 15, "HTTP /food, /diet, /health", size=11, color=GREEN, anchor="middle")

    # Control → GraphRAG
    _arrow(dwg, (cx + bw / 2 - 30, cy + bh), (gx + bw / 2, gy), color=PURPLE, marker_ref=marker_ref)
    _text(dwg, 170, 375, "HTTP /retrieve-only", size=11, color=PURPLE, anchor="middle")

    # Control → Gemma (long diagonal)
    _arrow(dwg, (cx + bw, cy + bh - 10), (lx, ly + 20), color=TEAL, marker_ref=marker_ref)
    _text(dwg, 530, 380, "HTTP /v1/chat/completions", size=11, color=TEAL, anchor="middle")

    # GraphRAG → Gemma
    _arrow(dwg, (gx + bw, gy + bh / 2), (lx, ly + bh / 2), color=TEAL, marker_ref=marker_ref, dashed=True)
    _text(dwg, W / 2, gy + bh / 2 + 20, "LLM 推論（port 8080）", size=11, color=TEAL, anchor="middle")

    # ── Legend ──
    _text(dwg, W / 2, H - 30, "實線 = 同步 HTTP　｜　虛線 = 內部依賴", size=12, color="#888")

    # ── Postgres box ──
    dbw, dbh = 180, 60
    dbx, dby = (W - dbw) / 2, 530
    _rounded_rect(dwg, dbx, dby, dbw, dbh, "#34495E", stroke="#34495E")
    _text(dwg, dbx + dbw / 2, dby + dbh / 2 - 8, "PostgreSQL", size=14, color=WHITE, weight="bold")
    _text(dwg, dbx + dbw / 2, dby + dbh / 2 + 14, "recipe_db", size=11, color=WHITE)

    # Backend → Postgres
    _arrow(dwg, (bx + bw / 2, by + bh), (dbx + dbw / 2 + 40, dby), color="#34495E", marker_ref=marker_ref)

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 2: 4-Step Pipeline
# ══════════════════════════════════════════════════════════════════
def svg_02_pipeline():
    H = 900
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "03_四步驟Pipeline.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "四步驟 LLM Pipeline", size=22, weight="bold")

    steps = [
        ("Step 1: Echo（即時確認）", "temp=0.5 · max_tokens=128 · 1次呼叫",
         "前台：SSE echo_reply　｜　後台：生成簡短確認句", BLUE),
        ("Step 2: Intent（意圖偵測）", "temp=0.1 · max_tokens=512 · 2次呼叫",
         "前台：SSE intent_result　｜　後台：分類 14 種意圖 + 參數抽取", GREEN),
        ("Step 3: ToolCall（工具指令）", "temp=0.1 · max_tokens=512 · 系統優先 / LLM 備援",
         "前台：SSE tool_start → tool_result → tool_done　｜　後台：分發執行", ORANGE),
        ("Step 4: Analysis（分析回覆）", "temp=0.3 · max_tokens=2048 · 2次呼叫",
         "前台：SSE analysis_chunk（串流）　｜　後台：綜合分析 + 建議", RED),
    ]

    box_w, box_h = 700, 130
    start_x = (W - box_w) / 2
    y = 70
    gap = 30

    for i, (title, params, detail, color) in enumerate(steps):
        _rounded_rect(dwg, start_x, y, box_w, box_h, WHITE, stroke=color)
        # colored left strip
        _rounded_rect(dwg, start_x, y, 8, box_h, color)
        # number circle
        cx_c, cy_c = start_x + 45, y + box_h / 2
        dwg.add(dwg.circle(center=(cx_c, cy_c), r=20, fill=color))
        _text(dwg, cx_c, cy_c, str(i + 1), size=18, color=WHITE, weight="bold")
        # text
        _text(dwg, start_x + 80, y + 30, title, size=16, color=DARK_TEXT, anchor="start", weight="bold")
        _text(dwg, start_x + 80, y + 60, params, size=13, color="#555", anchor="start")
        _text(dwg, start_x + 80, y + 88, detail, size=12, color="#777", anchor="start")

        if i < len(steps) - 1:
            arrow_x = W / 2
            _arrow(dwg, (arrow_x, y + box_h), (arrow_x, y + box_h + gap), color=color, marker_ref=marker_ref)

        y += box_h + gap

    # Side box: Memory Compression
    side_x = start_x + box_w + 30
    side_y = 200
    side_w = 140
    side_h = 340
    # Draw within bounds — shift left if needed
    side_x = min(side_x, W - side_w - 10)
    _rounded_rect(dwg, side_x, side_y, side_w, side_h, WHITE, stroke=PURPLE)
    _rounded_rect(dwg, side_x, side_y, side_w, 8, PURPLE)
    _text(dwg, side_x + side_w / 2, side_y + 35, "Memory", size=13, color=PURPLE, weight="bold")
    _text(dwg, side_x + side_w / 2, side_y + 55, "Compression", size=13, color=PURPLE, weight="bold")
    _text(dwg, side_x + side_w / 2, side_y + 90, "temp=0.2", size=11, color="#555")
    _text(dwg, side_x + side_w / 2, side_y + 110, "max_tokens", size=11, color="#555")
    _text(dwg, side_x + side_w / 2, side_y + 130, "=1024", size=11, color="#555")
    _text(dwg, side_x + side_w / 2, side_y + 165, "對話壓縮", size=12, color="#777")
    _text(dwg, side_x + side_w / 2, side_y + 185, "每 N 輪觸發", size=12, color="#777")

    # dashed arrow from side to step 4
    _arrow(dwg, (side_x, side_y + side_h / 2), (start_x + box_w, 70 + 3 * (box_h + gap) + box_h / 2),
           color=PURPLE, marker_ref=marker_ref, dashed=True)

    # ── Footer note ──
    _text(dwg, W / 2, H - 30, "所有步驟透過 SSE（Server-Sent Events）即時推送至前端", size=13, color="#888")

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 3: Tool Dispatch Mechanism
# ══════════════════════════════════════════════════════════════════
def svg_03_tool_dispatch():
    H = 560
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "05_工具分發機制.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "工具分發機制（Tool Dispatch）", size=22, weight="bold")

    # ── Flow boxes ──
    boxes = [
        (80, 90, 220, 60, "輸入: tool_calls list", "Intent 步驟產出", BLUE),
        (80, 200, 220, 60, "迴圈: for each tool_call", "name, args, token, msg_id", GREEN),
        (380, 200, 240, 60, "_TOOL_DISPATCH 查表", "dict → function pointer", ORANGE),
        (700, 200, 230, 60, "async 函式執行", "HTTP call → 取得結果", RED),
        (380, 340, 240, 80, "SSE 事件推送", "", PURPLE),
    ]

    for bx, by, bw, bh, title, sub, color in boxes:
        _rounded_rect(dwg, bx, by, bw, bh, WHITE, stroke=color)
        _rounded_rect(dwg, bx, by, bw, 6, color)
        _text(dwg, bx + bw / 2, by + 28, title, size=14, color=DARK_TEXT, weight="bold")
        if sub:
            _text(dwg, bx + bw / 2, by + 48, sub, size=11, color="#777")

    # Arrows
    _arrow(dwg, (190, 150), (190, 200), marker_ref=marker_ref)
    _arrow(dwg, (300, 230), (380, 230), marker_ref=marker_ref)
    _arrow(dwg, (620, 230), (700, 230), marker_ref=marker_ref)
    _arrow(dwg, (815, 260), (815, 340), marker_ref=marker_ref)
    # bend arrow down from execute to SSE
    dwg.add(dwg.polyline(
        points=[(815, 340), (815, 310), (620, 310), (620, 340)],
        stroke=DARK_TEXT, stroke_width=2, fill="none"
    ))

    # SSE event detail inside the SSE box
    sse_x, sse_y = 380, 340
    _text(dwg, sse_x + 120, sse_y + 30, "① tool_start（工具名稱）", size=12, color="#555", anchor="middle")
    _text(dwg, sse_x + 120, sse_y + 50, "② tool_result（結果 JSON）", size=12, color="#555", anchor="middle")
    _text(dwg, sse_x + 120, sse_y + 70, "③ tool_done（完成訊號）", size=12, color="#555", anchor="middle")

    # ── _TOOL_DISPATCH dictionary sample ──
    dict_x, dict_y = 60, 430
    dict_w, dict_h = 880, 100
    _rounded_rect(dwg, dict_x, dict_y, dict_w, dict_h, "#F0F4F8", stroke=MID_GRAY)
    _text(dwg, dict_x + PAD, dict_y + 25, "_TOOL_DISPATCH = {", size=13, color=DARK_TEXT, anchor="start", weight="bold")
    entries = [
        '"add_diet_log": _tool_add_diet_log,',
        '"search_food": _tool_search_food,',
        '"query_dri": _tool_query_dri,',
        '"search_symptom": _tool_search_symptom,',
        '"search_graphrag": _tool_search_graphrag,   ...共 13 個工具',
    ]
    for i, e in enumerate(entries):
        _text(dwg, dict_x + PAD + 30, dict_y + 45 + i * 14, e, size=11, color="#555", anchor="start")

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 4: Intent → Tool Mapping
# ══════════════════════════════════════════════════════════════════
def svg_04_intent_tool_mapping():
    H = 720
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "07_意圖到工具映射.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)

    _text(dwg, W / 2, 35, "意圖（Intent）→ 工具（Tool）映射", size=22, weight="bold")

    intents = [
        "record_diet", "query_dri", "search_food", "search_symptom",
        "search_graphrag", "nutrient_ranking", "get_diet_logs",
        "update_diet_log", "delete_diet_log", "get_recipes",
        "get_calendar", "get_profile", "update_profile", "general_chat"
    ]

    tools = [
        "add_diet_log", "query_dri", "search_food", "search_symptom",
        "search_graphrag", "get_nutrient_ranking", "get_diet_logs",
        "update_diet_log", "delete_diet_log", "get_saved_recipes",
        "get_calendar_entries", "get_user_profile", "update_user_profile",
    ]

    # mapping: intent index → tool index (or -1 for no tool)
    mapping = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, -1]

    intent_colors = [BLUE, GREEN, ORANGE, RED, PURPLE, TEAL,
                     BLUE, GREEN, RED, ORANGE, TEAL, PURPLE, GREEN, "#95A5A6"]

    lx, ly_start = 80, 80
    rx = 600
    bw_l, bw_r = 200, 230
    bh = 36
    gap = 8

    for i, intent in enumerate(intents):
        y = ly_start + i * (bh + gap)
        color = intent_colors[i % len(intent_colors)]
        _rounded_rect(dwg, lx, y, bw_l, bh, color, stroke=color)
        _text(dwg, lx + bw_l / 2, y + bh / 2, intent, size=12, color=WHITE, weight="bold")

    for j, tool in enumerate(tools):
        y = ly_start + j * (bh + gap)
        _rounded_rect(dwg, rx, y, bw_r, bh, WHITE, stroke=DARK_TEXT)
        _text(dwg, rx + bw_r / 2, y + bh / 2, tool, size=12, color=DARK_TEXT)

    # Draw mapping lines
    for i, ti in enumerate(mapping):
        iy = ly_start + i * (bh + gap) + bh / 2
        if ti >= 0:
            ty = ly_start + ti * (bh + gap) + bh / 2
            color = intent_colors[i % len(intent_colors)]
            dwg.add(dwg.line(
                start=(lx + bw_l, iy), end=(rx, ty),
                stroke=color, stroke_width=1.5, stroke_opacity=0.6
            ))
        else:
            # general_chat → no tool
            _text(dwg, lx + bw_l + 60, iy, "— 無工具（直接回覆）", size=12, color="#95A5A6", anchor="start")

    # Column headers
    _text(dwg, lx + bw_l / 2, ly_start - 18, "14 種意圖", size=14, weight="bold")
    _text(dwg, rx + bw_r / 2, ly_start - 18, "13 個工具函式", size=14, weight="bold")

    # record_diet note
    _text(dwg, rx + bw_r + 15, ly_start + bh / 2, "1→N 展開", size=11, color=BLUE, anchor="start")

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 5: DRI Gap Analysis Flow
# ══════════════════════════════════════════════════════════════════
def svg_05_dri_gap():
    H = 780
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "08_DRI缺口分析流程.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "DRI 缺口分析流程（query_dri）", size=22, weight="bold")

    # Flow steps
    steps_data = [
        ("diamond", 80, "daily_intake\n已提供？", BLUE, 160, 70),
        ("rect", 200, "自動取得今日飲食記錄", GREEN, 350, 60),
        ("rect", 200, "GET /diet/logs?date=today", GREEN, 350, 40),
        ("rect", 310, "dri_gap_service.analyze_dri_gap()", ORANGE, 500, 60),
        ("rect", 420, "載入 HPA v8 JSON", ORANGE, 280, 50),
        ("rect", 420, "取得年齡/性別對應 DRI 目標值", ORANGE, 280, 50),
        ("rect", 540, "比對實際 vs 目標", RED, 500, 60),
        ("rect", 650, "回傳缺口 + 推薦食物", TEAL, 400, 60),
    ]

    center_x = W / 2

    # Diamond for decision
    dy = 90
    dw, dh = 200, 80
    diamond_pts = [
        (center_x, dy), (center_x + dw / 2, dy + dh / 2),
        (center_x, dy + dh), (center_x - dw / 2, dy + dh / 2)
    ]
    dwg.add(dwg.polygon(points=diamond_pts, fill=WHITE, stroke=BLUE, stroke_width=2))
    _text(dwg, center_x, dy + dh / 2 - 8, "daily_intake", size=13, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, dy + dh / 2 + 12, "已提供？", size=13, color=DARK_TEXT)

    # Yes/No branches
    _text(dwg, center_x + dw / 2 + 20, dy + dh / 2 - 5, "是", size=13, color=GREEN, weight="bold")
    _text(dwg, center_x - dw / 2 - 20, dy + dh / 2 - 5, "否", size=13, color=RED, weight="bold")

    # "No" path: auto fetch
    no_box_x, no_box_y = 100, 190
    no_box_w, no_box_h = 260, 70
    _rounded_rect(dwg, no_box_x, no_box_y, no_box_w, no_box_h, WHITE, stroke=GREEN)
    _rounded_rect(dwg, no_box_x, no_box_y, no_box_w, 5, GREEN)
    _text(dwg, no_box_x + no_box_w / 2, no_box_y + 25, "自動取得今日飲食記錄", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, no_box_x + no_box_w / 2, no_box_y + 50, "GET /diet/logs?date=today", size=12, color="#777")

    # Arrow from diamond left to no_box
    _arrow(dwg, (center_x - dw / 2, dy + dh / 2), (no_box_x + no_box_w, no_box_y + no_box_h / 2),
           color=RED, marker_ref=marker_ref)

    # Analyze box
    ana_y = 300
    ana_w, ana_h = 500, 65
    ana_x = (W - ana_w) / 2
    _rounded_rect(dwg, ana_x, ana_y, ana_w, ana_h, WHITE, stroke=ORANGE)
    _rounded_rect(dwg, ana_x, ana_y, ana_w, 5, ORANGE)
    _text(dwg, center_x, ana_y + 28, "呼叫 dri_gap_service.analyze_dri_gap(age, sex, daily_intake)", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, ana_y + 50, "彙整每日攝取 → 對比 DRI 目標", size=12, color="#777")

    # Arrows
    _arrow(dwg, (center_x, dy + dh), (center_x, ana_y), color=GREEN, marker_ref=marker_ref)
    _arrow(dwg, (no_box_x + no_box_w / 2, no_box_y + no_box_h), (center_x - 80, ana_y), color=GREEN, marker_ref=marker_ref)

    # HPA v8 box + DRI target box side by side
    hpa_y = 400
    hpa_w, hpa_h = 220, 55
    hpa_x = center_x - hpa_w - 20
    _rounded_rect(dwg, hpa_x, hpa_y, hpa_w, hpa_h, WHITE, stroke=ORANGE)
    _text(dwg, hpa_x + hpa_w / 2, hpa_y + 20, "載入 HPA v8 JSON", size=13, color=DARK_TEXT, weight="bold")
    _text(dwg, hpa_x + hpa_w / 2, hpa_y + 40, "hpa_dri_v8.json", size=11, color="#777")

    dri_x = center_x + 20
    _rounded_rect(dwg, dri_x, hpa_y, hpa_w, hpa_h, WHITE, stroke=ORANGE)
    _text(dwg, dri_x + hpa_w / 2, hpa_y + 20, "取得 DRI 目標值", size=13, color=DARK_TEXT, weight="bold")
    _text(dwg, dri_x + hpa_w / 2, hpa_y + 40, "依年齡 + 性別篩選", size=11, color="#777")

    _arrow(dwg, (center_x, ana_y + ana_h), (center_x, hpa_y), color=ORANGE, marker_ref=marker_ref)

    # Compare box
    cmp_y = 500
    cmp_w, cmp_h = 500, 80
    cmp_x = (W - cmp_w) / 2
    _rounded_rect(dwg, cmp_x, cmp_y, cmp_w, cmp_h, WHITE, stroke=RED)
    _rounded_rect(dwg, cmp_x, cmp_y, cmp_w, 5, RED)
    _text(dwg, center_x, cmp_y + 25, "比對實際攝取 vs DRI 目標", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x - 120, cmp_y + 50, "不足（deficient）", size=12, color=RED)
    _text(dwg, center_x, cmp_y + 50, "充足（adequate）", size=12, color=GREEN)
    _text(dwg, center_x + 130, cmp_y + 50, "過量（excess）", size=12, color=ORANGE)
    _text(dwg, center_x, cmp_y + 70, "分類每個營養素狀態", size=11, color="#777")

    _arrow(dwg, (center_x, hpa_y + hpa_h), (center_x, cmp_y), color=ORANGE, marker_ref=marker_ref)

    # Recommend foods box
    rec_y = 620
    rec_w, rec_h = 420, 65
    rec_x = (W - rec_w) / 2
    _rounded_rect(dwg, rec_x, rec_y, rec_w, rec_h, WHITE, stroke=TEAL)
    _rounded_rect(dwg, rec_x, rec_y, rec_w, 5, TEAL)
    _text(dwg, center_x, rec_y + 25, "不足項 → GET /health/nutrients/{field}/top-foods", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, rec_y + 50, "推薦富含該營養素的食物", size=12, color="#777")

    _arrow(dwg, (center_x, cmp_y + cmp_h), (center_x, rec_y), color=RED, marker_ref=marker_ref)

    # Final output
    out_y = 720
    out_w, out_h = 300, 40
    out_x = (W - out_w) / 2
    _rounded_rect(dwg, out_x, out_y, out_w, out_h, TEAL)
    _text(dwg, center_x, out_y + out_h / 2, "回傳：缺口列表 + 推薦食物", size=14, color=WHITE, weight="bold")

    _arrow(dwg, (center_x, rec_y + rec_h), (center_x, out_y), color=TEAL, marker_ref=marker_ref)

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 6: Diet Log Flow
# ══════════════════════════════════════════════════════════════════
def svg_06_diet_log():
    H = 700
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "09_飲食記錄流程.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "飲食記錄流程（add_diet_log）", size=22, weight="bold")

    center_x = W / 2
    bw, bh = 460, 70
    bx = (W - bw) / 2

    flow = [
        ("接收參數", "food_name, amount_g, meal_type", BLUE, 80),
        ("自動搜尋食物", "GET /food/search?q={name}&limit=1", GREEN, 190),
        ("擷取搜尋結果", "food_id, food_source（taiwan_foods / foodb）", ORANGE, 300),
        ("建立飲食記錄", "POST /diet/logs", RED, 410),
        ("回傳成功 + 營養明細", "含巨量 / 微量營養素", TEAL, 520),
    ]

    for title, sub, color, y in flow:
        _rounded_rect(dwg, bx, y, bw, bh, WHITE, stroke=color)
        _rounded_rect(dwg, bx, y, 6, bh, color)
        _text(dwg, bx + 30, y + 25, title, size=15, color=DARK_TEXT, anchor="start", weight="bold")
        _text(dwg, bx + 30, y + 50, sub, size=12, color="#777", anchor="start")

    # Arrows between flow boxes
    for i in range(len(flow) - 1):
        y1 = flow[i][3] + bh
        y2 = flow[i + 1][3]
        _arrow(dwg, (center_x, y1), (center_x, y2), marker_ref=marker_ref)

    # POST payload detail
    payload_x = bx + bw + 30
    payload_y = 410
    pw, ph = 220, 120
    # Clamp within canvas
    payload_x = min(payload_x, W - pw - 10)
    _rounded_rect(dwg, payload_x, payload_y, pw, ph, "#F0F4F8", stroke=MID_GRAY)
    _text(dwg, payload_x + PAD, payload_y + 20, "POST body:", size=12, color=DARK_TEXT, anchor="start", weight="bold")
    fields = ["food_name", "amount_g", "meal_type", "food_id", "food_source", "logged_at"]
    for i, f in enumerate(fields):
        _text(dwg, payload_x + PAD + 10, payload_y + 40 + i * 14, f"· {f}", size=11, color="#555", anchor="start")

    # Arrow from main box to payload
    _arrow(dwg, (bx + bw, 445), (payload_x, 445), color=MID_GRAY, marker_ref=marker_ref)

    # Final output bar
    out_y = 630
    out_w, out_h = 350, 40
    out_x = (W - out_w) / 2
    _rounded_rect(dwg, out_x, out_y, out_w, out_h, TEAL)
    _text(dwg, center_x, out_y + out_h / 2, "成功：記錄已建立 + 營養分析", size=14, color=WHITE, weight="bold")

    _arrow(dwg, (center_x, flow[-1][3] + bh), (center_x, out_y), marker_ref=marker_ref)

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 7: Symptom Search Flow
# ══════════════════════════════════════════════════════════════════
def svg_07_symptom_search():
    H = 680
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "10_症狀搜尋流程.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "症狀搜尋流程（search_symptom）", size=22, weight="bold")

    center_x = W / 2
    bw, bh = 520, 75
    bx = (W - bw) / 2

    flow = [
        ("擷取中文症狀候選詞", "Regex: 2~6 字中文字元 → 候選清單", RED, 80),
        ("逐一搜尋", "對每個候選詞 + English symptom:\nPOST /health/symptom-search", ORANGE, 195),
        ("評分排序", "score = effects_count + recommendations_count", GREEN, 320),
        ("回傳最佳結果", "選分數最高者（含化合物、效果、推薦食物）", TEAL, 440),
    ]

    for title, sub, color, y in flow:
        _rounded_rect(dwg, bx, y, bw, bh, WHITE, stroke=color)
        _rounded_rect(dwg, bx, y, 6, bh, color)
        lines = sub.split("\n")
        _text(dwg, bx + 30, y + 25, title, size=15, color=DARK_TEXT, anchor="start", weight="bold")
        for li, line in enumerate(lines):
            _text(dwg, bx + 30, y + 48 + li * 16, line, size=12, color="#777", anchor="start")

    for i in range(len(flow) - 1):
        y1 = flow[i][3] + bh
        y2 = flow[i + 1][3]
        _arrow(dwg, (center_x, y1), (center_x, y2), marker_ref=marker_ref)

    # Side note: regex example
    note_x, note_y = bx + bw + 25, 90
    nw, nh = 190, 55
    note_x = min(note_x, W - nw - 10)
    _rounded_rect(dwg, note_x, note_y, nw, nh, "#FFF5F5", stroke=RED)
    _text(dwg, note_x + nw / 2, note_y + 20, "範例候選詞", size=12, color=RED, weight="bold")
    _text(dwg, note_x + nw / 2, note_y + 40, "頭痛、失眠、脹氣…", size=11, color="#777")

    # Loop indicator for step 2
    loop_x = bx - 45
    loop_y1 = 205
    loop_y2 = 280
    dwg.add(dwg.polyline(
        points=[(loop_x, loop_y1), (loop_x - 20, loop_y1), (loop_x - 20, loop_y2), (loop_x, loop_y2)],
        stroke=ORANGE, stroke_width=1.5, fill="none"
    ))
    _text(dwg, loop_x - 30, (loop_y1 + loop_y2) / 2, "loop", size=11, color=ORANGE)

    # Output bar
    out_y = 560
    out_w, out_h = 400, 40
    out_x = (W - out_w) / 2
    _rounded_rect(dwg, out_x, out_y, out_w, out_h, TEAL)
    _text(dwg, center_x, out_y + out_h / 2, "最佳症狀結果 + 相關化合物 + 推薦食物", size=14, color=WHITE, weight="bold")

    _arrow(dwg, (center_x, flow[-1][3] + bh), (center_x, out_y), marker_ref=marker_ref)

    # Footer
    _text(dwg, W / 2, H - 30, "搜尋來源：FooDB 症狀-化合物-食物知識庫", size=12, color="#888")

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 8: GraphRAG Flow
# ══════════════════════════════════════════════════════════════════
def svg_08_graphrag():
    H = 820
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "11_學術文獻流程.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "學術文獻檢索流程（search_graphrag）", size=22, weight="bold")

    center_x = W / 2

    # Step 1: Input
    s1_y = 80
    s1_w, s1_h = 420, 55
    s1_x = (W - s1_w) / 2
    _rounded_rect(dwg, s1_x, s1_y, s1_w, s1_h, WHITE, stroke=BLUE)
    _rounded_rect(dwg, s1_x, s1_y, s1_w, 5, BLUE)
    _text(dwg, center_x, s1_y + 22, "接收查詢（English academic terms）", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, s1_y + 42, "query: str", size=12, color="#777")

    # Step 2: POST
    s2_y = 170
    s2_w, s2_h = 520, 55
    s2_x = (W - s2_w) / 2
    _rounded_rect(dwg, s2_x, s2_y, s2_w, s2_h, WHITE, stroke=PURPLE)
    _rounded_rect(dwg, s2_x, s2_y, s2_w, 5, PURPLE)
    _text(dwg, center_x, s2_y + 22, 'POST http://localhost:8002/retrieve-only', size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, s2_y + 42, '{query, methods: ["B", "C"]}', size=12, color="#777")

    _arrow(dwg, (center_x, s1_y + s1_h), (center_x, s2_y), marker_ref=marker_ref)

    # Fork into Method B and Method C
    fork_y = s2_y + s2_h + 15
    _arrow(dwg, (center_x, s2_y + s2_h), (center_x, fork_y), marker_ref=marker_ref)

    # Method B — left
    mb_x, mb_y = 60, fork_y + 30
    mb_w, mb_h = 400, 130
    _rounded_rect(dwg, mb_x, mb_y, mb_w, mb_h, WHITE, stroke=GREEN)
    _rounded_rect(dwg, mb_x, mb_y, mb_w, 5, GREEN)
    _text(dwg, mb_x + mb_w / 2, mb_y + 25, "Method B: Local Search", size=15, color=GREEN, weight="bold")
    _text(dwg, mb_x + PAD, mb_y + 50, "① 查詢最相關 entity", size=12, color=DARK_TEXT, anchor="start")
    _text(dwg, mb_x + PAD, mb_y + 70, "② Graph traversal（edge weight ≥ 5.0）", size=12, color=DARK_TEXT, anchor="start")
    _text(dwg, mb_x + PAD, mb_y + 90, "③ entity_chunk_map → chunk_ids", size=12, color=DARK_TEXT, anchor="start")
    _text(dwg, mb_x + PAD, mb_y + 110, "④ Cosine re-rank → top chunks", size=12, color=DARK_TEXT, anchor="start")

    _arrow(dwg, (center_x - 60, fork_y), (mb_x + mb_w / 2, mb_y), color=GREEN, marker_ref=marker_ref)

    # Method C — right
    mc_x, mc_y = 540, fork_y + 30
    mc_w, mc_h = 400, 130
    _rounded_rect(dwg, mc_x, mc_y, mc_w, mc_h, WHITE, stroke=ORANGE)
    _rounded_rect(dwg, mc_x, mc_y, mc_w, 5, ORANGE)
    _text(dwg, mc_x + mc_w / 2, mc_y + 25, "Method C: Global Search", size=15, color=ORANGE, weight="bold")
    _text(dwg, mc_x + PAD, mc_y + 50, "① Community reports 篩選", size=12, color=DARK_TEXT, anchor="start")
    _text(dwg, mc_x + PAD, mc_y + 70, "② 收集 key_entities", size=12, color=DARK_TEXT, anchor="start")
    _text(dwg, mc_x + PAD, mc_y + 90, "③ entity_chunk_map → grounding chunks", size=12, color=DARK_TEXT, anchor="start")
    _text(dwg, mc_x + PAD, mc_y + 110, "④ 不再是「空中樓閣」—— 有出處", size=12, color=DARK_TEXT, anchor="start")

    _arrow(dwg, (center_x + 60, fork_y), (mc_x + mc_w / 2, mc_y), color=ORANGE, marker_ref=marker_ref)

    # Merge: Deduplicate
    merge_y = mb_y + mb_h + 40
    merge_w, merge_h = 400, 55
    merge_x = (W - merge_w) / 2
    _rounded_rect(dwg, merge_x, merge_y, merge_w, merge_h, WHITE, stroke=PURPLE)
    _rounded_rect(dwg, merge_x, merge_y, merge_w, 5, PURPLE)
    _text(dwg, center_x, merge_y + 22, "合併 & 去重（by doc_id）", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, merge_y + 42, "移除重複來源文獻", size=12, color="#777")

    _arrow(dwg, (mb_x + mb_w / 2, mb_y + mb_h), (center_x - 60, merge_y), color=GREEN, marker_ref=marker_ref)
    _arrow(dwg, (mc_x + mc_w / 2, mc_y + mc_h), (center_x + 60, merge_y), color=ORANGE, marker_ref=marker_ref)

    # Output: paper metadata
    out_y = merge_y + merge_h + 35
    out_w, out_h = 550, 80
    out_x = (W - out_w) / 2
    _rounded_rect(dwg, out_x, out_y, out_w, out_h, WHITE, stroke=TEAL)
    _rounded_rect(dwg, out_x, out_y, out_w, 5, TEAL)
    _text(dwg, center_x, out_y + 22, "回傳來源文獻 + 論文元數據", size=14, color=DARK_TEXT, weight="bold")
    _text(dwg, center_x, out_y + 45, "title / authors / journal / DOI / IF / SJR", size=12, color="#777")
    _text(dwg, center_x, out_y + 65, "65 篇學術論文語料庫", size=12, color=TEAL)

    _arrow(dwg, (center_x, merge_y + merge_h), (center_x, out_y), marker_ref=marker_ref)

    # Timeout note
    note_y = out_y + out_h + 25
    _rounded_rect(dwg, (W - 320) / 2, note_y, 320, 35, "#FFF5F0", stroke=ORANGE)
    _text(dwg, center_x, note_y + 18, "⏱ Timeout: 60 秒（其他工具 30 秒）", size=13, color=ORANGE, weight="bold")

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# SVG 9: Frontend Component Architecture
# ══════════════════════════════════════════════════════════════════
def svg_09_frontend():
    H = 800
    dwg = svgwrite.Drawing(os.path.join(OUTPUT_DIR, "13_前端渲染架構.svg"), size=(W, H))
    _rounded_rect(dwg, 0, 0, W, H, WHITE)
    marker_ref = _marker(dwg, DARK_TEXT)

    _text(dwg, W / 2, 35, "前端元件渲染架構", size=22, weight="bold")

    # Root node
    root_w, root_h = 260, 50
    root_x, root_y = (W - root_w) / 2, 70
    _rounded_rect(dwg, root_x, root_y, root_w, root_h, BLUE)
    _text(dwg, root_x + root_w / 2, root_y + root_h / 2, "AdvisorPage.jsx", size=16, color=WHITE, weight="bold")

    # Level 2: Three children
    l2_y = 175
    l2_h = 45
    l2_children = [
        ("ThinkingPanel.jsx", 80, 200, TEAL),
        ("MessageBubble.jsx", 400, 200, GREEN),
        ("ToolResultCard.jsx", 720, 230, ORANGE),
    ]

    for name, cx, cw, color in l2_children:
        lx = cx
        _rounded_rect(dwg, lx, l2_y, cw, l2_h, WHITE, stroke=color)
        _rounded_rect(dwg, lx, l2_y, cw, 5, color)
        _text(dwg, lx + cw / 2, l2_y + l2_h / 2 + 3, name, size=13, color=DARK_TEXT, weight="bold")
        # Arrow from root
        _arrow(dwg, (root_x + root_w / 2, root_y + root_h), (lx + cw / 2, l2_y), color=BLUE, marker_ref=marker_ref)

    # Sub-label for ThinkingPanel
    _text(dwg, 180, l2_y + l2_h + 18, "進度指示器", size=11, color="#888")

    # Sub-label for MessageBubble
    _text(dwg, 500, l2_y + l2_h + 18, "對話氣泡", size=11, color="#888")

    # Level 3: ToolResultCard → 11 renderers (2 columns)
    trc_cx = 720 + 230 / 2  # center of ToolResultCard

    renderers = [
        "DriGapTable",
        "NutrientRankingTable",
        "SearchFoodCard",
        "SymptomResultCard",
        "GraphRagResultCard",
        "DietLogsTable",
        "DietLogActionCard",
        "SavedRecipesCard",
        "CalendarEntriesCard",
        "UserProfileCard",
        "ProfileUpdatedCard",
    ]

    renderer_colors = [RED, ORANGE, GREEN, PURPLE, TEAL, BLUE,
                       GREEN, ORANGE, TEAL, PURPLE, GREEN]

    # Layout: 2 columns, left starts at x=60, right at x=520
    col_x = [60, 340, 620]
    card_w = 250
    card_h = 38
    start_y = 300
    gap_y = 12

    positions = []  # store (cx, cy) for arrows
    for i, name in enumerate(renderers):
        col = i % 3
        row = i // 3
        cx = col_x[col]
        cy = start_y + row * (card_h + gap_y)
        color = renderer_colors[i]
        _rounded_rect(dwg, cx, cy, card_w, card_h, WHITE, stroke=color)
        _rounded_rect(dwg, cx, cy, 5, card_h, color)
        _text(dwg, cx + card_w / 2, cy + card_h / 2, name, size=12, color=DARK_TEXT, weight="bold")
        positions.append((cx + card_w / 2, cy))

    # Arrows from ToolResultCard to each renderer
    trc_bottom = l2_y + l2_h
    for px, py in positions:
        _arrow(dwg, (trc_cx, trc_bottom), (px, py), color=ORANGE, marker_ref=marker_ref, stroke_width=1)

    # Special note: GraphRagResultCard → ReferenceList
    # Find GraphRagResultCard position (index 4)
    grag_i = 4
    grag_col = grag_i % 3
    grag_row = grag_i // 3
    grag_cx = col_x[grag_col]
    grag_cy = start_y + grag_row * (card_h + gap_y)

    ref_x = grag_cx + card_w + 20
    ref_y = grag_cy
    ref_w = 140
    ref_h = card_h
    # Only draw if it fits
    if ref_x + ref_w < W - 10:
        _rounded_rect(dwg, ref_x, ref_y, ref_w, ref_h, "#F0F4F8", stroke=TEAL)
        _text(dwg, ref_x + ref_w / 2, ref_y + ref_h / 2, "ReferenceList", size=11, color=TEAL, weight="bold")
        _arrow(dwg, (grag_cx + card_w, grag_cy + card_h / 2), (ref_x, ref_y + ref_h / 2), color=TEAL, marker_ref=marker_ref, stroke_width=1)

    # Legend at bottom
    legend_y = start_y + 4 * (card_h + gap_y) + 40
    _rounded_rect(dwg, 60, legend_y, W - 120, 120, "#F7F8FA", stroke=MID_GRAY)
    _text(dwg, W / 2, legend_y + 22, "各 Renderer 職責", size=14, weight="bold")

    legend_items = [
        ("DriGapTable", "DRI 缺口表格 + 推薦食物"),
        ("NutrientRankingTable", "營養素排名 Top N"),
        ("SearchFoodCard", "食品搜尋結果卡片"),
        ("SymptomResultCard", "症狀搜尋：化合物 + 效果 + 食物"),
        ("GraphRagResultCard", "學術文獻來源 + 論文元數據"),
        ("DietLogActionCard", "新增/更新/刪除 飲食記錄"),
    ]

    for i, (name, desc) in enumerate(legend_items):
        col = i % 2
        row = i // 2
        lx = 100 + col * 430
        ly = legend_y + 45 + row * 22
        _text(dwg, lx, ly, f"{name}：{desc}", size=11, color="#555", anchor="start")

    dwg.save()


# ══════════════════════════════════════════════════════════════════
# Main
# ══════════════════════════════════════════════════════════════════
if __name__ == "__main__":
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    generators = [
        ("01_系統架構圖.svg", svg_01_system_architecture),
        ("03_四步驟Pipeline.svg", svg_02_pipeline),
        ("05_工具分發機制.svg", svg_03_tool_dispatch),
        ("07_意圖到工具映射.svg", svg_04_intent_tool_mapping),
        ("08_DRI缺口分析流程.svg", svg_05_dri_gap),
        ("09_飲食記錄流程.svg", svg_06_diet_log),
        ("10_症狀搜尋流程.svg", svg_07_symptom_search),
        ("11_學術文獻流程.svg", svg_08_graphrag),
        ("13_前端渲染架構.svg", svg_09_frontend),
    ]

    for filename, func in generators:
        func()
        path = os.path.join(OUTPUT_DIR, filename)
        size_kb = os.path.getsize(path) / 1024
        print(f"  [OK] {filename}  ({size_kb:.1f} KB)")

    print(f"\nAll {len(generators)} SVG files generated in:\n  {OUTPUT_DIR}")
