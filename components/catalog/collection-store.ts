"use client";

import { useSyncExternalStore } from "react";

export type MemoryReaction = "used" | "remembered" | "wanted";
export type ReactionCounts = { total: number; used: number; remembered: number; wanted: number };
type CollectionState = { items: Record<string, MemoryReaction>; counts: Record<string, ReactionCounts>; loading: boolean; error: string | null };

const DEVICE_KEY = "b2000-device-key";
const LEGACY_KEY = "b2000-collection";
const serverState: CollectionState = { items: {}, counts: {}, loading: true, error: null };
let state: CollectionState = serverState;
let loadPromise: Promise<void> | null = null;
const listeners = new Set<() => void>();

function emit(next: CollectionState) {
  state = next;
  listeners.forEach((listener) => listener());
}

function deviceKey() {
  let key = localStorage.getItem(DEVICE_KEY);
  if (!key) {
    key = crypto.randomUUID();
    localStorage.setItem(DEVICE_KEY, key);
  }
  return key;
}

function normalize(payload: { items?: Array<{ contentId: string; reaction: MemoryReaction }>; counts?: Record<string, ReactionCounts> }) {
  return { items: Object.fromEntries((payload.items ?? []).map((item) => [item.contentId, item.reaction])), counts: payload.counts ?? {} };
}

async function request(input: RequestInfo, init?: RequestInit) {
  const response = await fetch(input, { ...init, headers: { "Content-Type": "application/json", "x-b2000-device": deviceKey(), ...init?.headers }, cache: "no-store" });
  if (!response.ok) throw new Error(`collection request failed: ${response.status}`);
  return normalize(await response.json());
}

async function migrateLegacyItems() {
  const legacy = localStorage.getItem(LEGACY_KEY);
  if (!legacy) return;
  localStorage.removeItem(LEGACY_KEY);
  try {
    const ids: unknown = JSON.parse(legacy);
    if (Array.isArray(ids)) {
      for (const contentId of ids.filter((id): id is string => typeof id === "string")) {
        await request("/api/collection", { method: "POST", body: JSON.stringify({ contentId, reaction: "used" }) });
      }
    }
  } catch {
    // A malformed legacy value should not block the new D1 collection.
  }
}

export async function refreshCollection() {
  emit({ ...state, loading: true, error: null });
  try {
    await migrateLegacyItems();
    const data = await request("/api/collection");
    emit({ ...data, loading: false, error: null });
  } catch {
    emit({ ...state, loading: false, error: "컬렉션을 불러오지 못했습니다. 잠시 후 다시 시도해 주세요." });
  }
}

function ensureLoaded() {
  if (!loadPromise && state.loading) loadPromise = refreshCollection().finally(() => { loadPromise = null; });
}

function subscribe(callback: () => void) {
  listeners.add(callback);
  ensureLoaded();
  return () => listeners.delete(callback);
}

export function useCollection() {
  return useSyncExternalStore(subscribe, () => state, () => serverState);
}

export function useCollectionIds() {
  return Object.keys(useCollection().items);
}

export async function setCollectionReaction(contentId: string, reaction: MemoryReaction) {
  const previous = state;
  const selected = state.items[contentId];
  const items = { ...state.items };
  if (selected === reaction) delete items[contentId];
  else items[contentId] = reaction;
  emit({ ...state, items, error: null });
  try {
    const data = selected === reaction
      ? await request(`/api/collection?contentId=${encodeURIComponent(contentId)}`, { method: "DELETE" })
      : await request("/api/collection", { method: "POST", body: JSON.stringify({ contentId, reaction }) });
    emit({ ...data, loading: false, error: null });
  } catch {
    emit({ ...previous, loading: false, error: "반응을 저장하지 못했습니다." });
  }
}
