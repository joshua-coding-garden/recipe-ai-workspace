"""advisor_profile.py — 從對話歷史中提取使用者結構化 profile"""
import re


def extract_profile(messages: list[dict]) -> dict:
    profile = {
        "age": None,
        "sex": None,
        "activity": None,
        "goals": [],
    }
    for msg in messages:
        if msg.get("role") != "user":
            continue
        text = msg.get("content", "")
        _extract_age(text, profile)
        _extract_sex(text, profile)
        _extract_activity(text, profile)
        _extract_goals(text, profile)
    return profile


def format_profile_block(profile: dict) -> str:
    parts = []
    if profile["age"]:
        parts.append(f"年齡：{profile['age']}歲")
    if profile["sex"]:
        parts.append(f"性別：{'男性' if profile['sex'] == 'male' else '女性'}")
    if profile["activity"]:
        act_map = {"high": "高（有運動/健身習慣）", "moderate": "中等", "low": "低"}
        parts.append(f"活動量：{act_map.get(profile['activity'], profile['activity'])}")
    if profile["goals"]:
        parts.append(f"目標：{'、'.join(profile['goals'])}")
    if not parts:
        return ""
    return "【已知使用者資訊】" + " | ".join(parts) + "\n請勿重複詢問以上已知資訊。"


def _extract_age(text: str, profile: dict):
    m = re.search(r"(?:我|本人)\s*(?:今年|現在)?\s*(\d{1,3})\s*歲", text)
    if m:
        profile["age"] = int(m.group(1))
        return
    if not profile["age"]:
        m = re.search(r"(\d{1,3})\s*歲", text)
        if m:
            profile["age"] = int(m.group(1))


def _extract_sex(text: str, profile: dict):
    if re.search(r"男性|我是男|我.*男生", text):
        profile["sex"] = "male"
    elif re.search(r"女性|我是女|我.*女生", text):
        profile["sex"] = "female"
    elif re.search(r"^男$|^男性$", text.strip()):
        profile["sex"] = "male"
    elif re.search(r"^女$|^女性$", text.strip()):
        profile["sex"] = "female"


def _extract_activity(text: str, profile: dict):
    if re.search(r"健身|重訓|運動.*習慣|高活動|一週\s*[4-7]|天天運動|每天運動", text):
        profile["activity"] = "high"
    elif re.search(r"偶爾運動|一週\s*[1-3]|中等活動", text):
        profile["activity"] = "moderate"
    elif re.search(r"不運動|久坐|辦公室|低活動|幾乎不動", text):
        profile["activity"] = "low"
    elif text.strip() in ("高", "高活動"):
        profile["activity"] = "high"
    elif text.strip() in ("中", "中等"):
        profile["activity"] = "moderate"
    elif text.strip() in ("低", "低活動"):
        profile["activity"] = "low"


def _extract_goals(text: str, profile: dict):
    for goal in ["增肌", "減脂", "減重", "維持體態", "增重", "健康飲食"]:
        if goal in text and goal not in profile["goals"]:
            profile["goals"].append(goal)


