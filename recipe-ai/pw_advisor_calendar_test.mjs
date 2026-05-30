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

  // 預塞 JWT 自動登入 + 清舊對話
  await context.addInitScript(({ token, user }) => {
    localStorage.setItem("token", token);
    localStorage.setItem("user", user);
    localStorage.removeItem("advisor_messages");
    localStorage.removeItem("advisor_narrative");
    localStorage.removeItem("advisor_structured_store");
  }, { token: TOKEN, user: USER });

  const page = await context.newPage();

  // ── Step 1: 前往 AI 顧問頁面 ──
  console.log("=== Step 1: 前往 AI 顧問頁面 ===");
  await page.goto(`${BASE}/advisor`, { waitUntil: "networkidle" });
  await page.waitForTimeout(2000);

  const title = await page.locator("text=AI 營養顧問").first();
  if (await title.isVisible()) {
    console.log("✓ AI 營養顧問頁面已載入");
  }

  // ── Step 2: 請 AI 顧問分析一份食譜（觸發 analyze_recipe 工具）──
  console.log("\n=== Step 2: 請 AI 顧問分析食譜 ===");
  const textarea = page.locator('textarea[placeholder*="輸入你的問題"]');
  await textarea.fill("幫我分析一份午餐食譜的營養：雞腿便當（雞腿1隻、白飯1碗、炒青菜、荷包蛋1顆）");
  await page.waitForTimeout(500);

  const sendBtn = page.locator('button:has-text("送出")');
  await sendBtn.click();
  console.log("✓ 已送出食譜分析請求");

  // 等待 AI 回應
  console.log("⏳ 等待 AI 分析回應（最多 180 秒）...");
  try {
    await page.locator('button:has-text("送出 ▶")').waitFor({ timeout: 180_000 });
    console.log("✓ AI 食譜分析完成");
  } catch (e) {
    console.log("⚠ AI 回應超時，繼續下一步...");
  }

  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/advisor_cal_step2.png", fullPage: true });
  console.log("📸 截圖: /tmp/advisor_cal_step2.png");

  // ── Step 3: 請 AI 顧問把分析結果加到今天的行事曆 ──
  console.log("\n=== Step 3: 請 AI 顧問加入行事曆 ===");
  await textarea.fill("把這份食譜加到今天的行事曆");
  await page.waitForTimeout(500);
  await sendBtn.click();
  console.log("✓ 已送出「加到行事曆」請求");

  console.log("⏳ 等待 AI 回應...");
  try {
    await page.locator('button:has-text("送出 ▶")').waitFor({ timeout: 120_000 });
    console.log("✓ AI 回應完成");
  } catch (e) {
    console.log("⚠ AI 回應超時...");
  }

  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/advisor_cal_step3.png", fullPage: true });
  console.log("📸 截圖: /tmp/advisor_cal_step3.png");

  // ── Step 4: 前往行事曆頁面確認是否真的有加進去 ──
  console.log("\n=== Step 4: 前往行事曆頁面確認 ===");
  await page.goto(`${BASE}/calendar`, { waitUntil: "networkidle" });
  await page.waitForTimeout(3000);
  await page.screenshot({ path: "/tmp/advisor_cal_step4.png", fullPage: true });
  console.log("📸 截圖: /tmp/advisor_cal_step4.png");

  // ── 保持瀏覽器開啟讓使用者觀察 ──
  console.log("\n=== 測試完成 ===");
  console.log("瀏覽器保持開啟，按 Ctrl+C 結束");

  await page.waitForTimeout(120_000);
  await browser.close();
})();
