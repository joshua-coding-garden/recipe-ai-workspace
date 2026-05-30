import { chromium } from "playwright";

const TOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1MSIsImVtYWlsIjoiZWpvc2hmdUBnbWFpbC5jb20iLCJleHAiOjE3NzkyNDgyMzV9.YgHgQtt0yPHM05G_sFcdMjD_ZL8H7G5XCQrmivdkN-c";
const USER = JSON.stringify({ id: 51, email: "ejoshfu@gmail.com", name: null });

const BASE = "http://localhost:3001";

async function waitForReply(page, timeoutMs = 180_000) {
  try {
    await page.locator('button:has-text("送出 ▶")').waitFor({ timeout: timeoutMs });
    return true;
  } catch {
    return false;
  }
}

async function sendMessage(page, text) {
  const textarea = page.locator('textarea[placeholder*="輸入你的問題"]');
  await textarea.fill(text);
  await page.waitForTimeout(500);
  const sendBtn = page.locator('button:has-text("送出")');
  await sendBtn.click();
}

(async () => {
  const browser = await chromium.launch({
    headless: false,
    slowMo: 400,
  });

  const context = await browser.newContext({ viewport: { width: 1400, height: 900 } });

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
  console.log("✓ AI 營養顧問頁面已載入");

  // ── Step 2: 分析食譜（為後續新增做準備）──
  console.log("\n=== Step 2: 分析食譜 ===");
  await sendMessage(page, "幫我分析一份午餐食譜的營養：雞腿便當（雞腿1隻、白飯1碗、炒青菜、荷包蛋1顆）");
  console.log("✓ 已送出食譜分析請求");

  console.log("⏳ 等待 AI 分析回應（最多 180 秒）...");
  const step2ok = await waitForReply(page);
  console.log(step2ok ? "✓ AI 食譜分析完成" : "⚠ AI 回應超時");
  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/crud_step2_analyze.png", fullPage: true });
  console.log("📸 截圖: /tmp/crud_step2_analyze.png");

  // ── Step 3: 新增到行事曆 (CREATE) ──
  console.log("\n=== Step 3: 新增到行事曆 (CREATE) ===");
  await sendMessage(page, "把這份食譜加到今天的行事曆");
  console.log("✓ 已送出「加到行事曆」請求");

  console.log("⏳ 等待 AI 回應...");
  const step3ok = await waitForReply(page);
  console.log(step3ok ? "✓ AI 回應完成" : "⚠ AI 回應超時");
  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/crud_step3_create.png", fullPage: true });
  console.log("📸 截圖: /tmp/crud_step3_create.png");

  // ── Step 4: 查詢今天的行事曆 (READ) ──
  console.log("\n=== Step 4: 查詢今天的行事曆 (READ) ===");
  await sendMessage(page, "查看今天的行事曆");
  console.log("✓ 已送出「查看行事曆」請求");

  console.log("⏳ 等待 AI 回應...");
  const step4ok = await waitForReply(page);
  console.log(step4ok ? "✓ AI 回應完成" : "⚠ AI 回應超時");
  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/crud_step4_read.png", fullPage: true });
  console.log("📸 截圖: /tmp/crud_step4_read.png");

  // ── Step 5: 刪除行事曆紀錄 (DELETE) ──
  console.log("\n=== Step 5: 刪除行事曆紀錄 (DELETE) ===");
  await sendMessage(page, "刪除今天行事曆裡的雞腿便當");
  console.log("✓ 已送出「刪除行事曆」請求");

  console.log("⏳ 等待 AI 回應...");
  const step5ok = await waitForReply(page);
  console.log(step5ok ? "✓ AI 回應完成" : "⚠ AI 回應超時");
  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/crud_step5_delete.png", fullPage: true });
  console.log("📸 截圖: /tmp/crud_step5_delete.png");

  // ── Step 6: 再次查詢確認已刪除 ──
  console.log("\n=== Step 6: 再次查詢確認已刪除 ===");
  await sendMessage(page, "再看一次今天的行事曆");
  console.log("✓ 已送出查詢請求");

  console.log("⏳ 等待 AI 回應...");
  const step6ok = await waitForReply(page);
  console.log(step6ok ? "✓ AI 回應完成" : "⚠ AI 回應超時");
  await page.waitForTimeout(2000);
  await page.screenshot({ path: "/tmp/crud_step6_verify.png", fullPage: true });
  console.log("📸 截圖: /tmp/crud_step6_verify.png");

  // ── Step 7: 前往行事曆頁面確認 ──
  console.log("\n=== Step 7: 前往行事曆頁面確認 ===");
  await page.goto(`${BASE}/calendar`, { waitUntil: "networkidle" });
  await page.waitForTimeout(3000);
  await page.screenshot({ path: "/tmp/crud_step7_calendar_page.png", fullPage: true });
  console.log("📸 截圖: /tmp/crud_step7_calendar_page.png");

  console.log("\n=== CRUD 測試完成 ===");
  console.log("瀏覽器保持開啟，按 Ctrl+C 結束");
  await page.waitForTimeout(120_000);
  await browser.close();
})();
