const { chromium } = require('playwright');

async function waitForStepHeading(page, text, timeout = 120000) {
  await page.getByRole('heading', { name: text }).waitFor({ timeout });
}

(async () => {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({ viewport: { width: 1440, height: 1000 } });
  const page = await context.newPage();

  try {
    console.log('Opening login page...');
    await page.goto('http://localhost:3001/login', { waitUntil: 'domcontentloaded', timeout: 120000 });

    console.log('Logging in...');
    await page.locator('input[type="email"]').fill('agent.browser.test+20260325@example.com');
    await page.locator('input[type="password"]').fill('Test123456');
    await page.getByRole('button', { name: '登入' }).click();

    await page.waitForURL(/recipe-analyzer/, { timeout: 120000 });
    await waitForStepHeading(page, '步驟1: 輸入食譜文本');

    console.log('Submitting recipe text...');
    await page.getByPlaceholder('黑糖饅頭20g*4顆\n水煮蛋1顆\n鮮奶250cc').fill('洋蔥 1顆\n馬鈴薯 200g\n雞蛋 2顆\n水 500ml');
    await page.getByRole('button', { name: 'AI 識別食材' }).click();

    await waitForStepHeading(page, '步驟2: 確認與編輯食材');

    console.log('Looking up ingredients...');
    await page.getByRole('button', { name: '開始查詢營養資訊' }).click();
    await waitForStepHeading(page, '步驟3: 選擇匹配並輸入用量');

    const amountInputs = page.getByPlaceholder('用量 (如 3顆、200g)');
    const count = await amountInputs.count();
    for (let i = 0; i < count; i += 1) {
      await amountInputs.nth(i).fill(i === 0 ? '1顆' : i === 1 ? '200g' : '2顆');
    }

    console.log('Calculating nutrition...');
    await page.getByRole('button', { name: '計算完整營養素' }).click();
    await waitForStepHeading(page, '步驟4: 營養素結算結果');
    await page.getByText('營養素總量').waitFor({ timeout: 120000 });

    const screenshotPath = '/tmp/recipe-ai-agent-browser.png';
    await page.screenshot({ path: screenshotPath, fullPage: true });

    console.log('TEST_OK');
    console.log(`Screenshot: ${screenshotPath}`);
  } finally {
    await context.close();
    await browser.close();
  }
})();
