import type { AnchorHTMLAttributes } from "react";

type HardLinkProps = Omit<AnchorHTMLAttributes<HTMLAnchorElement>, "href"> & { href: string };

/**
 * Uses a document navigation while vinext's production RSC link transition is unstable.
 * Keeping the fallback in one component makes it easy to restore client transitions later.
 */
export function HardLink({ href, children, ...props }: HardLinkProps) {
  return <a href={href} {...props}>{children}</a>;
}
