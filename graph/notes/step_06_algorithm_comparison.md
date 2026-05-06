# Phase 6：Louvain vs Leiden 社群偵測對照

## 統計對照

| 指標 | Louvain | Leiden |
|---|---|---|
| 社群數 | 20 | 20 |
| Modularity | 0.6745 | 0.6743 |
| 執行時間 | 0.09s | 0.03s |
| 不連通社群數 | 0 | 0 |
| 全部連通？ | ✅ | ✅（Leiden 保證） |

## 社群大小分佈

### Louvain
{
  "6": 268,
  "14": 147,
  "11": 143,
  "17": 125,
  "4": 123,
  "8": 109,
  "12": 102,
  "13": 100,
  "18": 97,
  "15": 97,
  "9": 95,
  "7": 78,
  "5": 77,
  "0": 68,
  "2": 67,
  "3": 66,
  "10": 54,
  "1": 51,
  "16": 12,
  "19": 9
}

### Leiden
{
  "0": 245,
  "1": 159,
  "2": 145,
  "3": 144,
  "4": 141,
  "5": 118,
  "6": 111,
  "7": 104,
  "8": 102,
  "9": 102,
  "10": 100,
  "11": 86,
  "12": 83,
  "13": 73,
  "14": 66,
  "15": 55,
  "16": 17,
  "17": 16,
  "18": 12,
  "19": 9
}

## Louvain 前 10 社群主力節點

- **C6** (268 nodes): Muscle protein synthesis (deg 84), Whey protein (deg 69), Protein (deg 64)
- **C14** (147 nodes): LEA (deg 79), REDs (deg 60), Bone mineral density (deg 22)
- **C11** (143 nodes): Creatine (deg 67), Creatine Monohydrate (deg 26), Nitrate (deg 23)
- **C17** (125 nodes): Meta-analysis (deg 46), Curcumin (deg 27), Systematic Review (deg 21)
- **C4** (123 nodes): EIMD (deg 75), DOMS (deg 27), Tart cherry juice (deg 25)
- **C8** (109 nodes): Sodium (deg 32), Sweating rate (deg 13), International Olympic Committee (deg 11)
- **C12** (102 nodes): Probiotics (deg 68), URTI (deg 21), Inflammation (deg 11)
- **C13** (100 nodes): Carbohydrate (deg 70), Glycogen resynthesis (deg 27), Glucose (deg 24)
- **C18** (97 nodes): Vitamin C (deg 36), Vitamin E (deg 26), AMPK (deg 21)
- **C15** (97 nodes): Caffeine (deg 121), Coffee (deg 9), Caffeine Chewing Gum (deg 5)

## Leiden 前 10 社群主力節點

- **C0** (245 nodes): EIMD (deg 75), Vitamin C (deg 36), Oxidative stress (deg 33)
- **C1** (159 nodes): Whey protein (deg 69), Protein (deg 64), Sarcopenia (deg 64)
- **C2** (145 nodes): Carbohydrate (deg 70), Glycogen resynthesis (deg 27), Glucose (deg 24)
- **C3** (144 nodes): LEA (deg 79), REDs (deg 60), Bone mineral density (deg 22)
- **C4** (141 nodes): Muscle protein synthesis (deg 84), Essential amino acids (deg 51), Muscle hypertrophy (deg 37)
- **C5** (118 nodes): Creatine (deg 67), HMB (deg 35), ISSN (deg 33)
- **C6** (111 nodes): Caffeine (deg 121), Energy drink (deg 11), Coffee (deg 9)
- **C7** (104 nodes): Probiotics (deg 68), URTI (deg 21), Inflammation (deg 11)
- **C8** (102 nodes): Sodium (deg 32), Sweating rate (deg 13), EAH (deg 10)
- **C9** (102 nodes): Endurance performance (deg 34), Dehydration (deg 21), Hypohydration (deg 18)

## 觀察

1. **Modularity 幾乎相同**（兩者都 ~0.674），社群數也都是 20——在這個規模的圖上兩個算法表現接近
2. **Louvain 這次沒有出現不連通社群**——但這不代表不會出現，只是這張圖剛好沒觸發那個 bug
3. **Leiden 保證連通**是算法層面的保證，不依賴運氣
4. **Leiden 快 3 倍**（0.03s vs 0.09s），在更大的圖上差異會更明顯
5. **社群主題清晰**：蛋白質/肌肉合成、LEA/REDs、creatine/ergogenic、EIMD/recovery、probiotics/immune 等——與 65 篇運動員營養論文的主題高度吻合
