"use client";

import { useSyncExternalStore } from "react";

const STORAGE_KEY = "b2000-collection";
const CHANGE_EVENT = "b2000-collection-change";

function readSnapshot() {
  return typeof window === "undefined" ? "[]" : (localStorage.getItem(STORAGE_KEY) ?? "[]");
}

function subscribe(callback: () => void) {
  window.addEventListener("storage", callback);
  window.addEventListener(CHANGE_EVENT, callback);
  return () => {
    window.removeEventListener("storage", callback);
    window.removeEventListener(CHANGE_EVENT, callback);
  };
}

function parseIds(snapshot: string): string[] {
  try {
    const value: unknown = JSON.parse(snapshot);
    return Array.isArray(value) ? value.filter((item): item is string => typeof item === "string") : [];
  } catch {
    return [];
  }
}

export function useCollectionIds() {
  return parseIds(useSyncExternalStore(subscribe, readSnapshot, () => "[]"));
}

export function toggleCollectionItem(id: string) {
  const saved = new Set(parseIds(readSnapshot()));
  if (saved.has(id)) saved.delete(id);
  else saved.add(id);
  localStorage.setItem(STORAGE_KEY, JSON.stringify([...saved]));
  window.dispatchEvent(new Event(CHANGE_EVENT));
}
