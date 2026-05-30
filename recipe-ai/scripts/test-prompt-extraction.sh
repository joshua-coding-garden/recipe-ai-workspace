#!/bin/bash
# test-prompt-extraction.sh - 食材提取品質迭代測試
# 用法: bash scripts/test-prompt-extraction.sh

set -euo pipefail
cd "$(dirname "$0")/.."

API="http://localhost:8000"
PASS_COUNT=0
FAIL_COUNT=0

# 取得 JWT token
TOKEN=$(curl -s -X POST "$API/auth/login" \
  -H "Content-Type: application/json" \
  -d '{"email":"agent.browser.test+20260325@example.com","password":"Test123456"}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin).get('access_token',''))")

if [ -z "$TOKEN" ]; then
  echo "ERROR: 無法取得 token"
  exit 1
fi

run_test() {
  local test_name="$1"
  local recipe="$2"
  local expected="$3"
  local garbage="$4"

  echo ""
  echo "=== $test_name ==="

  local result
  result=$(curl -s -X POST "$API/recipe/extract-with-amounts" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -d "{\"recipe_text\":\"$recipe\"}" 2>/dev/null)

  python3 -c "
import sys, json

raw = '''$result'''
try:
    d = json.loads(raw)
except:
    print('  ERROR: API 回應非 JSON')
    print(f'  raw: {raw[:200]}')
    sys.exit(1)

names = [x['name'] for x in d.get('ingredients', [])]
expected = [x for x in '$expected'.split(',') if x]
garbage = [x for x in '$garbage'.split(',') if x]

hit = [e for e in expected if any(e in n or n in e for n in names)]
miss = [e for e in expected if not any(e in n or n in e for n in names)]
bad = [g for g in garbage if g in names]
extra = [n for n in names if n not in expected and n not in garbage]

print(f'  提取: {names}')
print(f'  命中: {hit} ({len(hit)}/{len(expected)})')
if miss:
    print(f'  遺漏: {miss}')
if bad:
    print(f'  垃圾: {bad}')
if extra:
    print(f'  未預期: {extra}')

passed = len(bad) == 0 and len(hit) >= max(1, len(expected) * 0.7)
print(f'  結果: {\"PASS ✓\" if passed else \"FAIL ✗\"}')
sys.exit(0 if passed else 1)
"
  if [ $? -eq 0 ]; then
    PASS_COUNT=$((PASS_COUNT + 1))
  else
    FAIL_COUNT=$((FAIL_COUNT + 1))
  fi
}

# ── 測試案例 ──────────────────────────────────────────────────────────

run_test "Test 1: 潤餅食譜（含指令行）" \
  "潤餅皮 10張\n豆干 1塊\n雞蛋 3顆\n豬肉 300g\n炒麵 1份\n香菜適量\n花生粉 2大匙\n糖粉少許\n鹽巴少許\n米酒 1大匙\n豆干切絲滾水加鹽巴下鍋燙熟後盛起瀝乾備用\n雞蛋加鹽巴米酒打散下鍋煎熟後切絲備用\n拿張潤餅皮灑上一層花生粉\n依序鋪上豆干絲蛋絲肉絲炒麵香菜收口捲起後即完成" \
  "潤餅皮,豆干,雞蛋,豬肉,炒麵,香菜,花生粉,糖粉,鹽巴,米酒" \
  "或絲,加,拿張,一層花,生粉,麵香菜"

run_test "Test 2: 簡單食材清單" \
  "洋蔥 1顆\n馬鈴薯 200g\n雞蛋 2顆\n水 500ml" \
  "洋蔥,馬鈴薯,雞蛋,水" \
  ""

run_test "Test 3: 混合食材+調味料" \
  "預備食材\n雞胸肉 300g\n洋蔥 半顆\n蒜頭 3瓣\n醬油 2大匙\n米酒 1大匙\n糖 1小匙\n香油少許\n白胡椒粉適量" \
  "雞胸肉,洋蔥,蒜頭,醬油,米酒,糖,香油,白胡椒粉" \
  ""

run_test "Test 4: 英文食譜" \
  "Ingredients\n2 chicken breasts\n1 cup rice\n2 tablespoons soy sauce\n1 teaspoon sesame oil\n3 cloves garlic\nSalt and pepper to taste\n\nDirections\nCook the rice. Season chicken with salt." \
  "chicken breast,rice,soy sauce,sesame oil,garlic,salt,pepper" \
  ""

run_test "Test 5: 紅蘿蔔炒蛋（混合格式+分數+步驟噪音）" \
  "紅蘿蔔 1/4條\n蛋 2顆\n蔥 1根\n鹽 0.5小匙\n油 1大匙\n白胡椒粉 少許\n\n作法：\n1. 紅蘿蔔刨絲備用\n2. 蛋打散加入鹽巴和白胡椒粉調味\n3. 中火熱鍋加入油，先炒紅蘿蔔絲至軟\n4. 倒入蛋液，慢慢翻動至熟\n5. 起鍋前撒上蔥花即完成" \
  "紅蘿蔔,蛋,蔥,鹽,油,白胡椒粉" \
  "中火,熱鍋,完成,備用,翻動,起鍋,蔥花即"

# ── 總結 ──────────────────────────────────────────────────────────────

echo ""
echo "========================================="
echo "  PASS: $PASS_COUNT / $((PASS_COUNT + FAIL_COUNT))"
if [ $FAIL_COUNT -eq 0 ]; then
  echo "  ALL TESTS PASSED ✓"
else
  echo "  $FAIL_COUNT TESTS FAILED ✗"
fi
echo "========================================="
