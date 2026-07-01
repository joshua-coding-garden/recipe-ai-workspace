# Gemini Follow-up Prompt：修正 50 篇運動員營養論文清單

> **用法**：在**同一個 Gemini thread**（上次給我 50 篇清單那一個）貼下方 `===` 之間的整段。
> 不要開新 thread，否則 Gemini 看不到先前的論文清單。

===

我上次請你找的 50 篇運動員營養論文清單收到了。**這次任務不是找新論文，只是把上次答案的破洞補起來**。請按下列 3 個任務逐一修正後，重發完整清單。

## 任務 A：刪除 3 個重複/占位條目，重編號為 1–47

| 原編號 | 你寫的內容 | 處理 |
|---|---|---|
| 13 | 「ISSN 蛋白質與運動（與 #1 不同角度）」+ 你的備註「此文獻與 #1 同篇」 | **刪除** |
| 36 | 「碳水補充對耐力肝醣利用統合分析（重複 7# 的不同期刊版本）」 | **刪除** |
| 42 | 「碳水化合物補充對耐力表現的統合回歸分析（重複 #6 補充版本）」 | **刪除** |

刪除後共 47 篇，**從 1 重新編號到 47**，後面所有引用編號都要連動更新。

## 任務 B：補齊「待確認 / 推測 / 待查」的欄位

下表列出每個有破洞的論文（**沿用你上次的原編號**，方便你定位），請對每篇用 **PubMed + Google Scholar 雙重驗證**後給最終答案：

| 上次編號 | 主題短稱 | 你目前缺的欄位 |
|---|---|---|
| 5 | Beetroot Juice umbrella review (Nutrients 2025) | PMID、引用次數 |
| 6 | Acute carb feeding endurance meta (Crit Rev Food Sci Nutr 2024) | PMID、引用次數、PDF link |
| 10 | Nitrate cycling sprint meta (Tan R, Nutrients 2024) | PMID、引用次數 |
| 17 | Li omega-3 meta-analysis FASEB Journal 2026 | DOI、PMID、引用、OA、PDF link。**若 2026 年此論文尚未實際上線，明白標出並從清單刪除，補一篇 2024–2025 年同主題既有 meta-analysis 替代** |
| 18 | Tart cherry + pomegranate review | DOI、PMID、期刊全名（你寫「Biological Research For Nursing 2020 推測」，請確認 PMC7425296 是否真對應這篇）|
| 19 | Nieman 運動免疫綜述 | **期刊全名 + 卷期 + DOI + PMID 全部缺**（你只寫「推測 Nutrients 或相關期刊」）|
| 21 | 個人化微量營養素 RCT (Nutrients 2024) | DOI、PMID、期刊卷期（PMC11124258 是線索，請反查）|
| 28 | 大師級運動員膳食攝取系統性回顧 | DOI、PMID、期刊卷期 |
| 29 | 乳清蛋白 + 維生素 D 對肌少症 meta | DOI、PMID、期刊卷期 |
| 33 | ISSN Omega-3 立場聲明 2025 | DOI、PMID、PDF link。**請確認 ISSN 2025 年是否真的發過 Omega-3 立場聲明**——你打「推測」「待確認」太多，可能根本不存在。若不存在請刪除 |
| 34 | Fish oil athletes systematic review | DOI、PMID、PDF link、期刊確認（你寫「Adv Nutr 2020 推測」+ PMID 32437524 推測）|
| 35 | Philpott omega-3 current perspectives | DOI、PMID、期刊（全空）|
| 37 | Carb intake exercise review | DOI、PMID、期刊（你打「推測 Nutrition Reviews」但全空，第一作者也匿名）|
| 38 | Schoenfeld 2013 protein timing | 確認 DOI 與 PMID（這篇是經典文獻，應該很易查）|
| 39 | Protein type + added leucine | DOI、PMID、期刊（你只寫「推測 AJCN」，第一作者匿名）|
| 40 | Omega-3 sports nutrition overview | DOI、PMID、期刊 |
| 41 | ISSN 2024 整合運動營養立場聲明 | DOI、PMID、PDF link。**請確認 ISSN 2024 年是否真的發過此聲明**——若無請刪除並補一篇 ISSN 既有的近期立場聲明 |
| 43 | ISSN Ultraendurance 立場聲明 | DOI、PMID、PDF link。**請確認 ISSN 2019 年是否真的發過 ultraendurance 立場聲明**——若無請刪除 |
| 44 | 法文 nutrition récupération | DOI、PMID、期刊。**若無法定位請刪除並補替代** |
| 45 | GrassrootsHealth omega-3 expert summary | **這似乎不是 peer-reviewed 期刊論文，而是基於 Li 2026 的網站專家解讀，與 #17 同源**——**直接刪除** |
| 46 | Iron/Zinc/Vit C 免疫綜述 | DOI、PMID、期刊全名 |
| 47 | Zinc 補充免疫系統性回顧 | DOI、PMID、期刊全名 |
| 48 | Nitrate endurance meta | DOI、PMID、期刊（你打「推測 JISSN 或 Nutrients」）|
| 49 | Carb mouth rinse review | DOI、PMID 確認（PMC9143639 是線索）|

## 任務 C：paywall 條目補 publisher landing URL

下列 OA=No 的條目，全文 PDF 連結只寫「paywall」沒給 URL。即使沒有免費 PDF，**仍要給 publisher landing 頁**（讀者可以付費或透過大學圖書館取得）：

`#2、#6、#7、#15、#22、#25、#26、#27、#31、#50`

範例：BJSM 的 #2 應給 `https://bjsm.bmj.com/content/57/17/1073`。

## 驗證規則（重要，請逐條遵守）

1. **不要編造 DOI**。每個 DOI 必須能在 `https://doi.org/[DOI]` 解析到正確的論文頁。
2. **PubMed ID 必須能在 `https://pubmed.ncbi.nlm.nih.gov/[PMID]/` 找到，且該頁標題與你回的英文標題一致**。
3. **若某篇你查證後確實找不到 PubMed/DOI 紀錄**，請明白寫「⚠️ 無法驗證此論文存在」並從清單中刪除，再推薦 1 篇同主題、有確切 DOI 與 PMID 的替代論文。
4. 引用次數請以 Google Scholar 為準；若該文太新無法計算，寫具體數字（如「12」）而非「待確認」。
5. **第一作者匿名（標「第一作者 et al.」）的論文必須補上真實第一作者姓名**。

## 回覆格式

請只重發**修正後的 47 篇完整清單**（沿用上次的格式）+ 末尾總表（47 列）。
**不要重新生成主題不同的論文**——僅針對上次清單做修正、刪除、替代。

開始吧。

===
