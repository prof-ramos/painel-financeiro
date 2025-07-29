import type { Metadata } from "next"
import { Geist_Mono as GeistMono } from "next/font/google"
import type React from "react"
import "./globals.css"

const geistMono = GeistMono({ subsets: ["latin"] })

export const metadata: Metadata = {
  title: "Tactical Operations Dashboard",
  description: "Tactical command and control system",
    generator: 'v0.dev'
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es" suppressHydrationWarning>
      <body className={`${geistMono.className} bg-black text-white antialiased`}>{children}</body>
    </html>
  )
}
