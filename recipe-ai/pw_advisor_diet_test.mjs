import { chromium } from "playwright";

const TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1MSIsImVtYWlsIjoiZWpvc2hmdUBnbWFpbC5jb20iLCJleHAiOjE3NzkyNDgyMzV9.YgHgQtt0yPHM05G_sFcdMjD_ZL8H7G5XCQrmivdkN-c";
const USER = JSON.stringify({ id: 51, email: "ejoshfu@gmail.com", name: null });

const BASE = "http://localhost:3001";

(async () => {
  const browser = await chromium.launch({
    headless: false,
    slowMo: 400,
  });

  const context = await browser.newContext({ viewport: { width: 1400, height: 900 } });

  // 預塞 JWT 自動登入
  await context.addInitScript(({ token, user }) => {
    localStorage.setItem("token", token);
    localStorage.setItem("user", user);
    // 清掉舊對話避免干擾
    localStorage.removeItem("advisor_messages");
    localStorage.removeItem("advisor_narrative");
    localStorage.removeItem("advisor_structured_store");
  }, { token: TOKEN, user: USER });

  const page = await context.newPage();

  // ── Step 1: 前往 AI 顧問頁面 ──
  console.log("=== Step 1: 前往 AI 顧問頁面 ===");
  await page.goto(`${BASE}/advisor`, { waitUntil: "networkidle" });
  await page.waitForTimeout(1500);

  // 確認頁面載入
  const title = await page.locator("text=AI 營養顧問").first();
  if (await title.isVisible()) {
    console.log("✓ AI 營養顧問頁面已載入");
  }

  // ── Step 2: 測試記錄飲食 ──
  console.log("\n=== Step 2: 測試記錄飲食 ===");
  const textarea = page.locator('textarea[placeholder*="輸入你的問題"]');
  await textarea.fill("今天午餐吃了雞腿便當、青菜、荷包蛋");
  await page.waitForTimeout(500);

  // 點擊送出
  const sendBtn = page.locator('button:has-text("送出")');
  await sendBtn.click();
  console.log("✓ 已送出飲食記錄訊息");

  // 等待 AI 回應（最多 120 秒，因為 Gemma 比較慢）
  console.log("⏳ 等待 AI 回應...");

  // 等待「思考中」消失 + 回覆出現
  try {
    // 先等 loading 結束（送出按鈕從「思考中...」恢復為「送出 ▶」）
    await page.locator('button:has-text("送出 ▶")').waitFor({ timeout: 120_000 });
    console.log("✓ AI 回應完成");
  } catch (e) {
    console.log("⚠ AI 回應超時，繼續觀察...");
  }

  await page.waitForTimeout(2000);

  // 截圖記錄
  await page.screenshot({ path: "/tmp/advisor_diet_step2.png", fullPage: true });
  console.log("📸 截圖: /tmp/advisor_diet_step2.png");

  // ── Step 3: 測試查詢飲食日誌 ──
  console.log("\n=== Step 3: 測試查詢飲食日誌/行事曆 ===");
  await textarea.fill("這週吃了什麼？");
  await page.waitForTimeout(500);
  await sendBtn.click();
  console.log("✓ 已送出查詢訊息");

  console.log("⏳ 等待 AI 回應...");
  try {
    await page.locator('button:has-text("送出 ▶")').waitFor({ timeout: 120_000 });
    console.log("✓ AI 回應完成");
  } catch (e) {
    console.log("⚠ AI 回應超時，繼續觀察...");
  }

  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/advisor_diet_step3.png", fullPage: true });
  console.log("📸 截圖: /tmp/advisor_diet_step3.png");

  // ── Step 4: 測試分析營養 ──
  console.log("\n=== Step 4: 測試分析營養 ===");
  await textarea.fill("幫我分析剛剛那些食物的營養是否充足");
  await page.waitForTimeout(500);
  await sendBtn.click();
  console.log("✓ 已送出營養分析請求");

  console.log("⏳ 等待 AI 回應...");
  try {
    await page.locator('button:has-text("送出 ▶")').waitFor({ timeout: 120_000 });
    console.log("✓ AI 回應完成");
  } catch (e) {
    console.log("⚠ AI 回應超時，繼續觀察...");
  }

  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/advisor_diet_step4.png", fullPage: true });
  console.log("📸 截圖: /tmp/advisor_diet_step4.png");

  // ── 保持瀏覽器開啟讓使用者觀察 ──
  console.log("\n=== 測試完成 ===");
  console.log("瀏覽器保持開啟，按 Ctrl+C 結束");

  // 保持 60 秒讓使用者觀察
  await page.waitForTimeout(60_000);

  await browser.close();
})();
