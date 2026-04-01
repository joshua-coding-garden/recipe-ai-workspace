"""
argos_worker.py - Argos Translate 隔離子程序

透過 stdin/stdout JSON Lines 通訊，避免 pydantic v2 衝突。
不可 import 任何 app 模組（FastAPI / pydantic）。

協定：
  stdin  每行一個 JSON: {"text": "hello", "from": "en", "to": "zh"}
  stdout 每行一個 JSON: {"text": "你好", "ok": true}
  錯誤時: {"text": "", "ok": false, "error": "..."}
"""
import json
import sys


def _init():
    """載入語言包（首次呼叫時）。"""
    import argostranslate.package
    import argostranslate.translate

    installed = {
        (pkg.from_code, pkg.to_code)
        for pkg in argostranslate.package.get_installed_packages()
    }
    needed = {("zh", "en"), ("en", "zh")}
    missing = needed - installed

    if missing:
        argostranslate.package.update_package_index()
        available = argostranslate.package.get_available_packages()
        for pkg in available:
            if (pkg.from_code, pkg.to_code) in missing:
                argostranslate.package.install_from_path(pkg.download())

    # 預熱：各翻一次，確保模型載入
    argostranslate.translate.translate("test", "en", "zh")
    argostranslate.translate.translate("測試", "zh", "en")

    print(json.dumps({"ready": True}), flush=True)


def main():
    _init()

    import argostranslate.translate

    for line in sys.stdin:
        line = line.strip()
        if not line:
            continue
        try:
            req = json.loads(line)
            text = req.get("text", "")
            src = req.get("from", "en")
            tgt = req.get("to", "zh")

            if not text.strip():
                print(json.dumps({"text": text, "ok": False}), flush=True)
                continue

            result = argostranslate.translate.translate(text, src, tgt)
            print(json.dumps({"text": result, "ok": True}, ensure_ascii=False), flush=True)
        except Exception as e:
            print(json.dumps({"text": "", "ok": False, "error": str(e)}, ensure_ascii=False), flush=True)


if __name__ == "__main__":
    main()
