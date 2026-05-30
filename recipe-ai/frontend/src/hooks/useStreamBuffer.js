import { useRef, useCallback, useEffect } from "react";

const DRAIN_INTERVAL_MS = 60;

export default function useStreamBuffer(onDrain) {
  const buffersRef = useRef({});
  const rafRef = useRef(null);
  const lastDrainRef = useRef(0);
  const onDrainRef = useRef(onDrain);

  useEffect(() => {
    onDrainRef.current = onDrain;
  }, [onDrain]);

  const startLoop = useCallback(() => {
    if (rafRef.current) return;

    const loop = (ts) => {
      if (ts - lastDrainRef.current < DRAIN_INTERVAL_MS) {
        rafRef.current = requestAnimationFrame(loop);
        return;
      }

      const batch = {};
      let hasMore = false;

      for (const key of Object.keys(buffersRef.current)) {
        const buf = buffersRef.current[key];
        if (!buf) {
          delete buffersRef.current[key];
          continue;
        }

        const n =
          buf.length > 200 ? 8 : buf.length > 80 ? 4 : buf.length > 20 ? 2 : 1;

        batch[key] = buf.slice(0, n);
        buffersRef.current[key] = buf.slice(n);

        if (buffersRef.current[key]) hasMore = true;
        else delete buffersRef.current[key];
      }

      if (Object.keys(batch).length > 0) {
        onDrainRef.current(batch);
      }

      lastDrainRef.current = ts;

      if (hasMore) {
        rafRef.current = requestAnimationFrame(loop);
      } else {
        rafRef.current = null;
      }
    };

    rafRef.current = requestAnimationFrame(loop);
  }, []);

  const push = useCallback(
    (key, text) => {
      buffersRef.current[key] = (buffersRef.current[key] || "") + text;
      startLoop();
    },
    [startLoop]
  );

  const flush = useCallback((key) => {
    const remaining = buffersRef.current[key] || "";
    delete buffersRef.current[key];
    return remaining;
  }, []);

  const clear = useCallback(() => {
    buffersRef.current = {};
    if (rafRef.current) {
      cancelAnimationFrame(rafRef.current);
      rafRef.current = null;
    }
  }, []);

  useEffect(
    () => () => {
      if (rafRef.current) cancelAnimationFrame(rafRef.current);
    },
    []
  );

  return { push, flush, clear };
}
