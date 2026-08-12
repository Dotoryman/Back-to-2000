import type { Metadata } from "next";
import "./globals.css";
import { Header } from "@/components/site/header";
import { Footer } from "@/components/site/footer";

export const metadata: Metadata = {
  metadataBase: new URL("https://backto2000.kr"),
  title: { default: "Back to 2000 — 인터넷으로 떠나는 시간여행", template: "%s | Back to 2000" },
  description: "1998년부터 2015년까지, 우리가 사랑했던 웹사이트와 휴대폰 문화를 다시 만나는 디지털 타임머신.",
  icons: {
    icon: "/favicon.svg",
    shortcut: "/favicon.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="ko">
      <body>
        <Header />
        <main>{children}</main>
        <Footer />
      </body>
    </html>
  );
}
