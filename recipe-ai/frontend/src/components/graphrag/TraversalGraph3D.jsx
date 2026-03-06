import { useEffect, useRef, useState, useCallback, useMemo } from "react";
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls.js";
import { Tween, Group as TweenGroup, Easing } from "@tweenjs/tween.js";

const TYPE_COLORS = {
  NUTRIENT: "#2ecc71",
  FOOD: "#e67e22",
  DISEASE: "#e74c3c",
  CONCEPT: "#3498db",
  PERSON: "#9b59b6",
  ORGANIZATION: "#1abc9c",
  REPORT: "#ff6b9d",
  UNKNOWN: "#95a5a6",
};

const ROLE_CFG = {
  seed:             { radius: 3.0, emissive: 0.8, color: "#f59e0b" },
  neighbor:         { radius: 1.8, emissive: 0.5, color: "#10b981" },
  community_entity: { radius: 1.8, emissive: 0.4, color: null },
  community_hub:    { radius: 2.5, emissive: 0.7, color: null },
  sub_seed:         { radius: 2.2, emissive: 0.6, color: null },
  sub_neighbor:     { radius: 1.5, emissive: 0.4, color: "#10b981" },
};

const STEP_ICONS = {
  seed: "\u{1F3AF}", neighbor: "\u{1F517}",
  community_entity: "\u{1F4CA}", community_hub: "\u{1F4CA}",
  sub_seed: "➤", sub_neighbor: "\u{1F517}",
};

function lightenHex(hex, amount = 0.3) {
  const c = new THREE.Color(hex);
  c.lerp(new THREE.Color(0xffffff), amount);
  return "#" + c.getHexString();
}

function getNodeColor(node, methodColor) {
  const cfg = ROLE_CFG[node.role] || ROLE_CFG.neighbor;
  if (cfg.color) return cfg.color;
  if (node.role === "community_hub") return methodColor;
  if (node.role === "sub_seed") return lightenHex(methodColor);
  return TYPE_COLORS[node.type] || TYPE_COLORS.UNKNOWN;
}

function pseudoRandom(str) {
  let h = 0;
  for (let i = 0; i < str.length; i++) h = ((h << 5) - h + str.charCodeAt(i)) | 0;
  return (Math.abs(h) % 1000) / 1000;
}

function computeNodePositions(nodes) {
  const n = nodes.length;
  const scale = n <= 15 ? 1.2 : n <= 30 ? 1.0 : 0.85;
  const bands = [
    [4, 8], [18, 28], [30, 40], [36, 46], [40, 50], [44, 54],
  ];
  const groups = {};
  for (const nd of nodes) {
    const s = nd.step;
    if (!groups[s]) groups[s] = [];
    groups[s].push(nd);
  }
  const positions = {};
  const goldenAngle = Math.PI * (3 - Math.sqrt(5));
  for (const [stepStr, group] of Object.entries(groups)) {
    const step = parseInt(stepStr);
    const [rMin, rMax] = bands[Math.min(step, 5)];
    const rmn = rMin * scale, rmx = rMax * scale;
    const cnt = group.length;
    for (let i = 0; i < cnt; i++) {
      const nd = group[i];
      const y = cnt === 1 ? 0 : 1 - (i / (cnt - 1)) * 2;
      const radAtY = Math.sqrt(1 - y * y);
      const theta = goldenAngle * i + step * 2.39;
      const r = rmn + (rmx - rmn) * pseudoRandom(nd.id);
      positions[nd.id] = new THREE.Vector3(
        Math.cos(theta) * radAtY * r,
        y * r,
        Math.sin(theta) * radAtY * r,
      );
    }
  }
  return positions;
}

function buildNodeMesh(node, methodColor, sharedGeo) {
  const color = getNodeColor(node, methodColor);
  const cfg = ROLE_CFG[node.role] || ROLE_CFG.neighbor;
  const threeColor = new THREE.Color(color);
  const mat = new THREE.MeshStandardMaterial({
    color: threeColor,
    emissive: threeColor,
    emissiveIntensity: cfg.emissive,
    metalness: 0.3,
    roughness: 0.4,
    transparent: true,
    opacity: 0.92,
  });
  const mesh = new THREE.Mesh(sharedGeo, mat);
  mesh.scale.setScalar(cfg.radius);
  mesh.userData = { nodeId: node.id, nodeData: node, baseRadius: cfg.radius };
  return mesh;
}

const ARROW_GEO = new THREE.ConeGeometry(1.5, 4.0, 8);
ARROW_GEO.rotateX(Math.PI / 2);

function flyArrow(scene, tweenGroup, srcPos, tgtPos, color) {
  const threeColor = new THREE.Color(color);
  const mat = new THREE.MeshStandardMaterial({
    color: threeColor,
    emissive: threeColor,
    emissiveIntensity: 0.9,
    metalness: 0.5,
    roughness: 0.2,
    transparent: true,
    opacity: 0.9,
  });
  const arrow = new THREE.Mesh(ARROW_GEO, mat);
  arrow.position.copy(srcPos);
  arrow.lookAt(tgtPos);
  scene.add(arrow);

  const state = { t: 0 };
  const src = srcPos.clone(), tgt = tgtPos.clone();
  new Tween(state, tweenGroup)
    .to({ t: 1 }, 800)
    .easing(Easing.Quadratic.InOut)
    .onUpdate(() => {
      arrow.position.lerpVectors(src, tgt, state.t);
      arrow.lookAt(tgt);
    })
    .onComplete(() => {
      scene.remove(arrow);
      mat.dispose();
    })
    .start();
}

function fireArrows(scene, tweenGroup, edges, newIds, oldIds, positions, color) {
  const candidates = [];
  for (const e of edges) {
    let from, to;
    if (newIds.has(e.target) && oldIds.has(e.source)) { from = e.source; to = e.target; }
    else if (newIds.has(e.source) && oldIds.has(e.target)) { from = e.target; to = e.source; }
    else continue;
    if (!positions[from] || !positions[to]) continue;
    candidates.push({ from, to, w: e.weight || 0 });
  }
  candidates.sort((a, b) => b.w - a.w);
  for (const c of candidates.slice(0, 20)) {
    flyArrow(scene, tweenGroup, positions[c.from].clone(), positions[c.to].clone(), color);
  }
}

function buildEdgeLines(visEdges, positions, currentStep, methodColor) {
  const groups = { current: [], prev: [], old: [] };
  for (const e of visEdges) {
    const sPos = positions[e.source], tPos = positions[e.target];
    if (!sPos || !tPos) continue;
    const maxStep = Math.max(e._srcStep ?? 0, e._tgtStep ?? 0);
    const bucket = maxStep === currentStep ? "current" : maxStep === currentStep - 1 ? "prev" : "old";
    groups[bucket].push(sPos.x, sPos.y, sPos.z, tPos.x, tPos.y, tPos.z);
  }
  const result = [];
  const configs = [
    { key: "current", color: methodColor, opacity: 0.6 },
    { key: "prev", color: "#ffffff", opacity: 0.2 },
    { key: "old", color: "#ffffff", opacity: 0.08 },
  ];
  for (const cfg of configs) {
    const arr = groups[cfg.key];
    if (arr.length === 0) continue;
    const geo = new THREE.BufferGeometry();
    geo.setAttribute("position", new THREE.Float32BufferAttribute(arr, 3));
    const mat = new THREE.LineBasicMaterial({
      color: new THREE.Color(cfg.color),
      transparent: true,
      opacity: cfg.opacity,
    });
    result.push(new THREE.LineSegments(geo, mat));
  }
  return result;
}

function SearchLog({ entries }) {
  const endRef = useRef(null);
  useEffect(() => {
    endRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [entries.length]);
  return (
    <div style={S.logPanel}>
      <div style={S.logTitle}>Search Log</div>
      {entries.map((e, i) => (
        <div key={e.id + "-" + e.step} style={{
          ...S.logEntry,
          animation: `fadeSlideIn 0.3s ease ${i * 0.02}s both`,
        }}>
          <span style={S.logIcon}>{e.icon}</span>
          <span style={S.logName} title={e.id}>
            {e.id.length > 22 ? e.id.slice(0, 20) + "…" : e.id}
          </span>
          <span style={{ ...S.logType, color: TYPE_COLORS[e.type] || "#8b949e" }}>
            {e.type}
          </span>
        </div>
      ))}
      <div ref={endRef} />
      <style>{`@keyframes fadeSlideIn {
        from { opacity:0; transform:translateX(12px); }
        to   { opacity:1; transform:translateX(0); }
      }`}</style>
    </div>
  );
}

export default function TraversalGraph3D({ traversalGraph, methodColor }) {
  const containerRef = useRef(null);
  const sceneRef = useRef(null);
  const prevVisIdsRef = useRef(new Set());
  const animRef = useRef(null);
  const loopRef = useRef(false);
  const tooltipRef = useRef(null);

  const [currentStep, setCurrentStep] = useState(-1);
  const [isAnimating, setIsAnimating] = useState(false);

  const mc = methodColor || "#58a6ff";

  // Effect A: Scene lifecycle
  useEffect(() => {
    if (!containerRef.current || !traversalGraph) return;
    const container = containerRef.current;

    // Cleanup previous
    if (sceneRef.current) {
      cancelAnimationFrame(sceneRef.current.rafId);
      sceneRef.current.controls.dispose();
      sceneRef.current.renderer.dispose();
      sceneRef.current.nodeMeshMap.forEach((m) => m.material.dispose());
      sceneRef.current.sharedGeo.dispose();
      sceneRef.current.tweenGroup.removeAll();
      while (container.firstChild && container.firstChild.tagName === "CANVAS") {
        container.removeChild(container.firstChild);
      }
    }

    const w = container.clientWidth || 800;
    const h = 440;

    // Scene
    const scene = new THREE.Scene();
    scene.fog = new THREE.FogExp2(0x0d1117, 0.005);

    // Camera — distance adapts to node count
    const camera = new THREE.PerspectiveCamera(60, w / h, 0.1, 1000);
    const nodeCount = traversalGraph.nodes.length;
    const camZ = nodeCount <= 15 ? 55 : nodeCount <= 30 ? 70 : 90;
    camera.position.set(0, camZ * 0.3, camZ);

    // Renderer
    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(w, h);
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setClearColor(0x0d1117);
    container.insertBefore(renderer.domElement, container.firstChild);

    // Lights
    scene.add(new THREE.AmbientLight(0xffffff, 0.6));
    const dirLight = new THREE.DirectionalLight(0xffffff, 0.8);
    dirLight.position.set(50, 100, 50);
    scene.add(dirLight);

    // Controls
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableDamping = true;
    controls.dampingFactor = 0.05;
    controls.autoRotate = true;
    controls.autoRotateSpeed = 0.5;
    controls.minDistance = 20;
    controls.maxDistance = 250;

    // Shared resources
    const sharedGeo = new THREE.SphereGeometry(1, 16, 16);
    const tweenGroup = new TweenGroup();
    const nodeGroup = new THREE.Group();
    const edgeGroup = new THREE.Group();
    scene.add(edgeGroup);
    scene.add(nodeGroup);

    // Compute positions
    const positions = computeNodePositions(traversalGraph.nodes);
    const nodeMeshMap = new Map();

    // Raycaster for hover/click
    const raycaster = new THREE.Raycaster();
    const mouse = new THREE.Vector2();
    let hoveredMesh = null;

    const onPointerMove = (ev) => {
      const rect = renderer.domElement.getBoundingClientRect();
      mouse.x = ((ev.clientX - rect.left) / rect.width) * 2 - 1;
      mouse.y = -((ev.clientY - rect.top) / rect.height) * 2 + 1;
      raycaster.setFromCamera(mouse, camera);
      const hits = raycaster.intersectObjects(nodeGroup.children, false);

      if (hoveredMesh && (!hits.length || hits[0].object !== hoveredMesh)) {
        const br = hoveredMesh.userData.baseRadius;
        hoveredMesh.scale.setScalar(br);
        hoveredMesh.material.emissiveIntensity = ROLE_CFG[hoveredMesh.userData.nodeData?.role]?.emissive || 0.4;
        hoveredMesh = null;
      }

      if (hits.length > 0) {
        const hit = hits[0].object;
        if (hit !== hoveredMesh) {
          hoveredMesh = hit;
          hit.scale.setScalar(hit.userData.baseRadius * 1.3);
          hit.material.emissiveIntensity = 1.0;
        }
        // Tooltip
        if (tooltipRef.current) {
          const nd = hit.userData.nodeData;
          const pos = hit.position.clone().project(camera);
          const px = (pos.x * 0.5 + 0.5) * rect.width;
          const py = (-pos.y * 0.5 + 0.5) * rect.height;
          const color = getNodeColor(nd, mc);
          tooltipRef.current.style.display = "block";
          tooltipRef.current.style.left = px + "px";
          tooltipRef.current.style.top = (py - 10) + "px";
          tooltipRef.current.innerHTML =
            `<b style="color:${color}">${nd.id}</b><br/>` +
            `<span style="opacity:0.6;font-size:11px">${nd.type} · ${nd.role}</span>` +
            (nd.degree ? `<br/><span style="opacity:0.5;font-size:11px">degree: ${nd.degree}</span>` : "") +
            (nd.description ? `<br/><i style="opacity:0.5;font-size:11px">${nd.description}</i>` : "");
        }
        renderer.domElement.style.cursor = "pointer";
      } else {
        if (tooltipRef.current) tooltipRef.current.style.display = "none";
        renderer.domElement.style.cursor = "grab";
      }
    };

    const onClick = (ev) => {
      const rect = renderer.domElement.getBoundingClientRect();
      mouse.x = ((ev.clientX - rect.left) / rect.width) * 2 - 1;
      mouse.y = -((ev.clientY - rect.top) / rect.height) * 2 + 1;
      raycaster.setFromCamera(mouse, camera);
      const hits = raycaster.intersectObjects(nodeGroup.children, false);
      if (hits.length > 0) {
        const nodePos = hits[0].object.position.clone();
        const dir = nodePos.clone().normalize();
        const targetCam = nodePos.clone().add(dir.multiplyScalar(30));
        new Tween(camera.position, tweenGroup)
          .to({ x: targetCam.x, y: targetCam.y, z: targetCam.z }, 800)
          .easing(Easing.Quadratic.InOut)
          .start();
        controls.target.copy(nodePos);
      }
    };

    renderer.domElement.addEventListener("pointermove", onPointerMove);
    renderer.domElement.addEventListener("click", onClick);

    // Animation loop
    let rafId;
    function animate() {
      rafId = requestAnimationFrame(animate);
      controls.update();
      tweenGroup.update();
      renderer.render(scene, camera);
    }
    animate();

    // Resize observer
    const ro = new ResizeObserver(() => {
      const nw = container.clientWidth || 800;
      camera.aspect = nw / h;
      camera.updateProjectionMatrix();
      renderer.setSize(nw, h);
    });
    ro.observe(container);

    // Store refs
    sceneRef.current = {
      scene, camera, renderer, controls, tweenGroup,
      nodeGroup, edgeGroup, nodeMeshMap, positions,
      sharedGeo, rafId,
    };
    prevVisIdsRef.current = new Set();

    return () => {
      cancelAnimationFrame(rafId);
      ro.disconnect();
      renderer.domElement.removeEventListener("pointermove", onPointerMove);
      renderer.domElement.removeEventListener("click", onClick);
      controls.dispose();
      nodeMeshMap.forEach((m) => m.material.dispose());
      sharedGeo.dispose();
      tweenGroup.removeAll();
      renderer.dispose();
      if (renderer.domElement.parentNode === container) {
        container.removeChild(renderer.domElement);
      }
      sceneRef.current = null;
    };
  }, [traversalGraph, mc]);

  // Effect B: Step change
  useEffect(() => {
    const ctx = sceneRef.current;
    if (!ctx || !traversalGraph) return;
    const { scene, nodeGroup, edgeGroup, nodeMeshMap, positions, sharedGeo, tweenGroup } = ctx;

    if (currentStep < 0) {
      while (nodeGroup.children.length) nodeGroup.remove(nodeGroup.children[0]);
      while (edgeGroup.children.length) {
        const c = edgeGroup.children[0];
        c.geometry.dispose();
        c.material.dispose();
        edgeGroup.remove(c);
      }
      prevVisIdsRef.current = new Set();
      return;
    }

    const nodeStepMap = {};
    for (const nd of traversalGraph.nodes) nodeStepMap[nd.id] = nd.step;

    const visNodes = traversalGraph.nodes.filter((n) => n.step <= currentStep);
    const visIds = new Set(visNodes.map((n) => n.id));
    const visEdges = traversalGraph.edges
      .filter((e) => visIds.has(e.source) && visIds.has(e.target))
      .map((e) => ({ ...e, _srcStep: nodeStepMap[e.source], _tgtStep: nodeStepMap[e.target] }));

    const prevIds = prevVisIdsRef.current;
    const newNodeIds = new Set(visNodes.filter((n) => !prevIds.has(n.id)).map((n) => n.id));

    // Add new node meshes
    for (const nd of visNodes) {
      if (nodeMeshMap.has(nd.id)) {
        const m = nodeMeshMap.get(nd.id);
        if (!nodeGroup.children.includes(m)) nodeGroup.add(m);
        continue;
      }
      const mesh = buildNodeMesh(nd, mc, sharedGeo);
      const pos = positions[nd.id];
      if (pos) mesh.position.copy(pos);
      nodeMeshMap.set(nd.id, mesh);
      nodeGroup.add(mesh);

      if (newNodeIds.has(nd.id)) {
        const target = mesh.userData.baseRadius;
        mesh.scale.setScalar(0.01);
        const o = { s: 0.01 };
        new Tween(o, tweenGroup)
          .to({ s: target }, 600)
          .easing(Easing.Elastic.Out)
          .onUpdate(() => mesh.scale.setScalar(o.s))
          .start();
      }
    }

    // Remove nodes not in visIds
    for (let i = nodeGroup.children.length - 1; i >= 0; i--) {
      const child = nodeGroup.children[i];
      if (!visIds.has(child.userData.nodeId)) nodeGroup.remove(child);
    }

    // Rebuild edges
    while (edgeGroup.children.length) {
      const c = edgeGroup.children[0];
      c.geometry.dispose();
      c.material.dispose();
      edgeGroup.remove(c);
    }
    const edgeLines = buildEdgeLines(visEdges, positions, currentStep, mc);
    for (const line of edgeLines) edgeGroup.add(line);

    // Fire arrows
    if (newNodeIds.size > 0 && prevIds.size > 0 && tweenGroup) {
      setTimeout(() => {
        if (!sceneRef.current) return;
        fireArrows(scene, tweenGroup, visEdges, newNodeIds, prevIds, positions, mc);
      }, 400);
    }

    prevVisIdsRef.current = visIds;
  }, [currentStep, traversalGraph, mc]);

  const maxStep = traversalGraph
    ? Math.max(...traversalGraph.steps.map((s) => s.step), -1)
    : -1;

  const startAnimation = useCallback(() => {
    clearTimeout(animRef.current);
    loopRef.current = true;
    setIsAnimating(true);
    setCurrentStep(-1);
    prevVisIdsRef.current = new Set();

    const runCycle = (initDelay = 300) => {
      let step = 0;
      const tick = () => {
        if (!loopRef.current) return;
        setCurrentStep(step);
        step++;
        if (step > maxStep) {
          animRef.current = setTimeout(() => {
            if (!loopRef.current) return;
            setCurrentStep(-1);
            prevVisIdsRef.current = new Set();
            animRef.current = setTimeout(() => {
              if (!loopRef.current) return;
              runCycle(0);
            }, 400);
          }, 2200);
        } else {
          animRef.current = setTimeout(tick, 1400);
        }
      };
      animRef.current = setTimeout(tick, initDelay);
    };
    runCycle();
  }, [maxStep]);

  const stopAnimation = useCallback(() => {
    loopRef.current = false;
    clearTimeout(animRef.current);
    setIsAnimating(false);
  }, []);

  const showAll = useCallback(() => {
    loopRef.current = false;
    clearTimeout(animRef.current);
    setIsAnimating(false);
    setCurrentStep(maxStep);
  }, [maxStep]);

  const stepForward = useCallback(() => {
    loopRef.current = false;
    clearTimeout(animRef.current);
    setIsAnimating(false);
    setCurrentStep((prev) => Math.min(prev + 1, maxStep));
  }, [maxStep]);

  useEffect(() => () => {
    loopRef.current = false;
    clearTimeout(animRef.current);
  }, []);

  const logEntries = useMemo(() => {
    if (!traversalGraph || currentStep < 0) return [];
    return traversalGraph.nodes
      .filter((n) => n.step <= currentStep)
      .map((n) => ({
        id: n.id, type: n.type, role: n.role, step: n.step,
        icon: STEP_ICONS[n.role] || "•",
      }));
  }, [traversalGraph, currentStep]);

  if (!traversalGraph || traversalGraph.nodes.length === 0) return null;

  return (
    <div style={S.container}>
      <div style={S.toolbar}>
        {isAnimating ? (
          <button onClick={stopAnimation} style={S.stopBtn}>停止</button>
        ) : (
          <button onClick={startAnimation} style={S.playBtn}>
            {currentStep >= 0 ? "重播" : "播放"}搜尋路徑
          </button>
        )}
        <button onClick={stepForward} disabled={isAnimating || currentStep >= maxStep} style={S.btn}>
          {"下一步"}
        </button>
        <button onClick={showAll} style={S.btn}>
          {"全部顯示"}
        </button>
        {currentStep >= 0 && (
          <span style={S.depthBadge}>
            Depth {currentStep + 1}/{maxStep + 1}
          </span>
        )}
        <span style={S.stats}>
          {traversalGraph.nodes.length} {"節點"} · {traversalGraph.edges.length} {"邊"}
        </span>
      </div>

      <div style={S.stepsRow}>
        {traversalGraph.steps.map((s) => (
          <span key={s.step} style={{
            ...S.stepBadge,
            opacity: currentStep >= s.step ? 1 : 0.35,
            borderColor: currentStep >= s.step ? mc : "#555",
            background: currentStep >= s.step ? mc + "20" : "transparent",
            color: currentStep >= s.step ? "#e6edf3" : "#666",
          }}>
            {s.label} ({s.node_ids.length})
          </span>
        ))}
      </div>

      <div style={{ position: "relative" }}>
        <div ref={containerRef} style={S.graphBox} />
        <div ref={tooltipRef} style={S.tooltip} />
        {currentStep >= 0 && logEntries.length > 0 && (
          <SearchLog entries={logEntries} />
        )}
      </div>

      <div style={S.legend}>
        {Object.entries(TYPE_COLORS)
          .filter(([k]) => k !== "UNKNOWN")
          .map(([type, color]) => (
            <span key={type} style={S.legendItem}>
              <span style={{ ...S.dot, background: color }} />
              {type}
            </span>
          ))}
      </div>
    </div>
  );
}

const S = {
  container: {
    marginTop: 8,
    border: "1px solid #30363d",
    borderRadius: 8,
    background: "#0d1117",
    overflow: "hidden",
  },
  toolbar: {
    display: "flex",
    alignItems: "center",
    gap: 8,
    padding: "8px 12px",
    background: "#161b22",
    borderBottom: "1px solid #30363d",
    flexWrap: "wrap",
  },
  playBtn: {
    background: "#238636",
    color: "#fff",
    border: "none",
    borderRadius: 6,
    padding: "5px 14px",
    cursor: "pointer",
    fontWeight: 600,
    fontSize: 13,
  },
  stopBtn: {
    background: "#da3633",
    color: "#fff",
    border: "none",
    borderRadius: 6,
    padding: "5px 14px",
    cursor: "pointer",
    fontWeight: 600,
    fontSize: 13,
  },
  btn: {
    background: "#21262d",
    color: "#c9d1d9",
    border: "1px solid #30363d",
    borderRadius: 6,
    padding: "5px 12px",
    cursor: "pointer",
    fontSize: 13,
  },
  depthBadge: {
    padding: "3px 12px",
    background: "rgba(88,166,255,0.15)",
    border: "1px solid rgba(88,166,255,0.3)",
    borderRadius: 12,
    fontSize: 12,
    color: "#58a6ff",
    fontWeight: 600,
    letterSpacing: 1,
  },
  stats: {
    fontSize: 11,
    color: "#8b949e",
    marginLeft: "auto",
  },
  stepsRow: {
    display: "flex",
    flexWrap: "wrap",
    gap: 6,
    padding: "6px 12px",
    background: "#161b22",
  },
  stepBadge: {
    fontSize: 11,
    padding: "2px 10px",
    border: "1px solid #555",
    borderRadius: 12,
    transition: "all 0.3s",
    whiteSpace: "nowrap",
  },
  graphBox: {
    width: "100%",
    height: 440,
    position: "relative",
  },
  legend: {
    display: "flex",
    flexWrap: "wrap",
    gap: 12,
    padding: "6px 12px",
    background: "#161b22",
    borderTop: "1px solid #30363d",
  },
  legendItem: {
    display: "flex",
    alignItems: "center",
    gap: 4,
    fontSize: 11,
    color: "#8b949e",
  },
  dot: {
    width: 8,
    height: 8,
    borderRadius: "50%",
    flexShrink: 0,
  },
  tooltip: {
    position: "absolute",
    pointerEvents: "none",
    zIndex: 20,
    display: "none",
    transform: "translate(-50%, -100%)",
    padding: "6px 10px",
    background: "rgba(13,17,23,0.92)",
    border: "1px solid rgba(88,166,255,0.3)",
    borderRadius: 6,
    color: "#c9d1d9",
    fontSize: 12,
    maxWidth: 240,
    textAlign: "center",
    whiteSpace: "nowrap",
  },
  logPanel: {
    position: "absolute",
    right: 8,
    top: 8,
    width: 220,
    maxHeight: 380,
    overflowY: "auto",
    background: "rgba(13,17,23,0.88)",
    backdropFilter: "blur(8px)",
    border: "1px solid #30363d",
    borderRadius: 10,
    padding: "10px 12px",
    zIndex: 10,
  },
  logTitle: {
    fontSize: 11,
    fontWeight: 700,
    color: "#58a6ff",
    marginBottom: 6,
  },
  logEntry: {
    display: "flex",
    alignItems: "center",
    gap: 5,
    padding: "3px 0",
    borderBottom: "1px solid rgba(48,54,61,0.5)",
    fontSize: 11,
  },
  logIcon: { fontSize: 12, flexShrink: 0 },
  logName: {
    flex: 1,
    overflow: "hidden",
    textOverflow: "ellipsis",
    whiteSpace: "nowrap",
    color: "#c9d1d9",
  },
  logType: {
    fontSize: 9,
    fontWeight: 600,
    opacity: 0.7,
    flexShrink: 0,
  },
};
