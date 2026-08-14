"use client";

import { Check, Heart, Sparkles, Star } from "lucide-react";
import { setCollectionReaction, useCollection, type MemoryReaction } from "./collection-store";

export function CollectionToggle({ id, name }: { id: string; name: string }) {
  const { items, counts, error } = useCollection();
  const selected = items[id];
  const total = counts[id]?.total ?? 0;
  return <div className="memory-reactions" aria-label={`${name}에 대한 나의 기억`}>
    <p><Sparkles size={15} /> 나의 기억을 남겨보세요 {total > 0 && <small>{total.toLocaleString()}개의 반응</small>}</p>
    <div>
      <ReactionButton id={id} reaction="used" selected={selected} icon={<Check />} label="써봤어요" />
      <ReactionButton id={id} reaction="remembered" selected={selected} icon={<Heart />} label="기억나요" />
      <ReactionButton id={id} reaction="wanted" selected={selected} icon={<Star />} label="갖고 싶었어요" />
    </div>
    {error && <span role="status">{error}</span>}
  </div>;
}

function ReactionButton({ id, reaction, selected, icon, label }: { id: string; reaction: MemoryReaction; selected?: MemoryReaction; icon: React.ReactNode; label: string }) {
  const active = selected === reaction;
  return <button type="button" aria-pressed={active} className={active ? "collection-button selected" : "collection-button"} onClick={() => void setCollectionReaction(id, reaction)}>{icon}{label}</button>;
}
