"use client";

import { Check, Plus } from "lucide-react";
import { toggleCollectionItem, useCollectionIds } from "./collection-store";

export function CollectionToggle({ id, name }: { id: string; name: string }) {
  const selected = useCollectionIds().includes(id);
  return <button type="button" aria-pressed={selected} className={selected ? "collection-button selected" : "collection-button"} onClick={() => toggleCollectionItem(id)}>{selected ? <Check size={17} /> : <Plus size={17} />}{selected ? "써봤어요" : `${name} 써봤어요`}</button>;
}
