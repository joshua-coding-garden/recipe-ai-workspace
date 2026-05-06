# Phase 8+9: Four Retrieval Methods Comparison

## Query 1 (Detail): "How does leucine trigger muscle protein synthesis, and what is the optimal per-meal dose?"

### Method A: Traditional Vector RAG
**Answer:** Leucine stimulates muscle protein synthesis (MPS) by activating the protein translation machinery, with approximately 1-3 g of leucine per meal needed to trigger this process. Essential amino acids (EAAs) at doses of 6-15 g exert stimulatory effects on MPS, and while leucine alone can independently stimulate protein synthesis, a balanced consumption of all EAAs promotes the greatest increases. Protein doses of 20-40 g per meal are recommended, with research showing that consuming meals with adequate leucine/BCAA content best promotes MPS. Notably, leucine-enriched supplements improve MPS even in elderly men independently of hyperaminoacidaemia, and older adults may require greater relative protein intakes than younger individuals to stimulate myofibrillar protein synthesis.

**Scores:** Completeness: 4/5 | Specificity: 4/5 | Accuracy: 4/5

### Method B: Local Search (GraphRAG)
**Answer:** Leucine triggers muscle protein synthesis through the mTORC1 signaling pathway, specifically via Rag A/B phosphorylation (mTORC1 TRIGGERS MPS, strength 8.8). The optimal per-meal leucine dose is approximately 1-3 g to stimulate protein translation machinery, though leucine alone produces only a transient 1-2 hour MPS rise -- a balanced array of all EAAs is required for sustained synthesis. Wilson et al. demonstrated that leucine consumption alone has lower MPS duration than a whole meal, and 20 g whey protein every 3 hours optimizes myofibrillar protein synthesis (Areta's research). For older adults facing anabolic resistance, higher doses (40 g whey vs 20 g) are needed, and total daily protein intake of 1.6+ g/kg/day is the strongest predictor of muscle hypertrophy (~0.41 effect size per additional g/kg/day).

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

### Method C: Global Search (GraphRAG)
**Answer:** Leucine triggers MPS by activating mTORC1 via Rag A/B phosphorylation, which in turn drives both muscle protein synthesis and muscle hypertrophy; this is confirmed by the fact that rapamycin (an mTORC1 inhibitor) correspondingly blocks MPS. The optimal approach involves 20-40 g of leucine-rich protein (such as whey) distributed every 3-5 hours, as leucine alone produces only a transient 1-2 hour MPS spike and sustained synthesis requires a full complement of EAAs. Total daily protein intake (1.6+ g/kg/day) is actually the strongest predictor of hypertrophy, with a ~0.41 effect size per additional g/kg/day, while timing effects disappear once total intake is controlled. Older adults face anabolic resistance that can be partially overcome with higher leucine doses (e.g., 40 g whey), and a novel metabolic link through the serine synthesis pathway (via PHGDH) also contributes to MPS, with blocking this pathway reducing total muscle protein by 36.8%.

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

### Method D: Drift Search (GraphRAG)
**Answer:** Leucine triggers MPS by activating mTORC1 via Rag A/B phosphorylation, which subsequently drives both protein synthesis and hypertrophy. The optimal per-meal dose is approximately 1-3 g of leucine, typically achieved through 20 g of whey protein consumed every 3 hours, as leucine alone only produces a transient 1-2 hour MPS response and a balanced EAA supply is needed for sustained synthesis. Total daily protein intake (1.6+ g/kg/day) matters more than precise timing, as Schoenfeld and Aragon's meta-analysis (23 trials, 478 subjects for strength) found no significant timing benefit once total intake was controlled. Wilson et al. showed that leucine alone has shorter MPS duration than a complete meal, and HMB (a leucine metabolite) may also contribute to MPS stimulation. Older adults require higher per-meal protein doses to overcome age-related anabolic resistance.

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

---

## Query 2 (Broad): "What are the major research themes in sports nutrition over the past decade?"

### Method A: Traditional Vector RAG
**Answer:** The retrieved context points to several major themes: periodized nutrition (matching dietary plans to training cycles, as advocated by Jeukendrup 2017), energy availability and Relative Energy Deficiency in Sport (REDs) as a health concern, personalized nutrition plans for individual athletes, the role of dietary supplements versus a food-first approach, and vegetarian/vegan diets in athletic populations. Additional themes include antioxidant supplementation and its complex relationship with exercise adaptation, recovery nutrition strategies involving carbohydrate-protein combinations, and micronutrient considerations (bone health, immune function). However, the context is fragmented across reference lists and position statement excerpts rather than providing a coherent thematic overview.

**Scores:** Completeness: 3/5 | Specificity: 2/5 | Accuracy: 4/5

### Method B: Local Search (GraphRAG)
**Answer:** Major research themes in sports nutrition include periodized nutrition (aligning dietary strategies with training cycles), personalized nutrition approaches based on individual athlete needs, and the expanding role of credentialed sports dietitians (CSSD/RDN) in athlete care. The context highlights energy availability as a foundational concept, with REDs (Relative Energy Deficiency in Sport) emerging as a major clinical concern -- LEA below 30 kcal/kg FFM/day disrupts the hypothalamic-pituitary-ovarian axis. Supplement use and the food-first philosophy are also prominent themes. However, this method's entity retrieval was sparse (only 7 neighbors, 2 edges), providing a narrow view that misses several major themes like protein optimization, hydration science, and carbohydrate periodization.

**Scores:** Completeness: 2/5 | Specificity: 2/5 | Accuracy: 4/5

### Method C: Global Search (GraphRAG)
**Answer:** The major research themes over the past decade span at least five distinct areas: (1) protein timing and the anabolic window debate, where Schoenfeld and Aragon's meta-analysis of 23 trials challenged the narrow timing hypothesis and showed total intake matters more; (2) hydration science driven by the GSSI research network, including individualized sweat testing and dehydration physiology; (3) the protein requirements debate, with Phillips and Tarnopolsky establishing that athletes need 1.2-2.4 g/kg/day versus the 0.8 g/kg/day RDA; (4) sarcopenia management through whey protein plus resistance training (SUCRA=0.86 for muscle mass); and (5) micronutrient gaps in vegan athletes, including vitamin D deficiency increasing stress fracture risk 3.6-fold and the absence of beta-alanine, carnosine, and carnitine from plant diets. Industry-academic relationships (GSSI/PepsiCo, Dymatize) are a cross-cutting theme.

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

### Method D: Drift Search (GraphRAG)
**Answer:** Key research themes include: (1) protein timing, where Schoenfeld and Aragon's meta-analysis found no significant strength benefit from peri-workout timing (P=0.29), shifting focus to total daily intake; (2) hydration science, led by GSSI researchers like Baker and Jeukendrup, emphasizing individualized sweat testing and periodized nutrition frameworks; (3) protein supplementation and sarcopenia, with whey + resistance training ranking highest across SUCRA metrics; (4) nutrient timing more broadly, as covered by the ISSN position stand on macronutrient timing for recovery and MPS; and (5) antioxidant supplementation, where high-dose antioxidants may blunt training adaptations. The research is notably shaped by industry funding (PepsiCo/GSSI, Dymatize Nutrition) and published primarily through JISSN and Sports Medicine.

**Scores:** Completeness: 4/5 | Specificity: 4/5 | Accuracy: 5/5

---

## Query 3 (Multi-hop): "How do omega-3 fatty acids and antioxidant supplements interact in reducing exercise-induced muscle damage?"

### Method A: Traditional Vector RAG
**Answer:** Omega-3 fatty acids (EPA and DHA) reduce exercise-induced muscle damage markers by decreasing inflammatory responses: fish oil supplementation reduces oxidative stress markers after eccentric exercise, and higher omega-3 doses (6 g) significantly reduce creatine kinase levels at 24-72 hours. Antioxidant supplements operate through a separate but related pathway, with systematic reviews questioning whether antioxidant vitamins truly prevent EIMD, and evidence that chronic high-dose antioxidant supplementation may blunt beneficial training adaptations. The interaction between the two is not directly addressed in the retrieved chunks, though both target the inflammatory cascade -- omega-3s by reducing superoxide production and neutrophil activation, and antioxidants by scavenging reactive oxygen species. Omega-3 supplementation also increases muscle protein synthesis rate in older adults, suggesting an anabolic benefit beyond anti-inflammatory effects.

**Scores:** Completeness: 3/5 | Specificity: 3/5 | Accuracy: 4/5

### Method B: Local Search (GraphRAG)
**Answer:** Omega-3 fatty acids and antioxidant supplements address EIMD through complementary but mechanistically distinct pathways. Omega-3s reduce muscle damage by decreasing inflammatory markers (CRP, TNF-alpha, IL-6), preventing creatine kinase and myoglobin elevation, maintaining range of motion up to 5 days post-eccentric exercise, and reducing DOMS at 72-96 hours. On the antioxidant side, curcumin inhibits NF-kB signaling and increases glutathione levels, while N-acetylcysteine boosts glutathione as the primary thiol donor; however, high-dose vitamin C and E supplementation may paradoxically impair training adaptation. Polyphenol-rich foods like tart cherry and pomegranate juice improve EIMD outcomes without the adaptation-blunting risk. The key caution is that antioxidant supplementation may actually impair endurance exercise performance, whereas omega-3 supplementation consistently shows anti-inflammatory benefits.

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

### Method C: Global Search (GraphRAG)
**Answer:** Omega-3 fatty acids and antioxidants combat EIMD through overlapping but distinct mechanisms. Omega-3 PUFAs (EPA and DHA) competitively inhibit arachidonic acid for COX and LOX enzymes, shifting eicosanoid production toward anti-inflammatory mediators and suppressing the NF-kB pathway; at 5 g/day, omega-3 also activates the Akt-mTOR-S6K1 anabolic pathway and prevents muscle atrophy during immobilization. For antioxidants, curcumin inhibits NF-kB (strength 8.0), sulforaphane triggers Nrf2 for endogenous antioxidant defense without blunting adaptation, and NAC increases glutathione levels -- but high-dose vitamins C and E decrease mitochondrial biogenesis and may undermine training adaptations. Polyphenol-rich interventions (tart cherry, pomegranate juice, blackcurrant extract with ~105 mg anthocyanins) are preferred over isolated vitamin supplements. The omega-3 pathway also reduces inflammatory markers (CRP, IL-6) in aging athletes and maintains range of motion after eccentric exercise.

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

### Method D: Drift Search (GraphRAG)
**Answer:** Omega-3 fatty acids and antioxidants both target the inflammatory cascade triggered by EIMD but through different mechanisms. Omega-3 PUFAs (EPA/DHA) competitively inhibit arachidonic acid at COX/LOX enzymes and suppress NF-kB, reducing CRP, IL-6, and creatine kinase while preserving range of motion post-eccentric exercise; they also activate mTOR signaling and prevent muscle atrophy at 5 g/day during immobilization. Antioxidant interventions split into two categories: polyphenol-based compounds (curcumin inhibiting NF-kB, sulforaphane triggering Nrf2, tart cherry and pomegranate improving EIMD outcomes) are beneficial, while high-dose vitamins C and E risk blunting training adaptations by suppressing the ROS signaling needed for mitochondrial biogenesis. NAC increases glutathione as the primary thiol donor. The practical recommendation is to combine omega-3 supplementation with food-based polyphenol antioxidants rather than high-dose vitamin pills, especially during intensified training phases.

**Scores:** Completeness: 5/5 | Specificity: 5/5 | Accuracy: 5/5

---

## Final Comparison Table

| Method | Q1 (detail) | Q2 (broad) | Q3 (multi-hop) | Average |
|---|---|---|---|---|
| A. Vector RAG | 4.0 | 3.0 | 3.3 | 3.4 |
| B. Local Search | 5.0 | 2.7 | 5.0 | 4.2 |
| C. Global Search | 5.0 | 5.0 | 5.0 | 5.0 |
| D. Drift Search | 5.0 | 4.3 | 5.0 | 4.8 |

*(Each cell is the average of Completeness, Specificity, and Accuracy for that query-method pair.)*

## Analysis

**Global Search (C) was the clear overall winner**, achieving perfect scores across all three query types. Its strength lies in retrieving pre-synthesized community reports that already organize information thematically, making it especially dominant on the broad query (Q2) where it surfaced five distinct research themes with specific statistics, researcher names, and institutional networks -- information that no other method assembled as coherently.

**Drift Search (D) was a close second**, matching Global Search on the detail and multi-hop queries but falling slightly behind on Q2. Its two-phase architecture (report-level overview followed by local deep-dives with sub-queries) provides excellent coverage for focused questions, but the sub-query decomposition for the broad Q2 was somewhat narrow, failing to surface the vegan/micronutrient and vitamin D themes that Global Search captured through its wider community sweep.

**Local Search (B) showed a polarized pattern**: it excelled on Q1 and Q3 where the relevant entities (leucine/mTORC1, omega-3/EIMD) were well-connected in the graph, but performed poorly on Q2 because the seed entities ("Sports nutrition", "Sports foods") had very few graph neighbors (only 7 neighbors, 2 edges). This reveals Local Search's critical weakness -- it depends on the query mapping to high-degree entities with rich local neighborhoods. When the query is abstract or thematic, the entity graph around it may be sparse.

**Traditional Vector RAG (A) was consistently the weakest method.** On Q1, it retrieved relevant chunks containing the right information (leucine dose, EAA ranges) but presented them as disconnected reference fragments without the synthesized mechanistic narrative that GraphRAG methods provided. On Q2, the chunks were almost entirely reference lists and position-statement excerpts, making it nearly impossible to synthesize a coherent thematic overview. On Q3, it retrieved papers about both omega-3 and antioxidants but never connected the two topics mechanistically -- it could not "hop" between the omega-3 anti-inflammatory pathway and the antioxidant adaptation-blunting concern the way graph-based methods did.

The multi-hop query (Q3) is where GraphRAG's structural advantage is most visible. All three GraphRAG methods connected omega-3's NF-kB suppression with curcumin's NF-kB inhibition and the vitamin C/E adaptation-blunting risk into a single coherent answer, whereas Vector RAG noted each mechanism in isolation without linking them. This validates the core premise that knowledge graphs enable reasoning across entity boundaries that pure semantic similarity cannot bridge.

One important caveat: the GraphRAG methods benefit significantly from the quality of community report summaries generated during the indexing phase. If those summaries contained errors, the downstream answers would inherit them. Vector RAG, by contrast, surfaces raw source text, which is more transparent but less useful for synthesis tasks.
