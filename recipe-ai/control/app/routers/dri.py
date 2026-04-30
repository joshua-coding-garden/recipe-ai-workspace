"""
dri.py - DRI 元資料公開 API

前端透過 GET /dri/fields 取得 HPA 第八版 DRI 主表欄位 meta
(key / label_zh / unit / category / supported / hpa_order ...),
和後端 dri_gap_service 共用同一份 control/resources/hpa_dri_v8.json。

GET /dri/fields?include=upper_limits,anthropometry,activity_levels
可一次拉到上限攝取量、HPA 參考身高體重、活動強度四級表。
"""
from fastapi import APIRouter, Query

from app.services.dri_gap_service import (
    _load_hpa,
    get_extras_for_frontend,
    get_fields_for_frontend,
)

router = APIRouter(prefix="/dri", tags=["dri"])

_EXTRA_KEYS = {"upper_limits", "anthropometry", "activity_levels"}


@router.get("/fields")
def list_dri_fields(include: str | None = Query(default=None)) -> dict:
    """回傳 HPA v8 DRI 欄位清單給前端 FIELD_META_MAP 使用。

    include 為以逗號分隔的旗標 (upper_limits / anthropometry / activity_levels),
    指定後額外回傳對應區段。
    """
    hpa = _load_hpa()
    out: dict = {
        "version": hpa.get("version"),
        "fields": get_fields_for_frontend(),
    }
    if include:
        wanted = {tok.strip() for tok in include.split(",") if tok.strip()}
        extras = get_extras_for_frontend()
        for key in wanted & _EXTRA_KEYS:
            out[key] = extras.get(key, {})
    return out
