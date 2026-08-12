"use client";

import { Check, Plus } from "lucide-react";
import { useEffect, useState } from "react";

export function CollectionToggle({ id, name }: { id: string; name: string }) {
  const [selected, setSelected] = useState(false);
  useEffect(() => {
    const saved = JSON.parse(localStorage.getItem("b2000-collection") ?? "[]") as string[];
    setSelected(saved.includes(id));
  }, [id]);
  const toggle = () => {
    const saved = new Set(JSON.parse(localStorage.getItem("b2000-collection") ?? "[]") as string[]);
    selected ? saved.delete(id) : saved.add(id);
    localStorage.setItem("b2000-collection", JSON.stringify([...saved]));
    setSelected(!selected);
  };
  return <button className={selected ? "collection-button selected" : "collection-button"} onClick={toggle}>{selected ? <Check size={17} /> : <Plus size={17} />}{selected ? "써봤어요" : `${name} 써봤어요`}</button>;
}

