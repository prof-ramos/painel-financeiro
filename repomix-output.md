This file is a merged representation of the entire codebase, combined into a single document by Repomix.

# File Summary

## Purpose
This file contains a packed representation of the entire repository's contents.
It is designed to be easily consumable by AI systems for analysis, code review,
or other automated processes.

## File Format
The content is organized as follows:
1. This summary section
2. Repository information
3. Directory structure
4. Repository files (if enabled)
5. Multiple file entries, each consisting of:
  a. A header with the file path (## File: path/to/file)
  b. The full contents of the file in a code block

## Usage Guidelines
- This file should be treated as read-only. Any changes should be made to the
  original repository files, not this packed version.
- When processing this file, use the file path to distinguish
  between different files in the repository.
- Be aware that this file may contain sensitive information. Handle it with
  the same level of security as you would the original repository.

## Notes
- Some files may have been excluded based on .gitignore rules and Repomix's configuration
- Binary files are not included in this packed representation. Please refer to the Repository Structure section for a complete list of file paths, including binary files
- Files matching patterns in .gitignore are excluded
- Files matching default ignore patterns are excluded
- Files are sorted by Git change count (files with more changes are at the bottom)

# Directory Structure
```
app/
  agent-network/
    loading.tsx
    page.tsx
  command-center/
    page.tsx
  intelligence/
    loading.tsx
    page.tsx
  operations/
    page.tsx
  systems/
    page.tsx
  globals.css
  layout.tsx
  page.tsx
components/
  ui/
    accordion.tsx
    alert-dialog.tsx
    alert.tsx
    aspect-ratio.tsx
    avatar.tsx
    badge.tsx
    breadcrumb.tsx
    button.tsx
    calendar.tsx
    card.tsx
    carousel.tsx
    chart.tsx
    checkbox.tsx
    collapsible.tsx
    command.tsx
    context-menu.tsx
    dialog.tsx
    drawer.tsx
    dropdown-menu.tsx
    form.tsx
    hover-card.tsx
    input-otp.tsx
    input.tsx
    label.tsx
    menubar.tsx
    navigation-menu.tsx
    pagination.tsx
    popover.tsx
    progress.tsx
    radio-group.tsx
    resizable.tsx
    scroll-area.tsx
    select.tsx
    separator.tsx
    sheet.tsx
    sidebar.tsx
    skeleton.tsx
    slider.tsx
    sonner.tsx
    switch.tsx
    table.tsx
    tabs.tsx
    textarea.tsx
    toast.tsx
    toaster.tsx
    toggle-group.tsx
    toggle.tsx
    tooltip.tsx
    use-mobile.tsx
    use-toast.ts
  ContaCard.tsx
  IconComponents.tsx
  Navigation.tsx
  OverviewView.tsx
  theme-provider.tsx
config/
  nginx.conf
hooks/
  use-mobile.tsx
  use-toast.ts
  useFinancialData.ts
lib/
  utils.ts
public/
  placeholder-logo.svg
  placeholder.svg
scripts/
  backup.sh
  database-setup.sql
  deploy.sh
  monitor.sh
  restore.sh
  rollback.sh
  server-setup.sh
styles/
  globals.css
types/
  financial.ts
utils/
  financial.ts
.gitignore
components.json
ecosystem.config.js
next.config.mjs
package.json
postcss.config.mjs
README.md
tailwind.config.ts
tsconfig.json
```

# Files

## File: app/agent-network/loading.tsx
```typescript
export default function Loading() {
  return null
}
```

## File: app/agent-network/page.tsx
```typescript
"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Search, Filter, MoreHorizontal, MapPin, Clock, Shield } from "lucide-react"

export default function AgentNetworkPage() {
  const [searchTerm, setSearchTerm] = useState("")
  const [selectedAgent, setSelectedAgent] = useState(null)

  const agents = [
    {
      id: "G-078W",
      name: "VENGEFUL SPIRIT",
      status: "active",
      location: "Berlin",
      lastSeen: "2 min ago",
      missions: 47,
      risk: "high",
    },
    {
      id: "G-079X",
      name: "OBSIDIAN SENTINEL",
      status: "standby",
      location: "Tokyo",
      lastSeen: "15 min ago",
      missions: 32,
      risk: "medium",
    },
    {
      id: "G-080Y",
      name: "GHOSTLY FURY",
      status: "active",
      location: "Cairo",
      lastSeen: "1 min ago",
      missions: 63,
      risk: "high",
    },
    {
      id: "G-081Z",
      name: "CURSED REVENANT",
      status: "compromised",
      location: "Moscow",
      lastSeen: "3 hours ago",
      missions: 28,
      risk: "critical",
    },
    {
      id: "G-082A",
      name: "VENOMOUS SHADE",
      status: "active",
      location: "London",
      lastSeen: "5 min ago",
      missions: 41,
      risk: "medium",
    },
    {
      id: "G-083B",
      name: "MYSTIC ENIGMA",
      status: "training",
      location: "Base Alpha",
      lastSeen: "1 day ago",
      missions: 12,
      risk: "low",
    },
    {
      id: "G-084C",
      name: "WRAITH AVENGER",
      status: "active",
      location: "Paris",
      lastSeen: "8 min ago",
      missions: 55,
      risk: "high",
    },
    {
      id: "G-085D",
      name: "SPECTRAL FURY",
      status: "standby",
      location: "Sydney",
      lastSeen: "22 min ago",
      missions: 38,
      risk: "medium",
    },
  ]

  const filteredAgents = agents.filter(
    (agent) =>
      agent.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
      agent.id.toLowerCase().includes(searchTerm.toLowerCase()),
  )

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-white tracking-wider">AGENT NETWORK</h1>
          <p className="text-sm text-neutral-400">Manage and monitor field operatives</p>
        </div>
        <div className="flex gap-2">
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">Deploy Agent</Button>
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">
            <Filter className="w-4 h-4 mr-2" />
            Filter
          </Button>
        </div>
      </div>

      {/* Search and Stats */}
      <div className="grid grid-cols-1 lg:grid-cols-4 gap-4">
        <Card className="lg:col-span-1 bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-neutral-400" />
              <Input
                placeholder="Search agents..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="pl-10 bg-neutral-800 border-neutral-600 text-white placeholder-neutral-400"
              />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">ACTIVE AGENTS</p>
                <p className="text-2xl font-bold text-white font-mono">847</p>
              </div>
              <Shield className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">COMPROMISED</p>
                <p className="text-2xl font-bold text-red-500 font-mono">3</p>
              </div>
              <Shield className="w-8 h-8 text-red-500" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">IN TRAINING</p>
                <p className="text-2xl font-bold text-orange-500 font-mono">23</p>
              </div>
              <Shield className="w-8 h-8 text-orange-500" />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Agent List */}
      <Card className="bg-neutral-900 border-neutral-700">
        <CardHeader>
          <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">AGENT ROSTER</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <table className="w-full">
              <thead>
                <tr className="border-b border-neutral-700">
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">AGENT ID</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">CODENAME</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">STATUS</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">LOCATION</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">LAST SEEN</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">MISSIONS</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">RISK</th>
                  <th className="text-left py-3 px-4 text-xs font-medium text-neutral-400 tracking-wider">ACTIONS</th>
                </tr>
              </thead>
              <tbody>
                {filteredAgents.map((agent, index) => (
                  <tr
                    key={agent.id}
                    className={`border-b border-neutral-800 hover:bg-neutral-800 transition-colors cursor-pointer ${
                      index % 2 === 0 ? "bg-neutral-900" : "bg-neutral-850"
                    }`}
                    onClick={() => setSelectedAgent(agent)}
                  >
                    <td className="py-3 px-4 text-sm text-white font-mono">{agent.id}</td>
                    <td className="py-3 px-4 text-sm text-white">{agent.name}</td>
                    <td className="py-3 px-4">
                      <div className="flex items-center gap-2">
                        <div
                          className={`w-2 h-2 rounded-full ${
                            agent.status === "active"
                              ? "bg-white"
                              : agent.status === "standby"
                                ? "bg-neutral-500"
                                : agent.status === "training"
                                  ? "bg-orange-500"
                                  : "bg-red-500"
                          }`}
                        ></div>
                        <span className="text-xs text-neutral-300 uppercase tracking-wider">{agent.status}</span>
                      </div>
                    </td>
                    <td className="py-3 px-4">
                      <div className="flex items-center gap-2">
                        <MapPin className="w-3 h-3 text-neutral-400" />
                        <span className="text-sm text-neutral-300">{agent.location}</span>
                      </div>
                    </td>
                    <td className="py-3 px-4">
                      <div className="flex items-center gap-2">
                        <Clock className="w-3 h-3 text-neutral-400" />
                        <span className="text-sm text-neutral-300 font-mono">{agent.lastSeen}</span>
                      </div>
                    </td>
                    <td className="py-3 px-4 text-sm text-white font-mono">{agent.missions}</td>
                    <td className="py-3 px-4">
                      <span
                        className={`text-xs px-2 py-1 rounded uppercase tracking-wider ${
                          agent.risk === "critical"
                            ? "bg-red-500/20 text-red-500"
                            : agent.risk === "high"
                              ? "bg-orange-500/20 text-orange-500"
                              : agent.risk === "medium"
                                ? "bg-neutral-500/20 text-neutral-300"
                                : "bg-white/20 text-white"
                        }`}
                      >
                        {agent.risk}
                      </span>
                    </td>
                    <td className="py-3 px-4">
                      <Button variant="ghost" size="icon" className="text-neutral-400 hover:text-orange-500">
                        <MoreHorizontal className="w-4 h-4" />
                      </Button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Agent Detail Modal */}
      {selectedAgent && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <Card className="bg-neutral-900 border-neutral-700 w-full max-w-2xl">
            <CardHeader className="flex flex-row items-center justify-between">
              <div>
                <CardTitle className="text-lg font-bold text-white tracking-wider">{selectedAgent.name}</CardTitle>
                <p className="text-sm text-neutral-400 font-mono">{selectedAgent.id}</p>
              </div>
              <Button
                variant="ghost"
                onClick={() => setSelectedAgent(null)}
                className="text-neutral-400 hover:text-white"
              >
                ✕
              </Button>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <p className="text-xs text-neutral-400 tracking-wider mb-1">STATUS</p>
                  <div className="flex items-center gap-2">
                    <div
                      className={`w-2 h-2 rounded-full ${
                        selectedAgent.status === "active"
                          ? "bg-white"
                          : selectedAgent.status === "standby"
                            ? "bg-neutral-500"
                            : selectedAgent.status === "training"
                              ? "bg-orange-500"
                              : "bg-red-500"
                      }`}
                    ></div>
                    <span className="text-sm text-white uppercase tracking-wider">{selectedAgent.status}</span>
                  </div>
                </div>
                <div>
                  <p className="text-xs text-neutral-400 tracking-wider mb-1">LOCATION</p>
                  <p className="text-sm text-white">{selectedAgent.location}</p>
                </div>
                <div>
                  <p className="text-xs text-neutral-400 tracking-wider mb-1">MISSIONS COMPLETED</p>
                  <p className="text-sm text-white font-mono">{selectedAgent.missions}</p>
                </div>
                <div>
                  <p className="text-xs text-neutral-400 tracking-wider mb-1">RISK LEVEL</p>
                  <span
                    className={`text-xs px-2 py-1 rounded uppercase tracking-wider ${
                      selectedAgent.risk === "critical"
                        ? "bg-red-500/20 text-red-500"
                        : selectedAgent.risk === "high"
                          ? "bg-orange-500/20 text-orange-500"
                          : selectedAgent.risk === "medium"
                            ? "bg-neutral-500/20 text-neutral-300"
                            : "bg-white/20 text-white"
                    }`}
                  >
                    {selectedAgent.risk}
                  </span>
                </div>
              </div>
              <div className="flex gap-2 pt-4">
                <Button className="bg-orange-500 hover:bg-orange-600 text-white">Assign Mission</Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  View History
                </Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  Send Message
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  )
}
```

## File: app/command-center/page.tsx
```typescript
"use client"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"

export default function CommandCenterPage() {
  return (
    <div className="p-6 space-y-6">
      {/* Main Dashboard Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* Agent Status Overview */}
        <Card className="lg:col-span-4 bg-neutral-900 border-neutral-700">
          <CardHeader className="pb-3">
            <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">AGENT ALLOCATION</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-3 gap-4 mb-6">
              <div className="text-center">
                <div className="text-2xl font-bold text-white font-mono">190</div>
                <div className="text-xs text-neutral-500">Active Field</div>
              </div>
              <div className="text-center">
                <div className="text-2xl font-bold text-white font-mono">990</div>
                <div className="text-xs text-neutral-500">Undercover</div>
              </div>
              <div className="text-center">
                <div className="text-2xl font-bold text-white font-mono">290</div>
                <div className="text-xs text-neutral-500">Training</div>
              </div>
            </div>

            <div className="space-y-2">
              {[
                { id: "G-078W", name: "VENGEFUL SPIRIT", status: "active" },
                { id: "G-079X", name: "OBSIDIAN SENTINEL", status: "standby" },
                { id: "G-080Y", name: "GHOSTLY FURY", status: "active" },
                { id: "G-081Z", name: "CURSED REVENANT", status: "compromised" },
              ].map((agent) => (
                <div
                  key={agent.id}
                  className="flex items-center justify-between p-2 bg-neutral-800 rounded hover:bg-neutral-700 transition-colors cursor-pointer"
                >
                  <div className="flex items-center gap-3">
                    <div
                      className={`w-2 h-2 rounded-full ${
                        agent.status === "active"
                          ? "bg-white"
                          : agent.status === "standby"
                            ? "bg-neutral-500"
                            : "bg-red-500"
                      }`}
                    ></div>
                    <div>
                      <div className="text-xs text-white font-mono">{agent.id}</div>
                      <div className="text-xs text-neutral-500">{agent.name}</div>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Activity Log */}
        <Card className="lg:col-span-4 bg-neutral-900 border-neutral-700">
          <CardHeader className="pb-3">
            <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">ACTIVITY LOG</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-3 max-h-80 overflow-y-auto">
              {[
                {
                  time: "25/06/2025 09:29",
                  agent: "gh0st_Fire",
                  action: "completed mission in",
                  location: "Berlin",
                  target: "zer0_Nigh",
                },
                {
                  time: "25/06/2025 08:12",
                  agent: "dr4g0n_V3in",
                  action: "extracted high-value target in",
                  location: "Cairo",
                  target: null,
                },
                {
                  time: "24/06/2025 22:55",
                  agent: "sn4ke_Sh4de",
                  action: "lost communication in",
                  location: "Havana",
                  target: null,
                },
                {
                  time: "24/06/2025 21:33",
                  agent: "ph4nt0m_R4ven",
                  action: "initiated surveillance in",
                  location: "Tokyo",
                  target: null,
                },
                {
                  time: "24/06/2025 19:45",
                  agent: "v0id_Walk3r",
                  action: "compromised security in",
                  location: "Moscow",
                  target: "d4rk_M4trix",
                },
              ].map((log, index) => (
                <div
                  key={index}
                  className="text-xs border-l-2 border-orange-500 pl-3 hover:bg-neutral-800 p-2 rounded transition-colors"
                >
                  <div className="text-neutral-500 font-mono">{log.time}</div>
                  <div className="text-white">
                    Agent <span className="text-orange-500 font-mono">{log.agent}</span> {log.action}{" "}
                    <span className="text-white font-mono">{log.location}</span>
                    {log.target && (
                      <span>
                        {" "}
                        with agent <span className="text-orange-500 font-mono">{log.target}</span>
                      </span>
                    )}
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        {/* Encrypted Chat Activity */}
        <Card className="lg:col-span-4 bg-neutral-900 border-neutral-700">
          <CardHeader className="pb-3">
            <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">
              ENCRYPTED CHAT ACTIVITY
            </CardTitle>
          </CardHeader>
          <CardContent className="flex flex-col items-center">
            {/* Wireframe Sphere */}
            <div className="relative w-32 h-32 mb-4">
              <div className="absolute inset-0 border-2 border-white rounded-full opacity-60 animate-pulse"></div>
              <div className="absolute inset-2 border border-white rounded-full opacity-40"></div>
              <div className="absolute inset-4 border border-white rounded-full opacity-20"></div>
              {/* Grid lines */}
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="w-full h-px bg-white opacity-30"></div>
              </div>
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="w-px h-full bg-white opacity-30"></div>
              </div>
            </div>

            <div className="text-xs text-neutral-500 space-y-1 w-full font-mono">
              <div className="flex justify-between">
                <span># 2025-06-17 14:23 UTC</span>
              </div>
              <div className="text-white">{"> [AGT:gh0stfire] ::: INIT >> ^^^ loading secure channel"}</div>
              <div className="text-orange-500">{"> CH#2 | 1231.9082464.500...xR3"}</div>
              <div className="text-white">{"> KEY LOCKED"}</div>
              <div className="text-neutral-400">
                {'> MSG >> "...mission override initiated... awaiting delta node clearance"'}
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Mission Activity Chart */}
        <Card className="lg:col-span-8 bg-neutral-900 border-neutral-700">
          <CardHeader className="pb-3">
            <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">
              MISSION ACTIVITY OVERVIEW
            </CardTitle>
          </CardHeader>
          <CardContent>
            <div className="h-48 relative">
              {/* Chart Grid */}
              <div className="absolute inset-0 grid grid-cols-8 grid-rows-6 opacity-20">
                {Array.from({ length: 48 }).map((_, i) => (
                  <div key={i} className="border border-neutral-700"></div>
                ))}
              </div>

              {/* Chart Line */}
              <svg className="absolute inset-0 w-full h-full">
                <polyline
                  points="0,120 50,100 100,110 150,90 200,95 250,85 300,100 350,80"
                  fill="none"
                  stroke="#f97316"
                  strokeWidth="2"
                />
                <polyline
                  points="0,140 50,135 100,130 150,125 200,130 250,135 300,125 350,120"
                  fill="none"
                  stroke="#ffffff"
                  strokeWidth="2"
                  strokeDasharray="5,5"
                />
              </svg>

              {/* Y-axis labels */}
              <div className="absolute left-0 top-0 h-full flex flex-col justify-between text-xs text-neutral-500 -ml-5 font-mono">
                <span>500</span>
                <span>400</span>
                <span>300</span>
                <span>200</span>
              </div>

              {/* X-axis labels */}
              <div className="absolute bottom-0 left-0 w-full flex justify-between text-xs text-neutral-500 -mb-6 font-mono">
                <span>Jan 28, 2025</span>
                <span>Feb 28, 2025</span>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Mission Information */}
        <Card className="lg:col-span-4 bg-neutral-900 border-neutral-700">
          <CardHeader className="pb-3">
            <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">MISSION INFORMATION</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-1 gap-4">
              <div>
                <div className="flex items-center gap-2 mb-3">
                  <div className="w-2 h-2 bg-white rounded-full"></div>
                  <span className="text-xs text-white font-medium">Successful Missions</span>
                </div>
                <div className="space-y-2">
                  <div className="flex justify-between text-xs">
                    <span className="text-neutral-400">High Risk Mission</span>
                    <span className="text-white font-bold font-mono">190</span>
                  </div>
                  <div className="flex justify-between text-xs">
                    <span className="text-neutral-400">Medium Risk Mission</span>
                    <span className="text-white font-bold font-mono">426</span>
                  </div>
                  <div className="flex justify-between text-xs">
                    <span className="text-neutral-400">Low Risk Mission</span>
                    <span className="text-white font-bold font-mono">920</span>
                  </div>
                </div>
              </div>

              <div>
                <div className="flex items-center gap-2 mb-3">
                  <div className="w-2 h-2 bg-red-500 rounded-full"></div>
                  <span className="text-xs text-red-500 font-medium">Failed Missions</span>
                </div>
                <div className="space-y-2">
                  <div className="flex justify-between text-xs">
                    <span className="text-neutral-400">High Risk Mission</span>
                    <span className="text-white font-bold font-mono">190</span>
                  </div>
                  <div className="flex justify-between text-xs">
                    <span className="text-neutral-400">Medium Risk Mission</span>
                    <span className="text-white font-bold font-mono">426</span>
                  </div>
                  <div className="flex justify-between text-xs">
                    <span className="text-neutral-400">Low Risk Mission</span>
                    <span className="text-white font-bold font-mono">920</span>
                  </div>
                </div>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  )
}
```

## File: app/intelligence/loading.tsx
```typescript
export default function Loading() {
  return null
}
```

## File: app/intelligence/page.tsx
```typescript
"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Badge } from "@/components/ui/badge"
import { Search, FileText, Eye, Download, Filter, Globe, Shield, AlertTriangle } from "lucide-react"

export default function IntelligencePage() {
  const [searchTerm, setSearchTerm] = useState("")
  const [selectedReport, setSelectedReport] = useState(null)

  const reports = [
    {
      id: "INT-2025-001",
      title: "CYBERCRIME NETWORK ANALYSIS",
      classification: "TOP SECRET",
      source: "SIGINT",
      location: "Eastern Europe",
      date: "2025-06-17",
      status: "verified",
      threat: "high",
      summary: "Detailed analysis of emerging cybercrime syndicate operating across multiple jurisdictions",
      tags: ["cybercrime", "international", "financial"],
    },
    {
      id: "INT-2025-002",
      title: "ROGUE AGENT COMMUNICATIONS",
      classification: "SECRET",
      source: "HUMINT",
      location: "Berlin",
      date: "2025-06-16",
      status: "pending",
      threat: "critical",
      summary: "Intercepted communications suggesting potential security breach in European operations",
      tags: ["internal", "security", "communications"],
    },
    {
      id: "INT-2025-003",
      title: "ARMS TRAFFICKING ROUTES",
      classification: "CONFIDENTIAL",
      source: "OSINT",
      location: "Middle East",
      date: "2025-06-15",
      status: "verified",
      threat: "medium",
      summary: "Updated intelligence on weapons smuggling corridors through Mediterranean region",
      tags: ["trafficking", "weapons", "maritime"],
    },
    {
      id: "INT-2025-004",
      title: "TERRORIST CELL SURVEILLANCE",
      classification: "TOP SECRET",
      source: "HUMINT",
      location: "North Africa",
      date: "2025-06-14",
      status: "active",
      threat: "critical",
      summary: "Ongoing surveillance of suspected terrorist cell planning coordinated attacks",
      tags: ["terrorism", "surveillance", "coordinated"],
    },
    {
      id: "INT-2025-005",
      title: "DIPLOMATIC INTELLIGENCE BRIEF",
      classification: "SECRET",
      source: "DIPLOMATIC",
      location: "Asia Pacific",
      date: "2025-06-13",
      status: "verified",
      threat: "low",
      summary: "Political developments affecting regional security and operational considerations",
      tags: ["diplomatic", "political", "regional"],
    },
  ]

  const getClassificationColor = (classification) => {
    switch (classification) {
      case "TOP SECRET":
        return "bg-red-500/20 text-red-500"
      case "SECRET":
        return "bg-orange-500/20 text-orange-500"
      case "CONFIDENTIAL":
        return "bg-neutral-500/20 text-neutral-300"
      default:
        return "bg-white/20 text-white"
    }
  }

  const getThreatColor = (threat) => {
    switch (threat) {
      case "critical":
        return "bg-red-500/20 text-red-500"
      case "high":
        return "bg-orange-500/20 text-orange-500"
      case "medium":
        return "bg-neutral-500/20 text-neutral-300"
      case "low":
        return "bg-white/20 text-white"
      default:
        return "bg-neutral-500/20 text-neutral-300"
    }
  }

  const getStatusColor = (status) => {
    switch (status) {
      case "verified":
        return "bg-white/20 text-white"
      case "pending":
        return "bg-orange-500/20 text-orange-500"
      case "active":
        return "bg-white/20 text-white"
      default:
        return "bg-neutral-500/20 text-neutral-300"
    }
  }

  const filteredReports = reports.filter(
    (report) =>
      report.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
      report.id.toLowerCase().includes(searchTerm.toLowerCase()) ||
      report.tags.some((tag) => tag.toLowerCase().includes(searchTerm.toLowerCase())),
  )

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-white tracking-wider">INTELLIGENCE CENTER</h1>
          <p className="text-sm text-neutral-400">Classified reports and threat analysis</p>
        </div>
        <div className="flex gap-2">
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">New Report</Button>
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">
            <Filter className="w-4 h-4 mr-2" />
            Filter
          </Button>
        </div>
      </div>

      {/* Stats and Search */}
      <div className="grid grid-cols-1 lg:grid-cols-5 gap-4">
        <Card className="lg:col-span-2 bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="relative">
              <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-neutral-400" />
              <Input
                placeholder="Search intelligence reports..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
                className="pl-10 bg-neutral-800 border-neutral-600 text-white placeholder-neutral-400"
              />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">TOTAL REPORTS</p>
                <p className="text-2xl font-bold text-white font-mono">1,247</p>
              </div>
              <FileText className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">CRITICAL THREATS</p>
                <p className="text-2xl font-bold text-red-500 font-mono">12</p>
              </div>
              <AlertTriangle className="w-8 h-8 text-red-500" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">ACTIVE SOURCES</p>
                <p className="text-2xl font-bold text-white font-mono">89</p>
              </div>
              <Globe className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Intelligence Reports */}
      <Card className="bg-neutral-900 border-neutral-700">
        <CardHeader>
          <CardTitle className="text-sm font-medium text-neutral-300 tracking-wider">INTELLIGENCE REPORTS</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="space-y-4">
            {filteredReports.map((report) => (
              <div
                key={report.id}
                className="border border-neutral-700 rounded p-4 hover:border-orange-500/50 transition-colors cursor-pointer"
                onClick={() => setSelectedReport(report)}
              >
                <div className="flex flex-col sm:flex-row sm:items-start justify-between gap-4">
                  <div className="flex-1 space-y-2">
                    <div className="flex items-start gap-3">
                      <FileText className="w-5 h-5 text-neutral-400 mt-0.5" />
                      <div className="flex-1">
                        <h3 className="text-sm font-bold text-white tracking-wider">{report.title}</h3>
                        <p className="text-xs text-neutral-400 font-mono">{report.id}</p>
                      </div>
                    </div>

                    <p className="text-sm text-neutral-300 ml-8">{report.summary}</p>

                    <div className="flex flex-wrap gap-2 ml-8">
                      {report.tags.map((tag) => (
                        <Badge key={tag} className="bg-neutral-800 text-neutral-300 text-xs">
                          {tag}
                        </Badge>
                      ))}
                    </div>
                  </div>

                  <div className="flex flex-col sm:items-end gap-2">
                    <div className="flex flex-wrap gap-2">
                      <Badge className={getClassificationColor(report.classification)}>{report.classification}</Badge>
                      <Badge className={getThreatColor(report.threat)}>{report.threat.toUpperCase()}</Badge>
                      <Badge className={getStatusColor(report.status)}>{report.status.toUpperCase()}</Badge>
                    </div>

                    <div className="text-xs text-neutral-400 space-y-1">
                      <div className="flex items-center gap-2">
                        <Globe className="w-3 h-3" />
                        <span>{report.location}</span>
                      </div>
                      <div className="flex items-center gap-2">
                        <Shield className="w-3 h-3" />
                        <span>{report.source}</span>
                      </div>
                      <div className="font-mono">{report.date}</div>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </CardContent>
      </Card>

      {/* Report Detail Modal */}
      {selectedReport && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <Card className="bg-neutral-900 border-neutral-700 w-full max-w-4xl max-h-[90vh] overflow-y-auto">
            <CardHeader className="flex flex-row items-center justify-between">
              <div>
                <CardTitle className="text-xl font-bold text-white tracking-wider">{selectedReport.title}</CardTitle>
                <p className="text-sm text-neutral-400 font-mono">{selectedReport.id}</p>
              </div>
              <Button
                variant="ghost"
                onClick={() => setSelectedReport(null)}
                className="text-neutral-400 hover:text-white"
              >
                ✕
              </Button>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-4">
                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">CLASSIFICATION</h3>
                    <div className="flex gap-2">
                      <Badge className={getClassificationColor(selectedReport.classification)}>
                        {selectedReport.classification}
                      </Badge>
                      <Badge className={getThreatColor(selectedReport.threat)}>
                        THREAT: {selectedReport.threat.toUpperCase()}
                      </Badge>
                    </div>
                  </div>

                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">SOURCE DETAILS</h3>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Source Type:</span>
                        <span className="text-white font-mono">{selectedReport.source}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Location:</span>
                        <span className="text-white">{selectedReport.location}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Date:</span>
                        <span className="text-white font-mono">{selectedReport.date}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Status:</span>
                        <Badge className={getStatusColor(selectedReport.status)}>
                          {selectedReport.status.toUpperCase()}
                        </Badge>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="space-y-4">
                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">TAGS</h3>
                    <div className="flex flex-wrap gap-2">
                      {selectedReport.tags.map((tag) => (
                        <Badge key={tag} className="bg-neutral-800 text-neutral-300">
                          {tag}
                        </Badge>
                      ))}
                    </div>
                  </div>

                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">THREAT ASSESSMENT</h3>
                    <div className="space-y-2">
                      <div className="flex justify-between text-sm">
                        <span className="text-neutral-400">Threat Level</span>
                        <Badge className={getThreatColor(selectedReport.threat)}>
                          {selectedReport.threat.toUpperCase()}
                        </Badge>
                      </div>
                      <div className="w-full bg-neutral-800 rounded-full h-2">
                        <div
                          className={`h-2 rounded-full transition-all duration-300 ${
                            selectedReport.threat === "critical"
                              ? "bg-red-500 w-full"
                              : selectedReport.threat === "high"
                                ? "bg-orange-500 w-3/4"
                                : selectedReport.threat === "medium"
                                  ? "bg-neutral-400 w-1/2"
                                  : "bg-white w-1/4"
                          }`}
                        ></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div>
                <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">EXECUTIVE SUMMARY</h3>
                <p className="text-sm text-neutral-300 leading-relaxed">{selectedReport.summary}</p>
              </div>

              <div className="flex gap-2 pt-4 border-t border-neutral-700">
                <Button className="bg-orange-500 hover:bg-orange-600 text-white">
                  <Eye className="w-4 h-4 mr-2" />
                  View Full Report
                </Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  <Download className="w-4 h-4 mr-2" />
                  Download
                </Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  Share Intel
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  )
}
```

## File: app/operations/page.tsx
```typescript
"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Target, MapPin, Clock, Users, AlertTriangle, CheckCircle, XCircle } from "lucide-react"

export default function OperationsPage() {
  const [selectedOperation, setSelectedOperation] = useState(null)

  const operations = [
    {
      id: "OP-OMEGA-001",
      name: "SHADOW PROTOCOL",
      status: "active",
      priority: "critical",
      location: "Eastern Europe",
      agents: 5,
      progress: 75,
      startDate: "2025-06-15",
      estimatedCompletion: "2025-06-30",
      description: "Track high-value target in Eastern Europe",
      objectives: ["Locate target", "Establish surveillance", "Extract intelligence"],
    },
    {
      id: "OP-DELTA-002",
      name: "GHOST FIRE",
      status: "planning",
      priority: "high",
      location: "Seoul",
      agents: 3,
      progress: 25,
      startDate: "2025-06-20",
      estimatedCompletion: "2025-07-05",
      description: "Infiltrate cybercrime network in Seoul",
      objectives: ["Penetrate network", "Gather evidence", "Identify key players"],
    },
    {
      id: "OP-SIERRA-003",
      name: "NIGHT STALKER",
      status: "completed",
      priority: "medium",
      location: "Berlin",
      agents: 2,
      progress: 100,
      startDate: "2025-05-28",
      estimatedCompletion: "2025-06-12",
      description: "Monitor rogue agent communications in Berlin",
      objectives: ["Intercept communications", "Decode messages", "Report findings"],
    },
    {
      id: "OP-ALPHA-004",
      name: "CRIMSON TIDE",
      status: "active",
      priority: "high",
      location: "Cairo",
      agents: 4,
      progress: 60,
      startDate: "2025-06-10",
      estimatedCompletion: "2025-06-25",
      description: "Support covert extraction in South America",
      objectives: ["Secure extraction point", "Neutralize threats", "Extract asset"],
    },
    {
      id: "OP-BRAVO-005",
      name: "SILENT BLADE",
      status: "compromised",
      priority: "critical",
      location: "Moscow",
      agents: 6,
      progress: 40,
      startDate: "2025-06-05",
      estimatedCompletion: "2025-06-20",
      description: "Monitor rogue agent communications in Berlin",
      objectives: ["Assess compromise", "Extract personnel", "Damage control"],
    },
  ]

  const getStatusColor = (status) => {
    switch (status) {
      case "active":
        return "bg-white/20 text-white"
      case "planning":
        return "bg-orange-500/20 text-orange-500"
      case "completed":
        return "bg-white/20 text-white"
      case "compromised":
        return "bg-red-500/20 text-red-500"
      default:
        return "bg-neutral-500/20 text-neutral-300"
    }
  }

  const getPriorityColor = (priority) => {
    switch (priority) {
      case "critical":
        return "bg-red-500/20 text-red-500"
      case "high":
        return "bg-orange-500/20 text-orange-500"
      case "medium":
        return "bg-neutral-500/20 text-neutral-300"
      case "low":
        return "bg-white/20 text-white"
      default:
        return "bg-neutral-500/20 text-neutral-300"
    }
  }

  const getStatusIcon = (status) => {
    switch (status) {
      case "active":
        return <Target className="w-4 h-4" />
      case "planning":
        return <Clock className="w-4 h-4" />
      case "completed":
        return <CheckCircle className="w-4 h-4" />
      case "compromised":
        return <XCircle className="w-4 h-4" />
      default:
        return <AlertTriangle className="w-4 h-4" />
    }
  }

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-white tracking-wider">OPERATIONS CENTER</h1>
          <p className="text-sm text-neutral-400">Mission planning and execution oversight</p>
        </div>
        <div className="flex gap-2">
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">New Operation</Button>
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">Mission Brief</Button>
        </div>
      </div>

      {/* Stats Overview */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">ACTIVE OPS</p>
                <p className="text-2xl font-bold text-white font-mono">23</p>
              </div>
              <Target className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">COMPLETED</p>
                <p className="text-2xl font-bold text-white font-mono">156</p>
              </div>
              <CheckCircle className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">COMPROMISED</p>
                <p className="text-2xl font-bold text-red-500 font-mono">2</p>
              </div>
              <XCircle className="w-8 h-8 text-red-500" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">SUCCESS RATE</p>
                <p className="text-2xl font-bold text-white font-mono">94%</p>
              </div>
              <AlertTriangle className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Operations List */}
      <div className="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-6">
        {operations.map((operation) => (
          <Card
            key={operation.id}
            className="bg-neutral-900 border-neutral-700 hover:border-orange-500/50 transition-colors cursor-pointer"
            onClick={() => setSelectedOperation(operation)}
          >
            <CardHeader className="pb-3">
              <div className="flex items-start justify-between">
                <div>
                  <CardTitle className="text-sm font-bold text-white tracking-wider">{operation.name}</CardTitle>
                  <p className="text-xs text-neutral-400 font-mono">{operation.id}</p>
                </div>
                <div className="flex items-center gap-2">{getStatusIcon(operation.status)}</div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="flex gap-2">
                <Badge className={getStatusColor(operation.status)}>{operation.status.toUpperCase()}</Badge>
                <Badge className={getPriorityColor(operation.priority)}>{operation.priority.toUpperCase()}</Badge>
              </div>

              <p className="text-sm text-neutral-300">{operation.description}</p>

              <div className="space-y-2">
                <div className="flex items-center gap-2 text-xs text-neutral-400">
                  <MapPin className="w-3 h-3" />
                  <span>{operation.location}</span>
                </div>
                <div className="flex items-center gap-2 text-xs text-neutral-400">
                  <Users className="w-3 h-3" />
                  <span>{operation.agents} agents assigned</span>
                </div>
                <div className="flex items-center gap-2 text-xs text-neutral-400">
                  <Clock className="w-3 h-3" />
                  <span>Est. completion: {operation.estimatedCompletion}</span>
                </div>
              </div>

              <div className="space-y-2">
                <div className="flex justify-between text-xs">
                  <span className="text-neutral-400">Progress</span>
                  <span className="text-white font-mono">{operation.progress}%</span>
                </div>
                <div className="w-full bg-neutral-800 rounded-full h-2">
                  <div
                    className="bg-orange-500 h-2 rounded-full transition-all duration-300"
                    style={{ width: `${operation.progress}%` }}
                  ></div>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Operation Detail Modal */}
      {selectedOperation && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <Card className="bg-neutral-900 border-neutral-700 w-full max-w-4xl max-h-[90vh] overflow-y-auto">
            <CardHeader className="flex flex-row items-center justify-between">
              <div>
                <CardTitle className="text-xl font-bold text-white tracking-wider">{selectedOperation.name}</CardTitle>
                <p className="text-sm text-neutral-400 font-mono">{selectedOperation.id}</p>
              </div>
              <Button
                variant="ghost"
                onClick={() => setSelectedOperation(null)}
                className="text-neutral-400 hover:text-white"
              >
                ✕
              </Button>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-4">
                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">OPERATION STATUS</h3>
                    <div className="flex gap-2">
                      <Badge className={getStatusColor(selectedOperation.status)}>
                        {selectedOperation.status.toUpperCase()}
                      </Badge>
                      <Badge className={getPriorityColor(selectedOperation.priority)}>
                        {selectedOperation.priority.toUpperCase()}
                      </Badge>
                    </div>
                  </div>

                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">MISSION DETAILS</h3>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Location:</span>
                        <span className="text-white">{selectedOperation.location}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Agents:</span>
                        <span className="text-white font-mono">{selectedOperation.agents}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Start Date:</span>
                        <span className="text-white font-mono">{selectedOperation.startDate}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Est. Completion:</span>
                        <span className="text-white font-mono">{selectedOperation.estimatedCompletion}</span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="space-y-4">
                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">PROGRESS</h3>
                    <div className="space-y-2">
                      <div className="flex justify-between text-sm">
                        <span className="text-neutral-400">Completion</span>
                        <span className="text-white font-mono">{selectedOperation.progress}%</span>
                      </div>
                      <div className="w-full bg-neutral-800 rounded-full h-3">
                        <div
                          className="bg-orange-500 h-3 rounded-full transition-all duration-300"
                          style={{ width: `${selectedOperation.progress}%` }}
                        ></div>
                      </div>
                    </div>
                  </div>

                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">OBJECTIVES</h3>
                    <div className="space-y-2">
                      {selectedOperation.objectives.map((objective, index) => (
                        <div key={index} className="flex items-center gap-2 text-sm">
                          <div className="w-2 h-2 bg-orange-500 rounded-full"></div>
                          <span className="text-neutral-300">{objective}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </div>

              <div>
                <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">DESCRIPTION</h3>
                <p className="text-sm text-neutral-300">{selectedOperation.description}</p>
              </div>

              <div className="flex gap-2 pt-4 border-t border-neutral-700">
                <Button className="bg-orange-500 hover:bg-orange-600 text-white">Update Status</Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  View Reports
                </Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  Assign Agents
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  )
}
```

## File: app/systems/page.tsx
```typescript
"use client"

import { useState } from "react"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Progress } from "@/components/ui/progress"
import {
  Server,
  Database,
  Shield,
  Wifi,
  HardDrive,
  Cpu,
  Activity,
  AlertTriangle,
  CheckCircle,
  Settings,
} from "lucide-react"

export default function SystemsPage() {
  const [selectedSystem, setSelectedSystem] = useState(null)

  const systems = [
    {
      id: "SYS-001",
      name: "COMMAND SERVER ALPHA",
      type: "Primary Server",
      status: "online",
      health: 98,
      cpu: 45,
      memory: 67,
      storage: 34,
      uptime: "247 days",
      location: "Data Center 1",
      lastMaintenance: "2025-05-15",
    },
    {
      id: "SYS-002",
      name: "DATABASE CLUSTER BETA",
      type: "Database",
      status: "online",
      health: 95,
      cpu: 72,
      memory: 84,
      storage: 78,
      uptime: "189 days",
      location: "Data Center 2",
      lastMaintenance: "2025-06-01",
    },
    {
      id: "SYS-003",
      name: "SECURITY GATEWAY",
      type: "Firewall",
      status: "warning",
      health: 87,
      cpu: 23,
      memory: 45,
      storage: 12,
      uptime: "156 days",
      location: "DMZ",
      lastMaintenance: "2025-04-20",
    },
    {
      id: "SYS-004",
      name: "COMMUNICATION HUB",
      type: "Network",
      status: "online",
      health: 92,
      cpu: 38,
      memory: 52,
      storage: 23,
      uptime: "203 days",
      location: "Network Core",
      lastMaintenance: "2025-05-28",
    },
    {
      id: "SYS-005",
      name: "BACKUP STORAGE ARRAY",
      type: "Storage",
      status: "maintenance",
      health: 76,
      cpu: 15,
      memory: 28,
      storage: 89,
      uptime: "0 days",
      location: "Backup Facility",
      lastMaintenance: "2025-06-17",
    },
    {
      id: "SYS-006",
      name: "ANALYTICS ENGINE",
      type: "Processing",
      status: "online",
      health: 94,
      cpu: 89,
      memory: 76,
      storage: 45,
      uptime: "134 days",
      location: "Data Center 1",
      lastMaintenance: "2025-05-10",
    },
  ]

  const getStatusColor = (status) => {
    switch (status) {
      case "online":
        return "bg-white/20 text-white"
      case "warning":
        return "bg-orange-500/20 text-orange-500"
      case "maintenance":
        return "bg-neutral-500/20 text-neutral-300"
      case "offline":
        return "bg-red-500/20 text-red-500"
      default:
        return "bg-neutral-500/20 text-neutral-300"
    }
  }

  const getStatusIcon = (status) => {
    switch (status) {
      case "online":
        return <CheckCircle className="w-4 h-4" />
      case "warning":
        return <AlertTriangle className="w-4 h-4" />
      case "maintenance":
        return <Settings className="w-4 h-4" />
      case "offline":
        return <AlertTriangle className="w-4 h-4" />
      default:
        return <Activity className="w-4 h-4" />
    }
  }

  const getSystemIcon = (type) => {
    switch (type) {
      case "Primary Server":
        return <Server className="w-6 h-6" />
      case "Database":
        return <Database className="w-6 h-6" />
      case "Firewall":
        return <Shield className="w-6 h-6" />
      case "Network":
        return <Wifi className="w-6 h-6" />
      case "Storage":
        return <HardDrive className="w-6 h-6" />
      case "Processing":
        return <Cpu className="w-6 h-6" />
      default:
        return <Server className="w-6 h-6" />
    }
  }

  const getHealthColor = (health) => {
    if (health >= 95) return "text-white"
    if (health >= 85) return "text-white"
    if (health >= 70) return "text-orange-500"
    return "text-red-500"
  }

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
        <div>
          <h1 className="text-2xl font-bold text-white tracking-wider">SYSTEMS MONITOR</h1>
          <p className="text-sm text-neutral-400">Infrastructure health and performance monitoring</p>
        </div>
        <div className="flex gap-2">
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">System Scan</Button>
          <Button className="bg-orange-500 hover:bg-orange-600 text-white">Maintenance Mode</Button>
        </div>
      </div>

      {/* System Overview Stats */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">SYSTEMS ONLINE</p>
                <p className="text-2xl font-bold text-white font-mono">24/26</p>
              </div>
              <CheckCircle className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">WARNINGS</p>
                <p className="text-2xl font-bold text-orange-500 font-mono">3</p>
              </div>
              <AlertTriangle className="w-8 h-8 text-orange-500" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">AVG UPTIME</p>
                <p className="text-2xl font-bold text-white font-mono">99.7%</p>
              </div>
              <Activity className="w-8 h-8 text-white" />
            </div>
          </CardContent>
        </Card>

        <Card className="bg-neutral-900 border-neutral-700">
          <CardContent className="p-4">
            <div className="flex items-center justify-between">
              <div>
                <p className="text-xs text-neutral-400 tracking-wider">MAINTENANCE</p>
                <p className="text-2xl font-bold text-neutral-300 font-mono">1</p>
              </div>
              <Settings className="w-8 h-8 text-neutral-300" />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Systems Grid */}
      <div className="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-6">
        {systems.map((system) => (
          <Card
            key={system.id}
            className="bg-neutral-900 border-neutral-700 hover:border-orange-500/50 transition-colors cursor-pointer"
            onClick={() => setSelectedSystem(system)}
          >
            <CardHeader className="pb-3">
              <div className="flex items-start justify-between">
                <div className="flex items-center gap-3">
                  {getSystemIcon(system.type)}
                  <div>
                    <CardTitle className="text-sm font-bold text-white tracking-wider">{system.name}</CardTitle>
                    <p className="text-xs text-neutral-400">{system.type}</p>
                  </div>
                </div>
                <div className="flex items-center gap-2">
                  {getStatusIcon(system.status)}
                  <Badge className={getStatusColor(system.status)}>{system.status.toUpperCase()}</Badge>
                </div>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="flex items-center justify-between">
                <span className="text-xs text-neutral-400">SYSTEM HEALTH</span>
                <span className={`text-sm font-bold font-mono ${getHealthColor(system.health)}`}>{system.health}%</span>
              </div>
              <Progress value={system.health} className="h-2" />

              <div className="grid grid-cols-3 gap-4 text-xs">
                <div>
                  <div className="text-neutral-400 mb-1">CPU</div>
                  <div className="text-white font-mono">{system.cpu}%</div>
                  <div className="w-full bg-neutral-800 rounded-full h-1 mt-1">
                    <div
                      className="bg-orange-500 h-1 rounded-full transition-all duration-300"
                      style={{ width: `${system.cpu}%` }}
                    ></div>
                  </div>
                </div>
                <div>
                  <div className="text-neutral-400 mb-1">MEMORY</div>
                  <div className="text-white font-mono">{system.memory}%</div>
                  <div className="w-full bg-neutral-800 rounded-full h-1 mt-1">
                    <div
                      className="bg-orange-500 h-1 rounded-full transition-all duration-300"
                      style={{ width: `${system.memory}%` }}
                    ></div>
                  </div>
                </div>
                <div>
                  <div className="text-neutral-400 mb-1">STORAGE</div>
                  <div className="text-white font-mono">{system.storage}%</div>
                  <div className="w-full bg-neutral-800 rounded-full h-1 mt-1">
                    <div
                      className="bg-orange-500 h-1 rounded-full transition-all duration-300"
                      style={{ width: `${system.storage}%` }}
                    ></div>
                  </div>
                </div>
              </div>

              <div className="space-y-1 text-xs text-neutral-400">
                <div className="flex justify-between">
                  <span>Uptime:</span>
                  <span className="text-white font-mono">{system.uptime}</span>
                </div>
                <div className="flex justify-between">
                  <span>Location:</span>
                  <span className="text-white">{system.location}</span>
                </div>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* System Detail Modal */}
      {selectedSystem && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center p-4 z-50">
          <Card className="bg-neutral-900 border-neutral-700 w-full max-w-4xl max-h-[90vh] overflow-y-auto">
            <CardHeader className="flex flex-row items-center justify-between">
              <div className="flex items-center gap-3">
                {getSystemIcon(selectedSystem.type)}
                <div>
                  <CardTitle className="text-xl font-bold text-white tracking-wider">{selectedSystem.name}</CardTitle>
                  <p className="text-sm text-neutral-400">
                    {selectedSystem.id} • {selectedSystem.type}
                  </p>
                </div>
              </div>
              <Button
                variant="ghost"
                onClick={() => setSelectedSystem(null)}
                className="text-neutral-400 hover:text-white"
              >
                ✕
              </Button>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-4">
                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">SYSTEM STATUS</h3>
                    <div className="flex items-center gap-2">
                      {getStatusIcon(selectedSystem.status)}
                      <Badge className={getStatusColor(selectedSystem.status)}>
                        {selectedSystem.status.toUpperCase()}
                      </Badge>
                    </div>
                  </div>

                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">SYSTEM INFORMATION</h3>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Location:</span>
                        <span className="text-white">{selectedSystem.location}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Uptime:</span>
                        <span className="text-white font-mono">{selectedSystem.uptime}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Last Maintenance:</span>
                        <span className="text-white font-mono">{selectedSystem.lastMaintenance}</span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-neutral-400">Health Score:</span>
                        <span className={`font-mono ${getHealthColor(selectedSystem.health)}`}>
                          {selectedSystem.health}%
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <div className="space-y-4">
                  <div>
                    <h3 className="text-sm font-medium text-neutral-300 tracking-wider mb-2">RESOURCE USAGE</h3>
                    <div className="space-y-3">
                      <div>
                        <div className="flex justify-between text-sm mb-1">
                          <span className="text-neutral-400">CPU Usage</span>
                          <span className="text-white font-mono">{selectedSystem.cpu}%</span>
                        </div>
                        <div className="w-full bg-neutral-800 rounded-full h-2">
                          <div
                            className="bg-orange-500 h-2 rounded-full transition-all duration-300"
                            style={{ width: `${selectedSystem.cpu}%` }}
                          ></div>
                        </div>
                      </div>

                      <div>
                        <div className="flex justify-between text-sm mb-1">
                          <span className="text-neutral-400">Memory Usage</span>
                          <span className="text-white font-mono">{selectedSystem.memory}%</span>
                        </div>
                        <div className="w-full bg-neutral-800 rounded-full h-2">
                          <div
                            className="bg-orange-500 h-2 rounded-full transition-all duration-300"
                            style={{ width: `${selectedSystem.memory}%` }}
                          ></div>
                        </div>
                      </div>

                      <div>
                        <div className="flex justify-between text-sm mb-1">
                          <span className="text-neutral-400">Storage Usage</span>
                          <span className="text-white font-mono">{selectedSystem.storage}%</span>
                        </div>
                        <div className="w-full bg-neutral-800 rounded-full h-2">
                          <div
                            className="bg-orange-500 h-2 rounded-full transition-all duration-300"
                            style={{ width: `${selectedSystem.storage}%` }}
                          ></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className="flex gap-2 pt-4 border-t border-neutral-700">
                <Button className="bg-orange-500 hover:bg-orange-600 text-white">Restart System</Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  View Logs
                </Button>
                <Button
                  variant="outline"
                  className="border-neutral-700 text-neutral-400 hover:bg-neutral-800 hover:text-neutral-300 bg-transparent"
                >
                  Schedule Maintenance
                </Button>
              </div>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  )
}
```

## File: app/globals.css
```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer utilities {
  .text-balance {
    text-wrap: balance;
  }
}

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 0 0% 3.9%;
    --card: 0 0% 100%;
    --card-foreground: 0 0% 3.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 0 0% 3.9%;
    --primary: 0 0% 9%;
    --primary-foreground: 0 0% 98%;
    --secondary: 0 0% 96.1%;
    --secondary-foreground: 0 0% 9%;
    --muted: 0 0% 96.1%;
    --muted-foreground: 0 0% 45.1%;
    --accent: 0 0% 96.1%;
    --accent-foreground: 0 0% 9%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 0 0% 89.8%;
    --input: 0 0% 89.8%;
    --ring: 0 0% 3.9%;
    --chart-1: 12 76% 61%;
    --chart-2: 173 58% 39%;
    --chart-3: 197 37% 24%;
    --chart-4: 43 74% 66%;
    --chart-5: 27 87% 67%;
    --radius: 0.5rem;
    --sidebar-background: 0 0% 98%;
    --sidebar-foreground: 240 5.3% 26.1%;
    --sidebar-primary: 240 5.9% 10%;
    --sidebar-primary-foreground: 0 0% 98%;
    --sidebar-accent: 240 4.8% 95.9%;
    --sidebar-accent-foreground: 240 5.9% 10%;
    --sidebar-border: 220 13% 91%;
    --sidebar-ring: 217.2 91.2% 59.8%;
  }
  .dark {
    --background: 0 0% 3.9%;
    --foreground: 0 0% 98%;
    --card: 0 0% 3.9%;
    --card-foreground: 0 0% 98%;
    --popover: 0 0% 3.9%;
    --popover-foreground: 0 0% 98%;
    --primary: 0 0% 98%;
    --primary-foreground: 0 0% 9%;
    --secondary: 0 0% 14.9%;
    --secondary-foreground: 0 0% 98%;
    --muted: 0 0% 14.9%;
    --muted-foreground: 0 0% 63.9%;
    --accent: 0 0% 14.9%;
    --accent-foreground: 0 0% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 0 0% 98%;
    --border: 0 0% 14.9%;
    --input: 0 0% 14.9%;
    --ring: 0 0% 83.1%;
    --chart-1: 220 70% 50%;
    --chart-2: 160 60% 45%;
    --chart-3: 30 80% 55%;
    --chart-4: 280 65% 60%;
    --chart-5: 340 75% 55%;
    --sidebar-background: 240 5.9% 10%;
    --sidebar-foreground: 240 4.8% 95.9%;
    --sidebar-primary: 224.3 76.3% 48%;
    --sidebar-primary-foreground: 0 0% 100%;
    --sidebar-accent: 240 3.7% 15.9%;
    --sidebar-accent-foreground: 240 4.8% 95.9%;
    --sidebar-border: 240 3.7% 15.9%;
    --sidebar-ring: 217.2 91.2% 59.8%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}
```

## File: app/layout.tsx
```typescript
import type React from "react"
import type { Metadata } from "next"
import { Geist_Mono as GeistMono } from "next/font/google"
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
    <html lang="es">
      <body className={`${geistMono.className} bg-black text-white antialiased`}>{children}</body>
    </html>
  )
}
```

## File: app/page.tsx
```typescript
"use client"

import { useState } from "react"
import { Navigation } from "@/components/Navigation"
import { OverviewView } from "@/components/OverviewView"
import { ContaCard } from "@/components/ContaCard"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Progress } from "@/components/ui/progress"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"
import { Checkbox } from "@/components/ui/checkbox"
import { useFinancialData } from "@/hooks/useFinancialData"
import { formatCurrency, formatDate, exportToCSV, MESES, ANOS, META_CHILE, DATA_META } from "@/utils/financial"
import { iconesDisponiveis } from "@/components/IconComponents"
import type { ViewType, FormData, DepositoForm, Conta } from "@/types/financial"
import {
  DollarSign,
  Plus,
  Check,
  X,
  Target,
  Plane,
  Wallet,
  Calculator,
  Calendar,
  AlertTriangle,
  Download,
  Trash2,
} from "lucide-react"

export default function FamilyFinancialDashboard() {
  const [activeView, setActiveView] = useState<ViewType>("overview")
  const [selectedMonth, setSelectedMonth] = useState(new Date().getMonth())
  const [selectedYear, setSelectedYear] = useState(new Date().getFullYear())
  const [isAddModalOpen, setIsAddModalOpen] = useState(false)
  const [editingConta, setEditingConta] = useState<Conta | null>(null)
  const [isDepositModalOpen, setIsDepositModalOpen] = useState(false)

  // Form states
  const [formData, setFormData] = useState<FormData>({
    nome: "",
    valor: "",
    categoria: "necessidade",
    dataVencimento: "10",
    icone: "Home",
  })

  const [depositoForm, setDepositoForm] = useState<DepositoForm>({
    valor: "",
    descricao: "",
  })

  const {
    contas,
    contasAtivas,
    depositosMeta,
    renda,
    financialSummary,
    addConta,
    updateConta,
    deleteConta,
    toggleContaStatus,
    togglePagamento,
    isPago,
    addDeposito,
    deleteDeposito,
  } = useFinancialData()

  // Chile goal calculations
  const totalEconomizado = depositosMeta.reduce((sum, deposito) => sum + deposito.valor, 0)
  const restanteMeta = META_CHILE - totalEconomizado
  const progressoMeta = (totalEconomizado / META_CHILE) * 100

  const hoje = new Date()
  const mesesRestantes = Math.max(
    0,
    (DATA_META.getFullYear() - hoje.getFullYear()) * 12 + (DATA_META.getMonth() - hoje.getMonth()),
  )
  const valorMensalNecessario = mesesRestantes > 0 ? restanteMeta / mesesRestantes : 0

  // Event handlers
  const handleViewChange = (view: ViewType) => {
    setActiveView(view)
  }

  const handleAddConta = () => {
    if (!formData.nome || !formData.valor) return

    addConta({
      nome: formData.nome,
      valor: Number.parseFloat(formData.valor),
      categoria: formData.categoria,
      dataVencimento: Number.parseInt(formData.dataVencimento),
      status: "ativo",
      icone: formData.icone,
    })

    setFormData({ nome: "", valor: "", categoria: "necessidade", dataVencimento: "10", icone: "Home" })
    setIsAddModalOpen(false)
  }

  const handleEditConta = (conta: Conta) => {
    setEditingConta(conta)
    setFormData({
      nome: conta.nome,
      valor: conta.valor.toString(),
      categoria: conta.categoria,
      dataVencimento: conta.dataVencimento.toString(),
      icone: conta.icone,
    })
  }

  const handleUpdateConta = () => {
    if (!editingConta || !formData.nome || !formData.valor) return

    updateConta(editingConta.id, {
      nome: formData.nome,
      valor: Number.parseFloat(formData.valor),
      categoria: formData.categoria,
      dataVencimento: Number.parseInt(formData.dataVencimento),
      icone: formData.icone,
    })

    setEditingConta(null)
    setFormData({ nome: "", valor: "", categoria: "necessidade", dataVencimento: "10", icone: "Home" })
  }

  const handleTogglePagamento = (contaId: string) => {
    togglePagamento(contaId, selectedMonth, selectedYear)
  }

  const handleAddDeposito = () => {
    if (!depositoForm.valor) return

    addDeposito({
      valor: Number.parseFloat(depositoForm.valor),
      descricao: depositoForm.descricao || "Depósito",
    })

    setDepositoForm({ valor: "", descricao: "" })
    setIsDepositModalOpen(false)
  }

  const handleExportCSV = () => {
    exportToCSV(contas, [], selectedYear)
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-50 via-blue-50 to-indigo-50 p-4">
      <div className="max-w-7xl mx-auto space-y-6">
        {/* Header */}
        <div className="text-center space-y-2">
          <h1 className="text-4xl font-bold bg-gradient-to-r from-slate-800 to-blue-800 bg-clip-text text-transparent">
            Painel Financeiro Familiar
          </h1>
          <p className="text-slate-600">Controle completo das finanças da família</p>
        </div>

        {/* Navigation */}
        <Navigation activeView={activeView} onViewChange={handleViewChange} />

        {/* Overview View */}
        {activeView === "overview" && <OverviewView financialSummary={financialSummary} renda={renda} />}

        {/* Manage View */}
        {activeView === "manage" && (
          <div className="space-y-6">
            <div className="flex justify-between items-center">
              <h2 className="text-2xl font-bold text-slate-800">Gerenciar Contas</h2>
              <Dialog open={isAddModalOpen} onOpenChange={setIsAddModalOpen}>
                <DialogTrigger asChild>
                  <Button className="flex items-center gap-2 bg-emerald-600 hover:bg-emerald-700 shadow-lg transition-all duration-200">
                    <Plus className="w-4 h-4" />
                    Adicionar Conta
                  </Button>
                </DialogTrigger>
                <DialogContent className="sm:max-w-md">
                  <DialogHeader>
                    <DialogTitle>Adicionar Nova Conta</DialogTitle>
                  </DialogHeader>
                  <div className="space-y-4">
                    <div>
                      <Label htmlFor="nome">Nome da Conta</Label>
                      <Input
                        id="nome"
                        value={formData.nome}
                        onChange={(e) => setFormData({ ...formData, nome: e.target.value })}
                        placeholder="Ex: Conta de Luz"
                        className="mt-1"
                      />
                    </div>
                    <div>
                      <Label htmlFor="valor">Valor (R$)</Label>
                      <Input
                        id="valor"
                        type="number"
                        value={formData.valor}
                        onChange={(e) => setFormData({ ...formData, valor: e.target.value })}
                        placeholder="0.00"
                        className="mt-1"
                      />
                    </div>
                    <div>
                      <Label htmlFor="categoria">Categoria</Label>
                      <Select
                        value={formData.categoria}
                        onValueChange={(value: "necessidade" | "desejo" | "divida") =>
                          setFormData({ ...formData, categoria: value })
                        }
                      >
                        <SelectTrigger className="mt-1">
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          <SelectItem value="necessidade">Necessidade</SelectItem>
                          <SelectItem value="desejo">Desejo</SelectItem>
                          <SelectItem value="divida">Dívida</SelectItem>
                        </SelectContent>
                      </Select>
                    </div>
                    <div>
                      <Label htmlFor="dataVencimento">Data de Vencimento</Label>
                      <Input
                        id="dataVencimento"
                        type="number"
                        min="1"
                        max="31"
                        value={formData.dataVencimento}
                        onChange={(e) => setFormData({ ...formData, dataVencimento: e.target.value })}
                        className="mt-1"
                      />
                    </div>
                    <div>
                      <Label htmlFor="icone">Ícone</Label>
                      <Select
                        value={formData.icone}
                        onValueChange={(value) => setFormData({ ...formData, icone: value })}
                      >
                        <SelectTrigger className="mt-1">
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent>
                          {Object.keys(iconesDisponiveis).map((icone) => (
                            <SelectItem key={icone} value={icone}>
                              {icone}
                            </SelectItem>
                          ))}
                        </SelectContent>
                      </Select>
                    </div>
                    <Button
                      onClick={handleAddConta}
                      className="w-full bg-emerald-600 hover:bg-emerald-700 transition-colors"
                    >
                      Adicionar Conta
                    </Button>
                  </div>
                </DialogContent>
              </Dialog>
            </div>

            {/* Account Cards */}
            <div className="grid grid-cols-1 lg:grid-cols-2 xl:grid-cols-3 gap-4">
              {contas.map((conta) => (
                <ContaCard
                  key={conta.id}
                  conta={conta}
                  onEdit={handleEditConta}
                  onToggleStatus={toggleContaStatus}
                  onDelete={deleteConta}
                />
              ))}
            </div>

            {/* Edit Modal */}
            <Dialog open={!!editingConta} onOpenChange={() => setEditingConta(null)}>
              <DialogContent className="sm:max-w-md">
                <DialogHeader>
                  <DialogTitle>Editar Conta</DialogTitle>
                </DialogHeader>
                <div className="space-y-4">
                  <div>
                    <Label htmlFor="nome-edit">Nome da Conta</Label>
                    <Input
                      id="nome-edit"
                      value={formData.nome}
                      onChange={(e) => setFormData({ ...formData, nome: e.target.value })}
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="valor-edit">Valor (R$)</Label>
                    <Input
                      id="valor-edit"
                      type="number"
                      value={formData.valor}
                      onChange={(e) => setFormData({ ...formData, valor: e.target.value })}
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="categoria-edit">Categoria</Label>
                    <Select
                      value={formData.categoria}
                      onValueChange={(value: "necessidade" | "desejo" | "divida") =>
                        setFormData({ ...formData, categoria: value })
                      }
                    >
                      <SelectTrigger className="mt-1">
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        <SelectItem value="necessidade">Necessidade</SelectItem>
                        <SelectItem value="desejo">Desejo</SelectItem>
                        <SelectItem value="divida">Dívida</SelectItem>
                      </SelectContent>
                    </Select>
                  </div>
                  <div>
                    <Label htmlFor="dataVencimento-edit">Data de Vencimento</Label>
                    <Input
                      id="dataVencimento-edit"
                      type="number"
                      min="1"
                      max="31"
                      value={formData.dataVencimento}
                      onChange={(e) => setFormData({ ...formData, dataVencimento: e.target.value })}
                      className="mt-1"
                    />
                  </div>
                  <div>
                    <Label htmlFor="icone-edit">Ícone</Label>
                    <Select
                      value={formData.icone}
                      onValueChange={(value) => setFormData({ ...formData, icone: value })}
                    >
                      <SelectTrigger className="mt-1">
                        <SelectValue />
                      </SelectTrigger>
                      <SelectContent>
                        {Object.keys(iconesDisponiveis).map((icone) => (
                          <SelectItem key={icone} value={icone}>
                            {icone}
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                  </div>
                  <div className="flex gap-2">
                    <Button
                      onClick={handleUpdateConta}
                      className="flex-1 bg-blue-600 hover:bg-blue-700 transition-colors"
                    >
                      Salvar Alterações
                    </Button>
                    <Button variant="outline" onClick={() => setEditingConta(null)}>
                      Cancelar
                    </Button>
                  </div>
                </div>
              </DialogContent>
            </Dialog>
          </div>
        )}

        {/* Monthly View */}
        {activeView === "monthly" && (
          <div className="space-y-6">
            <div className="flex flex-col sm:flex-row gap-4 items-center justify-between">
              <h2 className="text-2xl font-bold text-slate-800">Controle Mensal de Pagamentos</h2>
              <div className="flex gap-2">
                <Select
                  value={selectedMonth.toString()}
                  onValueChange={(value) => setSelectedMonth(Number.parseInt(value))}
                >
                  <SelectTrigger className="w-40">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {MESES.map((mes, index) => (
                      <SelectItem key={index} value={index.toString()}>
                        {mes}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
                <Select
                  value={selectedYear.toString()}
                  onValueChange={(value) => setSelectedYear(Number.parseInt(value))}
                >
                  <SelectTrigger className="w-24">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {ANOS.map((ano) => (
                      <SelectItem key={ano} value={ano.toString()}>
                        {ano}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>
            </div>

            {/* Monthly Summary */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
              <Card className="shadow-lg hover:shadow-xl transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-slate-600">Contas Pagas</p>
                      <p className="text-2xl font-bold text-emerald-600">
                        {contasAtivas.filter((conta) => isPago(conta.id, selectedMonth, selectedYear)).length}
                      </p>
                    </div>
                    <Check className="w-8 h-8 text-emerald-600" />
                  </div>
                </CardContent>
              </Card>
              <Card className="shadow-lg hover:shadow-xl transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-slate-600">Contas Pendentes</p>
                      <p className="text-2xl font-bold text-red-600">
                        {contasAtivas.filter((conta) => !isPago(conta.id, selectedMonth, selectedYear)).length}
                      </p>
                    </div>
                    <X className="w-8 h-8 text-red-600" />
                  </div>
                </CardContent>
              </Card>
              <Card className="shadow-lg hover:shadow-xl transition-shadow">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-slate-600">Total Pago</p>
                      <p className="text-2xl font-bold text-blue-600">
                        {formatCurrency(
                          contasAtivas
                            .filter((conta) => isPago(conta.id, selectedMonth, selectedYear))
                            .reduce((sum, conta) => sum + conta.valor, 0),
                        )}
                      </p>
                    </div>
                    <DollarSign className="w-8 h-8 text-blue-600" />
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Monthly Bills List */}
            <Card className="shadow-lg">
              <CardHeader>
                <CardTitle>
                  Contas de {MESES[selectedMonth]} {selectedYear}
                </CardTitle>
              </CardHeader>
              <CardContent>
                <div className="space-y-3">
                  {contasAtivas.map((conta) => {
                    const pago = isPago(conta.id, selectedMonth, selectedYear)
                    return (
                      <div
                        key={conta.id}
                        className={`flex items-center justify-between p-4 rounded-lg border transition-all duration-200 ${
                          pago
                            ? "bg-gradient-to-r from-emerald-50 to-emerald-100 border-emerald-200"
                            : "bg-gradient-to-r from-red-50 to-red-100 border-red-200"
                        }`}
                      >
                        <div className="flex items-center gap-3">
                          <Checkbox
                            checked={pago}
                            onCheckedChange={() => handleTogglePagamento(conta.id)}
                            aria-label={`Marcar ${conta.nome} como ${pago ? "não pago" : "pago"}`}
                          />
                          <div>
                            <p className="font-medium">{conta.nome}</p>
                            <p className="text-sm text-slate-600">
                              Vence dia {conta.dataVencimento} • {formatCurrency(conta.valor)}
                            </p>
                          </div>
                        </div>
                        <Badge
                          variant={pago ? "default" : "destructive"}
                          className={
                            pago
                              ? "bg-emerald-100 text-emerald-800 border-emerald-300"
                              : "bg-red-100 text-red-800 border-red-300"
                          }
                        >
                          {pago ? "Pago" : "Pendente"}
                        </Badge>
                      </div>
                    )
                  })}
                </div>
              </CardContent>
            </Card>
          </div>
        )}

        {/* Chile Goal View */}
        {activeView === "chile" && (
          <div className="space-y-6">
            <div className="text-center space-y-4">
              <div className="flex items-center justify-center gap-3">
                <Plane className="w-8 h-8 text-orange-600" />
                <h2 className="text-3xl font-bold bg-gradient-to-r from-orange-600 to-red-600 bg-clip-text text-transparent">
                  Meta Chile 2025
                </h2>
              </div>
              <p className="text-slate-600">Objetivo: Economizar R$ 20.000 até outubro de 2025</p>
            </div>

            {/* Progress Cards */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
              <Card className="bg-gradient-to-br from-orange-50 to-orange-100 border-orange-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-orange-800">Meta Total</p>
                      <p className="text-2xl font-bold text-orange-700">{formatCurrency(META_CHILE)}</p>
                    </div>
                    <Target className="w-8 h-8 text-orange-600" />
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gradient-to-br from-emerald-50 to-emerald-100 border-emerald-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-emerald-800">Economizado</p>
                      <p className="text-2xl font-bold text-emerald-700">{formatCurrency(totalEconomizado)}</p>
                    </div>
                    <Wallet className="w-8 h-8 text-emerald-600" />
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gradient-to-br from-blue-50 to-blue-100 border-blue-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-blue-800">Restante</p>
                      <p className="text-2xl font-bold text-blue-700">{formatCurrency(restanteMeta)}</p>
                    </div>
                    <Calculator className="w-8 h-8 text-blue-600" />
                  </div>
                </CardContent>
              </Card>

              <Card className="bg-gradient-to-br from-purple-50 to-purple-100 border-purple-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center justify-between">
                    <div>
                      <p className="text-sm text-purple-800">Por Mês</p>
                      <p className="text-2xl font-bold text-purple-700">{formatCurrency(valorMensalNecessario)}</p>
                    </div>
                    <Calendar className="w-8 h-8 text-purple-600" />
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Progress Bar */}
            <Card className="shadow-lg">
              <CardHeader>
                <CardTitle className="flex items-center justify-between">
                  <span>Progresso da Meta</span>
                  <span className="text-2xl font-bold text-orange-600">{progressoMeta.toFixed(1)}%</span>
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div className="relative">
                  <Progress
                    value={progressoMeta}
                    className="h-6 bg-slate-200"
                    aria-label={`Progresso da meta: ${progressoMeta.toFixed(1)}%`}
                  />
                  <div className="absolute inset-0 flex items-center justify-center">
                    <span className="text-sm font-medium text-white drop-shadow-lg">
                      {formatCurrency(totalEconomizado)} de {formatCurrency(META_CHILE)}
                    </span>
                  </div>
                </div>
                <div className="flex justify-between text-sm text-slate-600">
                  <span>Início: Janeiro 2025</span>
                  <span>Meta: Outubro 2025</span>
                </div>
                {mesesRestantes > 0 && (
                  <div className="p-3 bg-blue-50 border border-blue-200 rounded-lg">
                    <p className="text-sm text-blue-800">
                      <strong>Faltam {mesesRestantes} meses</strong> para atingir a meta. É necessário economizar{" "}
                      <strong>{formatCurrency(valorMensalNecessario)}</strong> por mês.
                    </p>
                  </div>
                )}
                {progressoMeta >= 100 && (
                  <div className="p-3 bg-emerald-50 border border-emerald-200 rounded-lg">
                    <p className="text-sm text-emerald-800 font-medium">
                      🎉 Parabéns! Você atingiu sua meta para o Chile!
                    </p>
                  </div>
                )}
              </CardContent>
            </Card>

            {/* Deposits Section */}
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {/* Add Deposit */}
              <Card className="shadow-lg">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <Plus className="w-5 h-5 text-emerald-600" />
                    Adicionar Depósito
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <Dialog open={isDepositModalOpen} onOpenChange={setIsDepositModalOpen}>
                    <DialogTrigger asChild>
                      <Button className="w-full bg-emerald-600 hover:bg-emerald-700 shadow-lg transition-all duration-200">
                        <Plus className="w-4 h-4 mr-2" />
                        Registrar Economia
                      </Button>
                    </DialogTrigger>
                    <DialogContent className="sm:max-w-md">
                      <DialogHeader>
                        <DialogTitle>Registrar Nova Economia</DialogTitle>
                      </DialogHeader>
                      <div className="space-y-4">
                        <div>
                          <Label htmlFor="valor-deposito">Valor Economizado (R$)</Label>
                          <Input
                            id="valor-deposito"
                            type="number"
                            value={depositoForm.valor}
                            onChange={(e) => setDepositoForm({ ...depositoForm, valor: e.target.value })}
                            placeholder="0.00"
                            className="mt-1"
                          />
                        </div>
                        <div>
                          <Label htmlFor="descricao-deposito">Descrição (opcional)</Label>
                          <Input
                            id="descricao-deposito"
                            value={depositoForm.descricao}
                            onChange={(e) => setDepositoForm({ ...depositoForm, descricao: e.target.value })}
                            placeholder="Ex: Economia do mês, Freelance..."
                            className="mt-1"
                          />
                        </div>
                        <Button
                          onClick={handleAddDeposito}
                          className="w-full bg-emerald-600 hover:bg-emerald-700 transition-colors"
                        >
                          Registrar Economia
                        </Button>
                      </div>
                    </DialogContent>
                  </Dialog>

                  <div className="mt-4 p-4 bg-slate-50 rounded-lg">
                    <h4 className="font-medium text-slate-800 mb-2">Dicas para Economizar:</h4>
                    <ul className="text-sm text-slate-600 space-y-1">
                      <li>• Reduza gastos com desejos</li>
                      <li>• Procure renda extra</li>
                      <li>• Revise contratos mensais</li>
                      <li>• Evite compras por impulso</li>
                    </ul>
                  </div>
                </CardContent>
              </Card>

              {/* Deposit History */}
              <Card className="shadow-lg">
                <CardHeader>
                  <CardTitle className="flex items-center gap-2">
                    <Wallet className="w-5 h-5 text-blue-600" />
                    Histórico de Economias
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3 max-h-80 overflow-y-auto">
                    {depositosMeta
                      .sort((a, b) => new Date(b.data).getTime() - new Date(a.data).getTime())
                      .map((deposito) => (
                        <div
                          key={deposito.id}
                          className="flex items-center justify-between p-3 bg-gradient-to-r from-emerald-50 to-emerald-100 border border-emerald-200 rounded-lg"
                        >
                          <div>
                            <p className="font-medium text-emerald-800">{formatCurrency(deposito.valor)}</p>
                            <p className="text-xs text-emerald-600">
                              {formatDate(deposito.data)} • {deposito.descricao}
                            </p>
                          </div>
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => deleteDeposito(deposito.id)}
                            className="hover:bg-red-50 hover:border-red-300 hover:text-red-600 transition-colors"
                            aria-label={`Excluir depósito de ${formatCurrency(deposito.valor)}`}
                          >
                            <Trash2 className="w-3 h-3" />
                          </Button>
                        </div>
                      ))}
                    {depositosMeta.length === 0 && (
                      <div className="text-center py-8 text-slate-500">
                        <Wallet className="w-12 h-12 mx-auto mb-2 opacity-50" />
                        <p>Nenhuma economia registrada ainda</p>
                      </div>
                    )}
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* Alerts and Status */}
            {restanteMeta > 0 && valorMensalNecessario > financialSummary.saldoFinal && (
              <Card className="bg-gradient-to-r from-amber-50 to-amber-100 border-amber-200 shadow-lg">
                <CardContent className="p-4">
                  <div className="flex items-center gap-3">
                    <AlertTriangle className="w-6 h-6 text-amber-600" />
                    <div>
                      <p className="font-medium text-amber-800">Atenção!</p>
                      <p className="text-sm text-amber-700">
                        Seu saldo atual ({formatCurrency(financialSummary.saldoFinal)}) é menor que o necessário por mês
                        ({formatCurrency(valorMensalNecessario)}). Considere revisar seus gastos ou buscar renda extra.
                      </p>
                    </div>
                  </div>
                </CardContent>
              </Card>
            )}
          </div>
        )}

        {/* Export View */}
        {activeView === "export" && (
          <div className="space-y-6">
            <div className="text-center space-y-4">
              <h2 className="text-2xl font-bold text-slate-800">Exportar Dados</h2>
              <p className="text-slate-600">Exporte seus dados financeiros para análise externa</p>
            </div>

            <Card className="max-w-md mx-auto shadow-lg">
              <CardHeader>
                <CardTitle className="flex items-center gap-2">
                  <Download className="w-5 h-5 text-slate-600" />
                  Exportar para CSV
                </CardTitle>
              </CardHeader>
              <CardContent className="space-y-4">
                <div>
                  <Label>Ano para Exportação</Label>
                  <Select
                    value={selectedYear.toString()}
                    onValueChange={(value) => setSelectedYear(Number.parseInt(value))}
                  >
                    <SelectTrigger className="mt-1">
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent>
                      {ANOS.map((ano) => (
                        <SelectItem key={ano} value={ano.toString()}>
                          {ano}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <p className="text-sm text-slate-600">
                  O arquivo CSV incluirá todas as contas com seus valores, categorias, datas de vencimento e status de
                  pagamento para cada mês do ano selecionado.
                </p>
                <Button
                  onClick={handleExportCSV}
                  className="w-full bg-slate-600 hover:bg-slate-700 shadow-lg transition-all duration-200"
                >
                  <Download className="w-4 h-4 mr-2" />
                  Baixar CSV
                </Button>
              </CardContent>
            </Card>
          </div>
        )}
      </div>
    </div>
  )
}
```

## File: components/ui/accordion.tsx
```typescript
"use client"

import * as React from "react"
import * as AccordionPrimitive from "@radix-ui/react-accordion"
import { ChevronDown } from "lucide-react"

import { cn } from "@/lib/utils"

const Accordion = AccordionPrimitive.Root

const AccordionItem = React.forwardRef<
  React.ElementRef<typeof AccordionPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.Item>
>(({ className, ...props }, ref) => (
  <AccordionPrimitive.Item
    ref={ref}
    className={cn("border-b", className)}
    {...props}
  />
))
AccordionItem.displayName = "AccordionItem"

const AccordionTrigger = React.forwardRef<
  React.ElementRef<typeof AccordionPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.Trigger>
>(({ className, children, ...props }, ref) => (
  <AccordionPrimitive.Header className="flex">
    <AccordionPrimitive.Trigger
      ref={ref}
      className={cn(
        "flex flex-1 items-center justify-between py-4 font-medium transition-all hover:underline [&[data-state=open]>svg]:rotate-180",
        className
      )}
      {...props}
    >
      {children}
      <ChevronDown className="h-4 w-4 shrink-0 transition-transform duration-200" />
    </AccordionPrimitive.Trigger>
  </AccordionPrimitive.Header>
))
AccordionTrigger.displayName = AccordionPrimitive.Trigger.displayName

const AccordionContent = React.forwardRef<
  React.ElementRef<typeof AccordionPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof AccordionPrimitive.Content>
>(({ className, children, ...props }, ref) => (
  <AccordionPrimitive.Content
    ref={ref}
    className="overflow-hidden text-sm transition-all data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down"
    {...props}
  >
    <div className={cn("pb-4 pt-0", className)}>{children}</div>
  </AccordionPrimitive.Content>
))

AccordionContent.displayName = AccordionPrimitive.Content.displayName

export { Accordion, AccordionItem, AccordionTrigger, AccordionContent }
```

## File: components/ui/alert-dialog.tsx
```typescript
"use client"

import * as React from "react"
import * as AlertDialogPrimitive from "@radix-ui/react-alert-dialog"

import { cn } from "@/lib/utils"
import { buttonVariants } from "@/components/ui/button"

const AlertDialog = AlertDialogPrimitive.Root

const AlertDialogTrigger = AlertDialogPrimitive.Trigger

const AlertDialogPortal = AlertDialogPrimitive.Portal

const AlertDialogOverlay = React.forwardRef<
  React.ElementRef<typeof AlertDialogPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <AlertDialogPrimitive.Overlay
    className={cn(
      "fixed inset-0 z-50 bg-black/80  data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0",
      className
    )}
    {...props}
    ref={ref}
  />
))
AlertDialogOverlay.displayName = AlertDialogPrimitive.Overlay.displayName

const AlertDialogContent = React.forwardRef<
  React.ElementRef<typeof AlertDialogPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Content>
>(({ className, ...props }, ref) => (
  <AlertDialogPortal>
    <AlertDialogOverlay />
    <AlertDialogPrimitive.Content
      ref={ref}
      className={cn(
        "fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg",
        className
      )}
      {...props}
    />
  </AlertDialogPortal>
))
AlertDialogContent.displayName = AlertDialogPrimitive.Content.displayName

const AlertDialogHeader = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn(
      "flex flex-col space-y-2 text-center sm:text-left",
      className
    )}
    {...props}
  />
)
AlertDialogHeader.displayName = "AlertDialogHeader"

const AlertDialogFooter = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn(
      "flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2",
      className
    )}
    {...props}
  />
)
AlertDialogFooter.displayName = "AlertDialogFooter"

const AlertDialogTitle = React.forwardRef<
  React.ElementRef<typeof AlertDialogPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Title>
>(({ className, ...props }, ref) => (
  <AlertDialogPrimitive.Title
    ref={ref}
    className={cn("text-lg font-semibold", className)}
    {...props}
  />
))
AlertDialogTitle.displayName = AlertDialogPrimitive.Title.displayName

const AlertDialogDescription = React.forwardRef<
  React.ElementRef<typeof AlertDialogPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Description>
>(({ className, ...props }, ref) => (
  <AlertDialogPrimitive.Description
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
))
AlertDialogDescription.displayName =
  AlertDialogPrimitive.Description.displayName

const AlertDialogAction = React.forwardRef<
  React.ElementRef<typeof AlertDialogPrimitive.Action>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Action>
>(({ className, ...props }, ref) => (
  <AlertDialogPrimitive.Action
    ref={ref}
    className={cn(buttonVariants(), className)}
    {...props}
  />
))
AlertDialogAction.displayName = AlertDialogPrimitive.Action.displayName

const AlertDialogCancel = React.forwardRef<
  React.ElementRef<typeof AlertDialogPrimitive.Cancel>,
  React.ComponentPropsWithoutRef<typeof AlertDialogPrimitive.Cancel>
>(({ className, ...props }, ref) => (
  <AlertDialogPrimitive.Cancel
    ref={ref}
    className={cn(
      buttonVariants({ variant: "outline" }),
      "mt-2 sm:mt-0",
      className
    )}
    {...props}
  />
))
AlertDialogCancel.displayName = AlertDialogPrimitive.Cancel.displayName

export {
  AlertDialog,
  AlertDialogPortal,
  AlertDialogOverlay,
  AlertDialogTrigger,
  AlertDialogContent,
  AlertDialogHeader,
  AlertDialogFooter,
  AlertDialogTitle,
  AlertDialogDescription,
  AlertDialogAction,
  AlertDialogCancel,
}
```

## File: components/ui/alert.tsx
```typescript
import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const alertVariants = cva(
  "relative w-full rounded-lg border p-4 [&>svg~*]:pl-7 [&>svg+div]:translate-y-[-3px] [&>svg]:absolute [&>svg]:left-4 [&>svg]:top-4 [&>svg]:text-foreground",
  {
    variants: {
      variant: {
        default: "bg-background text-foreground",
        destructive:
          "border-destructive/50 text-destructive dark:border-destructive [&>svg]:text-destructive",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  }
)

const Alert = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement> & VariantProps<typeof alertVariants>
>(({ className, variant, ...props }, ref) => (
  <div
    ref={ref}
    role="alert"
    className={cn(alertVariants({ variant }), className)}
    {...props}
  />
))
Alert.displayName = "Alert"

const AlertTitle = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLHeadingElement>
>(({ className, ...props }, ref) => (
  <h5
    ref={ref}
    className={cn("mb-1 font-medium leading-none tracking-tight", className)}
    {...props}
  />
))
AlertTitle.displayName = "AlertTitle"

const AlertDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("text-sm [&_p]:leading-relaxed", className)}
    {...props}
  />
))
AlertDescription.displayName = "AlertDescription"

export { Alert, AlertTitle, AlertDescription }
```

## File: components/ui/aspect-ratio.tsx
```typescript
"use client"

import * as AspectRatioPrimitive from "@radix-ui/react-aspect-ratio"

const AspectRatio = AspectRatioPrimitive.Root

export { AspectRatio }
```

## File: components/ui/avatar.tsx
```typescript
"use client"

import * as React from "react"
import * as AvatarPrimitive from "@radix-ui/react-avatar"

import { cn } from "@/lib/utils"

const Avatar = React.forwardRef<
  React.ElementRef<typeof AvatarPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof AvatarPrimitive.Root>
>(({ className, ...props }, ref) => (
  <AvatarPrimitive.Root
    ref={ref}
    className={cn(
      "relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full",
      className
    )}
    {...props}
  />
))
Avatar.displayName = AvatarPrimitive.Root.displayName

const AvatarImage = React.forwardRef<
  React.ElementRef<typeof AvatarPrimitive.Image>,
  React.ComponentPropsWithoutRef<typeof AvatarPrimitive.Image>
>(({ className, ...props }, ref) => (
  <AvatarPrimitive.Image
    ref={ref}
    className={cn("aspect-square h-full w-full", className)}
    {...props}
  />
))
AvatarImage.displayName = AvatarPrimitive.Image.displayName

const AvatarFallback = React.forwardRef<
  React.ElementRef<typeof AvatarPrimitive.Fallback>,
  React.ComponentPropsWithoutRef<typeof AvatarPrimitive.Fallback>
>(({ className, ...props }, ref) => (
  <AvatarPrimitive.Fallback
    ref={ref}
    className={cn(
      "flex h-full w-full items-center justify-center rounded-full bg-muted",
      className
    )}
    {...props}
  />
))
AvatarFallback.displayName = AvatarPrimitive.Fallback.displayName

export { Avatar, AvatarImage, AvatarFallback }
```

## File: components/ui/badge.tsx
```typescript
import * as React from "react"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const badgeVariants = cva(
  "inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2",
  {
    variants: {
      variant: {
        default:
          "border-transparent bg-primary text-primary-foreground hover:bg-primary/80",
        secondary:
          "border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80",
        destructive:
          "border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80",
        outline: "text-foreground",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  }
)

export interface BadgeProps
  extends React.HTMLAttributes<HTMLDivElement>,
    VariantProps<typeof badgeVariants> {}

function Badge({ className, variant, ...props }: BadgeProps) {
  return (
    <div className={cn(badgeVariants({ variant }), className)} {...props} />
  )
}

export { Badge, badgeVariants }
```

## File: components/ui/breadcrumb.tsx
```typescript
import * as React from "react"
import { Slot } from "@radix-ui/react-slot"
import { ChevronRight, MoreHorizontal } from "lucide-react"

import { cn } from "@/lib/utils"

const Breadcrumb = React.forwardRef<
  HTMLElement,
  React.ComponentPropsWithoutRef<"nav"> & {
    separator?: React.ReactNode
  }
>(({ ...props }, ref) => <nav ref={ref} aria-label="breadcrumb" {...props} />)
Breadcrumb.displayName = "Breadcrumb"

const BreadcrumbList = React.forwardRef<
  HTMLOListElement,
  React.ComponentPropsWithoutRef<"ol">
>(({ className, ...props }, ref) => (
  <ol
    ref={ref}
    className={cn(
      "flex flex-wrap items-center gap-1.5 break-words text-sm text-muted-foreground sm:gap-2.5",
      className
    )}
    {...props}
  />
))
BreadcrumbList.displayName = "BreadcrumbList"

const BreadcrumbItem = React.forwardRef<
  HTMLLIElement,
  React.ComponentPropsWithoutRef<"li">
>(({ className, ...props }, ref) => (
  <li
    ref={ref}
    className={cn("inline-flex items-center gap-1.5", className)}
    {...props}
  />
))
BreadcrumbItem.displayName = "BreadcrumbItem"

const BreadcrumbLink = React.forwardRef<
  HTMLAnchorElement,
  React.ComponentPropsWithoutRef<"a"> & {
    asChild?: boolean
  }
>(({ asChild, className, ...props }, ref) => {
  const Comp = asChild ? Slot : "a"

  return (
    <Comp
      ref={ref}
      className={cn("transition-colors hover:text-foreground", className)}
      {...props}
    />
  )
})
BreadcrumbLink.displayName = "BreadcrumbLink"

const BreadcrumbPage = React.forwardRef<
  HTMLSpanElement,
  React.ComponentPropsWithoutRef<"span">
>(({ className, ...props }, ref) => (
  <span
    ref={ref}
    role="link"
    aria-disabled="true"
    aria-current="page"
    className={cn("font-normal text-foreground", className)}
    {...props}
  />
))
BreadcrumbPage.displayName = "BreadcrumbPage"

const BreadcrumbSeparator = ({
  children,
  className,
  ...props
}: React.ComponentProps<"li">) => (
  <li
    role="presentation"
    aria-hidden="true"
    className={cn("[&>svg]:w-3.5 [&>svg]:h-3.5", className)}
    {...props}
  >
    {children ?? <ChevronRight />}
  </li>
)
BreadcrumbSeparator.displayName = "BreadcrumbSeparator"

const BreadcrumbEllipsis = ({
  className,
  ...props
}: React.ComponentProps<"span">) => (
  <span
    role="presentation"
    aria-hidden="true"
    className={cn("flex h-9 w-9 items-center justify-center", className)}
    {...props}
  >
    <MoreHorizontal className="h-4 w-4" />
    <span className="sr-only">More</span>
  </span>
)
BreadcrumbEllipsis.displayName = "BreadcrumbElipssis"

export {
  Breadcrumb,
  BreadcrumbList,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbPage,
  BreadcrumbSeparator,
  BreadcrumbEllipsis,
}
```

## File: components/ui/button.tsx
```typescript
import * as React from "react"
import { Slot } from "@radix-ui/react-slot"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        destructive:
          "bg-destructive text-destructive-foreground hover:bg-destructive/90",
        outline:
          "border border-input bg-background hover:bg-accent hover:text-accent-foreground",
        secondary:
          "bg-secondary text-secondary-foreground hover:bg-secondary/80",
        ghost: "hover:bg-accent hover:text-accent-foreground",
        link: "text-primary underline-offset-4 hover:underline",
      },
      size: {
        default: "h-10 px-4 py-2",
        sm: "h-9 rounded-md px-3",
        lg: "h-11 rounded-md px-8",
        icon: "h-10 w-10",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
)

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : "button"
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        {...props}
      />
    )
  }
)
Button.displayName = "Button"

export { Button, buttonVariants }
```

## File: components/ui/calendar.tsx
```typescript
'use client'

import * as React from 'react'
import {
  ChevronDownIcon,
  ChevronLeftIcon,
  ChevronRightIcon,
} from 'lucide-react'
import { DayButton, DayPicker, getDefaultClassNames } from 'react-day-picker'

import { cn } from '@/lib/utils'
import { Button, buttonVariants } from '@/components/ui/button'

function Calendar({
  className,
  classNames,
  showOutsideDays = true,
  captionLayout = 'label',
  buttonVariant = 'ghost',
  formatters,
  components,
  ...props
}: React.ComponentProps<typeof DayPicker> & {
  buttonVariant?: React.ComponentProps<typeof Button>['variant']
}) {
  const defaultClassNames = getDefaultClassNames()

  return (
    <DayPicker
      showOutsideDays={showOutsideDays}
      className={cn(
        'bg-background group/calendar p-3 [--cell-size:--spacing(8)] [[data-slot=card-content]_&]:bg-transparent [[data-slot=popover-content]_&]:bg-transparent',
        String.raw`rtl:**:[.rdp-button\_next>svg]:rotate-180`,
        String.raw`rtl:**:[.rdp-button\_previous>svg]:rotate-180`,
        className
      )}
      captionLayout={captionLayout}
      formatters={{
        formatMonthDropdown: date =>
          date.toLocaleString('default', { month: 'short' }),
        ...formatters,
      }}
      classNames={{
        root: cn('w-fit', defaultClassNames.root),
        months: cn(
          'flex gap-4 flex-col md:flex-row relative',
          defaultClassNames.months
        ),
        month: cn('flex flex-col w-full gap-4', defaultClassNames.month),
        nav: cn(
          'flex items-center gap-1 w-full absolute top-0 inset-x-0 justify-between',
          defaultClassNames.nav
        ),
        button_previous: cn(
          buttonVariants({ variant: buttonVariant }),
          'size-[--cell-size] aria-disabled:opacity-50 p-0 select-none',
          defaultClassNames.button_previous
        ),
        button_next: cn(
          buttonVariants({ variant: buttonVariant }),
          'size-[--cell-size] aria-disabled:opacity-50 p-0 select-none',
          defaultClassNames.button_next
        ),
        month_caption: cn(
          'flex items-center justify-center h-[--cell-size] w-full px-[--cell-size]',
          defaultClassNames.month_caption
        ),
        dropdowns: cn(
          'w-full flex items-center text-sm font-medium justify-center h-[--cell-size] gap-1.5',
          defaultClassNames.dropdowns
        ),
        dropdown_root: cn(
          'relative has-focus:border-ring border border-input shadow-xs has-focus:ring-ring/50 has-focus:ring-[3px] rounded-md',
          defaultClassNames.dropdown_root
        ),
        dropdown: cn(
          'absolute bg-popover inset-0 opacity-0',
          defaultClassNames.dropdown
        ),
        caption_label: cn(
          'select-none font-medium',
          captionLayout === 'label'
            ? 'text-sm'
            : 'rounded-md pl-2 pr-1 flex items-center gap-1 text-sm h-8 [&>svg]:text-muted-foreground [&>svg]:size-3.5',
          defaultClassNames.caption_label
        ),
        table: 'w-full border-collapse',
        weekdays: cn('flex', defaultClassNames.weekdays),
        weekday: cn(
          'text-muted-foreground rounded-md flex-1 font-normal text-[0.8rem] select-none',
          defaultClassNames.weekday
        ),
        week: cn('flex w-full mt-2', defaultClassNames.week),
        week_number_header: cn(
          'select-none w-[--cell-size]',
          defaultClassNames.week_number_header
        ),
        week_number: cn(
          'text-[0.8rem] select-none text-muted-foreground',
          defaultClassNames.week_number
        ),
        day: cn(
          'relative w-full h-full p-0 text-center [&:first-child[data-selected=true]_button]:rounded-l-md [&:last-child[data-selected=true]_button]:rounded-r-md group/day aspect-square select-none',
          defaultClassNames.day
        ),
        range_start: cn(
          'rounded-l-md bg-accent',
          defaultClassNames.range_start
        ),
        range_middle: cn('rounded-none', defaultClassNames.range_middle),
        range_end: cn('rounded-r-md bg-accent', defaultClassNames.range_end),
        today: cn(
          'bg-accent text-accent-foreground rounded-md data-[selected=true]:rounded-none',
          defaultClassNames.today
        ),
        outside: cn(
          'text-muted-foreground aria-selected:text-muted-foreground',
          defaultClassNames.outside
        ),
        disabled: cn(
          'text-muted-foreground opacity-50',
          defaultClassNames.disabled
        ),
        hidden: cn('invisible', defaultClassNames.hidden),
        ...classNames,
      }}
      components={{
        Root: ({ className, rootRef, ...props }) => {
          return (
            <div
              data-slot="calendar"
              ref={rootRef}
              className={cn(className)}
              {...props}
            />
          )
        },
        Chevron: ({ className, orientation, ...props }) => {
          if (orientation === 'left') {
            return (
              <ChevronLeftIcon className={cn('size-4', className)} {...props} />
            )
          }

          if (orientation === 'right') {
            return (
              <ChevronRightIcon
                className={cn('size-4', className)}
                {...props}
              />
            )
          }

          return (
            <ChevronDownIcon className={cn('size-4', className)} {...props} />
          )
        },
        DayButton: CalendarDayButton,
        WeekNumber: ({ children, ...props }) => {
          return (
            <td {...props}>
              <div className="flex size-[--cell-size] items-center justify-center text-center">
                {children}
              </div>
            </td>
          )
        },
        ...components,
      }}
      {...props}
    />
  )
}

function CalendarDayButton({
  className,
  day,
  modifiers,
  ...props
}: React.ComponentProps<typeof DayButton>) {
  const defaultClassNames = getDefaultClassNames()

  const ref = React.useRef<HTMLButtonElement>(null)
  React.useEffect(() => {
    if (modifiers.focused) ref.current?.focus()
  }, [modifiers.focused])

  return (
    <Button
      ref={ref}
      variant="ghost"
      size="icon"
      data-day={day.date.toLocaleDateString()}
      data-selected-single={
        modifiers.selected &&
        !modifiers.range_start &&
        !modifiers.range_end &&
        !modifiers.range_middle
      }
      data-range-start={modifiers.range_start}
      data-range-end={modifiers.range_end}
      data-range-middle={modifiers.range_middle}
      className={cn(
        'data-[selected-single=true]:bg-primary data-[selected-single=true]:text-primary-foreground data-[range-middle=true]:bg-accent data-[range-middle=true]:text-accent-foreground data-[range-start=true]:bg-primary data-[range-start=true]:text-primary-foreground data-[range-end=true]:bg-primary data-[range-end=true]:text-primary-foreground group-data-[focused=true]/day:border-ring group-data-[focused=true]/day:ring-ring/50 dark:hover:text-accent-foreground flex aspect-square w-full min-w-[--cell-size] flex-col gap-1 leading-none font-normal group-data-[focused=true]/day:relative group-data-[focused=true]/day:z-10 group-data-[focused=true]/day:ring-[3px] data-[range-end=true]:rounded-md data-[range-end=true]:rounded-r-md data-[range-middle=true]:rounded-none data-[range-start=true]:rounded-md data-[range-start=true]:rounded-l-md [&>span]:text-xs [&>span]:opacity-70',
        defaultClassNames.day,
        className
      )}
      {...props}
    />
  )
}

export { Calendar, CalendarDayButton }
```

## File: components/ui/card.tsx
```typescript
import * as React from "react"

import { cn } from "@/lib/utils"

const Card = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn(
      "rounded-lg border bg-card text-card-foreground shadow-sm",
      className
    )}
    {...props}
  />
))
Card.displayName = "Card"

const CardHeader = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex flex-col space-y-1.5 p-6", className)}
    {...props}
  />
))
CardHeader.displayName = "CardHeader"

const CardTitle = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn(
      "text-2xl font-semibold leading-none tracking-tight",
      className
    )}
    {...props}
  />
))
CardTitle.displayName = "CardTitle"

const CardDescription = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
))
CardDescription.displayName = "CardDescription"

const CardContent = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div ref={ref} className={cn("p-6 pt-0", className)} {...props} />
))
CardContent.displayName = "CardContent"

const CardFooter = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    className={cn("flex items-center p-6 pt-0", className)}
    {...props}
  />
))
CardFooter.displayName = "CardFooter"

export { Card, CardHeader, CardFooter, CardTitle, CardDescription, CardContent }
```

## File: components/ui/carousel.tsx
```typescript
"use client"

import * as React from "react"
import useEmblaCarousel, {
  type UseEmblaCarouselType,
} from "embla-carousel-react"
import { ArrowLeft, ArrowRight } from "lucide-react"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"

type CarouselApi = UseEmblaCarouselType[1]
type UseCarouselParameters = Parameters<typeof useEmblaCarousel>
type CarouselOptions = UseCarouselParameters[0]
type CarouselPlugin = UseCarouselParameters[1]

type CarouselProps = {
  opts?: CarouselOptions
  plugins?: CarouselPlugin
  orientation?: "horizontal" | "vertical"
  setApi?: (api: CarouselApi) => void
}

type CarouselContextProps = {
  carouselRef: ReturnType<typeof useEmblaCarousel>[0]
  api: ReturnType<typeof useEmblaCarousel>[1]
  scrollPrev: () => void
  scrollNext: () => void
  canScrollPrev: boolean
  canScrollNext: boolean
} & CarouselProps

const CarouselContext = React.createContext<CarouselContextProps | null>(null)

function useCarousel() {
  const context = React.useContext(CarouselContext)

  if (!context) {
    throw new Error("useCarousel must be used within a <Carousel />")
  }

  return context
}

const Carousel = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement> & CarouselProps
>(
  (
    {
      orientation = "horizontal",
      opts,
      setApi,
      plugins,
      className,
      children,
      ...props
    },
    ref
  ) => {
    const [carouselRef, api] = useEmblaCarousel(
      {
        ...opts,
        axis: orientation === "horizontal" ? "x" : "y",
      },
      plugins
    )
    const [canScrollPrev, setCanScrollPrev] = React.useState(false)
    const [canScrollNext, setCanScrollNext] = React.useState(false)

    const onSelect = React.useCallback((api: CarouselApi) => {
      if (!api) {
        return
      }

      setCanScrollPrev(api.canScrollPrev())
      setCanScrollNext(api.canScrollNext())
    }, [])

    const scrollPrev = React.useCallback(() => {
      api?.scrollPrev()
    }, [api])

    const scrollNext = React.useCallback(() => {
      api?.scrollNext()
    }, [api])

    const handleKeyDown = React.useCallback(
      (event: React.KeyboardEvent<HTMLDivElement>) => {
        if (event.key === "ArrowLeft") {
          event.preventDefault()
          scrollPrev()
        } else if (event.key === "ArrowRight") {
          event.preventDefault()
          scrollNext()
        }
      },
      [scrollPrev, scrollNext]
    )

    React.useEffect(() => {
      if (!api || !setApi) {
        return
      }

      setApi(api)
    }, [api, setApi])

    React.useEffect(() => {
      if (!api) {
        return
      }

      onSelect(api)
      api.on("reInit", onSelect)
      api.on("select", onSelect)

      return () => {
        api?.off("select", onSelect)
      }
    }, [api, onSelect])

    return (
      <CarouselContext.Provider
        value={{
          carouselRef,
          api: api,
          opts,
          orientation:
            orientation || (opts?.axis === "y" ? "vertical" : "horizontal"),
          scrollPrev,
          scrollNext,
          canScrollPrev,
          canScrollNext,
        }}
      >
        <div
          ref={ref}
          onKeyDownCapture={handleKeyDown}
          className={cn("relative", className)}
          role="region"
          aria-roledescription="carousel"
          {...props}
        >
          {children}
        </div>
      </CarouselContext.Provider>
    )
  }
)
Carousel.displayName = "Carousel"

const CarouselContent = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => {
  const { carouselRef, orientation } = useCarousel()

  return (
    <div ref={carouselRef} className="overflow-hidden">
      <div
        ref={ref}
        className={cn(
          "flex",
          orientation === "horizontal" ? "-ml-4" : "-mt-4 flex-col",
          className
        )}
        {...props}
      />
    </div>
  )
})
CarouselContent.displayName = "CarouselContent"

const CarouselItem = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => {
  const { orientation } = useCarousel()

  return (
    <div
      ref={ref}
      role="group"
      aria-roledescription="slide"
      className={cn(
        "min-w-0 shrink-0 grow-0 basis-full",
        orientation === "horizontal" ? "pl-4" : "pt-4",
        className
      )}
      {...props}
    />
  )
})
CarouselItem.displayName = "CarouselItem"

const CarouselPrevious = React.forwardRef<
  HTMLButtonElement,
  React.ComponentProps<typeof Button>
>(({ className, variant = "outline", size = "icon", ...props }, ref) => {
  const { orientation, scrollPrev, canScrollPrev } = useCarousel()

  return (
    <Button
      ref={ref}
      variant={variant}
      size={size}
      className={cn(
        "absolute  h-8 w-8 rounded-full",
        orientation === "horizontal"
          ? "-left-12 top-1/2 -translate-y-1/2"
          : "-top-12 left-1/2 -translate-x-1/2 rotate-90",
        className
      )}
      disabled={!canScrollPrev}
      onClick={scrollPrev}
      {...props}
    >
      <ArrowLeft className="h-4 w-4" />
      <span className="sr-only">Previous slide</span>
    </Button>
  )
})
CarouselPrevious.displayName = "CarouselPrevious"

const CarouselNext = React.forwardRef<
  HTMLButtonElement,
  React.ComponentProps<typeof Button>
>(({ className, variant = "outline", size = "icon", ...props }, ref) => {
  const { orientation, scrollNext, canScrollNext } = useCarousel()

  return (
    <Button
      ref={ref}
      variant={variant}
      size={size}
      className={cn(
        "absolute h-8 w-8 rounded-full",
        orientation === "horizontal"
          ? "-right-12 top-1/2 -translate-y-1/2"
          : "-bottom-12 left-1/2 -translate-x-1/2 rotate-90",
        className
      )}
      disabled={!canScrollNext}
      onClick={scrollNext}
      {...props}
    >
      <ArrowRight className="h-4 w-4" />
      <span className="sr-only">Next slide</span>
    </Button>
  )
})
CarouselNext.displayName = "CarouselNext"

export {
  type CarouselApi,
  Carousel,
  CarouselContent,
  CarouselItem,
  CarouselPrevious,
  CarouselNext,
}
```

## File: components/ui/chart.tsx
```typescript
"use client"

import * as React from "react"
import * as RechartsPrimitive from "recharts"

import { cn } from "@/lib/utils"

// Format: { THEME_NAME: CSS_SELECTOR }
const THEMES = { light: "", dark: ".dark" } as const

export type ChartConfig = {
  [k in string]: {
    label?: React.ReactNode
    icon?: React.ComponentType
  } & (
    | { color?: string; theme?: never }
    | { color?: never; theme: Record<keyof typeof THEMES, string> }
  )
}

type ChartContextProps = {
  config: ChartConfig
}

const ChartContext = React.createContext<ChartContextProps | null>(null)

function useChart() {
  const context = React.useContext(ChartContext)

  if (!context) {
    throw new Error("useChart must be used within a <ChartContainer />")
  }

  return context
}

const ChartContainer = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & {
    config: ChartConfig
    children: React.ComponentProps<
      typeof RechartsPrimitive.ResponsiveContainer
    >["children"]
  }
>(({ id, className, children, config, ...props }, ref) => {
  const uniqueId = React.useId()
  const chartId = `chart-${id || uniqueId.replace(/:/g, "")}`

  return (
    <ChartContext.Provider value={{ config }}>
      <div
        data-chart={chartId}
        ref={ref}
        className={cn(
          "flex aspect-video justify-center text-xs [&_.recharts-cartesian-axis-tick_text]:fill-muted-foreground [&_.recharts-cartesian-grid_line[stroke='#ccc']]:stroke-border/50 [&_.recharts-curve.recharts-tooltip-cursor]:stroke-border [&_.recharts-dot[stroke='#fff']]:stroke-transparent [&_.recharts-layer]:outline-none [&_.recharts-polar-grid_[stroke='#ccc']]:stroke-border [&_.recharts-radial-bar-background-sector]:fill-muted [&_.recharts-rectangle.recharts-tooltip-cursor]:fill-muted [&_.recharts-reference-line_[stroke='#ccc']]:stroke-border [&_.recharts-sector[stroke='#fff']]:stroke-transparent [&_.recharts-sector]:outline-none [&_.recharts-surface]:outline-none",
          className
        )}
        {...props}
      >
        <ChartStyle id={chartId} config={config} />
        <RechartsPrimitive.ResponsiveContainer>
          {children}
        </RechartsPrimitive.ResponsiveContainer>
      </div>
    </ChartContext.Provider>
  )
})
ChartContainer.displayName = "Chart"

const ChartStyle = ({ id, config }: { id: string; config: ChartConfig }) => {
  const colorConfig = Object.entries(config).filter(
    ([_, config]) => config.theme || config.color
  )

  if (!colorConfig.length) {
    return null
  }

  return (
    <style
      dangerouslySetInnerHTML={{
        __html: Object.entries(THEMES)
          .map(
            ([theme, prefix]) => `
${prefix} [data-chart=${id}] {
${colorConfig
  .map(([key, itemConfig]) => {
    const color =
      itemConfig.theme?.[theme as keyof typeof itemConfig.theme] ||
      itemConfig.color
    return color ? `  --color-${key}: ${color};` : null
  })
  .join("\n")}
}
`
          )
          .join("\n"),
      }}
    />
  )
}

const ChartTooltip = RechartsPrimitive.Tooltip

const ChartTooltipContent = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<typeof RechartsPrimitive.Tooltip> &
    React.ComponentProps<"div"> & {
      hideLabel?: boolean
      hideIndicator?: boolean
      indicator?: "line" | "dot" | "dashed"
      nameKey?: string
      labelKey?: string
    }
>(
  (
    {
      active,
      payload,
      className,
      indicator = "dot",
      hideLabel = false,
      hideIndicator = false,
      label,
      labelFormatter,
      labelClassName,
      formatter,
      color,
      nameKey,
      labelKey,
    },
    ref
  ) => {
    const { config } = useChart()

    const tooltipLabel = React.useMemo(() => {
      if (hideLabel || !payload?.length) {
        return null
      }

      const [item] = payload
      const key = `${labelKey || item.dataKey || item.name || "value"}`
      const itemConfig = getPayloadConfigFromPayload(config, item, key)
      const value =
        !labelKey && typeof label === "string"
          ? config[label as keyof typeof config]?.label || label
          : itemConfig?.label

      if (labelFormatter) {
        return (
          <div className={cn("font-medium", labelClassName)}>
            {labelFormatter(value, payload)}
          </div>
        )
      }

      if (!value) {
        return null
      }

      return <div className={cn("font-medium", labelClassName)}>{value}</div>
    }, [
      label,
      labelFormatter,
      payload,
      hideLabel,
      labelClassName,
      config,
      labelKey,
    ])

    if (!active || !payload?.length) {
      return null
    }

    const nestLabel = payload.length === 1 && indicator !== "dot"

    return (
      <div
        ref={ref}
        className={cn(
          "grid min-w-[8rem] items-start gap-1.5 rounded-lg border border-border/50 bg-background px-2.5 py-1.5 text-xs shadow-xl",
          className
        )}
      >
        {!nestLabel ? tooltipLabel : null}
        <div className="grid gap-1.5">
          {payload.map((item, index) => {
            const key = `${nameKey || item.name || item.dataKey || "value"}`
            const itemConfig = getPayloadConfigFromPayload(config, item, key)
            const indicatorColor = color || item.payload.fill || item.color

            return (
              <div
                key={item.dataKey}
                className={cn(
                  "flex w-full flex-wrap items-stretch gap-2 [&>svg]:h-2.5 [&>svg]:w-2.5 [&>svg]:text-muted-foreground",
                  indicator === "dot" && "items-center"
                )}
              >
                {formatter && item?.value !== undefined && item.name ? (
                  formatter(item.value, item.name, item, index, item.payload)
                ) : (
                  <>
                    {itemConfig?.icon ? (
                      <itemConfig.icon />
                    ) : (
                      !hideIndicator && (
                        <div
                          className={cn(
                            "shrink-0 rounded-[2px] border-[--color-border] bg-[--color-bg]",
                            {
                              "h-2.5 w-2.5": indicator === "dot",
                              "w-1": indicator === "line",
                              "w-0 border-[1.5px] border-dashed bg-transparent":
                                indicator === "dashed",
                              "my-0.5": nestLabel && indicator === "dashed",
                            }
                          )}
                          style={
                            {
                              "--color-bg": indicatorColor,
                              "--color-border": indicatorColor,
                            } as React.CSSProperties
                          }
                        />
                      )
                    )}
                    <div
                      className={cn(
                        "flex flex-1 justify-between leading-none",
                        nestLabel ? "items-end" : "items-center"
                      )}
                    >
                      <div className="grid gap-1.5">
                        {nestLabel ? tooltipLabel : null}
                        <span className="text-muted-foreground">
                          {itemConfig?.label || item.name}
                        </span>
                      </div>
                      {item.value && (
                        <span className="font-mono font-medium tabular-nums text-foreground">
                          {item.value.toLocaleString()}
                        </span>
                      )}
                    </div>
                  </>
                )}
              </div>
            )
          })}
        </div>
      </div>
    )
  }
)
ChartTooltipContent.displayName = "ChartTooltip"

const ChartLegend = RechartsPrimitive.Legend

const ChartLegendContent = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> &
    Pick<RechartsPrimitive.LegendProps, "payload" | "verticalAlign"> & {
      hideIcon?: boolean
      nameKey?: string
    }
>(
  (
    { className, hideIcon = false, payload, verticalAlign = "bottom", nameKey },
    ref
  ) => {
    const { config } = useChart()

    if (!payload?.length) {
      return null
    }

    return (
      <div
        ref={ref}
        className={cn(
          "flex items-center justify-center gap-4",
          verticalAlign === "top" ? "pb-3" : "pt-3",
          className
        )}
      >
        {payload.map((item) => {
          const key = `${nameKey || item.dataKey || "value"}`
          const itemConfig = getPayloadConfigFromPayload(config, item, key)

          return (
            <div
              key={item.value}
              className={cn(
                "flex items-center gap-1.5 [&>svg]:h-3 [&>svg]:w-3 [&>svg]:text-muted-foreground"
              )}
            >
              {itemConfig?.icon && !hideIcon ? (
                <itemConfig.icon />
              ) : (
                <div
                  className="h-2 w-2 shrink-0 rounded-[2px]"
                  style={{
                    backgroundColor: item.color,
                  }}
                />
              )}
              {itemConfig?.label}
            </div>
          )
        })}
      </div>
    )
  }
)
ChartLegendContent.displayName = "ChartLegend"

// Helper to extract item config from a payload.
function getPayloadConfigFromPayload(
  config: ChartConfig,
  payload: unknown,
  key: string
) {
  if (typeof payload !== "object" || payload === null) {
    return undefined
  }

  const payloadPayload =
    "payload" in payload &&
    typeof payload.payload === "object" &&
    payload.payload !== null
      ? payload.payload
      : undefined

  let configLabelKey: string = key

  if (
    key in payload &&
    typeof payload[key as keyof typeof payload] === "string"
  ) {
    configLabelKey = payload[key as keyof typeof payload] as string
  } else if (
    payloadPayload &&
    key in payloadPayload &&
    typeof payloadPayload[key as keyof typeof payloadPayload] === "string"
  ) {
    configLabelKey = payloadPayload[
      key as keyof typeof payloadPayload
    ] as string
  }

  return configLabelKey in config
    ? config[configLabelKey]
    : config[key as keyof typeof config]
}

export {
  ChartContainer,
  ChartTooltip,
  ChartTooltipContent,
  ChartLegend,
  ChartLegendContent,
  ChartStyle,
}
```

## File: components/ui/checkbox.tsx
```typescript
"use client"

import * as React from "react"
import * as CheckboxPrimitive from "@radix-ui/react-checkbox"
import { Check } from "lucide-react"

import { cn } from "@/lib/utils"

const Checkbox = React.forwardRef<
  React.ElementRef<typeof CheckboxPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof CheckboxPrimitive.Root>
>(({ className, ...props }, ref) => (
  <CheckboxPrimitive.Root
    ref={ref}
    className={cn(
      "peer h-4 w-4 shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground",
      className
    )}
    {...props}
  >
    <CheckboxPrimitive.Indicator
      className={cn("flex items-center justify-center text-current")}
    >
      <Check className="h-4 w-4" />
    </CheckboxPrimitive.Indicator>
  </CheckboxPrimitive.Root>
))
Checkbox.displayName = CheckboxPrimitive.Root.displayName

export { Checkbox }
```

## File: components/ui/collapsible.tsx
```typescript
"use client"

import * as CollapsiblePrimitive from "@radix-ui/react-collapsible"

const Collapsible = CollapsiblePrimitive.Root

const CollapsibleTrigger = CollapsiblePrimitive.CollapsibleTrigger

const CollapsibleContent = CollapsiblePrimitive.CollapsibleContent

export { Collapsible, CollapsibleTrigger, CollapsibleContent }
```

## File: components/ui/command.tsx
```typescript
"use client"

import * as React from "react"
import { type DialogProps } from "@radix-ui/react-dialog"
import { Command as CommandPrimitive } from "cmdk"
import { Search } from "lucide-react"

import { cn } from "@/lib/utils"
import { Dialog, DialogContent } from "@/components/ui/dialog"

const Command = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive>
>(({ className, ...props }, ref) => (
  <CommandPrimitive
    ref={ref}
    className={cn(
      "flex h-full w-full flex-col overflow-hidden rounded-md bg-popover text-popover-foreground",
      className
    )}
    {...props}
  />
))
Command.displayName = CommandPrimitive.displayName

const CommandDialog = ({ children, ...props }: DialogProps) => {
  return (
    <Dialog {...props}>
      <DialogContent className="overflow-hidden p-0 shadow-lg">
        <Command className="[&_[cmdk-group-heading]]:px-2 [&_[cmdk-group-heading]]:font-medium [&_[cmdk-group-heading]]:text-muted-foreground [&_[cmdk-group]:not([hidden])_~[cmdk-group]]:pt-0 [&_[cmdk-group]]:px-2 [&_[cmdk-input-wrapper]_svg]:h-5 [&_[cmdk-input-wrapper]_svg]:w-5 [&_[cmdk-input]]:h-12 [&_[cmdk-item]]:px-2 [&_[cmdk-item]]:py-3 [&_[cmdk-item]_svg]:h-5 [&_[cmdk-item]_svg]:w-5">
          {children}
        </Command>
      </DialogContent>
    </Dialog>
  )
}

const CommandInput = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive.Input>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive.Input>
>(({ className, ...props }, ref) => (
  <div className="flex items-center border-b px-3" cmdk-input-wrapper="">
    <Search className="mr-2 h-4 w-4 shrink-0 opacity-50" />
    <CommandPrimitive.Input
      ref={ref}
      className={cn(
        "flex h-11 w-full rounded-md bg-transparent py-3 text-sm outline-none placeholder:text-muted-foreground disabled:cursor-not-allowed disabled:opacity-50",
        className
      )}
      {...props}
    />
  </div>
))

CommandInput.displayName = CommandPrimitive.Input.displayName

const CommandList = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive.List>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive.List>
>(({ className, ...props }, ref) => (
  <CommandPrimitive.List
    ref={ref}
    className={cn("max-h-[300px] overflow-y-auto overflow-x-hidden", className)}
    {...props}
  />
))

CommandList.displayName = CommandPrimitive.List.displayName

const CommandEmpty = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive.Empty>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive.Empty>
>((props, ref) => (
  <CommandPrimitive.Empty
    ref={ref}
    className="py-6 text-center text-sm"
    {...props}
  />
))

CommandEmpty.displayName = CommandPrimitive.Empty.displayName

const CommandGroup = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive.Group>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive.Group>
>(({ className, ...props }, ref) => (
  <CommandPrimitive.Group
    ref={ref}
    className={cn(
      "overflow-hidden p-1 text-foreground [&_[cmdk-group-heading]]:px-2 [&_[cmdk-group-heading]]:py-1.5 [&_[cmdk-group-heading]]:text-xs [&_[cmdk-group-heading]]:font-medium [&_[cmdk-group-heading]]:text-muted-foreground",
      className
    )}
    {...props}
  />
))

CommandGroup.displayName = CommandPrimitive.Group.displayName

const CommandSeparator = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive.Separator>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive.Separator>
>(({ className, ...props }, ref) => (
  <CommandPrimitive.Separator
    ref={ref}
    className={cn("-mx-1 h-px bg-border", className)}
    {...props}
  />
))
CommandSeparator.displayName = CommandPrimitive.Separator.displayName

const CommandItem = React.forwardRef<
  React.ElementRef<typeof CommandPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof CommandPrimitive.Item>
>(({ className, ...props }, ref) => (
  <CommandPrimitive.Item
    ref={ref}
    className={cn(
      "relative flex cursor-default gap-2 select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none data-[disabled=true]:pointer-events-none data-[selected='true']:bg-accent data-[selected=true]:text-accent-foreground data-[disabled=true]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0",
      className
    )}
    {...props}
  />
))

CommandItem.displayName = CommandPrimitive.Item.displayName

const CommandShortcut = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLSpanElement>) => {
  return (
    <span
      className={cn(
        "ml-auto text-xs tracking-widest text-muted-foreground",
        className
      )}
      {...props}
    />
  )
}
CommandShortcut.displayName = "CommandShortcut"

export {
  Command,
  CommandDialog,
  CommandInput,
  CommandList,
  CommandEmpty,
  CommandGroup,
  CommandItem,
  CommandShortcut,
  CommandSeparator,
}
```

## File: components/ui/context-menu.tsx
```typescript
"use client"

import * as React from "react"
import * as ContextMenuPrimitive from "@radix-ui/react-context-menu"
import { Check, ChevronRight, Circle } from "lucide-react"

import { cn } from "@/lib/utils"

const ContextMenu = ContextMenuPrimitive.Root

const ContextMenuTrigger = ContextMenuPrimitive.Trigger

const ContextMenuGroup = ContextMenuPrimitive.Group

const ContextMenuPortal = ContextMenuPrimitive.Portal

const ContextMenuSub = ContextMenuPrimitive.Sub

const ContextMenuRadioGroup = ContextMenuPrimitive.RadioGroup

const ContextMenuSubTrigger = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.SubTrigger>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.SubTrigger> & {
    inset?: boolean
  }
>(({ className, inset, children, ...props }, ref) => (
  <ContextMenuPrimitive.SubTrigger
    ref={ref}
    className={cn(
      "flex cursor-default select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground",
      inset && "pl-8",
      className
    )}
    {...props}
  >
    {children}
    <ChevronRight className="ml-auto h-4 w-4" />
  </ContextMenuPrimitive.SubTrigger>
))
ContextMenuSubTrigger.displayName = ContextMenuPrimitive.SubTrigger.displayName

const ContextMenuSubContent = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.SubContent>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.SubContent>
>(({ className, ...props }, ref) => (
  <ContextMenuPrimitive.SubContent
    ref={ref}
    className={cn(
      "z-50 min-w-[8rem] overflow-hidden rounded-md border bg-popover p-1 text-popover-foreground shadow-md data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
      className
    )}
    {...props}
  />
))
ContextMenuSubContent.displayName = ContextMenuPrimitive.SubContent.displayName

const ContextMenuContent = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.Content>
>(({ className, ...props }, ref) => (
  <ContextMenuPrimitive.Portal>
    <ContextMenuPrimitive.Content
      ref={ref}
      className={cn(
        "z-50 min-w-[8rem] overflow-hidden rounded-md border bg-popover p-1 text-popover-foreground shadow-md animate-in fade-in-80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
        className
      )}
      {...props}
    />
  </ContextMenuPrimitive.Portal>
))
ContextMenuContent.displayName = ContextMenuPrimitive.Content.displayName

const ContextMenuItem = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.Item> & {
    inset?: boolean
  }
>(({ className, inset, ...props }, ref) => (
  <ContextMenuPrimitive.Item
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      inset && "pl-8",
      className
    )}
    {...props}
  />
))
ContextMenuItem.displayName = ContextMenuPrimitive.Item.displayName

const ContextMenuCheckboxItem = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.CheckboxItem>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.CheckboxItem>
>(({ className, children, checked, ...props }, ref) => (
  <ContextMenuPrimitive.CheckboxItem
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    checked={checked}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <ContextMenuPrimitive.ItemIndicator>
        <Check className="h-4 w-4" />
      </ContextMenuPrimitive.ItemIndicator>
    </span>
    {children}
  </ContextMenuPrimitive.CheckboxItem>
))
ContextMenuCheckboxItem.displayName =
  ContextMenuPrimitive.CheckboxItem.displayName

const ContextMenuRadioItem = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.RadioItem>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.RadioItem>
>(({ className, children, ...props }, ref) => (
  <ContextMenuPrimitive.RadioItem
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <ContextMenuPrimitive.ItemIndicator>
        <Circle className="h-2 w-2 fill-current" />
      </ContextMenuPrimitive.ItemIndicator>
    </span>
    {children}
  </ContextMenuPrimitive.RadioItem>
))
ContextMenuRadioItem.displayName = ContextMenuPrimitive.RadioItem.displayName

const ContextMenuLabel = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.Label>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.Label> & {
    inset?: boolean
  }
>(({ className, inset, ...props }, ref) => (
  <ContextMenuPrimitive.Label
    ref={ref}
    className={cn(
      "px-2 py-1.5 text-sm font-semibold text-foreground",
      inset && "pl-8",
      className
    )}
    {...props}
  />
))
ContextMenuLabel.displayName = ContextMenuPrimitive.Label.displayName

const ContextMenuSeparator = React.forwardRef<
  React.ElementRef<typeof ContextMenuPrimitive.Separator>,
  React.ComponentPropsWithoutRef<typeof ContextMenuPrimitive.Separator>
>(({ className, ...props }, ref) => (
  <ContextMenuPrimitive.Separator
    ref={ref}
    className={cn("-mx-1 my-1 h-px bg-border", className)}
    {...props}
  />
))
ContextMenuSeparator.displayName = ContextMenuPrimitive.Separator.displayName

const ContextMenuShortcut = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLSpanElement>) => {
  return (
    <span
      className={cn(
        "ml-auto text-xs tracking-widest text-muted-foreground",
        className
      )}
      {...props}
    />
  )
}
ContextMenuShortcut.displayName = "ContextMenuShortcut"

export {
  ContextMenu,
  ContextMenuTrigger,
  ContextMenuContent,
  ContextMenuItem,
  ContextMenuCheckboxItem,
  ContextMenuRadioItem,
  ContextMenuLabel,
  ContextMenuSeparator,
  ContextMenuShortcut,
  ContextMenuGroup,
  ContextMenuPortal,
  ContextMenuSub,
  ContextMenuSubContent,
  ContextMenuSubTrigger,
  ContextMenuRadioGroup,
}
```

## File: components/ui/dialog.tsx
```typescript
"use client"

import * as React from "react"
import * as DialogPrimitive from "@radix-ui/react-dialog"
import { X } from "lucide-react"

import { cn } from "@/lib/utils"

const Dialog = DialogPrimitive.Root

const DialogTrigger = DialogPrimitive.Trigger

const DialogPortal = DialogPrimitive.Portal

const DialogClose = DialogPrimitive.Close

const DialogOverlay = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <DialogPrimitive.Overlay
    ref={ref}
    className={cn(
      "fixed inset-0 z-50 bg-black/80  data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0",
      className
    )}
    {...props}
  />
))
DialogOverlay.displayName = DialogPrimitive.Overlay.displayName

const DialogContent = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Content>
>(({ className, children, ...props }, ref) => (
  <DialogPortal>
    <DialogOverlay />
    <DialogPrimitive.Content
      ref={ref}
      className={cn(
        "fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg",
        className
      )}
      {...props}
    >
      {children}
      <DialogPrimitive.Close className="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">
        <X className="h-4 w-4" />
        <span className="sr-only">Close</span>
      </DialogPrimitive.Close>
    </DialogPrimitive.Content>
  </DialogPortal>
))
DialogContent.displayName = DialogPrimitive.Content.displayName

const DialogHeader = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn(
      "flex flex-col space-y-1.5 text-center sm:text-left",
      className
    )}
    {...props}
  />
)
DialogHeader.displayName = "DialogHeader"

const DialogFooter = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn(
      "flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2",
      className
    )}
    {...props}
  />
)
DialogFooter.displayName = "DialogFooter"

const DialogTitle = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Title>
>(({ className, ...props }, ref) => (
  <DialogPrimitive.Title
    ref={ref}
    className={cn(
      "text-lg font-semibold leading-none tracking-tight",
      className
    )}
    {...props}
  />
))
DialogTitle.displayName = DialogPrimitive.Title.displayName

const DialogDescription = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Description>
>(({ className, ...props }, ref) => (
  <DialogPrimitive.Description
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
))
DialogDescription.displayName = DialogPrimitive.Description.displayName

export {
  Dialog,
  DialogPortal,
  DialogOverlay,
  DialogClose,
  DialogTrigger,
  DialogContent,
  DialogHeader,
  DialogFooter,
  DialogTitle,
  DialogDescription,
}
```

## File: components/ui/drawer.tsx
```typescript
"use client"

import * as React from "react"
import { Drawer as DrawerPrimitive } from "vaul"

import { cn } from "@/lib/utils"

const Drawer = ({
  shouldScaleBackground = true,
  ...props
}: React.ComponentProps<typeof DrawerPrimitive.Root>) => (
  <DrawerPrimitive.Root
    shouldScaleBackground={shouldScaleBackground}
    {...props}
  />
)
Drawer.displayName = "Drawer"

const DrawerTrigger = DrawerPrimitive.Trigger

const DrawerPortal = DrawerPrimitive.Portal

const DrawerClose = DrawerPrimitive.Close

const DrawerOverlay = React.forwardRef<
  React.ElementRef<typeof DrawerPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof DrawerPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <DrawerPrimitive.Overlay
    ref={ref}
    className={cn("fixed inset-0 z-50 bg-black/80", className)}
    {...props}
  />
))
DrawerOverlay.displayName = DrawerPrimitive.Overlay.displayName

const DrawerContent = React.forwardRef<
  React.ElementRef<typeof DrawerPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof DrawerPrimitive.Content>
>(({ className, children, ...props }, ref) => (
  <DrawerPortal>
    <DrawerOverlay />
    <DrawerPrimitive.Content
      ref={ref}
      className={cn(
        "fixed inset-x-0 bottom-0 z-50 mt-24 flex h-auto flex-col rounded-t-[10px] border bg-background",
        className
      )}
      {...props}
    >
      <div className="mx-auto mt-4 h-2 w-[100px] rounded-full bg-muted" />
      {children}
    </DrawerPrimitive.Content>
  </DrawerPortal>
))
DrawerContent.displayName = "DrawerContent"

const DrawerHeader = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn("grid gap-1.5 p-4 text-center sm:text-left", className)}
    {...props}
  />
)
DrawerHeader.displayName = "DrawerHeader"

const DrawerFooter = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn("mt-auto flex flex-col gap-2 p-4", className)}
    {...props}
  />
)
DrawerFooter.displayName = "DrawerFooter"

const DrawerTitle = React.forwardRef<
  React.ElementRef<typeof DrawerPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof DrawerPrimitive.Title>
>(({ className, ...props }, ref) => (
  <DrawerPrimitive.Title
    ref={ref}
    className={cn(
      "text-lg font-semibold leading-none tracking-tight",
      className
    )}
    {...props}
  />
))
DrawerTitle.displayName = DrawerPrimitive.Title.displayName

const DrawerDescription = React.forwardRef<
  React.ElementRef<typeof DrawerPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof DrawerPrimitive.Description>
>(({ className, ...props }, ref) => (
  <DrawerPrimitive.Description
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
))
DrawerDescription.displayName = DrawerPrimitive.Description.displayName

export {
  Drawer,
  DrawerPortal,
  DrawerOverlay,
  DrawerTrigger,
  DrawerClose,
  DrawerContent,
  DrawerHeader,
  DrawerFooter,
  DrawerTitle,
  DrawerDescription,
}
```

## File: components/ui/dropdown-menu.tsx
```typescript
"use client"

import * as React from "react"
import * as DropdownMenuPrimitive from "@radix-ui/react-dropdown-menu"
import { Check, ChevronRight, Circle } from "lucide-react"

import { cn } from "@/lib/utils"

const DropdownMenu = DropdownMenuPrimitive.Root

const DropdownMenuTrigger = DropdownMenuPrimitive.Trigger

const DropdownMenuGroup = DropdownMenuPrimitive.Group

const DropdownMenuPortal = DropdownMenuPrimitive.Portal

const DropdownMenuSub = DropdownMenuPrimitive.Sub

const DropdownMenuRadioGroup = DropdownMenuPrimitive.RadioGroup

const DropdownMenuSubTrigger = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.SubTrigger>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.SubTrigger> & {
    inset?: boolean
  }
>(({ className, inset, children, ...props }, ref) => (
  <DropdownMenuPrimitive.SubTrigger
    ref={ref}
    className={cn(
      "flex cursor-default gap-2 select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none focus:bg-accent data-[state=open]:bg-accent [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0",
      inset && "pl-8",
      className
    )}
    {...props}
  >
    {children}
    <ChevronRight className="ml-auto" />
  </DropdownMenuPrimitive.SubTrigger>
))
DropdownMenuSubTrigger.displayName =
  DropdownMenuPrimitive.SubTrigger.displayName

const DropdownMenuSubContent = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.SubContent>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.SubContent>
>(({ className, ...props }, ref) => (
  <DropdownMenuPrimitive.SubContent
    ref={ref}
    className={cn(
      "z-50 min-w-[8rem] overflow-hidden rounded-md border bg-popover p-1 text-popover-foreground shadow-lg data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
      className
    )}
    {...props}
  />
))
DropdownMenuSubContent.displayName =
  DropdownMenuPrimitive.SubContent.displayName

const DropdownMenuContent = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.Content>
>(({ className, sideOffset = 4, ...props }, ref) => (
  <DropdownMenuPrimitive.Portal>
    <DropdownMenuPrimitive.Content
      ref={ref}
      sideOffset={sideOffset}
      className={cn(
        "z-50 min-w-[8rem] overflow-hidden rounded-md border bg-popover p-1 text-popover-foreground shadow-md data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
        className
      )}
      {...props}
    />
  </DropdownMenuPrimitive.Portal>
))
DropdownMenuContent.displayName = DropdownMenuPrimitive.Content.displayName

const DropdownMenuItem = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.Item> & {
    inset?: boolean
  }
>(({ className, inset, ...props }, ref) => (
  <DropdownMenuPrimitive.Item
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-none transition-colors focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50 [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0",
      inset && "pl-8",
      className
    )}
    {...props}
  />
))
DropdownMenuItem.displayName = DropdownMenuPrimitive.Item.displayName

const DropdownMenuCheckboxItem = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.CheckboxItem>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.CheckboxItem>
>(({ className, children, checked, ...props }, ref) => (
  <DropdownMenuPrimitive.CheckboxItem
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none transition-colors focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    checked={checked}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <DropdownMenuPrimitive.ItemIndicator>
        <Check className="h-4 w-4" />
      </DropdownMenuPrimitive.ItemIndicator>
    </span>
    {children}
  </DropdownMenuPrimitive.CheckboxItem>
))
DropdownMenuCheckboxItem.displayName =
  DropdownMenuPrimitive.CheckboxItem.displayName

const DropdownMenuRadioItem = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.RadioItem>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.RadioItem>
>(({ className, children, ...props }, ref) => (
  <DropdownMenuPrimitive.RadioItem
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none transition-colors focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <DropdownMenuPrimitive.ItemIndicator>
        <Circle className="h-2 w-2 fill-current" />
      </DropdownMenuPrimitive.ItemIndicator>
    </span>
    {children}
  </DropdownMenuPrimitive.RadioItem>
))
DropdownMenuRadioItem.displayName = DropdownMenuPrimitive.RadioItem.displayName

const DropdownMenuLabel = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.Label>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.Label> & {
    inset?: boolean
  }
>(({ className, inset, ...props }, ref) => (
  <DropdownMenuPrimitive.Label
    ref={ref}
    className={cn(
      "px-2 py-1.5 text-sm font-semibold",
      inset && "pl-8",
      className
    )}
    {...props}
  />
))
DropdownMenuLabel.displayName = DropdownMenuPrimitive.Label.displayName

const DropdownMenuSeparator = React.forwardRef<
  React.ElementRef<typeof DropdownMenuPrimitive.Separator>,
  React.ComponentPropsWithoutRef<typeof DropdownMenuPrimitive.Separator>
>(({ className, ...props }, ref) => (
  <DropdownMenuPrimitive.Separator
    ref={ref}
    className={cn("-mx-1 my-1 h-px bg-muted", className)}
    {...props}
  />
))
DropdownMenuSeparator.displayName = DropdownMenuPrimitive.Separator.displayName

const DropdownMenuShortcut = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLSpanElement>) => {
  return (
    <span
      className={cn("ml-auto text-xs tracking-widest opacity-60", className)}
      {...props}
    />
  )
}
DropdownMenuShortcut.displayName = "DropdownMenuShortcut"

export {
  DropdownMenu,
  DropdownMenuTrigger,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuCheckboxItem,
  DropdownMenuRadioItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuShortcut,
  DropdownMenuGroup,
  DropdownMenuPortal,
  DropdownMenuSub,
  DropdownMenuSubContent,
  DropdownMenuSubTrigger,
  DropdownMenuRadioGroup,
}
```

## File: components/ui/form.tsx
```typescript
"use client"

import * as React from "react"
import * as LabelPrimitive from "@radix-ui/react-label"
import { Slot } from "@radix-ui/react-slot"
import {
  Controller,
  ControllerProps,
  FieldPath,
  FieldValues,
  FormProvider,
  useFormContext,
} from "react-hook-form"

import { cn } from "@/lib/utils"
import { Label } from "@/components/ui/label"

const Form = FormProvider

type FormFieldContextValue<
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>
> = {
  name: TName
}

const FormFieldContext = React.createContext<FormFieldContextValue>(
  {} as FormFieldContextValue
)

const FormField = <
  TFieldValues extends FieldValues = FieldValues,
  TName extends FieldPath<TFieldValues> = FieldPath<TFieldValues>
>({
  ...props
}: ControllerProps<TFieldValues, TName>) => {
  return (
    <FormFieldContext.Provider value={{ name: props.name }}>
      <Controller {...props} />
    </FormFieldContext.Provider>
  )
}

const useFormField = () => {
  const fieldContext = React.useContext(FormFieldContext)
  const itemContext = React.useContext(FormItemContext)
  const { getFieldState, formState } = useFormContext()

  const fieldState = getFieldState(fieldContext.name, formState)

  if (!fieldContext) {
    throw new Error("useFormField should be used within <FormField>")
  }

  const { id } = itemContext

  return {
    id,
    name: fieldContext.name,
    formItemId: `${id}-form-item`,
    formDescriptionId: `${id}-form-item-description`,
    formMessageId: `${id}-form-item-message`,
    ...fieldState,
  }
}

type FormItemContextValue = {
  id: string
}

const FormItemContext = React.createContext<FormItemContextValue>(
  {} as FormItemContextValue
)

const FormItem = React.forwardRef<
  HTMLDivElement,
  React.HTMLAttributes<HTMLDivElement>
>(({ className, ...props }, ref) => {
  const id = React.useId()

  return (
    <FormItemContext.Provider value={{ id }}>
      <div ref={ref} className={cn("space-y-2", className)} {...props} />
    </FormItemContext.Provider>
  )
})
FormItem.displayName = "FormItem"

const FormLabel = React.forwardRef<
  React.ElementRef<typeof LabelPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof LabelPrimitive.Root>
>(({ className, ...props }, ref) => {
  const { error, formItemId } = useFormField()

  return (
    <Label
      ref={ref}
      className={cn(error && "text-destructive", className)}
      htmlFor={formItemId}
      {...props}
    />
  )
})
FormLabel.displayName = "FormLabel"

const FormControl = React.forwardRef<
  React.ElementRef<typeof Slot>,
  React.ComponentPropsWithoutRef<typeof Slot>
>(({ ...props }, ref) => {
  const { error, formItemId, formDescriptionId, formMessageId } = useFormField()

  return (
    <Slot
      ref={ref}
      id={formItemId}
      aria-describedby={
        !error
          ? `${formDescriptionId}`
          : `${formDescriptionId} ${formMessageId}`
      }
      aria-invalid={!!error}
      {...props}
    />
  )
})
FormControl.displayName = "FormControl"

const FormDescription = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, ...props }, ref) => {
  const { formDescriptionId } = useFormField()

  return (
    <p
      ref={ref}
      id={formDescriptionId}
      className={cn("text-sm text-muted-foreground", className)}
      {...props}
    />
  )
})
FormDescription.displayName = "FormDescription"

const FormMessage = React.forwardRef<
  HTMLParagraphElement,
  React.HTMLAttributes<HTMLParagraphElement>
>(({ className, children, ...props }, ref) => {
  const { error, formMessageId } = useFormField()
  const body = error ? String(error?.message) : children

  if (!body) {
    return null
  }

  return (
    <p
      ref={ref}
      id={formMessageId}
      className={cn("text-sm font-medium text-destructive", className)}
      {...props}
    >
      {body}
    </p>
  )
})
FormMessage.displayName = "FormMessage"

export {
  useFormField,
  Form,
  FormItem,
  FormLabel,
  FormControl,
  FormDescription,
  FormMessage,
  FormField,
}
```

## File: components/ui/hover-card.tsx
```typescript
"use client"

import * as React from "react"
import * as HoverCardPrimitive from "@radix-ui/react-hover-card"

import { cn } from "@/lib/utils"

const HoverCard = HoverCardPrimitive.Root

const HoverCardTrigger = HoverCardPrimitive.Trigger

const HoverCardContent = React.forwardRef<
  React.ElementRef<typeof HoverCardPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof HoverCardPrimitive.Content>
>(({ className, align = "center", sideOffset = 4, ...props }, ref) => (
  <HoverCardPrimitive.Content
    ref={ref}
    align={align}
    sideOffset={sideOffset}
    className={cn(
      "z-50 w-64 rounded-md border bg-popover p-4 text-popover-foreground shadow-md outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
      className
    )}
    {...props}
  />
))
HoverCardContent.displayName = HoverCardPrimitive.Content.displayName

export { HoverCard, HoverCardTrigger, HoverCardContent }
```

## File: components/ui/input-otp.tsx
```typescript
"use client"

import * as React from "react"
import { OTPInput, OTPInputContext } from "input-otp"
import { Dot } from "lucide-react"

import { cn } from "@/lib/utils"

const InputOTP = React.forwardRef<
  React.ElementRef<typeof OTPInput>,
  React.ComponentPropsWithoutRef<typeof OTPInput>
>(({ className, containerClassName, ...props }, ref) => (
  <OTPInput
    ref={ref}
    containerClassName={cn(
      "flex items-center gap-2 has-[:disabled]:opacity-50",
      containerClassName
    )}
    className={cn("disabled:cursor-not-allowed", className)}
    {...props}
  />
))
InputOTP.displayName = "InputOTP"

const InputOTPGroup = React.forwardRef<
  React.ElementRef<"div">,
  React.ComponentPropsWithoutRef<"div">
>(({ className, ...props }, ref) => (
  <div ref={ref} className={cn("flex items-center", className)} {...props} />
))
InputOTPGroup.displayName = "InputOTPGroup"

const InputOTPSlot = React.forwardRef<
  React.ElementRef<"div">,
  React.ComponentPropsWithoutRef<"div"> & { index: number }
>(({ index, className, ...props }, ref) => {
  const inputOTPContext = React.useContext(OTPInputContext)
  const { char, hasFakeCaret, isActive } = inputOTPContext.slots[index]

  return (
    <div
      ref={ref}
      className={cn(
        "relative flex h-10 w-10 items-center justify-center border-y border-r border-input text-sm transition-all first:rounded-l-md first:border-l last:rounded-r-md",
        isActive && "z-10 ring-2 ring-ring ring-offset-background",
        className
      )}
      {...props}
    >
      {char}
      {hasFakeCaret && (
        <div className="pointer-events-none absolute inset-0 flex items-center justify-center">
          <div className="h-4 w-px animate-caret-blink bg-foreground duration-1000" />
        </div>
      )}
    </div>
  )
})
InputOTPSlot.displayName = "InputOTPSlot"

const InputOTPSeparator = React.forwardRef<
  React.ElementRef<"div">,
  React.ComponentPropsWithoutRef<"div">
>(({ ...props }, ref) => (
  <div ref={ref} role="separator" {...props}>
    <Dot />
  </div>
))
InputOTPSeparator.displayName = "InputOTPSeparator"

export { InputOTP, InputOTPGroup, InputOTPSlot, InputOTPSeparator }
```

## File: components/ui/input.tsx
```typescript
import * as React from "react"

import { cn } from "@/lib/utils"

const Input = React.forwardRef<HTMLInputElement, React.ComponentProps<"input">>(
  ({ className, type, ...props }, ref) => {
    return (
      <input
        type={type}
        className={cn(
          "flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm text-gray-500",
          className
        )}
        ref={ref}
        {...props}
      />
    )
  }
)
Input.displayName = "Input"

export { Input }
```

## File: components/ui/label.tsx
```typescript
"use client"

import * as React from "react"
import * as LabelPrimitive from "@radix-ui/react-label"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const labelVariants = cva(
  "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
)

const Label = React.forwardRef<
  React.ElementRef<typeof LabelPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof LabelPrimitive.Root> &
    VariantProps<typeof labelVariants>
>(({ className, ...props }, ref) => (
  <LabelPrimitive.Root
    ref={ref}
    className={cn(labelVariants(), className)}
    {...props}
  />
))
Label.displayName = LabelPrimitive.Root.displayName

export { Label }
```

## File: components/ui/menubar.tsx
```typescript
"use client"

import * as React from "react"
import * as MenubarPrimitive from "@radix-ui/react-menubar"
import { Check, ChevronRight, Circle } from "lucide-react"

import { cn } from "@/lib/utils"

const MenubarMenu = MenubarPrimitive.Menu

const MenubarGroup = MenubarPrimitive.Group

const MenubarPortal = MenubarPrimitive.Portal

const MenubarSub = MenubarPrimitive.Sub

const MenubarRadioGroup = MenubarPrimitive.RadioGroup

const Menubar = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.Root>
>(({ className, ...props }, ref) => (
  <MenubarPrimitive.Root
    ref={ref}
    className={cn(
      "flex h-10 items-center space-x-1 rounded-md border bg-background p-1",
      className
    )}
    {...props}
  />
))
Menubar.displayName = MenubarPrimitive.Root.displayName

const MenubarTrigger = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.Trigger>
>(({ className, ...props }, ref) => (
  <MenubarPrimitive.Trigger
    ref={ref}
    className={cn(
      "flex cursor-default select-none items-center rounded-sm px-3 py-1.5 text-sm font-medium outline-none focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground",
      className
    )}
    {...props}
  />
))
MenubarTrigger.displayName = MenubarPrimitive.Trigger.displayName

const MenubarSubTrigger = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.SubTrigger>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.SubTrigger> & {
    inset?: boolean
  }
>(({ className, inset, children, ...props }, ref) => (
  <MenubarPrimitive.SubTrigger
    ref={ref}
    className={cn(
      "flex cursor-default select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground",
      inset && "pl-8",
      className
    )}
    {...props}
  >
    {children}
    <ChevronRight className="ml-auto h-4 w-4" />
  </MenubarPrimitive.SubTrigger>
))
MenubarSubTrigger.displayName = MenubarPrimitive.SubTrigger.displayName

const MenubarSubContent = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.SubContent>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.SubContent>
>(({ className, ...props }, ref) => (
  <MenubarPrimitive.SubContent
    ref={ref}
    className={cn(
      "z-50 min-w-[8rem] overflow-hidden rounded-md border bg-popover p-1 text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
      className
    )}
    {...props}
  />
))
MenubarSubContent.displayName = MenubarPrimitive.SubContent.displayName

const MenubarContent = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.Content>
>(
  (
    { className, align = "start", alignOffset = -4, sideOffset = 8, ...props },
    ref
  ) => (
    <MenubarPrimitive.Portal>
      <MenubarPrimitive.Content
        ref={ref}
        align={align}
        alignOffset={alignOffset}
        sideOffset={sideOffset}
        className={cn(
          "z-50 min-w-[12rem] overflow-hidden rounded-md border bg-popover p-1 text-popover-foreground shadow-md data-[state=open]:animate-in data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
          className
        )}
        {...props}
      />
    </MenubarPrimitive.Portal>
  )
)
MenubarContent.displayName = MenubarPrimitive.Content.displayName

const MenubarItem = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.Item> & {
    inset?: boolean
  }
>(({ className, inset, ...props }, ref) => (
  <MenubarPrimitive.Item
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      inset && "pl-8",
      className
    )}
    {...props}
  />
))
MenubarItem.displayName = MenubarPrimitive.Item.displayName

const MenubarCheckboxItem = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.CheckboxItem>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.CheckboxItem>
>(({ className, children, checked, ...props }, ref) => (
  <MenubarPrimitive.CheckboxItem
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    checked={checked}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <MenubarPrimitive.ItemIndicator>
        <Check className="h-4 w-4" />
      </MenubarPrimitive.ItemIndicator>
    </span>
    {children}
  </MenubarPrimitive.CheckboxItem>
))
MenubarCheckboxItem.displayName = MenubarPrimitive.CheckboxItem.displayName

const MenubarRadioItem = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.RadioItem>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.RadioItem>
>(({ className, children, ...props }, ref) => (
  <MenubarPrimitive.RadioItem
    ref={ref}
    className={cn(
      "relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <MenubarPrimitive.ItemIndicator>
        <Circle className="h-2 w-2 fill-current" />
      </MenubarPrimitive.ItemIndicator>
    </span>
    {children}
  </MenubarPrimitive.RadioItem>
))
MenubarRadioItem.displayName = MenubarPrimitive.RadioItem.displayName

const MenubarLabel = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.Label>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.Label> & {
    inset?: boolean
  }
>(({ className, inset, ...props }, ref) => (
  <MenubarPrimitive.Label
    ref={ref}
    className={cn(
      "px-2 py-1.5 text-sm font-semibold",
      inset && "pl-8",
      className
    )}
    {...props}
  />
))
MenubarLabel.displayName = MenubarPrimitive.Label.displayName

const MenubarSeparator = React.forwardRef<
  React.ElementRef<typeof MenubarPrimitive.Separator>,
  React.ComponentPropsWithoutRef<typeof MenubarPrimitive.Separator>
>(({ className, ...props }, ref) => (
  <MenubarPrimitive.Separator
    ref={ref}
    className={cn("-mx-1 my-1 h-px bg-muted", className)}
    {...props}
  />
))
MenubarSeparator.displayName = MenubarPrimitive.Separator.displayName

const MenubarShortcut = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLSpanElement>) => {
  return (
    <span
      className={cn(
        "ml-auto text-xs tracking-widest text-muted-foreground",
        className
      )}
      {...props}
    />
  )
}
MenubarShortcut.displayname = "MenubarShortcut"

export {
  Menubar,
  MenubarMenu,
  MenubarTrigger,
  MenubarContent,
  MenubarItem,
  MenubarSeparator,
  MenubarLabel,
  MenubarCheckboxItem,
  MenubarRadioGroup,
  MenubarRadioItem,
  MenubarPortal,
  MenubarSubContent,
  MenubarSubTrigger,
  MenubarGroup,
  MenubarSub,
  MenubarShortcut,
}
```

## File: components/ui/navigation-menu.tsx
```typescript
import * as React from "react"
import * as NavigationMenuPrimitive from "@radix-ui/react-navigation-menu"
import { cva } from "class-variance-authority"
import { ChevronDown } from "lucide-react"

import { cn } from "@/lib/utils"

const NavigationMenu = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Root>
>(({ className, children, ...props }, ref) => (
  <NavigationMenuPrimitive.Root
    ref={ref}
    className={cn(
      "relative z-10 flex max-w-max flex-1 items-center justify-center",
      className
    )}
    {...props}
  >
    {children}
    <NavigationMenuViewport />
  </NavigationMenuPrimitive.Root>
))
NavigationMenu.displayName = NavigationMenuPrimitive.Root.displayName

const NavigationMenuList = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.List>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.List>
>(({ className, ...props }, ref) => (
  <NavigationMenuPrimitive.List
    ref={ref}
    className={cn(
      "group flex flex-1 list-none items-center justify-center space-x-1",
      className
    )}
    {...props}
  />
))
NavigationMenuList.displayName = NavigationMenuPrimitive.List.displayName

const NavigationMenuItem = NavigationMenuPrimitive.Item

const navigationMenuTriggerStyle = cva(
  "group inline-flex h-10 w-max items-center justify-center rounded-md bg-background px-4 py-2 text-sm font-medium transition-colors hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground focus:outline-none disabled:pointer-events-none disabled:opacity-50 data-[active]:bg-accent/50 data-[state=open]:bg-accent/50"
)

const NavigationMenuTrigger = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Trigger>
>(({ className, children, ...props }, ref) => (
  <NavigationMenuPrimitive.Trigger
    ref={ref}
    className={cn(navigationMenuTriggerStyle(), "group", className)}
    {...props}
  >
    {children}{" "}
    <ChevronDown
      className="relative top-[1px] ml-1 h-3 w-3 transition duration-200 group-data-[state=open]:rotate-180"
      aria-hidden="true"
    />
  </NavigationMenuPrimitive.Trigger>
))
NavigationMenuTrigger.displayName = NavigationMenuPrimitive.Trigger.displayName

const NavigationMenuContent = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Content>
>(({ className, ...props }, ref) => (
  <NavigationMenuPrimitive.Content
    ref={ref}
    className={cn(
      "left-0 top-0 w-full data-[motion^=from-]:animate-in data-[motion^=to-]:animate-out data-[motion^=from-]:fade-in data-[motion^=to-]:fade-out data-[motion=from-end]:slide-in-from-right-52 data-[motion=from-start]:slide-in-from-left-52 data-[motion=to-end]:slide-out-to-right-52 data-[motion=to-start]:slide-out-to-left-52 md:absolute md:w-auto ",
      className
    )}
    {...props}
  />
))
NavigationMenuContent.displayName = NavigationMenuPrimitive.Content.displayName

const NavigationMenuLink = NavigationMenuPrimitive.Link

const NavigationMenuViewport = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Viewport>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Viewport>
>(({ className, ...props }, ref) => (
  <div className={cn("absolute left-0 top-full flex justify-center")}>
    <NavigationMenuPrimitive.Viewport
      className={cn(
        "origin-top-center relative mt-1.5 h-[var(--radix-navigation-menu-viewport-height)] w-full overflow-hidden rounded-md border bg-popover text-popover-foreground shadow-lg data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-90 md:w-[var(--radix-navigation-menu-viewport-width)]",
        className
      )}
      ref={ref}
      {...props}
    />
  </div>
))
NavigationMenuViewport.displayName =
  NavigationMenuPrimitive.Viewport.displayName

const NavigationMenuIndicator = React.forwardRef<
  React.ElementRef<typeof NavigationMenuPrimitive.Indicator>,
  React.ComponentPropsWithoutRef<typeof NavigationMenuPrimitive.Indicator>
>(({ className, ...props }, ref) => (
  <NavigationMenuPrimitive.Indicator
    ref={ref}
    className={cn(
      "top-full z-[1] flex h-1.5 items-end justify-center overflow-hidden data-[state=visible]:animate-in data-[state=hidden]:animate-out data-[state=hidden]:fade-out data-[state=visible]:fade-in",
      className
    )}
    {...props}
  >
    <div className="relative top-[60%] h-2 w-2 rotate-45 rounded-tl-sm bg-border shadow-md" />
  </NavigationMenuPrimitive.Indicator>
))
NavigationMenuIndicator.displayName =
  NavigationMenuPrimitive.Indicator.displayName

export {
  navigationMenuTriggerStyle,
  NavigationMenu,
  NavigationMenuList,
  NavigationMenuItem,
  NavigationMenuContent,
  NavigationMenuTrigger,
  NavigationMenuLink,
  NavigationMenuIndicator,
  NavigationMenuViewport,
}
```

## File: components/ui/pagination.tsx
```typescript
import * as React from "react"
import { ChevronLeft, ChevronRight, MoreHorizontal } from "lucide-react"

import { cn } from "@/lib/utils"
import { ButtonProps, buttonVariants } from "@/components/ui/button"

const Pagination = ({ className, ...props }: React.ComponentProps<"nav">) => (
  <nav
    role="navigation"
    aria-label="pagination"
    className={cn("mx-auto flex w-full justify-center", className)}
    {...props}
  />
)
Pagination.displayName = "Pagination"

const PaginationContent = React.forwardRef<
  HTMLUListElement,
  React.ComponentProps<"ul">
>(({ className, ...props }, ref) => (
  <ul
    ref={ref}
    className={cn("flex flex-row items-center gap-1", className)}
    {...props}
  />
))
PaginationContent.displayName = "PaginationContent"

const PaginationItem = React.forwardRef<
  HTMLLIElement,
  React.ComponentProps<"li">
>(({ className, ...props }, ref) => (
  <li ref={ref} className={cn("", className)} {...props} />
))
PaginationItem.displayName = "PaginationItem"

type PaginationLinkProps = {
  isActive?: boolean
} & Pick<ButtonProps, "size"> &
  React.ComponentProps<"a">

const PaginationLink = ({
  className,
  isActive,
  size = "icon",
  ...props
}: PaginationLinkProps) => (
  <a
    aria-current={isActive ? "page" : undefined}
    className={cn(
      buttonVariants({
        variant: isActive ? "outline" : "ghost",
        size,
      }),
      className
    )}
    {...props}
  />
)
PaginationLink.displayName = "PaginationLink"

const PaginationPrevious = ({
  className,
  ...props
}: React.ComponentProps<typeof PaginationLink>) => (
  <PaginationLink
    aria-label="Go to previous page"
    size="default"
    className={cn("gap-1 pl-2.5", className)}
    {...props}
  >
    <ChevronLeft className="h-4 w-4" />
    <span>Previous</span>
  </PaginationLink>
)
PaginationPrevious.displayName = "PaginationPrevious"

const PaginationNext = ({
  className,
  ...props
}: React.ComponentProps<typeof PaginationLink>) => (
  <PaginationLink
    aria-label="Go to next page"
    size="default"
    className={cn("gap-1 pr-2.5", className)}
    {...props}
  >
    <span>Next</span>
    <ChevronRight className="h-4 w-4" />
  </PaginationLink>
)
PaginationNext.displayName = "PaginationNext"

const PaginationEllipsis = ({
  className,
  ...props
}: React.ComponentProps<"span">) => (
  <span
    aria-hidden
    className={cn("flex h-9 w-9 items-center justify-center", className)}
    {...props}
  >
    <MoreHorizontal className="h-4 w-4" />
    <span className="sr-only">More pages</span>
  </span>
)
PaginationEllipsis.displayName = "PaginationEllipsis"

export {
  Pagination,
  PaginationContent,
  PaginationEllipsis,
  PaginationItem,
  PaginationLink,
  PaginationNext,
  PaginationPrevious,
}
```

## File: components/ui/popover.tsx
```typescript
"use client"

import * as React from "react"
import * as PopoverPrimitive from "@radix-ui/react-popover"

import { cn } from "@/lib/utils"

const Popover = PopoverPrimitive.Root

const PopoverTrigger = PopoverPrimitive.Trigger

const PopoverContent = React.forwardRef<
  React.ElementRef<typeof PopoverPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof PopoverPrimitive.Content>
>(({ className, align = "center", sideOffset = 4, ...props }, ref) => (
  <PopoverPrimitive.Portal>
    <PopoverPrimitive.Content
      ref={ref}
      align={align}
      sideOffset={sideOffset}
      className={cn(
        "z-50 w-72 rounded-md border bg-popover p-4 text-popover-foreground shadow-md outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
        className
      )}
      {...props}
    />
  </PopoverPrimitive.Portal>
))
PopoverContent.displayName = PopoverPrimitive.Content.displayName

export { Popover, PopoverTrigger, PopoverContent }
```

## File: components/ui/progress.tsx
```typescript
"use client"

import * as React from "react"
import * as ProgressPrimitive from "@radix-ui/react-progress"

import { cn } from "@/lib/utils"

const Progress = React.forwardRef<
  React.ElementRef<typeof ProgressPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof ProgressPrimitive.Root>
>(({ className, value, ...props }, ref) => (
  <ProgressPrimitive.Root
    ref={ref}
    className={cn(
      "relative h-4 w-full overflow-hidden rounded-full bg-secondary",
      className
    )}
    {...props}
  >
    <ProgressPrimitive.Indicator
      className="h-full w-full flex-1 bg-primary transition-all"
      style={{ transform: `translateX(-${100 - (value || 0)}%)` }}
    />
  </ProgressPrimitive.Root>
))
Progress.displayName = ProgressPrimitive.Root.displayName

export { Progress }
```

## File: components/ui/radio-group.tsx
```typescript
"use client"

import * as React from "react"
import * as RadioGroupPrimitive from "@radix-ui/react-radio-group"
import { Circle } from "lucide-react"

import { cn } from "@/lib/utils"

const RadioGroup = React.forwardRef<
  React.ElementRef<typeof RadioGroupPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Root>
>(({ className, ...props }, ref) => {
  return (
    <RadioGroupPrimitive.Root
      className={cn("grid gap-2", className)}
      {...props}
      ref={ref}
    />
  )
})
RadioGroup.displayName = RadioGroupPrimitive.Root.displayName

const RadioGroupItem = React.forwardRef<
  React.ElementRef<typeof RadioGroupPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Item>
>(({ className, ...props }, ref) => {
  return (
    <RadioGroupPrimitive.Item
      ref={ref}
      className={cn(
        "aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
        className
      )}
      {...props}
    >
      <RadioGroupPrimitive.Indicator className="flex items-center justify-center">
        <Circle className="h-2.5 w-2.5 fill-current text-current" />
      </RadioGroupPrimitive.Indicator>
    </RadioGroupPrimitive.Item>
  )
})
RadioGroupItem.displayName = RadioGroupPrimitive.Item.displayName

export { RadioGroup, RadioGroupItem }
```

## File: components/ui/resizable.tsx
```typescript
"use client"

import { GripVertical } from "lucide-react"
import * as ResizablePrimitive from "react-resizable-panels"

import { cn } from "@/lib/utils"

const ResizablePanelGroup = ({
  className,
  ...props
}: React.ComponentProps<typeof ResizablePrimitive.PanelGroup>) => (
  <ResizablePrimitive.PanelGroup
    className={cn(
      "flex h-full w-full data-[panel-group-direction=vertical]:flex-col",
      className
    )}
    {...props}
  />
)

const ResizablePanel = ResizablePrimitive.Panel

const ResizableHandle = ({
  withHandle,
  className,
  ...props
}: React.ComponentProps<typeof ResizablePrimitive.PanelResizeHandle> & {
  withHandle?: boolean
}) => (
  <ResizablePrimitive.PanelResizeHandle
    className={cn(
      "relative flex w-px items-center justify-center bg-border after:absolute after:inset-y-0 after:left-1/2 after:w-1 after:-translate-x-1/2 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring focus-visible:ring-offset-1 data-[panel-group-direction=vertical]:h-px data-[panel-group-direction=vertical]:w-full data-[panel-group-direction=vertical]:after:left-0 data-[panel-group-direction=vertical]:after:h-1 data-[panel-group-direction=vertical]:after:w-full data-[panel-group-direction=vertical]:after:-translate-y-1/2 data-[panel-group-direction=vertical]:after:translate-x-0 [&[data-panel-group-direction=vertical]>div]:rotate-90",
      className
    )}
    {...props}
  >
    {withHandle && (
      <div className="z-10 flex h-4 w-3 items-center justify-center rounded-sm border bg-border">
        <GripVertical className="h-2.5 w-2.5" />
      </div>
    )}
  </ResizablePrimitive.PanelResizeHandle>
)

export { ResizablePanelGroup, ResizablePanel, ResizableHandle }
```

## File: components/ui/scroll-area.tsx
```typescript
"use client"

import * as React from "react"
import * as ScrollAreaPrimitive from "@radix-ui/react-scroll-area"

import { cn } from "@/lib/utils"

const ScrollArea = React.forwardRef<
  React.ElementRef<typeof ScrollAreaPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof ScrollAreaPrimitive.Root>
>(({ className, children, ...props }, ref) => (
  <ScrollAreaPrimitive.Root
    ref={ref}
    className={cn("relative overflow-hidden", className)}
    {...props}
  >
    <ScrollAreaPrimitive.Viewport className="h-full w-full rounded-[inherit]">
      {children}
    </ScrollAreaPrimitive.Viewport>
    <ScrollBar />
    <ScrollAreaPrimitive.Corner />
  </ScrollAreaPrimitive.Root>
))
ScrollArea.displayName = ScrollAreaPrimitive.Root.displayName

const ScrollBar = React.forwardRef<
  React.ElementRef<typeof ScrollAreaPrimitive.ScrollAreaScrollbar>,
  React.ComponentPropsWithoutRef<typeof ScrollAreaPrimitive.ScrollAreaScrollbar>
>(({ className, orientation = "vertical", ...props }, ref) => (
  <ScrollAreaPrimitive.ScrollAreaScrollbar
    ref={ref}
    orientation={orientation}
    className={cn(
      "flex touch-none select-none transition-colors",
      orientation === "vertical" &&
        "h-full w-2.5 border-l border-l-transparent p-[1px]",
      orientation === "horizontal" &&
        "h-2.5 flex-col border-t border-t-transparent p-[1px]",
      className
    )}
    {...props}
  >
    <ScrollAreaPrimitive.ScrollAreaThumb className="relative flex-1 rounded-full bg-border" />
  </ScrollAreaPrimitive.ScrollAreaScrollbar>
))
ScrollBar.displayName = ScrollAreaPrimitive.ScrollAreaScrollbar.displayName

export { ScrollArea, ScrollBar }
```

## File: components/ui/select.tsx
```typescript
"use client"

import * as React from "react"
import * as SelectPrimitive from "@radix-ui/react-select"
import { Check, ChevronDown, ChevronUp } from "lucide-react"

import { cn } from "@/lib/utils"

const Select = SelectPrimitive.Root

const SelectGroup = SelectPrimitive.Group

const SelectValue = SelectPrimitive.Value

const SelectTrigger = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Trigger>
>(({ className, children, ...props }, ref) => (
  <SelectPrimitive.Trigger
    ref={ref}
    className={cn(
      "flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&>span]:line-clamp-1 text-gray-500",
      className
    )}
    {...props}
  >
    {children}
    <SelectPrimitive.Icon asChild>
      <ChevronDown className="h-4 w-4 opacity-50" />
    </SelectPrimitive.Icon>
  </SelectPrimitive.Trigger>
))
SelectTrigger.displayName = SelectPrimitive.Trigger.displayName

const SelectScrollUpButton = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.ScrollUpButton>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.ScrollUpButton>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.ScrollUpButton
    ref={ref}
    className={cn(
      "flex cursor-default items-center justify-center py-1",
      className
    )}
    {...props}
  >
    <ChevronUp className="h-4 w-4" />
  </SelectPrimitive.ScrollUpButton>
))
SelectScrollUpButton.displayName = SelectPrimitive.ScrollUpButton.displayName

const SelectScrollDownButton = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.ScrollDownButton>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.ScrollDownButton>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.ScrollDownButton
    ref={ref}
    className={cn(
      "flex cursor-default items-center justify-center py-1",
      className
    )}
    {...props}
  >
    <ChevronDown className="h-4 w-4" />
  </SelectPrimitive.ScrollDownButton>
))
SelectScrollDownButton.displayName =
  SelectPrimitive.ScrollDownButton.displayName

const SelectContent = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Content>
>(({ className, children, position = "popper", ...props }, ref) => (
  <SelectPrimitive.Portal>
    <SelectPrimitive.Content
      ref={ref}
      className={cn(
        "relative z-50 max-h-96 min-w-[8rem] overflow-hidden rounded-md border bg-popover text-popover-foreground shadow-md data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
        position === "popper" &&
          "data-[side=bottom]:translate-y-1 data-[side=left]:-translate-x-1 data-[side=right]:translate-x-1 data-[side=top]:-translate-y-1",
        className
      )}
      position={position}
      {...props}
    >
      <SelectScrollUpButton />
      <SelectPrimitive.Viewport
        className={cn(
          "p-1",
          position === "popper" &&
            "h-[var(--radix-select-trigger-height)] w-full min-w-[var(--radix-select-trigger-width)]"
        )}
      >
        {children}
      </SelectPrimitive.Viewport>
      <SelectScrollDownButton />
    </SelectPrimitive.Content>
  </SelectPrimitive.Portal>
))
SelectContent.displayName = SelectPrimitive.Content.displayName

const SelectLabel = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Label>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Label>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.Label
    ref={ref}
    className={cn("py-1.5 pl-8 pr-2 text-sm font-semibold", className)}
    {...props}
  />
))
SelectLabel.displayName = SelectPrimitive.Label.displayName

const SelectItem = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Item>
>(({ className, children, ...props }, ref) => (
  <SelectPrimitive.Item
    ref={ref}
    className={cn(
      "relative flex w-full cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50",
      className
    )}
    {...props}
  >
    <span className="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
      <SelectPrimitive.ItemIndicator>
        <Check className="h-4 w-4" />
      </SelectPrimitive.ItemIndicator>
    </span>

    <SelectPrimitive.ItemText>{children}</SelectPrimitive.ItemText>
  </SelectPrimitive.Item>
))
SelectItem.displayName = SelectPrimitive.Item.displayName

const SelectSeparator = React.forwardRef<
  React.ElementRef<typeof SelectPrimitive.Separator>,
  React.ComponentPropsWithoutRef<typeof SelectPrimitive.Separator>
>(({ className, ...props }, ref) => (
  <SelectPrimitive.Separator
    ref={ref}
    className={cn("-mx-1 my-1 h-px bg-muted", className)}
    {...props}
  />
))
SelectSeparator.displayName = SelectPrimitive.Separator.displayName

export {
  Select,
  SelectGroup,
  SelectValue,
  SelectTrigger,
  SelectContent,
  SelectLabel,
  SelectItem,
  SelectSeparator,
  SelectScrollUpButton,
  SelectScrollDownButton,
}
```

## File: components/ui/separator.tsx
```typescript
"use client"

import * as React from "react"
import * as SeparatorPrimitive from "@radix-ui/react-separator"

import { cn } from "@/lib/utils"

const Separator = React.forwardRef<
  React.ElementRef<typeof SeparatorPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SeparatorPrimitive.Root>
>(
  (
    { className, orientation = "horizontal", decorative = true, ...props },
    ref
  ) => (
    <SeparatorPrimitive.Root
      ref={ref}
      decorative={decorative}
      orientation={orientation}
      className={cn(
        "shrink-0 bg-border",
        orientation === "horizontal" ? "h-[1px] w-full" : "h-full w-[1px]",
        className
      )}
      {...props}
    />
  )
)
Separator.displayName = SeparatorPrimitive.Root.displayName

export { Separator }
```

## File: components/ui/sheet.tsx
```typescript
"use client"

import * as React from "react"
import * as SheetPrimitive from "@radix-ui/react-dialog"
import { cva, type VariantProps } from "class-variance-authority"
import { X } from "lucide-react"

import { cn } from "@/lib/utils"

const Sheet = SheetPrimitive.Root

const SheetTrigger = SheetPrimitive.Trigger

const SheetClose = SheetPrimitive.Close

const SheetPortal = SheetPrimitive.Portal

const SheetOverlay = React.forwardRef<
  React.ElementRef<typeof SheetPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <SheetPrimitive.Overlay
    className={cn(
      "fixed inset-0 z-50 bg-black/80  data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0",
      className
    )}
    {...props}
    ref={ref}
  />
))
SheetOverlay.displayName = SheetPrimitive.Overlay.displayName

const sheetVariants = cva(
  "fixed z-50 gap-4 bg-background p-6 shadow-lg transition ease-in-out data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:duration-300 data-[state=open]:duration-500",
  {
    variants: {
      side: {
        top: "inset-x-0 top-0 border-b data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top",
        bottom:
          "inset-x-0 bottom-0 border-t data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom",
        left: "inset-y-0 left-0 h-full w-3/4 border-r data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left sm:max-w-sm",
        right:
          "inset-y-0 right-0 h-full w-3/4  border-l data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right sm:max-w-sm",
      },
    },
    defaultVariants: {
      side: "right",
    },
  }
)

interface SheetContentProps
  extends React.ComponentPropsWithoutRef<typeof SheetPrimitive.Content>,
    VariantProps<typeof sheetVariants> {}

const SheetContent = React.forwardRef<
  React.ElementRef<typeof SheetPrimitive.Content>,
  SheetContentProps
>(({ side = "right", className, children, ...props }, ref) => (
  <SheetPortal>
    <SheetOverlay />
    <SheetPrimitive.Content
      ref={ref}
      className={cn(sheetVariants({ side }), className)}
      {...props}
    >
      {children}
      <SheetPrimitive.Close className="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-secondary">
        <X className="h-4 w-4" />
        <span className="sr-only">Close</span>
      </SheetPrimitive.Close>
    </SheetPrimitive.Content>
  </SheetPortal>
))
SheetContent.displayName = SheetPrimitive.Content.displayName

const SheetHeader = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn(
      "flex flex-col space-y-2 text-center sm:text-left",
      className
    )}
    {...props}
  />
)
SheetHeader.displayName = "SheetHeader"

const SheetFooter = ({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) => (
  <div
    className={cn(
      "flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2",
      className
    )}
    {...props}
  />
)
SheetFooter.displayName = "SheetFooter"

const SheetTitle = React.forwardRef<
  React.ElementRef<typeof SheetPrimitive.Title>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Title>
>(({ className, ...props }, ref) => (
  <SheetPrimitive.Title
    ref={ref}
    className={cn("text-lg font-semibold text-foreground", className)}
    {...props}
  />
))
SheetTitle.displayName = SheetPrimitive.Title.displayName

const SheetDescription = React.forwardRef<
  React.ElementRef<typeof SheetPrimitive.Description>,
  React.ComponentPropsWithoutRef<typeof SheetPrimitive.Description>
>(({ className, ...props }, ref) => (
  <SheetPrimitive.Description
    ref={ref}
    className={cn("text-sm text-muted-foreground", className)}
    {...props}
  />
))
SheetDescription.displayName = SheetPrimitive.Description.displayName

export {
  Sheet,
  SheetPortal,
  SheetOverlay,
  SheetTrigger,
  SheetClose,
  SheetContent,
  SheetHeader,
  SheetFooter,
  SheetTitle,
  SheetDescription,
}
```

## File: components/ui/sidebar.tsx
```typescript
"use client"

import * as React from "react"
import { Slot } from "@radix-ui/react-slot"
import { VariantProps, cva } from "class-variance-authority"
import { PanelLeft } from "lucide-react"

import { useIsMobile } from "@/hooks/use-mobile"
import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Separator } from "@/components/ui/separator"
import { Sheet, SheetContent } from "@/components/ui/sheet"
import { Skeleton } from "@/components/ui/skeleton"
import {
  Tooltip,
  TooltipContent,
  TooltipProvider,
  TooltipTrigger,
} from "@/components/ui/tooltip"

const SIDEBAR_COOKIE_NAME = "sidebar:state"
const SIDEBAR_COOKIE_MAX_AGE = 60 * 60 * 24 * 7
const SIDEBAR_WIDTH = "16rem"
const SIDEBAR_WIDTH_MOBILE = "18rem"
const SIDEBAR_WIDTH_ICON = "3rem"
const SIDEBAR_KEYBOARD_SHORTCUT = "b"

type SidebarContext = {
  state: "expanded" | "collapsed"
  open: boolean
  setOpen: (open: boolean) => void
  openMobile: boolean
  setOpenMobile: (open: boolean) => void
  isMobile: boolean
  toggleSidebar: () => void
}

const SidebarContext = React.createContext<SidebarContext | null>(null)

function useSidebar() {
  const context = React.useContext(SidebarContext)
  if (!context) {
    throw new Error("useSidebar must be used within a SidebarProvider.")
  }

  return context
}

const SidebarProvider = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & {
    defaultOpen?: boolean
    open?: boolean
    onOpenChange?: (open: boolean) => void
  }
>(
  (
    {
      defaultOpen = true,
      open: openProp,
      onOpenChange: setOpenProp,
      className,
      style,
      children,
      ...props
    },
    ref
  ) => {
    const isMobile = useIsMobile()
    const [openMobile, setOpenMobile] = React.useState(false)

    // This is the internal state of the sidebar.
    // We use openProp and setOpenProp for control from outside the component.
    const [_open, _setOpen] = React.useState(defaultOpen)
    const open = openProp ?? _open
    const setOpen = React.useCallback(
      (value: boolean | ((value: boolean) => boolean)) => {
        const openState = typeof value === "function" ? value(open) : value
        if (setOpenProp) {
          setOpenProp(openState)
        } else {
          _setOpen(openState)
        }

        // This sets the cookie to keep the sidebar state.
        document.cookie = `${SIDEBAR_COOKIE_NAME}=${openState}; path=/; max-age=${SIDEBAR_COOKIE_MAX_AGE}`
      },
      [setOpenProp, open]
    )

    // Helper to toggle the sidebar.
    const toggleSidebar = React.useCallback(() => {
      return isMobile
        ? setOpenMobile((open) => !open)
        : setOpen((open) => !open)
    }, [isMobile, setOpen, setOpenMobile])

    // Adds a keyboard shortcut to toggle the sidebar.
    React.useEffect(() => {
      const handleKeyDown = (event: KeyboardEvent) => {
        if (
          event.key === SIDEBAR_KEYBOARD_SHORTCUT &&
          (event.metaKey || event.ctrlKey)
        ) {
          event.preventDefault()
          toggleSidebar()
        }
      }

      window.addEventListener("keydown", handleKeyDown)
      return () => window.removeEventListener("keydown", handleKeyDown)
    }, [toggleSidebar])

    // We add a state so that we can do data-state="expanded" or "collapsed".
    // This makes it easier to style the sidebar with Tailwind classes.
    const state = open ? "expanded" : "collapsed"

    const contextValue = React.useMemo<SidebarContext>(
      () => ({
        state,
        open,
        setOpen,
        isMobile,
        openMobile,
        setOpenMobile,
        toggleSidebar,
      }),
      [state, open, setOpen, isMobile, openMobile, setOpenMobile, toggleSidebar]
    )

    return (
      <SidebarContext.Provider value={contextValue}>
        <TooltipProvider delayDuration={0}>
          <div
            style={
              {
                "--sidebar-width": SIDEBAR_WIDTH,
                "--sidebar-width-icon": SIDEBAR_WIDTH_ICON,
                ...style,
              } as React.CSSProperties
            }
            className={cn(
              "group/sidebar-wrapper flex min-h-svh w-full has-[[data-variant=inset]]:bg-sidebar",
              className
            )}
            ref={ref}
            {...props}
          >
            {children}
          </div>
        </TooltipProvider>
      </SidebarContext.Provider>
    )
  }
)
SidebarProvider.displayName = "SidebarProvider"

const Sidebar = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & {
    side?: "left" | "right"
    variant?: "sidebar" | "floating" | "inset"
    collapsible?: "offcanvas" | "icon" | "none"
  }
>(
  (
    {
      side = "left",
      variant = "sidebar",
      collapsible = "offcanvas",
      className,
      children,
      ...props
    },
    ref
  ) => {
    const { isMobile, state, openMobile, setOpenMobile } = useSidebar()

    if (collapsible === "none") {
      return (
        <div
          className={cn(
            "flex h-full w-[--sidebar-width] flex-col bg-sidebar text-sidebar-foreground",
            className
          )}
          ref={ref}
          {...props}
        >
          {children}
        </div>
      )
    }

    if (isMobile) {
      return (
        <Sheet open={openMobile} onOpenChange={setOpenMobile} {...props}>
          <SheetContent
            data-sidebar="sidebar"
            data-mobile="true"
            className="w-[--sidebar-width] bg-sidebar p-0 text-sidebar-foreground [&>button]:hidden"
            style={
              {
                "--sidebar-width": SIDEBAR_WIDTH_MOBILE,
              } as React.CSSProperties
            }
            side={side}
          >
            <div className="flex h-full w-full flex-col">{children}</div>
          </SheetContent>
        </Sheet>
      )
    }

    return (
      <div
        ref={ref}
        className="group peer hidden md:block text-sidebar-foreground"
        data-state={state}
        data-collapsible={state === "collapsed" ? collapsible : ""}
        data-variant={variant}
        data-side={side}
      >
        {/* This is what handles the sidebar gap on desktop */}
        <div
          className={cn(
            "duration-200 relative h-svh w-[--sidebar-width] bg-transparent transition-[width] ease-linear",
            "group-data-[collapsible=offcanvas]:w-0",
            "group-data-[side=right]:rotate-180",
            variant === "floating" || variant === "inset"
              ? "group-data-[collapsible=icon]:w-[calc(var(--sidebar-width-icon)_+_theme(spacing.4))]"
              : "group-data-[collapsible=icon]:w-[--sidebar-width-icon]"
          )}
        />
        <div
          className={cn(
            "duration-200 fixed inset-y-0 z-10 hidden h-svh w-[--sidebar-width] transition-[left,right,width] ease-linear md:flex",
            side === "left"
              ? "left-0 group-data-[collapsible=offcanvas]:left-[calc(var(--sidebar-width)*-1)]"
              : "right-0 group-data-[collapsible=offcanvas]:right-[calc(var(--sidebar-width)*-1)]",
            // Adjust the padding for floating and inset variants.
            variant === "floating" || variant === "inset"
              ? "p-2 group-data-[collapsible=icon]:w-[calc(var(--sidebar-width-icon)_+_theme(spacing.4)_+2px)]"
              : "group-data-[collapsible=icon]:w-[--sidebar-width-icon] group-data-[side=left]:border-r group-data-[side=right]:border-l",
            className
          )}
          {...props}
        >
          <div
            data-sidebar="sidebar"
            className="flex h-full w-full flex-col bg-sidebar group-data-[variant=floating]:rounded-lg group-data-[variant=floating]:border group-data-[variant=floating]:border-sidebar-border group-data-[variant=floating]:shadow"
          >
            {children}
          </div>
        </div>
      </div>
    )
  }
)
Sidebar.displayName = "Sidebar"

const SidebarTrigger = React.forwardRef<
  React.ElementRef<typeof Button>,
  React.ComponentProps<typeof Button>
>(({ className, onClick, ...props }, ref) => {
  const { toggleSidebar } = useSidebar()

  return (
    <Button
      ref={ref}
      data-sidebar="trigger"
      variant="ghost"
      size="icon"
      className={cn("h-7 w-7", className)}
      onClick={(event) => {
        onClick?.(event)
        toggleSidebar()
      }}
      {...props}
    >
      <PanelLeft />
      <span className="sr-only">Toggle Sidebar</span>
    </Button>
  )
})
SidebarTrigger.displayName = "SidebarTrigger"

const SidebarRail = React.forwardRef<
  HTMLButtonElement,
  React.ComponentProps<"button">
>(({ className, ...props }, ref) => {
  const { toggleSidebar } = useSidebar()

  return (
    <button
      ref={ref}
      data-sidebar="rail"
      aria-label="Toggle Sidebar"
      tabIndex={-1}
      onClick={toggleSidebar}
      title="Toggle Sidebar"
      className={cn(
        "absolute inset-y-0 z-20 hidden w-4 -translate-x-1/2 transition-all ease-linear after:absolute after:inset-y-0 after:left-1/2 after:w-[2px] hover:after:bg-sidebar-border group-data-[side=left]:-right-4 group-data-[side=right]:left-0 sm:flex",
        "[[data-side=left]_&]:cursor-w-resize [[data-side=right]_&]:cursor-e-resize",
        "[[data-side=left][data-state=collapsed]_&]:cursor-e-resize [[data-side=right][data-state=collapsed]_&]:cursor-w-resize",
        "group-data-[collapsible=offcanvas]:translate-x-0 group-data-[collapsible=offcanvas]:after:left-full group-data-[collapsible=offcanvas]:hover:bg-sidebar",
        "[[data-side=left][data-collapsible=offcanvas]_&]:-right-2",
        "[[data-side=right][data-collapsible=offcanvas]_&]:-left-2",
        className
      )}
      {...props}
    />
  )
})
SidebarRail.displayName = "SidebarRail"

const SidebarInset = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"main">
>(({ className, ...props }, ref) => {
  return (
    <main
      ref={ref}
      className={cn(
        "relative flex min-h-svh flex-1 flex-col bg-background",
        "peer-data-[variant=inset]:min-h-[calc(100svh-theme(spacing.4))] md:peer-data-[variant=inset]:m-2 md:peer-data-[state=collapsed]:peer-data-[variant=inset]:ml-2 md:peer-data-[variant=inset]:ml-0 md:peer-data-[variant=inset]:rounded-xl md:peer-data-[variant=inset]:shadow",
        className
      )}
      {...props}
    />
  )
})
SidebarInset.displayName = "SidebarInset"

const SidebarInput = React.forwardRef<
  React.ElementRef<typeof Input>,
  React.ComponentProps<typeof Input>
>(({ className, ...props }, ref) => {
  return (
    <Input
      ref={ref}
      data-sidebar="input"
      className={cn(
        "h-8 w-full bg-background shadow-none focus-visible:ring-2 focus-visible:ring-sidebar-ring",
        className
      )}
      {...props}
    />
  )
})
SidebarInput.displayName = "SidebarInput"

const SidebarHeader = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div">
>(({ className, ...props }, ref) => {
  return (
    <div
      ref={ref}
      data-sidebar="header"
      className={cn("flex flex-col gap-2 p-2", className)}
      {...props}
    />
  )
})
SidebarHeader.displayName = "SidebarHeader"

const SidebarFooter = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div">
>(({ className, ...props }, ref) => {
  return (
    <div
      ref={ref}
      data-sidebar="footer"
      className={cn("flex flex-col gap-2 p-2", className)}
      {...props}
    />
  )
})
SidebarFooter.displayName = "SidebarFooter"

const SidebarSeparator = React.forwardRef<
  React.ElementRef<typeof Separator>,
  React.ComponentProps<typeof Separator>
>(({ className, ...props }, ref) => {
  return (
    <Separator
      ref={ref}
      data-sidebar="separator"
      className={cn("mx-2 w-auto bg-sidebar-border", className)}
      {...props}
    />
  )
})
SidebarSeparator.displayName = "SidebarSeparator"

const SidebarContent = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div">
>(({ className, ...props }, ref) => {
  return (
    <div
      ref={ref}
      data-sidebar="content"
      className={cn(
        "flex min-h-0 flex-1 flex-col gap-2 overflow-auto group-data-[collapsible=icon]:overflow-hidden",
        className
      )}
      {...props}
    />
  )
})
SidebarContent.displayName = "SidebarContent"

const SidebarGroup = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div">
>(({ className, ...props }, ref) => {
  return (
    <div
      ref={ref}
      data-sidebar="group"
      className={cn("relative flex w-full min-w-0 flex-col p-2", className)}
      {...props}
    />
  )
})
SidebarGroup.displayName = "SidebarGroup"

const SidebarGroupLabel = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & { asChild?: boolean }
>(({ className, asChild = false, ...props }, ref) => {
  const Comp = asChild ? Slot : "div"

  return (
    <Comp
      ref={ref}
      data-sidebar="group-label"
      className={cn(
        "duration-200 flex h-8 shrink-0 items-center rounded-md px-2 text-xs font-medium text-sidebar-foreground/70 outline-none ring-sidebar-ring transition-[margin,opa] ease-linear focus-visible:ring-2 [&>svg]:size-4 [&>svg]:shrink-0",
        "group-data-[collapsible=icon]:-mt-8 group-data-[collapsible=icon]:opacity-0",
        className
      )}
      {...props}
    />
  )
})
SidebarGroupLabel.displayName = "SidebarGroupLabel"

const SidebarGroupAction = React.forwardRef<
  HTMLButtonElement,
  React.ComponentProps<"button"> & { asChild?: boolean }
>(({ className, asChild = false, ...props }, ref) => {
  const Comp = asChild ? Slot : "button"

  return (
    <Comp
      ref={ref}
      data-sidebar="group-action"
      className={cn(
        "absolute right-3 top-3.5 flex aspect-square w-5 items-center justify-center rounded-md p-0 text-sidebar-foreground outline-none ring-sidebar-ring transition-transform hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 [&>svg]:size-4 [&>svg]:shrink-0",
        // Increases the hit area of the button on mobile.
        "after:absolute after:-inset-2 after:md:hidden",
        "group-data-[collapsible=icon]:hidden",
        className
      )}
      {...props}
    />
  )
})
SidebarGroupAction.displayName = "SidebarGroupAction"

const SidebarGroupContent = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div">
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    data-sidebar="group-content"
    className={cn("w-full text-sm", className)}
    {...props}
  />
))
SidebarGroupContent.displayName = "SidebarGroupContent"

const SidebarMenu = React.forwardRef<
  HTMLUListElement,
  React.ComponentProps<"ul">
>(({ className, ...props }, ref) => (
  <ul
    ref={ref}
    data-sidebar="menu"
    className={cn("flex w-full min-w-0 flex-col gap-1", className)}
    {...props}
  />
))
SidebarMenu.displayName = "SidebarMenu"

const SidebarMenuItem = React.forwardRef<
  HTMLLIElement,
  React.ComponentProps<"li">
>(({ className, ...props }, ref) => (
  <li
    ref={ref}
    data-sidebar="menu-item"
    className={cn("group/menu-item relative", className)}
    {...props}
  />
))
SidebarMenuItem.displayName = "SidebarMenuItem"

const sidebarMenuButtonVariants = cva(
  "peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left text-sm outline-none ring-sidebar-ring transition-[width,height,padding] hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 active:bg-sidebar-accent active:text-sidebar-accent-foreground disabled:pointer-events-none disabled:opacity-50 group-has-[[data-sidebar=menu-action]]/menu-item:pr-8 aria-disabled:pointer-events-none aria-disabled:opacity-50 data-[active=true]:bg-sidebar-accent data-[active=true]:font-medium data-[active=true]:text-sidebar-accent-foreground data-[state=open]:hover:bg-sidebar-accent data-[state=open]:hover:text-sidebar-accent-foreground group-data-[collapsible=icon]:!size-8 group-data-[collapsible=icon]:!p-2 [&>span:last-child]:truncate [&>svg]:size-4 [&>svg]:shrink-0",
  {
    variants: {
      variant: {
        default: "hover:bg-sidebar-accent hover:text-sidebar-accent-foreground",
        outline:
          "bg-background shadow-[0_0_0_1px_hsl(var(--sidebar-border))] hover:bg-sidebar-accent hover:text-sidebar-accent-foreground hover:shadow-[0_0_0_1px_hsl(var(--sidebar-accent))]",
      },
      size: {
        default: "h-8 text-sm",
        sm: "h-7 text-xs",
        lg: "h-12 text-sm group-data-[collapsible=icon]:!p-0",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
)

const SidebarMenuButton = React.forwardRef<
  HTMLButtonElement,
  React.ComponentProps<"button"> & {
    asChild?: boolean
    isActive?: boolean
    tooltip?: string | React.ComponentProps<typeof TooltipContent>
  } & VariantProps<typeof sidebarMenuButtonVariants>
>(
  (
    {
      asChild = false,
      isActive = false,
      variant = "default",
      size = "default",
      tooltip,
      className,
      ...props
    },
    ref
  ) => {
    const Comp = asChild ? Slot : "button"
    const { isMobile, state } = useSidebar()

    const button = (
      <Comp
        ref={ref}
        data-sidebar="menu-button"
        data-size={size}
        data-active={isActive}
        className={cn(sidebarMenuButtonVariants({ variant, size }), className)}
        {...props}
      />
    )

    if (!tooltip) {
      return button
    }

    if (typeof tooltip === "string") {
      tooltip = {
        children: tooltip,
      }
    }

    return (
      <Tooltip>
        <TooltipTrigger asChild>{button}</TooltipTrigger>
        <TooltipContent
          side="right"
          align="center"
          hidden={state !== "collapsed" || isMobile}
          {...tooltip}
        />
      </Tooltip>
    )
  }
)
SidebarMenuButton.displayName = "SidebarMenuButton"

const SidebarMenuAction = React.forwardRef<
  HTMLButtonElement,
  React.ComponentProps<"button"> & {
    asChild?: boolean
    showOnHover?: boolean
  }
>(({ className, asChild = false, showOnHover = false, ...props }, ref) => {
  const Comp = asChild ? Slot : "button"

  return (
    <Comp
      ref={ref}
      data-sidebar="menu-action"
      className={cn(
        "absolute right-1 top-1.5 flex aspect-square w-5 items-center justify-center rounded-md p-0 text-sidebar-foreground outline-none ring-sidebar-ring transition-transform hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 peer-hover/menu-button:text-sidebar-accent-foreground [&>svg]:size-4 [&>svg]:shrink-0",
        // Increases the hit area of the button on mobile.
        "after:absolute after:-inset-2 after:md:hidden",
        "peer-data-[size=sm]/menu-button:top-1",
        "peer-data-[size=default]/menu-button:top-1.5",
        "peer-data-[size=lg]/menu-button:top-2.5",
        "group-data-[collapsible=icon]:hidden",
        showOnHover &&
          "group-focus-within/menu-item:opacity-100 group-hover/menu-item:opacity-100 data-[state=open]:opacity-100 peer-data-[active=true]/menu-button:text-sidebar-accent-foreground md:opacity-0",
        className
      )}
      {...props}
    />
  )
})
SidebarMenuAction.displayName = "SidebarMenuAction"

const SidebarMenuBadge = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div">
>(({ className, ...props }, ref) => (
  <div
    ref={ref}
    data-sidebar="menu-badge"
    className={cn(
      "absolute right-1 flex h-5 min-w-5 items-center justify-center rounded-md px-1 text-xs font-medium tabular-nums text-sidebar-foreground select-none pointer-events-none",
      "peer-hover/menu-button:text-sidebar-accent-foreground peer-data-[active=true]/menu-button:text-sidebar-accent-foreground",
      "peer-data-[size=sm]/menu-button:top-1",
      "peer-data-[size=default]/menu-button:top-1.5",
      "peer-data-[size=lg]/menu-button:top-2.5",
      "group-data-[collapsible=icon]:hidden",
      className
    )}
    {...props}
  />
))
SidebarMenuBadge.displayName = "SidebarMenuBadge"

const SidebarMenuSkeleton = React.forwardRef<
  HTMLDivElement,
  React.ComponentProps<"div"> & {
    showIcon?: boolean
  }
>(({ className, showIcon = false, ...props }, ref) => {
  // Random width between 50 to 90%.
  const width = React.useMemo(() => {
    return `${Math.floor(Math.random() * 40) + 50}%`
  }, [])

  return (
    <div
      ref={ref}
      data-sidebar="menu-skeleton"
      className={cn("rounded-md h-8 flex gap-2 px-2 items-center", className)}
      {...props}
    >
      {showIcon && (
        <Skeleton
          className="size-4 rounded-md"
          data-sidebar="menu-skeleton-icon"
        />
      )}
      <Skeleton
        className="h-4 flex-1 max-w-[--skeleton-width]"
        data-sidebar="menu-skeleton-text"
        style={
          {
            "--skeleton-width": width,
          } as React.CSSProperties
        }
      />
    </div>
  )
})
SidebarMenuSkeleton.displayName = "SidebarMenuSkeleton"

const SidebarMenuSub = React.forwardRef<
  HTMLUListElement,
  React.ComponentProps<"ul">
>(({ className, ...props }, ref) => (
  <ul
    ref={ref}
    data-sidebar="menu-sub"
    className={cn(
      "mx-3.5 flex min-w-0 translate-x-px flex-col gap-1 border-l border-sidebar-border px-2.5 py-0.5",
      "group-data-[collapsible=icon]:hidden",
      className
    )}
    {...props}
  />
))
SidebarMenuSub.displayName = "SidebarMenuSub"

const SidebarMenuSubItem = React.forwardRef<
  HTMLLIElement,
  React.ComponentProps<"li">
>(({ ...props }, ref) => <li ref={ref} {...props} />)
SidebarMenuSubItem.displayName = "SidebarMenuSubItem"

const SidebarMenuSubButton = React.forwardRef<
  HTMLAnchorElement,
  React.ComponentProps<"a"> & {
    asChild?: boolean
    size?: "sm" | "md"
    isActive?: boolean
  }
>(({ asChild = false, size = "md", isActive, className, ...props }, ref) => {
  const Comp = asChild ? Slot : "a"

  return (
    <Comp
      ref={ref}
      data-sidebar="menu-sub-button"
      data-size={size}
      data-active={isActive}
      className={cn(
        "flex h-7 min-w-0 -translate-x-px items-center gap-2 overflow-hidden rounded-md px-2 text-sidebar-foreground outline-none ring-sidebar-ring hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 active:bg-sidebar-accent active:text-sidebar-accent-foreground disabled:pointer-events-none disabled:opacity-50 aria-disabled:pointer-events-none aria-disabled:opacity-50 [&>span:last-child]:truncate [&>svg]:size-4 [&>svg]:shrink-0 [&>svg]:text-sidebar-accent-foreground",
        "data-[active=true]:bg-sidebar-accent data-[active=true]:text-sidebar-accent-foreground",
        size === "sm" && "text-xs",
        size === "md" && "text-sm",
        "group-data-[collapsible=icon]:hidden",
        className
      )}
      {...props}
    />
  )
})
SidebarMenuSubButton.displayName = "SidebarMenuSubButton"

export {
  Sidebar,
  SidebarContent,
  SidebarFooter,
  SidebarGroup,
  SidebarGroupAction,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarHeader,
  SidebarInput,
  SidebarInset,
  SidebarMenu,
  SidebarMenuAction,
  SidebarMenuBadge,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarMenuSkeleton,
  SidebarMenuSub,
  SidebarMenuSubButton,
  SidebarMenuSubItem,
  SidebarProvider,
  SidebarRail,
  SidebarSeparator,
  SidebarTrigger,
  useSidebar,
}
```

## File: components/ui/skeleton.tsx
```typescript
import { cn } from "@/lib/utils"

function Skeleton({
  className,
  ...props
}: React.HTMLAttributes<HTMLDivElement>) {
  return (
    <div
      className={cn("animate-pulse rounded-md bg-muted", className)}
      {...props}
    />
  )
}

export { Skeleton }
```

## File: components/ui/slider.tsx
```typescript
"use client"

import * as React from "react"
import * as SliderPrimitive from "@radix-ui/react-slider"

import { cn } from "@/lib/utils"

const Slider = React.forwardRef<
  React.ElementRef<typeof SliderPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof SliderPrimitive.Root>
>(({ className, ...props }, ref) => (
  <SliderPrimitive.Root
    ref={ref}
    className={cn(
      "relative flex w-full touch-none select-none items-center",
      className
    )}
    {...props}
  >
    <SliderPrimitive.Track className="relative h-2 w-full grow overflow-hidden rounded-full bg-secondary">
      <SliderPrimitive.Range className="absolute h-full bg-primary" />
    </SliderPrimitive.Track>
    <SliderPrimitive.Thumb className="block h-5 w-5 rounded-full border-2 border-primary bg-background ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50" />
  </SliderPrimitive.Root>
))
Slider.displayName = SliderPrimitive.Root.displayName

export { Slider }
```

## File: components/ui/sonner.tsx
```typescript
"use client"

import { useTheme } from "next-themes"
import { Toaster as Sonner } from "sonner"

type ToasterProps = React.ComponentProps<typeof Sonner>

const Toaster = ({ ...props }: ToasterProps) => {
  const { theme = "system" } = useTheme()

  return (
    <Sonner
      theme={theme as ToasterProps["theme"]}
      className="toaster group"
      toastOptions={{
        classNames: {
          toast:
            "group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg",
          description: "group-[.toast]:text-muted-foreground",
          actionButton:
            "group-[.toast]:bg-primary group-[.toast]:text-primary-foreground",
          cancelButton:
            "group-[.toast]:bg-muted group-[.toast]:text-muted-foreground",
        },
      }}
      {...props}
    />
  )
}

export { Toaster }
```

## File: components/ui/switch.tsx
```typescript
"use client"

import * as React from "react"
import * as SwitchPrimitives from "@radix-ui/react-switch"

import { cn } from "@/lib/utils"

const Switch = React.forwardRef<
  React.ElementRef<typeof SwitchPrimitives.Root>,
  React.ComponentPropsWithoutRef<typeof SwitchPrimitives.Root>
>(({ className, ...props }, ref) => (
  <SwitchPrimitives.Root
    className={cn(
      "peer inline-flex h-6 w-11 shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-input",
      className
    )}
    {...props}
    ref={ref}
  >
    <SwitchPrimitives.Thumb
      className={cn(
        "pointer-events-none block h-5 w-5 rounded-full bg-background shadow-lg ring-0 transition-transform data-[state=checked]:translate-x-5 data-[state=unchecked]:translate-x-0"
      )}
    />
  </SwitchPrimitives.Root>
))
Switch.displayName = SwitchPrimitives.Root.displayName

export { Switch }
```

## File: components/ui/table.tsx
```typescript
import * as React from "react"

import { cn } from "@/lib/utils"

const Table = React.forwardRef<
  HTMLTableElement,
  React.HTMLAttributes<HTMLTableElement>
>(({ className, ...props }, ref) => (
  <div className="relative w-full overflow-auto">
    <table
      ref={ref}
      className={cn("w-full caption-bottom text-sm", className)}
      {...props}
    />
  </div>
))
Table.displayName = "Table"

const TableHeader = React.forwardRef<
  HTMLTableSectionElement,
  React.HTMLAttributes<HTMLTableSectionElement>
>(({ className, ...props }, ref) => (
  <thead ref={ref} className={cn("[&_tr]:border-b", className)} {...props} />
))
TableHeader.displayName = "TableHeader"

const TableBody = React.forwardRef<
  HTMLTableSectionElement,
  React.HTMLAttributes<HTMLTableSectionElement>
>(({ className, ...props }, ref) => (
  <tbody
    ref={ref}
    className={cn("[&_tr:last-child]:border-0", className)}
    {...props}
  />
))
TableBody.displayName = "TableBody"

const TableFooter = React.forwardRef<
  HTMLTableSectionElement,
  React.HTMLAttributes<HTMLTableSectionElement>
>(({ className, ...props }, ref) => (
  <tfoot
    ref={ref}
    className={cn(
      "border-t bg-muted/50 font-medium [&>tr]:last:border-b-0",
      className
    )}
    {...props}
  />
))
TableFooter.displayName = "TableFooter"

const TableRow = React.forwardRef<
  HTMLTableRowElement,
  React.HTMLAttributes<HTMLTableRowElement>
>(({ className, ...props }, ref) => (
  <tr
    ref={ref}
    className={cn(
      "border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted",
      className
    )}
    {...props}
  />
))
TableRow.displayName = "TableRow"

const TableHead = React.forwardRef<
  HTMLTableCellElement,
  React.ThHTMLAttributes<HTMLTableCellElement>
>(({ className, ...props }, ref) => (
  <th
    ref={ref}
    className={cn(
      "h-12 px-4 text-left align-middle font-medium text-muted-foreground [&:has([role=checkbox])]:pr-0",
      className
    )}
    {...props}
  />
))
TableHead.displayName = "TableHead"

const TableCell = React.forwardRef<
  HTMLTableCellElement,
  React.TdHTMLAttributes<HTMLTableCellElement>
>(({ className, ...props }, ref) => (
  <td
    ref={ref}
    className={cn("p-4 align-middle [&:has([role=checkbox])]:pr-0", className)}
    {...props}
  />
))
TableCell.displayName = "TableCell"

const TableCaption = React.forwardRef<
  HTMLTableCaptionElement,
  React.HTMLAttributes<HTMLTableCaptionElement>
>(({ className, ...props }, ref) => (
  <caption
    ref={ref}
    className={cn("mt-4 text-sm text-muted-foreground", className)}
    {...props}
  />
))
TableCaption.displayName = "TableCaption"

export {
  Table,
  TableHeader,
  TableBody,
  TableFooter,
  TableHead,
  TableRow,
  TableCell,
  TableCaption,
}
```

## File: components/ui/tabs.tsx
```typescript
"use client"

import * as React from "react"
import * as TabsPrimitive from "@radix-ui/react-tabs"

import { cn } from "@/lib/utils"

const Tabs = TabsPrimitive.Root

const TabsList = React.forwardRef<
  React.ElementRef<typeof TabsPrimitive.List>,
  React.ComponentPropsWithoutRef<typeof TabsPrimitive.List>
>(({ className, ...props }, ref) => (
  <TabsPrimitive.List
    ref={ref}
    className={cn(
      "inline-flex h-10 items-center justify-center rounded-md bg-muted p-1 text-muted-foreground",
      className
    )}
    {...props}
  />
))
TabsList.displayName = TabsPrimitive.List.displayName

const TabsTrigger = React.forwardRef<
  React.ElementRef<typeof TabsPrimitive.Trigger>,
  React.ComponentPropsWithoutRef<typeof TabsPrimitive.Trigger>
>(({ className, ...props }, ref) => (
  <TabsPrimitive.Trigger
    ref={ref}
    className={cn(
      "inline-flex items-center justify-center whitespace-nowrap rounded-sm px-3 py-1.5 text-sm font-medium ring-offset-background transition-all focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm",
      className
    )}
    {...props}
  />
))
TabsTrigger.displayName = TabsPrimitive.Trigger.displayName

const TabsContent = React.forwardRef<
  React.ElementRef<typeof TabsPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof TabsPrimitive.Content>
>(({ className, ...props }, ref) => (
  <TabsPrimitive.Content
    ref={ref}
    className={cn(
      "mt-2 ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2",
      className
    )}
    {...props}
  />
))
TabsContent.displayName = TabsPrimitive.Content.displayName

export { Tabs, TabsList, TabsTrigger, TabsContent }
```

## File: components/ui/textarea.tsx
```typescript
import * as React from "react"

import { cn } from "@/lib/utils"

const Textarea = React.forwardRef<
  HTMLTextAreaElement,
  React.ComponentProps<"textarea">
>(({ className, ...props }, ref) => {
  return (
    <textarea
      className={cn(
        "flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm",
        className
      )}
      ref={ref}
      {...props}
    />
  )
})
Textarea.displayName = "Textarea"

export { Textarea }
```

## File: components/ui/toast.tsx
```typescript
"use client"

import * as React from "react"
import * as ToastPrimitives from "@radix-ui/react-toast"
import { cva, type VariantProps } from "class-variance-authority"
import { X } from "lucide-react"

import { cn } from "@/lib/utils"

const ToastProvider = ToastPrimitives.Provider

const ToastViewport = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Viewport>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Viewport>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Viewport
    ref={ref}
    className={cn(
      "fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]",
      className
    )}
    {...props}
  />
))
ToastViewport.displayName = ToastPrimitives.Viewport.displayName

const toastVariants = cva(
  "group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md border p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full",
  {
    variants: {
      variant: {
        default: "border bg-background text-foreground",
        destructive:
          "destructive group border-destructive bg-destructive text-destructive-foreground",
      },
    },
    defaultVariants: {
      variant: "default",
    },
  }
)

const Toast = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Root>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Root> &
    VariantProps<typeof toastVariants>
>(({ className, variant, ...props }, ref) => {
  return (
    <ToastPrimitives.Root
      ref={ref}
      className={cn(toastVariants({ variant }), className)}
      {...props}
    />
  )
})
Toast.displayName = ToastPrimitives.Root.displayName

const ToastAction = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Action>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Action>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Action
    ref={ref}
    className={cn(
      "inline-flex h-8 shrink-0 items-center justify-center rounded-md border bg-transparent px-3 text-sm font-medium ring-offset-background transition-colors hover:bg-secondary focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 group-[.destructive]:border-muted/40 group-[.destructive]:hover:border-destructive/30 group-[.destructive]:hover:bg-destructive group-[.destructive]:hover:text-destructive-foreground group-[.destructive]:focus:ring-destructive",
      className
    )}
    {...props}
  />
))
ToastAction.displayName = ToastPrimitives.Action.displayName

const ToastClose = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Close>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Close>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Close
    ref={ref}
    className={cn(
      "absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600",
      className
    )}
    toast-close=""
    {...props}
  >
    <X className="h-4 w-4" />
  </ToastPrimitives.Close>
))
ToastClose.displayName = ToastPrimitives.Close.displayName

const ToastTitle = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Title>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Title>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Title
    ref={ref}
    className={cn("text-sm font-semibold", className)}
    {...props}
  />
))
ToastTitle.displayName = ToastPrimitives.Title.displayName

const ToastDescription = React.forwardRef<
  React.ElementRef<typeof ToastPrimitives.Description>,
  React.ComponentPropsWithoutRef<typeof ToastPrimitives.Description>
>(({ className, ...props }, ref) => (
  <ToastPrimitives.Description
    ref={ref}
    className={cn("text-sm opacity-90", className)}
    {...props}
  />
))
ToastDescription.displayName = ToastPrimitives.Description.displayName

type ToastProps = React.ComponentPropsWithoutRef<typeof Toast>

type ToastActionElement = React.ReactElement<typeof ToastAction>

export {
  type ToastProps,
  type ToastActionElement,
  ToastProvider,
  ToastViewport,
  Toast,
  ToastTitle,
  ToastDescription,
  ToastClose,
  ToastAction,
}
```

## File: components/ui/toaster.tsx
```typescript
"use client"

import { useToast } from "@/hooks/use-toast"
import {
  Toast,
  ToastClose,
  ToastDescription,
  ToastProvider,
  ToastTitle,
  ToastViewport,
} from "@/components/ui/toast"

export function Toaster() {
  const { toasts } = useToast()

  return (
    <ToastProvider>
      {toasts.map(function ({ id, title, description, action, ...props }) {
        return (
          <Toast key={id} {...props}>
            <div className="grid gap-1">
              {title && <ToastTitle>{title}</ToastTitle>}
              {description && (
                <ToastDescription>{description}</ToastDescription>
              )}
            </div>
            {action}
            <ToastClose />
          </Toast>
        )
      })}
      <ToastViewport />
    </ToastProvider>
  )
}
```

## File: components/ui/toggle-group.tsx
```typescript
"use client"

import * as React from "react"
import * as ToggleGroupPrimitive from "@radix-ui/react-toggle-group"
import { type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"
import { toggleVariants } from "@/components/ui/toggle"

const ToggleGroupContext = React.createContext<
  VariantProps<typeof toggleVariants>
>({
  size: "default",
  variant: "default",
})

const ToggleGroup = React.forwardRef<
  React.ElementRef<typeof ToggleGroupPrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof ToggleGroupPrimitive.Root> &
    VariantProps<typeof toggleVariants>
>(({ className, variant, size, children, ...props }, ref) => (
  <ToggleGroupPrimitive.Root
    ref={ref}
    className={cn("flex items-center justify-center gap-1", className)}
    {...props}
  >
    <ToggleGroupContext.Provider value={{ variant, size }}>
      {children}
    </ToggleGroupContext.Provider>
  </ToggleGroupPrimitive.Root>
))

ToggleGroup.displayName = ToggleGroupPrimitive.Root.displayName

const ToggleGroupItem = React.forwardRef<
  React.ElementRef<typeof ToggleGroupPrimitive.Item>,
  React.ComponentPropsWithoutRef<typeof ToggleGroupPrimitive.Item> &
    VariantProps<typeof toggleVariants>
>(({ className, children, variant, size, ...props }, ref) => {
  const context = React.useContext(ToggleGroupContext)

  return (
    <ToggleGroupPrimitive.Item
      ref={ref}
      className={cn(
        toggleVariants({
          variant: context.variant || variant,
          size: context.size || size,
        }),
        className
      )}
      {...props}
    >
      {children}
    </ToggleGroupPrimitive.Item>
  )
})

ToggleGroupItem.displayName = ToggleGroupPrimitive.Item.displayName

export { ToggleGroup, ToggleGroupItem }
```

## File: components/ui/toggle.tsx
```typescript
"use client"

import * as React from "react"
import * as TogglePrimitive from "@radix-ui/react-toggle"
import { cva, type VariantProps } from "class-variance-authority"

import { cn } from "@/lib/utils"

const toggleVariants = cva(
  "inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors hover:bg-muted hover:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground [&_svg]:pointer-events-none [&_svg]:size-4 [&_svg]:shrink-0 gap-2",
  {
    variants: {
      variant: {
        default: "bg-transparent",
        outline:
          "border border-input bg-transparent hover:bg-accent hover:text-accent-foreground",
      },
      size: {
        default: "h-10 px-3 min-w-10",
        sm: "h-9 px-2.5 min-w-9",
        lg: "h-11 px-5 min-w-11",
      },
    },
    defaultVariants: {
      variant: "default",
      size: "default",
    },
  }
)

const Toggle = React.forwardRef<
  React.ElementRef<typeof TogglePrimitive.Root>,
  React.ComponentPropsWithoutRef<typeof TogglePrimitive.Root> &
    VariantProps<typeof toggleVariants>
>(({ className, variant, size, ...props }, ref) => (
  <TogglePrimitive.Root
    ref={ref}
    className={cn(toggleVariants({ variant, size, className }))}
    {...props}
  />
))

Toggle.displayName = TogglePrimitive.Root.displayName

export { Toggle, toggleVariants }
```

## File: components/ui/tooltip.tsx
```typescript
"use client"

import * as React from "react"
import * as TooltipPrimitive from "@radix-ui/react-tooltip"

import { cn } from "@/lib/utils"

const TooltipProvider = TooltipPrimitive.Provider

const Tooltip = TooltipPrimitive.Root

const TooltipTrigger = TooltipPrimitive.Trigger

const TooltipContent = React.forwardRef<
  React.ElementRef<typeof TooltipPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof TooltipPrimitive.Content>
>(({ className, sideOffset = 4, ...props }, ref) => (
  <TooltipPrimitive.Content
    ref={ref}
    sideOffset={sideOffset}
    className={cn(
      "z-50 overflow-hidden rounded-md border bg-popover px-3 py-1.5 text-sm text-popover-foreground shadow-md animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
      className
    )}
    {...props}
  />
))
TooltipContent.displayName = TooltipPrimitive.Content.displayName

export { Tooltip, TooltipTrigger, TooltipContent, TooltipProvider }
```

## File: components/ui/use-mobile.tsx
```typescript
import * as React from "react"

const MOBILE_BREAKPOINT = 768

export function useIsMobile() {
  const [isMobile, setIsMobile] = React.useState<boolean | undefined>(undefined)

  React.useEffect(() => {
    const mql = window.matchMedia(`(max-width: ${MOBILE_BREAKPOINT - 1}px)`)
    const onChange = () => {
      setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
    }
    mql.addEventListener("change", onChange)
    setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
    return () => mql.removeEventListener("change", onChange)
  }, [])

  return !!isMobile
}
```

## File: components/ui/use-toast.ts
```typescript
"use client"

// Inspired by react-hot-toast library
import * as React from "react"

import type {
  ToastActionElement,
  ToastProps,
} from "@/components/ui/toast"

const TOAST_LIMIT = 1
const TOAST_REMOVE_DELAY = 1000000

type ToasterToast = ToastProps & {
  id: string
  title?: React.ReactNode
  description?: React.ReactNode
  action?: ToastActionElement
}

const actionTypes = {
  ADD_TOAST: "ADD_TOAST",
  UPDATE_TOAST: "UPDATE_TOAST",
  DISMISS_TOAST: "DISMISS_TOAST",
  REMOVE_TOAST: "REMOVE_TOAST",
} as const

let count = 0

function genId() {
  count = (count + 1) % Number.MAX_SAFE_INTEGER
  return count.toString()
}

type ActionType = typeof actionTypes

type Action =
  | {
      type: ActionType["ADD_TOAST"]
      toast: ToasterToast
    }
  | {
      type: ActionType["UPDATE_TOAST"]
      toast: Partial<ToasterToast>
    }
  | {
      type: ActionType["DISMISS_TOAST"]
      toastId?: ToasterToast["id"]
    }
  | {
      type: ActionType["REMOVE_TOAST"]
      toastId?: ToasterToast["id"]
    }

interface State {
  toasts: ToasterToast[]
}

const toastTimeouts = new Map<string, ReturnType<typeof setTimeout>>()

const addToRemoveQueue = (toastId: string) => {
  if (toastTimeouts.has(toastId)) {
    return
  }

  const timeout = setTimeout(() => {
    toastTimeouts.delete(toastId)
    dispatch({
      type: "REMOVE_TOAST",
      toastId: toastId,
    })
  }, TOAST_REMOVE_DELAY)

  toastTimeouts.set(toastId, timeout)
}

export const reducer = (state: State, action: Action): State => {
  switch (action.type) {
    case "ADD_TOAST":
      return {
        ...state,
        toasts: [action.toast, ...state.toasts].slice(0, TOAST_LIMIT),
      }

    case "UPDATE_TOAST":
      return {
        ...state,
        toasts: state.toasts.map((t) =>
          t.id === action.toast.id ? { ...t, ...action.toast } : t
        ),
      }

    case "DISMISS_TOAST": {
      const { toastId } = action

      // ! Side effects ! - This could be extracted into a dismissToast() action,
      // but I'll keep it here for simplicity
      if (toastId) {
        addToRemoveQueue(toastId)
      } else {
        state.toasts.forEach((toast) => {
          addToRemoveQueue(toast.id)
        })
      }

      return {
        ...state,
        toasts: state.toasts.map((t) =>
          t.id === toastId || toastId === undefined
            ? {
                ...t,
                open: false,
              }
            : t
        ),
      }
    }
    case "REMOVE_TOAST":
      if (action.toastId === undefined) {
        return {
          ...state,
          toasts: [],
        }
      }
      return {
        ...state,
        toasts: state.toasts.filter((t) => t.id !== action.toastId),
      }
  }
}

const listeners: Array<(state: State) => void> = []

let memoryState: State = { toasts: [] }

function dispatch(action: Action) {
  memoryState = reducer(memoryState, action)
  listeners.forEach((listener) => {
    listener(memoryState)
  })
}

type Toast = Omit<ToasterToast, "id">

function toast({ ...props }: Toast) {
  const id = genId()

  const update = (props: ToasterToast) =>
    dispatch({
      type: "UPDATE_TOAST",
      toast: { ...props, id },
    })
  const dismiss = () => dispatch({ type: "DISMISS_TOAST", toastId: id })

  dispatch({
    type: "ADD_TOAST",
    toast: {
      ...props,
      id,
      open: true,
      onOpenChange: (open) => {
        if (!open) dismiss()
      },
    },
  })

  return {
    id: id,
    dismiss,
    update,
  }
}

function useToast() {
  const [state, setState] = React.useState<State>(memoryState)

  React.useEffect(() => {
    listeners.push(setState)
    return () => {
      const index = listeners.indexOf(setState)
      if (index > -1) {
        listeners.splice(index, 1)
      }
    }
  }, [state])

  return {
    ...state,
    toast,
    dismiss: (toastId?: string) => dispatch({ type: "DISMISS_TOAST", toastId }),
  }
}

export { useToast, toast }
```

## File: components/ContaCard.tsx
```typescript
"use client"

import type React from "react"

import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Badge } from "@/components/ui/badge"
import { Edit, Pause, Play, Trash2 } from "lucide-react"
import { IconComponent } from "@/components/IconComponents"
import { formatCurrency } from "@/utils/financial"
import type { Conta, IconType } from "@/types/financial"

interface ContaCardProps {
  conta: Conta
  onEdit: (conta: Conta) => void
  onToggleStatus: (id: string) => void
  onDelete: (id: string) => void
}

export const ContaCard = ({ conta, onEdit, onToggleStatus, onDelete }: ContaCardProps) => {
  const handleEdit = () => {
    onEdit(conta)
  }

  const handleToggleStatus = () => {
    onToggleStatus(conta.id)
  }

  const handleDelete = () => {
    onDelete(conta.id)
  }

  const handleKeyDown = (event: React.KeyboardEvent, action: () => void) => {
    if (event.key === "Enter" || event.key === " ") {
      event.preventDefault()
      action()
    }
  }

  return (
    <Card
      className={`${
        conta.status === "suspenso" ? "opacity-50" : ""
      } shadow-lg hover:shadow-xl transition-all duration-200`}
    >
      <CardHeader className="pb-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <IconComponent iconName={conta.icone as IconType} className="w-5 h-5 text-slate-600" />
            <div>
              <CardTitle className="text-sm font-bold">{conta.nome}</CardTitle>
              <p className="text-xs text-slate-500">
                Vence dia {conta.dataVencimento} • {conta.categoria}
              </p>
            </div>
          </div>
          <Badge
            variant={conta.status === "ativo" ? "default" : "secondary"}
            className={
              conta.status === "ativo"
                ? "bg-emerald-100 text-emerald-800 border-emerald-300"
                : "bg-slate-100 text-slate-600"
            }
          >
            {conta.status}
          </Badge>
        </div>
      </CardHeader>
      <CardContent>
        <div className="flex items-center justify-between mb-4">
          <span className="text-lg font-bold">{formatCurrency(conta.valor)}</span>
        </div>
        <div className="flex gap-2">
          <Button
            size="sm"
            variant="outline"
            onClick={handleEdit}
            onKeyDown={(event) => handleKeyDown(event, handleEdit)}
            className="flex-1 hover:bg-blue-50 hover:border-blue-300 transition-colors"
            tabIndex={0}
            aria-label={`Editar conta ${conta.nome}`}
          >
            <Edit className="w-3 h-3 mr-1" aria-hidden="true" />
            Editar
          </Button>
          <Button
            size="sm"
            variant="outline"
            onClick={handleToggleStatus}
            onKeyDown={(event) => handleKeyDown(event, handleToggleStatus)}
            className="hover:bg-amber-50 hover:border-amber-300 transition-colors"
            tabIndex={0}
            aria-label={`${conta.status === "ativo" ? "Suspender" : "Ativar"} conta ${conta.nome}`}
          >
            {conta.status === "ativo" ? (
              <Pause className="w-3 h-3" aria-hidden="true" />
            ) : (
              <Play className="w-3 h-3" aria-hidden="true" />
            )}
          </Button>
          <Button
            size="sm"
            variant="outline"
            onClick={handleDelete}
            onKeyDown={(event) => handleKeyDown(event, handleDelete)}
            className="hover:bg-red-50 hover:border-red-300 hover:text-red-600 transition-colors"
            tabIndex={0}
            aria-label={`Excluir conta ${conta.nome}`}
          >
            <Trash2 className="w-3 h-3" aria-hidden="true" />
          </Button>
        </div>
      </CardContent>
    </Card>
  )
}
```

## File: components/IconComponents.tsx
```typescript
import { Home, Car, ShoppingCart, Smartphone, Heart, Calculator, CreditCard, DollarSign } from "lucide-react"
import type { IconType } from "@/types/financial"

const iconesDisponiveis = {
  Home,
  Car,
  ShoppingCart,
  Smartphone,
  Heart,
  Calculator,
  CreditCard,
  DollarSign,
}

interface IconComponentProps {
  iconName: IconType
  className?: string
}

export const IconComponent = ({ iconName, className = "w-5 h-5" }: IconComponentProps) => {
  const Icon = iconesDisponiveis[iconName] || Home
  return <Icon className={className} />
}

export { iconesDisponiveis }
```

## File: components/Navigation.tsx
```typescript
"use client"

import type React from "react"

import { Button } from "@/components/ui/button"
import { PieChart, Edit, Calendar, Plane, Download } from "lucide-react"
import type { ViewType } from "@/types/financial"

interface NavigationProps {
  activeView: ViewType
  onViewChange: (view: ViewType) => void
}

const navigationItems = [
  {
    id: "overview" as ViewType,
    label: "Visão Geral",
    icon: PieChart,
    colorClass: "bg-blue-600 hover:bg-blue-700",
    hoverClass: "hover:bg-blue-50 hover:border-blue-300",
  },
  {
    id: "manage" as ViewType,
    label: "Gerenciar Contas",
    icon: Edit,
    colorClass: "bg-emerald-600 hover:bg-emerald-700",
    hoverClass: "hover:bg-emerald-50 hover:border-emerald-300",
  },
  {
    id: "monthly" as ViewType,
    label: "Controle Mensal",
    icon: Calendar,
    colorClass: "bg-purple-600 hover:bg-purple-700",
    hoverClass: "hover:bg-purple-50 hover:border-purple-300",
  },
  {
    id: "chile" as ViewType,
    label: "Meta Chile",
    icon: Plane,
    colorClass: "bg-orange-600 hover:bg-orange-700",
    hoverClass: "hover:bg-orange-50 hover:border-orange-300",
  },
  {
    id: "export" as ViewType,
    label: "Exportar Dados",
    icon: Download,
    colorClass: "bg-slate-600 hover:bg-slate-700",
    hoverClass: "hover:bg-slate-50 hover:border-slate-300",
  },
]

export const Navigation = ({ activeView, onViewChange }: NavigationProps) => {
  const handleViewChange = (view: ViewType) => {
    onViewChange(view)
  }

  const handleKeyDown = (event: React.KeyboardEvent, view: ViewType) => {
    if (event.key === "Enter" || event.key === " ") {
      event.preventDefault()
      handleViewChange(view)
    }
  }

  return (
    <div className="flex flex-wrap justify-center gap-3">
      {navigationItems.map(({ id, label, icon: Icon, colorClass, hoverClass }) => (
        <Button
          key={id}
          variant={activeView === id ? "default" : "outline"}
          onClick={() => handleViewChange(id)}
          onKeyDown={(event) => handleKeyDown(event, id)}
          className={`flex items-center gap-2 transition-all duration-200 shadow-lg ${
            activeView === id ? colorClass : hoverClass
          }`}
          tabIndex={0}
          aria-label={`Navegar para ${label}`}
          role="tab"
          aria-selected={activeView === id}
        >
          <Icon className="w-4 h-4" />
          {label}
        </Button>
      ))}
    </div>
  )
}
```

## File: components/OverviewView.tsx
```typescript
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Progress } from "@/components/ui/progress"
import { TrendingUp, TrendingDown, CreditCard, DollarSign, PieChart, Calculator } from "lucide-react"
import { formatCurrency, getBalanceColor, getBalanceBgColor } from "@/utils/financial"
import type { FinancialSummary, Renda } from "@/types/financial"

interface OverviewViewProps {
  financialSummary: FinancialSummary
  renda: Renda
}

export const OverviewView = ({ financialSummary, renda }: OverviewViewProps) => {
  const { totalNecessidades, totalDesejos, totalDividas, totalDespesas, saldoAposDespesas, saldoFinal } =
    financialSummary

  return (
    <>
      {/* Main Cards */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <Card className="bg-gradient-to-br from-emerald-50 to-emerald-100 border-emerald-200 shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-emerald-800">Renda Total</CardTitle>
            <TrendingUp className="h-5 w-5 text-emerald-600" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-emerald-700">{formatCurrency(renda.salarioLiquido)}</div>
            <p className="text-xs text-emerald-600 mt-1">Salário líquido mensal</p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-red-50 to-red-100 border-red-200 shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-red-800">Despesas Totais</CardTitle>
            <TrendingDown className="h-5 w-5 text-red-600" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-red-700">{formatCurrency(totalDespesas)}</div>
            <p className="text-xs text-red-600 mt-1">
              {((totalDespesas / renda.salarioLiquido) * 100).toFixed(1)}% da renda
            </p>
          </CardContent>
        </Card>

        <Card className="bg-gradient-to-br from-orange-50 to-orange-100 border-orange-200 shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium text-orange-800">Dívidas</CardTitle>
            <CreditCard className="h-5 w-5 text-orange-600" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold text-orange-700">{formatCurrency(totalDividas)}</div>
            <p className="text-xs text-orange-600 mt-1">Pendente de pagamento</p>
          </CardContent>
        </Card>

        <Card
          className={`${getBalanceBgColor(saldoFinal)} shadow-lg hover:shadow-xl transition-shadow bg-gradient-to-br`}
        >
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">Saldo Final</CardTitle>
            <DollarSign className="h-5 w-5" aria-hidden="true" />
          </CardHeader>
          <CardContent>
            <div className={`text-2xl font-bold ${getBalanceColor(saldoFinal)}`}>{formatCurrency(saldoFinal)}</div>
            <p className="text-xs text-slate-600 mt-1">Após todas as despesas</p>
          </CardContent>
        </Card>
      </div>

      {/* Expense Distribution */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <Card className="shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <PieChart className="w-5 h-5 text-blue-600" aria-hidden="true" />
              Distribuição de Gastos
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Necessidades</span>
                <span className="text-sm font-bold">{formatCurrency(totalNecessidades)}</span>
              </div>
              <Progress
                value={(totalNecessidades / renda.salarioLiquido) * 100}
                className="h-3 bg-slate-200"
                aria-label={`Necessidades: ${((totalNecessidades / renda.salarioLiquido) * 100).toFixed(1)}% da renda`}
              />
              <p className="text-xs text-slate-600">
                {((totalNecessidades / renda.salarioLiquido) * 100).toFixed(1)}% da renda
              </p>
            </div>

            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Desejos</span>
                <span className="text-sm font-bold">{formatCurrency(totalDesejos)}</span>
              </div>
              <Progress
                value={(totalDesejos / renda.salarioLiquido) * 100}
                className="h-3 bg-slate-200"
                aria-label={`Desejos: ${((totalDesejos / renda.salarioLiquido) * 100).toFixed(1)}% da renda`}
              />
              <p className="text-xs text-slate-600">
                {((totalDesejos / renda.salarioLiquido) * 100).toFixed(1)}% da renda
              </p>
            </div>

            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Dívidas</span>
                <span className="text-sm font-bold">{formatCurrency(totalDividas)}</span>
              </div>
              <Progress
                value={(totalDividas / renda.salarioLiquido) * 100}
                className="h-3 bg-slate-200"
                aria-label={`Dívidas: ${((totalDividas / renda.salarioLiquido) * 100).toFixed(1)}% da renda`}
              />
              <p className="text-xs text-slate-600">
                {((totalDividas / renda.salarioLiquido) * 100).toFixed(1)}% da renda
              </p>
            </div>
          </CardContent>
        </Card>

        <Card className="shadow-lg hover:shadow-xl transition-shadow">
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Calculator className="w-5 h-5 text-blue-600" aria-hidden="true" />
              Resumo Financeiro
            </CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-3">
              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-emerald-50 to-emerald-100 rounded-lg border border-emerald-200">
                <span className="font-medium text-emerald-800">Renda Mensal</span>
                <span className="font-bold text-emerald-700">{formatCurrency(renda.salarioLiquido)}</span>
              </div>

              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-red-50 to-red-100 rounded-lg border border-red-200">
                <span className="font-medium text-red-800">Total de Despesas</span>
                <span className="font-bold text-red-700">-{formatCurrency(totalDespesas)}</span>
              </div>

              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-slate-50 to-slate-100 rounded-lg border border-slate-200">
                <span className="font-medium text-slate-800">Saldo após Despesas</span>
                <span className={`font-bold ${getBalanceColor(saldoAposDespesas)}`}>
                  {formatCurrency(saldoAposDespesas)}
                </span>
              </div>

              <div className="flex justify-between items-center p-3 bg-gradient-to-r from-orange-50 to-orange-100 rounded-lg border border-orange-200">
                <span className="font-medium text-orange-800">Dívidas</span>
                <span className="font-bold text-orange-700">-{formatCurrency(totalDividas)}</span>
              </div>

              <div
                className={`flex justify-between items-center p-3 rounded-lg border ${getBalanceBgColor(saldoFinal)} bg-gradient-to-r`}
              >
                <span className="font-medium">Saldo Final</span>
                <span className={`font-bold text-lg ${getBalanceColor(saldoFinal)}`}>{formatCurrency(saldoFinal)}</span>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </>
  )
}
```

## File: components/theme-provider.tsx
```typescript
'use client'

import * as React from 'react'
import {
  ThemeProvider as NextThemesProvider,
  type ThemeProviderProps,
} from 'next-themes'

export function ThemeProvider({ children, ...props }: ThemeProviderProps) {
  return <NextThemesProvider {...props}>{children}</NextThemesProvider>
}
```

## File: config/nginx.conf
```
# V0 Project - Nginx Configuration
# High-performance, secure web server configuration

# Main context
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

# Events context
events {
    worker_connections 2048;
    use epoll;
    multi_accept on;
}

# HTTP context
http {
    # Basic Settings
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    keepalive_requests 1000;
    types_hash_max_size 2048;
    server_tokens off;
    client_max_body_size 10M;
    
    # MIME types
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    
    # Logging Settings
    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                   '$status $body_bytes_sent "$http_referer" '
                   '"$http_user_agent" "$http_x_forwarded_for" '
                   'rt=$request_time uct="$upstream_connect_time" '
                   'uht="$upstream_header_time" urt="$upstream_response_time"';
    
    access_log /var/log/nginx/v0-access.log main;
    error_log /var/log/nginx/v0-error.log warn;
    
    # Gzip Settings
    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types
        text/plain
        text/css
        text/xml
        text/javascript
        application/json
        application/javascript
        application/xml+rss
        application/atom+xml
        image/svg+xml;
    
    # Rate Limiting
    limit_req_zone $binary_remote_addr zone=api:10m rate=10r/s;
    limit_req_zone $binary_remote_addr zone=login:10m rate=1r/s;
    limit_req_zone $binary_remote_addr zone=general:10m rate=30r/s;
    
    # Connection Limiting
    limit_conn_zone $binary_remote_addr zone=conn_limit_per_ip:10m;
    limit_conn_zone $server_name zone=conn_limit_per_server:10m;
    
    # Security Headers Map
    map $sent_http_content_type $content_security_policy {
        ~*text/html "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval' https://cdn.jsdelivr.net; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com; font-src 'self' https://fonts.gstatic.com; img-src 'self' data: https:; connect-src 'self' wss: https:; frame-ancestors 'none'; base-uri 'self'; form-action 'self'";
    }
    
    # Upstream for Node.js application
    upstream v0_app {
        least_conn;
        server 127.0.0.1:3000 max_fails=3 fail_timeout=30s;
        server 127.0.0.1:3001 max_fails=3 fail_timeout=30s backup;
        keepalive 32;
    }
    
    # HTTP to HTTPS redirect
    server {
        listen 80;
        listen [::]:80;
        server_name your-domain.com www.your-domain.com;
        
        # Security headers even for redirects
        add_header X-Frame-Options DENY always;
        add_header X-Content-Type-Options nosniff always;
        add_header X-XSS-Protection "1; mode=block" always;
        
        # Let's Encrypt challenge
        location /.well-known/acme-challenge/ {
            root /var/www/certbot;
        }
        
        # Redirect all HTTP traffic to HTTPS
        location / {
            return 301 https://$server_name$request_uri;
        }
    }
    
    # Main HTTPS server
    server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name your-domain.com www.your-domain.com;
        
        # SSL Configuration
        ssl_certificate /etc/letsencrypt/live/your-domain.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/your-domain.com/privkey.pem;
        ssl_trusted_certificate /etc/letsencrypt/live/your-domain.com/chain.pem;
        
        # SSL Settings
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA384;
        ssl_prefer_server_ciphers off;
        ssl_session_cache shared:SSL:10m;
        ssl_session_timeout 10m;
        ssl_session_tickets off;
        
        # OCSP Stapling
        ssl_stapling on;
        ssl_stapling_verify on;
        resolver 8.8.8.8 8.8.4.4 valid=300s;
        resolver_timeout 5s;
        
        # Security Headers
        add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload" always;
        add_header X-Frame-Options DENY always;
        add_header X-Content-Type-Options nosniff always;
        add_header X-XSS-Protection "1; mode=block" always;
        add_header Referrer-Policy "strict-origin-when-cross-origin" always;
        add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always;
        add_header Content-Security-Policy $content_security_policy always;
        
        # Connection limits
        limit_conn conn_limit_per_ip 20;
        limit_conn conn_limit_per_server 1000;
        
        # Root directory
        root /var/www/v0-project/public;
        index index.html;
        
        # Logging
        access_log /var/log/nginx/v0-access.log main;
        error_log /var/log/nginx/v0-error.log;
        
        # Static files caching
        location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot)$ {
            expires 1y;
            add_header Cache-Control "public, immutable";
            add_header X-Content-Type-Options nosniff always;
            
            # CORS for fonts
            location ~* \.(woff|woff2|ttf|eot)$ {
                add_header Access-Control-Allow-Origin "*";
            }
        }
        
        # API routes with rate limiting
        location /api/ {
            limit_req zone=api burst=20 nodelay;
            limit_req_status 429;
            
            # Proxy settings
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Port $server_port;
            
            # Timeouts
            proxy_connect_timeout 5s;
            proxy_send_timeout 60s;
            proxy_read_timeout 60s;
            
            # Buffering
            proxy_buffering on;
            proxy_buffer_size 4k;
            proxy_buffers 8 4k;
            proxy_busy_buffers_size 8k;
            
            # Cache control for API responses
            add_header Cache-Control "no-cache, no-store, must-revalidate" always;
            add_header Pragma "no-cache" always;
            add_header Expires "0" always;
        }
        
        # Authentication routes with stricter rate limiting
        location ~ ^/(api/auth|api/login|api/register) {
            limit_req zone=login burst=5 nodelay;
            limit_req_status 429;
            
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            
            # Additional security for auth endpoints
            add_header X-Frame-Options DENY always;
            add_header Cache-Control "no-cache, no-store, must-revalidate" always;
        }
        
        # WebSocket support
        location /ws {
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            
            # WebSocket specific timeouts
            proxy_read_timeout 86400s;
            proxy_send_timeout 86400s;
        }
        
        # Health check endpoint (no rate limiting)
        location /health {
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            
            access_log off;
        }
        
        # Admin panel with IP restriction
        location /admin {
            # Restrict to specific IPs (update with your admin IPs)
            allow 192.168.1.0/24;
            allow 10.0.0.0/8;
            deny all;
            
            limit_req zone=general burst=10 nodelay;
            
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
        
        # File uploads
        location /api/upload {
            limit_req zone=api burst=5 nodelay;
            client_max_body_size 50M;
            
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            
            # Upload specific timeouts
            proxy_connect_timeout 10s;
            proxy_send_timeout 300s;
            proxy_read_timeout 300s;
        }
        
        # Next.js application (catch-all)
        location / {
            limit_req zone=general burst=50 nodelay;
            
            # Try static files first, then proxy to app
            try_files $uri $uri/ @nextjs;
        }
        
        # Next.js proxy
        location @nextjs {
            proxy_pass http://v0_app;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection 'upgrade';
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_cache_bypass $http_upgrade;
            
            # Timeouts
            proxy_connect_timeout 5s;
            proxy_send_timeout 60s;
            proxy_read_timeout 60s;
        }
        
        # Security: Block access to sensitive files
        location ~ /\. {
            deny all;
            access_log off;
            log_not_found off;
        }
        
        location ~ \.(env|config|log|sql|md)$ {
            deny all;
            access_log off;
            log_not_found off;
        }
        
        # Block common attack patterns
        location ~* (wp-admin|wp-login|phpmyadmin|admin|administrator) {
            deny all;
            access_log off;
            log_not_found off;
        }
        
        # Custom error pages
        error_page 404 /404.html;
        error_page 500 502 503 504 /50x.html;
        
        location = /404.html {
            root /var/www/v0-project/public;
            internal;
        }
        
        location = /50x.html {
            root /var/www/v0-project/public;
            internal;
        }
        
        # Monitoring endpoints for load balancer health checks
        location /nginx-health {
            access_log off;
            return 200 "healthy\n";
            add_header Content-Type text/plain;
        }
    }
    
    # Additional server block for www redirect
    server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name www.your-domain.com;
        
        ssl_certificate /etc/letsencrypt/live/your-domain.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/your-domain.com/privkey.pem;
        
        return 301 https://your-domain.com$request_uri;
    }
}

# Stream context for TCP/UDP load balancing (if needed)
stream {
    # Example: PostgreSQL load balancing
    upstream postgres_backend {
        server 127.0.0.1:5432 max_fails=3 fail_timeout=30s;
    }
    
    server {
        listen 5433;
        proxy_pass postgres_backend;
        proxy_timeout 1s;
        proxy_responses 1;
        error_log /var/log/nginx/postgres_proxy.log;
    }
}
```

## File: hooks/use-mobile.tsx
```typescript
import * as React from "react"

const MOBILE_BREAKPOINT = 768

export function useIsMobile() {
  const [isMobile, setIsMobile] = React.useState<boolean | undefined>(undefined)

  React.useEffect(() => {
    const mql = window.matchMedia(`(max-width: ${MOBILE_BREAKPOINT - 1}px)`)
    const onChange = () => {
      setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
    }
    mql.addEventListener("change", onChange)
    setIsMobile(window.innerWidth < MOBILE_BREAKPOINT)
    return () => mql.removeEventListener("change", onChange)
  }, [])

  return !!isMobile
}
```

## File: hooks/use-toast.ts
```typescript
"use client"

// Inspired by react-hot-toast library
import * as React from "react"

import type {
  ToastActionElement,
  ToastProps,
} from "@/components/ui/toast"

const TOAST_LIMIT = 1
const TOAST_REMOVE_DELAY = 1000000

type ToasterToast = ToastProps & {
  id: string
  title?: React.ReactNode
  description?: React.ReactNode
  action?: ToastActionElement
}

const actionTypes = {
  ADD_TOAST: "ADD_TOAST",
  UPDATE_TOAST: "UPDATE_TOAST",
  DISMISS_TOAST: "DISMISS_TOAST",
  REMOVE_TOAST: "REMOVE_TOAST",
} as const

let count = 0

function genId() {
  count = (count + 1) % Number.MAX_SAFE_INTEGER
  return count.toString()
}

type ActionType = typeof actionTypes

type Action =
  | {
      type: ActionType["ADD_TOAST"]
      toast: ToasterToast
    }
  | {
      type: ActionType["UPDATE_TOAST"]
      toast: Partial<ToasterToast>
    }
  | {
      type: ActionType["DISMISS_TOAST"]
      toastId?: ToasterToast["id"]
    }
  | {
      type: ActionType["REMOVE_TOAST"]
      toastId?: ToasterToast["id"]
    }

interface State {
  toasts: ToasterToast[]
}

const toastTimeouts = new Map<string, ReturnType<typeof setTimeout>>()

const addToRemoveQueue = (toastId: string) => {
  if (toastTimeouts.has(toastId)) {
    return
  }

  const timeout = setTimeout(() => {
    toastTimeouts.delete(toastId)
    dispatch({
      type: "REMOVE_TOAST",
      toastId: toastId,
    })
  }, TOAST_REMOVE_DELAY)

  toastTimeouts.set(toastId, timeout)
}

export const reducer = (state: State, action: Action): State => {
  switch (action.type) {
    case "ADD_TOAST":
      return {
        ...state,
        toasts: [action.toast, ...state.toasts].slice(0, TOAST_LIMIT),
      }

    case "UPDATE_TOAST":
      return {
        ...state,
        toasts: state.toasts.map((t) =>
          t.id === action.toast.id ? { ...t, ...action.toast } : t
        ),
      }

    case "DISMISS_TOAST": {
      const { toastId } = action

      // ! Side effects ! - This could be extracted into a dismissToast() action,
      // but I'll keep it here for simplicity
      if (toastId) {
        addToRemoveQueue(toastId)
      } else {
        state.toasts.forEach((toast) => {
          addToRemoveQueue(toast.id)
        })
      }

      return {
        ...state,
        toasts: state.toasts.map((t) =>
          t.id === toastId || toastId === undefined
            ? {
                ...t,
                open: false,
              }
            : t
        ),
      }
    }
    case "REMOVE_TOAST":
      if (action.toastId === undefined) {
        return {
          ...state,
          toasts: [],
        }
      }
      return {
        ...state,
        toasts: state.toasts.filter((t) => t.id !== action.toastId),
      }
  }
}

const listeners: Array<(state: State) => void> = []

let memoryState: State = { toasts: [] }

function dispatch(action: Action) {
  memoryState = reducer(memoryState, action)
  listeners.forEach((listener) => {
    listener(memoryState)
  })
}

type Toast = Omit<ToasterToast, "id">

function toast({ ...props }: Toast) {
  const id = genId()

  const update = (props: ToasterToast) =>
    dispatch({
      type: "UPDATE_TOAST",
      toast: { ...props, id },
    })
  const dismiss = () => dispatch({ type: "DISMISS_TOAST", toastId: id })

  dispatch({
    type: "ADD_TOAST",
    toast: {
      ...props,
      id,
      open: true,
      onOpenChange: (open) => {
        if (!open) dismiss()
      },
    },
  })

  return {
    id: id,
    dismiss,
    update,
  }
}

function useToast() {
  const [state, setState] = React.useState<State>(memoryState)

  React.useEffect(() => {
    listeners.push(setState)
    return () => {
      const index = listeners.indexOf(setState)
      if (index > -1) {
        listeners.splice(index, 1)
      }
    }
  }, [state])

  return {
    ...state,
    toast,
    dismiss: (toastId?: string) => dispatch({ type: "DISMISS_TOAST", toastId }),
  }
}

export { useToast, toast }
```

## File: hooks/useFinancialData.ts
```typescript
"use client"

import { useState, useMemo } from "react"
import type { Conta, Pagamento, DepositoMeta, Renda, FinancialSummary } from "@/types/financial"

const initialContas: Conta[] = [
  {
    id: "1",
    nome: "Aluguel",
    valor: 1500,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "2",
    nome: "Condomínio",
    valor: 400,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "3",
    nome: "Energia",
    valor: 150,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "4",
    nome: "Internet",
    valor: 150,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "5",
    nome: "Celular",
    valor: 90,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Smartphone",
  },
  {
    id: "6",
    nome: "Supermercado",
    valor: 800,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "ShoppingCart",
  },
  {
    id: "7",
    nome: "Academia - Ramos",
    valor: 170,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "8",
    nome: "Academia - Gaya",
    valor: 170,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "9",
    nome: "Medicamentos - Ramos",
    valor: 470,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "10",
    nome: "Medicamentos - Gaya",
    valor: 150,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "11",
    nome: "Pet Shop - Racanto",
    valor: 250,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "12",
    nome: "Pet Shop - Asa Sul",
    valor: 100,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "13",
    nome: "Seguro Auto (Etios)",
    valor: 100,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Car",
  },
  {
    id: "14",
    nome: "Gasolina",
    valor: 300,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Car",
  },
  {
    id: "15",
    nome: "TecConcursos",
    valor: 80,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "16",
    nome: "Obsidian",
    valor: 35,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "17",
    nome: "Lavanderia",
    valor: 360,
    categoria: "necessidade",
    dataVencimento: 10,
    status: "ativo",
    icone: "Home",
  },
  {
    id: "18",
    nome: "Spotify",
    valor: 12,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "19",
    nome: "iCloud",
    valor: 100,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Smartphone",
  },
  {
    id: "20",
    nome: "ChatGPT",
    valor: 120,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "21",
    nome: "Raycast",
    valor: 59,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Calculator",
  },
  {
    id: "22",
    nome: "IPTV",
    valor: 30,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "23",
    nome: "POD",
    valor: 600,
    categoria: "desejo",
    dataVencimento: 10,
    status: "ativo",
    icone: "Heart",
  },
  {
    id: "24",
    nome: "William Ramos",
    valor: 2500,
    categoria: "divida",
    dataVencimento: 10,
    status: "ativo",
    icone: "CreditCard",
  },
]

const initialDepositos: DepositoMeta[] = [
  {
    id: "1",
    valor: 1500,
    data: "2025-01-15",
    descricao: "Depósito inicial",
  },
  {
    id: "2",
    valor: 800,
    data: "2025-01-20",
    descricao: "Economia do mês",
  },
]

export const useFinancialData = () => {
  const [contas, setContas] = useState<Conta[]>(initialContas)
  const [pagamentos, setPagamentos] = useState<Pagamento[]>([])
  const [depositosMeta, setDepositosMeta] = useState<DepositoMeta[]>(initialDepositos)
  const [renda] = useState<Renda>({ salarioLiquido: 8600 })

  const contasAtivas = useMemo(() => contas.filter((conta) => conta.status === "ativo"), [contas])

  const financialSummary = useMemo((): FinancialSummary => {
    const necessidades = contasAtivas.filter((conta) => conta.categoria === "necessidade")
    const desejos = contasAtivas.filter((conta) => conta.categoria === "desejo")
    const dividas = contasAtivas.filter((conta) => conta.categoria === "divida")

    const totalNecessidades = necessidades.reduce((sum, item) => sum + item.valor, 0)
    const totalDesejos = desejos.reduce((sum, item) => sum + item.valor, 0)
    const totalDividas = dividas.reduce((sum, item) => sum + item.valor, 0)
    const totalDespesas = totalNecessidades + totalDesejos
    const saldoAposDespesas = renda.salarioLiquido - totalDespesas
    const saldoFinal = saldoAposDespesas - totalDividas

    return {
      totalNecessidades,
      totalDesejos,
      totalDividas,
      totalDespesas,
      saldoAposDespesas,
      saldoFinal,
    }
  }, [contasAtivas, renda.salarioLiquido])

  const addConta = (novaConta: Omit<Conta, "id">) => {
    const conta: Conta = {
      ...novaConta,
      id: Date.now().toString(),
    }
    setContas((prev) => [...prev, conta])
  }

  const updateConta = (id: string, updatedConta: Partial<Conta>) => {
    setContas((prev) => prev.map((conta) => (conta.id === id ? { ...conta, ...updatedConta } : conta)))
  }

  const deleteConta = (id: string) => {
    setContas((prev) => prev.filter((conta) => conta.id !== id))
    setPagamentos((prev) => prev.filter((pagamento) => pagamento.contaId !== id))
  }

  const toggleContaStatus = (id: string) => {
    setContas((prev) =>
      prev.map((conta) =>
        conta.id === id ? { ...conta, status: conta.status === "ativo" ? "suspenso" : "ativo" } : conta,
      ),
    )
  }

  const togglePagamento = (contaId: string, mes: number, ano: number) => {
    const pagamentoExistente = pagamentos.find((p) => p.contaId === contaId && p.mes === mes && p.ano === ano)

    if (pagamentoExistente) {
      setPagamentos((prev) =>
        prev.map((p) =>
          p.contaId === contaId && p.mes === mes && p.ano === ano
            ? {
                ...p,
                pago: !p.pago,
                dataPagamento: !p.pago ? new Date().toISOString().split("T")[0] : undefined,
              }
            : p,
        ),
      )
    } else {
      setPagamentos((prev) => [
        ...prev,
        {
          contaId,
          mes,
          ano,
          pago: true,
          dataPagamento: new Date().toISOString().split("T")[0],
        },
      ])
    }
  }

  const isPago = (contaId: string, mes: number, ano: number): boolean => {
    const pagamento = pagamentos.find((p) => p.contaId === contaId && p.mes === mes && p.ano === ano)
    return pagamento?.pago || false
  }

  const addDeposito = (novoDeposito: Omit<DepositoMeta, "id" | "data">) => {
    const deposito: DepositoMeta = {
      ...novoDeposito,
      id: Date.now().toString(),
      data: new Date().toISOString().split("T")[0],
    }
    setDepositosMeta((prev) => [...prev, deposito])
  }

  const deleteDeposito = (id: string) => {
    setDepositosMeta((prev) => prev.filter((deposito) => deposito.id !== id))
  }

  return {
    contas,
    contasAtivas,
    pagamentos,
    depositosMeta,
    renda,
    financialSummary,
    addConta,
    updateConta,
    deleteConta,
    toggleContaStatus,
    togglePagamento,
    isPago,
    addDeposito,
    deleteDeposito,
  }
}
```

## File: lib/utils.ts
```typescript
import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

## File: public/placeholder-logo.svg
```
<svg xmlns="http://www.w3.org/2000/svg" width="215" height="48" fill="none"><path fill="#000" d="M57.588 9.6h6L73.828 38h-5.2l-2.36-6.88h-11.36L52.548 38h-5.2l10.24-28.4Zm7.16 17.16-4.16-12.16-4.16 12.16h8.32Zm23.694-2.24c-.186-1.307-.706-2.32-1.56-3.04-.853-.72-1.866-1.08-3.04-1.08-1.68 0-2.986.613-3.92 1.84-.906 1.227-1.36 2.947-1.36 5.16s.454 3.933 1.36 5.16c.934 1.227 2.24 1.84 3.92 1.84 1.254 0 2.307-.373 3.16-1.12.854-.773 1.387-1.867 1.6-3.28l5.12.24c-.186 1.68-.733 3.147-1.64 4.4-.906 1.227-2.08 2.173-3.52 2.84-1.413.667-2.986 1-4.72 1-2.08 0-3.906-.453-5.48-1.36-1.546-.907-2.76-2.2-3.64-3.88-.853-1.68-1.28-3.627-1.28-5.84 0-2.24.427-4.187 1.28-5.84.88-1.68 2.094-2.973 3.64-3.88 1.574-.907 3.4-1.36 5.48-1.36 1.68 0 3.227.32 4.64.96 1.414.64 2.56 1.56 3.44 2.76.907 1.2 1.454 2.6 1.64 4.2l-5.12.28Zm11.486-7.72.12 3.4c.534-1.227 1.307-2.173 2.32-2.84 1.04-.693 2.267-1.04 3.68-1.04 1.494 0 2.76.387 3.8 1.16 1.067.747 1.827 1.813 2.28 3.2.507-1.44 1.294-2.52 2.36-3.24 1.094-.747 2.414-1.12 3.96-1.12 1.414 0 2.64.307 3.68.92s1.84 1.52 2.4 2.72c.56 1.2.84 2.667.84 4.4V38h-4.96V25.92c0-1.813-.293-3.187-.88-4.12-.56-.96-1.413-1.44-2.56-1.44-.906 0-1.68.213-2.32.64-.64.427-1.133 1.053-1.48 1.88-.32.827-.48 1.84-.48 3.04V38h-4.56V25.92c0-1.2-.133-2.213-.4-3.04-.24-.827-.626-1.453-1.16-1.88-.506-.427-1.133-.64-1.88-.64-.906 0-1.68.227-2.32.68-.64.427-1.133 1.053-1.48 1.88-.32.827-.48 1.827-.48 3V38h-4.96V16.8h4.48Zm26.723 10.6c0-2.24.427-4.187 1.28-5.84.854-1.68 2.067-2.973 3.64-3.88 1.574-.907 3.4-1.36 5.48-1.36 1.84 0 3.494.413 4.96 1.24 1.467.827 2.64 2.08 3.52 3.76.88 1.653 1.347 3.693 1.4 6.12v1.32h-15.08c.107 1.813.614 3.227 1.52 4.24.907.987 2.134 1.48 3.68 1.48.987 0 1.88-.253 2.68-.76a4.803 4.803 0 0 0 1.84-2.2l5.08.36c-.64 2.027-1.84 3.64-3.6 4.84-1.733 1.173-3.733 1.76-6 1.76-2.08 0-3.906-.453-5.48-1.36-1.573-.907-2.786-2.2-3.64-3.88-.853-1.68-1.28-3.627-1.28-5.84Zm15.16-2.04c-.213-1.733-.76-3.013-1.64-3.84-.853-.827-1.893-1.24-3.12-1.24-1.44 0-2.6.453-3.48 1.36-.88.88-1.44 2.12-1.68 3.72h9.92ZM163.139 9.6V38h-5.04V9.6h5.04Zm8.322 7.2.24 5.88-.64-.36c.32-2.053 1.094-3.56 2.32-4.52 1.254-.987 2.787-1.48 4.6-1.48 2.32 0 4.107.733 5.36 2.2 1.254 1.44 1.88 3.387 1.88 5.84V38h-4.96V25.92c0-1.253-.12-2.28-.36-3.08-.24-.8-.64-1.413-1.2-1.84-.533-.427-1.253-.64-2.16-.64-1.44 0-2.573.48-3.4 1.44-.8.933-1.2 2.307-1.2 4.12V38h-4.96V16.8h4.48Zm30.003 7.72c-.186-1.307-.706-2.32-1.56-3.04-.853-.72-1.866-1.08-3.04-1.08-1.68 0-2.986.613-3.92 1.84-.906 1.227-1.36 2.947-1.36 5.16s.454 3.933 1.36 5.16c.934 1.227 2.24 1.84 3.92 1.84 1.254 0 2.307-.373 3.16-1.12.854-.773 1.387-1.867 1.6-3.28l5.12.24c-.186 1.68-.733 3.147-1.64 4.4-.906 1.227-2.08 2.173-3.52 2.84-1.413.667-2.986 1-4.72 1-2.08 0-3.906-.453-5.48-1.36-1.546-.907-2.76-2.2-3.64-3.88-.853-1.68-1.28-3.627-1.28-5.84 0-2.24.427-4.187 1.28-5.84.88-1.68 2.094-2.973 3.64-3.88 1.574-.907 3.4-1.36 5.48-1.36 1.68 0 3.227.32 4.64.96 1.414.64 2.56 1.56 3.44 2.76.907 1.2 1.454 2.6 1.64 4.2l-5.12.28Zm11.443 8.16V38h-5.6v-5.32h5.6Z"/><path fill="#171717" fill-rule="evenodd" d="m7.839 40.783 16.03-28.054L20 6 0 40.783h7.839Zm8.214 0H40L27.99 19.894l-4.02 7.032 3.976 6.914H20.02l-3.967 6.943Z" clip-rule="evenodd"/></svg>
```

## File: public/placeholder.svg
```
<svg xmlns="http://www.w3.org/2000/svg" width="1200" height="1200" fill="none"><rect width="1200" height="1200" fill="#EAEAEA" rx="3"/><g opacity=".5"><g opacity=".5"><path fill="#FAFAFA" d="M600.709 736.5c-75.454 0-136.621-61.167-136.621-136.62 0-75.454 61.167-136.621 136.621-136.621 75.453 0 136.62 61.167 136.62 136.621 0 75.453-61.167 136.62-136.62 136.62Z"/><path stroke="#C9C9C9" stroke-width="2.418" d="M600.709 736.5c-75.454 0-136.621-61.167-136.621-136.62 0-75.454 61.167-136.621 136.621-136.621 75.453 0 136.62 61.167 136.62 136.621 0 75.453-61.167 136.62-136.62 136.62Z"/></g><path stroke="url(#a)" stroke-width="2.418" d="M0-1.209h553.581" transform="scale(1 -1) rotate(45 1163.11 91.165)"/><path stroke="url(#b)" stroke-width="2.418" d="M404.846 598.671h391.726"/><path stroke="url(#c)" stroke-width="2.418" d="M599.5 795.742V404.017"/><path stroke="url(#d)" stroke-width="2.418" d="m795.717 796.597-391.441-391.44"/><path fill="#fff" d="M600.709 656.704c-31.384 0-56.825-25.441-56.825-56.824 0-31.384 25.441-56.825 56.825-56.825 31.383 0 56.824 25.441 56.824 56.825 0 31.383-25.441 56.824-56.824 56.824Z"/><g clip-path="url(#e)"><path fill="#666" fill-rule="evenodd" d="M616.426 586.58h-31.434v16.176l3.553-3.554.531-.531h9.068l.074-.074 8.463-8.463h2.565l7.18 7.181V586.58Zm-15.715 14.654 3.698 3.699 1.283 1.282-2.565 2.565-1.282-1.283-5.2-5.199h-6.066l-5.514 5.514-.073.073v2.876a2.418 2.418 0 0 0 2.418 2.418h26.598a2.418 2.418 0 0 0 2.418-2.418v-8.317l-8.463-8.463-7.181 7.181-.071.072Zm-19.347 5.442v4.085a6.045 6.045 0 0 0 6.046 6.045h26.598a6.044 6.044 0 0 0 6.045-6.045v-7.108l1.356-1.355-1.282-1.283-.074-.073v-17.989h-38.689v23.43l-.146.146.146.147Z" clip-rule="evenodd"/></g><path stroke="#C9C9C9" stroke-width="2.418" d="M600.709 656.704c-31.384 0-56.825-25.441-56.825-56.824 0-31.384 25.441-56.825 56.825-56.825 31.383 0 56.824 25.441 56.824 56.825 0 31.383-25.441 56.824-56.824 56.824Z"/></g><defs><linearGradient id="a" x1="554.061" x2="-.48" y1=".083" y2=".087" gradientUnits="userSpaceOnUse"><stop stop-color="#C9C9C9" stop-opacity="0"/><stop offset=".208" stop-color="#C9C9C9"/><stop offset=".792" stop-color="#C9C9C9"/><stop offset="1" stop-color="#C9C9C9" stop-opacity="0"/></linearGradient><linearGradient id="b" x1="796.912" x2="404.507" y1="599.963" y2="599.965" gradientUnits="userSpaceOnUse"><stop stop-color="#C9C9C9" stop-opacity="0"/><stop offset=".208" stop-color="#C9C9C9"/><stop offset=".792" stop-color="#C9C9C9"/><stop offset="1" stop-color="#C9C9C9" stop-opacity="0"/></linearGradient><linearGradient id="c" x1="600.792" x2="600.794" y1="403.677" y2="796.082" gradientUnits="userSpaceOnUse"><stop stop-color="#C9C9C9" stop-opacity="0"/><stop offset=".208" stop-color="#C9C9C9"/><stop offset=".792" stop-color="#C9C9C9"/><stop offset="1" stop-color="#C9C9C9" stop-opacity="0"/></linearGradient><linearGradient id="d" x1="404.85" x2="796.972" y1="403.903" y2="796.02" gradientUnits="userSpaceOnUse"><stop stop-color="#C9C9C9" stop-opacity="0"/><stop offset=".208" stop-color="#C9C9C9"/><stop offset=".792" stop-color="#C9C9C9"/><stop offset="1" stop-color="#C9C9C9" stop-opacity="0"/></linearGradient><clipPath id="e"><path fill="#fff" d="M581.364 580.535h38.689v38.689h-38.689z"/></clipPath></defs></svg>
```

## File: scripts/backup.sh
```bash
#!/bin/bash

# V0 Project - Backup Script
# Comprehensive backup solution with encryption and rotation

set -e

# Configuration
PROJECT_NAME="v0-project"
BACKUP_BASE_DIR="/var/backups/v0-project"
APP_DIR="/var/www/v0-project"
LOG_FILE="/var/log/v0-project/backup.log"
RETENTION_DAYS=30
ENCRYPTION_KEY="${BACKUP_ENCRYPTION_KEY:-}"
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL:-}"

# Database configuration
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="v0_tactical_db"
DB_USER="v0_user"
DB_PASSWORD="${DATABASE_PASSWORD:-}"

# S3 configuration (optional)
S3_BUCKET="${BACKUP_S3_BUCKET:-}"
S3_REGION="${BACKUP_S3_REGION:-us-east-1}"
AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID:-}"
AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY:-}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
    send_notification "❌ Backup Failed" "$1" "danger"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

# Send Slack notification
send_notification() {
    local title="$1"
    local message="$2"
    local color="${3:-good}"
    
    if [ -n "$SLACK_WEBHOOK" ]; then
        curl -X POST -H 'Content-type: application/json' \
            --data "{
                \"attachments\": [{
                    \"color\": \"$color\",
                    \"title\": \"$title\",
                    \"text\": \"$message\",
                    \"footer\": \"V0 Project Backup\",
                    \"ts\": $(date +%s)
                }]
            }" \
            "$SLACK_WEBHOOK" > /dev/null 2>&1 || true
    fi
}

# Create backup directory structure
create_backup_structure() {
    local backup_date="$1"
    local backup_dir="$BACKUP_BASE_DIR/$backup_date"
    
    mkdir -p "$backup_dir"/{database,application,logs,config}
    echo "$backup_dir"
}

# Backup database
backup_database() {
    local backup_dir="$1"
    local db_backup_file="$backup_dir/database/database.sql"
    
    log "📊 Backing up database..."
    
    # Set password for pg_dump
    export PGPASSWORD="$DB_PASSWORD"
    
    # Create database backup
    pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
        --verbose --clean --if-exists --create \
        > "$db_backup_file" || error "Failed to backup database"
    
    # Compress database backup
    gzip "$db_backup_file" || error "Failed to compress database backup"
    
    # Get backup size
    local backup_size=$(du -h "$db_backup_file.gz" | cut -f1)
    log "Database backup completed: $backup_size"
    
    # Unset password
    unset PGPASSWORD
}

# Backup application files
backup_application() {
    local backup_dir="$1"
    local app_backup_file="$backup_dir/application/app-files.tar.gz"
    
    log "📁 Backing up application files..."
    
    # Create application backup excluding unnecessary files
    tar -czf "$app_backup_file" \
        -C "$APP_DIR" \
        --exclude='node_modules' \
        --exclude='.git' \
        --exclude='.next' \
        --exclude='logs' \
        --exclude='*.log' \
        --exclude='uploads/temp' \
        . || error "Failed to backup application files"
    
    local backup_size=$(du -h "$app_backup_file" | cut -f1)
    log "Application backup completed: $backup_size"
}

# Backup logs
backup_logs() {
    local backup_dir="$1"
    local logs_backup_file="$backup_dir/logs/logs.tar.gz"
    
    log "📋 Backing up logs..."
    
    if [ -d "/var/log/v0-project" ]; then
        tar -czf "$logs_backup_file" \
            -C "/var/log" \
            "v0-project" || warning "Failed to backup logs"
        
        local backup_size=$(du -h "$logs_backup_file" | cut -f1)
        log "Logs backup completed: $backup_size"
    else
        warning "Logs directory not found, skipping logs backup"
    fi
}

# Backup configuration files
backup_config() {
    local backup_dir="$1"
    local config_backup_file="$backup_dir/config/config.tar.gz"
    
    log "⚙️ Backing up configuration files..."
    
    # Create temporary directory for config files
    local temp_config_dir=$(mktemp -d)
    
    # Copy configuration files
    cp "$APP_DIR/.env.local" "$temp_config_dir/" 2>/dev/null || true
    cp "$APP_DIR/ecosystem.config.js" "$temp_config_dir/" 2>/dev/null || true
    cp "/etc/nginx/sites-available/v0-project" "$temp_config_dir/nginx.conf" 2>/dev/null || true
    
    # PM2 configuration
    pm2 save > /dev/null 2>&1 || true
    cp ~/.pm2/dump.pm2 "$temp_config_dir/" 2>/dev/null || true
    
    # Create config backup
    if [ "$(ls -A $temp_config_dir)" ]; then
        tar -czf "$config_backup_file" -C "$temp_config_dir" . || warning "Failed to backup configuration"
        local backup_size=$(du -h "$config_backup_file" | cut -f1)
        log "Configuration backup completed: $backup_size"
    else
        warning "No configuration files found to backup"
    fi
    
    # Clean up temporary directory
    rm -rf "$temp_config_dir"
}

# Encrypt backup
encrypt_backup() {
    local backup_dir="$1"
    
    if [ -n "$ENCRYPTION_KEY" ]; then
        log "🔒 Encrypting backup..."
        
        # Create encrypted archive
        local encrypted_file="$backup_dir.tar.gz.enc"
        tar -czf - -C "$BACKUP_BASE_DIR" "$(basename "$backup_dir")" | \
            openssl enc -aes-256-cbc -salt -k "$ENCRYPTION_KEY" > "$encrypted_file" || \
            error "Failed to encrypt backup"
        
        # Remove unencrypted backup
        rm -rf "$backup_dir"
        
        local backup_size=$(du -h "$encrypted_file" | cut -f1)
        log "Backup encrypted: $backup_size"
        
        echo "$encrypted_file"
    else
        # Just compress the backup
        local compressed_file="$backup_dir.tar.gz"
        tar -czf "$compressed_file" -C "$BACKUP_BASE_DIR" "$(basename "$backup_dir")" || \
            error "Failed to compress backup"
        
        rm -rf "$backup_dir"
        
        local backup_size=$(du -h "$compressed_file" | cut -f1)
        log "Backup compressed: $backup_size"
        
        echo "$compressed_file"
    fi
}

# Upload to S3 (optional)
upload_to_s3() {
    local backup_file="$1"
    
    if [ -n "$S3_BUCKET" ] && [ -n "$AWS_ACCESS_KEY_ID" ] && [ -n "$AWS_SECRET_ACCESS_KEY" ]; then
        log "☁️ Uploading backup to S3..."
        
        # Install AWS CLI if not present
        if ! command -v aws &> /dev/null; then
            warning "AWS CLI not found, skipping S3 upload"
            return
        fi
        
        # Upload to S3
        aws s3 cp "$backup_file" "s3://$S3_BUCKET/v0-project-backups/" \
            --region "$S3_REGION" || warning "Failed to upload backup to S3"
        
        success "Backup uploaded to S3"
    fi
}

# Clean old backups
cleanup_old_backups() {
    log "🧹 Cleaning up old backups..."
    
    # Remove local backups older than retention period
    find "$BACKUP_BASE_DIR" -name "*.tar.gz*" -type f -mtime +$RETENTION_DAYS -delete || true
    
    # Clean up S3 backups if configured
    if [ -n "$S3_BUCKET" ] && command -v aws &> /dev/null; then
        local cutoff_date=$(date -d "$RETENTION_DAYS days ago" +%Y-%m-%d)
        aws s3 ls "s3://$S3_BUCKET/v0-project-backups/" | \
            awk '$1 < "'$cutoff_date'" {print $4}' | \
            while read -r file; do
                aws s3 rm "s3://$S3_BUCKET/v0-project-backups/$file" || true
            done
    fi
    
    log "Old backups cleaned up"
}

# Generate backup report
generate_report() {
    local backup_file="$1"
    local start_time="$2"
    local end_time="$3"
    
    local duration=$((end_time - start_time))
    local backup_size=$(du -h "$backup_file" | cut -f1)
    local backup_name=$(basename "$backup_file")
    
    cat > "$BACKUP_BASE_DIR/last-backup-report.txt" << EOF
V0 Project Backup Report
========================

Backup Name: $backup_name
Backup Size: $backup_size
Start Time: $(date -d @$start_time)
End Time: $(date -d @$end_time)
Duration: ${duration} seconds
Status: SUCCESS

Components Backed Up:
- Database (PostgreSQL)
- Application Files
- Configuration Files
- Log Files

Backup Location: $backup_file
$([ -n "$S3_BUCKET" ] && echo "S3 Location: s3://$S3_BUCKET/v0-project-backups/")

Next Backup: $(date -d "tomorrow" +"%Y-%m-%d %H:%M:%S")
EOF

    log "📊 Backup report generated"
}

# Main backup function
main() {
    local start_time=$(date +%s)
    local backup_date=$(date +%Y%m%d-%H%M%S)
    
    log "🚀 Starting backup process: $backup_date"
    send_notification "🔄 Backup Started" "Starting backup process for V0 Project" "warning"
    
    # Create backup directory structure
    local backup_dir=$(create_backup_structure "$backup_date")
    
    # Perform backups
    backup_database "$backup_dir"
    backup_application "$backup_dir"
    backup_logs "$backup_dir"
    backup_config "$backup_dir"
    
    # Create backup manifest
    cat > "$backup_dir/manifest.json" << EOF
{
    "backup_date": "$backup_date",
    "created_at": "$(date -Iseconds)",
    "project_name": "$PROJECT_NAME",
    "git_commit": "$(cd "$APP_DIR" 2>/dev/null && git rev-parse HEAD 2>/dev/null || echo 'unknown')",
    "node_version": "$(node --version)",
    "database_name": "$DB_NAME",
    "encrypted": $([ -n "$ENCRYPTION_KEY" ] && echo "true" || echo "false")
}
EOF
    
    # Encrypt/compress backup
    local final_backup_file=$(encrypt_backup "$backup_dir")
    
    # Upload to S3 if configured
    upload_to_s3 "$final_backup_file"
    
    # Clean up old backups
    cleanup_old_backups
    
    local end_time=$(date +%s)
    
    # Generate report
    generate_report "$final_backup_file" "$start_time" "$end_time"
    
    success "✅ Backup completed successfully: $(basename "$final_backup_file")"
    send_notification "✅ Backup Completed" "Backup completed successfully: $(basename "$final_backup_file")" "good"
    
    log "🎉 Backup process finished"
}

# Check if running as correct user
if [ "$EUID" -eq 0 ]; then
    error "This script should not be run as root"
fi

# Create necessary directories
mkdir -p "$BACKUP_BASE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# Run main backup function
main "$@"
```

## File: scripts/database-setup.sql
```sql
-- V0 Project - Database Setup Script
-- PostgreSQL 14+ Database Schema and Configuration

-- Create database if it doesn't exist
SELECT 'CREATE DATABASE v0_tactical_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'v0_tactical_db')\gexec

-- Connect to the database
\c v0_tactical_db;

-- Enable required extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "pg_stat_statements";
CREATE EXTENSION IF NOT EXISTS "btree_gin";

-- Create custom types
CREATE TYPE user_role AS ENUM ('admin', 'operator', 'analyst', 'viewer');
CREATE TYPE system_status AS ENUM ('online', 'offline', 'maintenance', 'error');
CREATE TYPE alert_severity AS ENUM ('low', 'medium', 'high', 'critical');
CREATE TYPE operation_status AS ENUM ('pending', 'running', 'completed', 'failed', 'cancelled');

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role user_role DEFAULT 'viewer',
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    avatar_url TEXT,
    is_active BOOLEAN DEFAULT true,
    last_login TIMESTAMP WITH TIME ZONE,
    failed_login_attempts INTEGER DEFAULT 0,
    locked_until TIMESTAMP WITH TIME ZONE,
    two_factor_enabled BOOLEAN DEFAULT false,
    two_factor_secret VARCHAR(32),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create sessions table
CREATE TABLE IF NOT EXISTS user_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    session_token VARCHAR(255) UNIQUE NOT NULL,
    refresh_token VARCHAR(255) UNIQUE,
    ip_address INET,
    user_agent TEXT,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    last_accessed TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create systems table
CREATE TABLE IF NOT EXISTS systems (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    system_type VARCHAR(50) NOT NULL,
    status system_status DEFAULT 'offline',
    endpoint_url TEXT,
    api_key_hash VARCHAR(255),
    configuration JSONB DEFAULT '{}',
    health_check_url TEXT,
    last_health_check TIMESTAMP WITH TIME ZONE,
    health_status BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create agents table
CREATE TABLE IF NOT EXISTS agents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    agent_type VARCHAR(50) NOT NULL,
    status system_status DEFAULT 'offline',
    system_id UUID REFERENCES systems(id) ON DELETE SET NULL,
    capabilities JSONB DEFAULT '[]',
    configuration JSONB DEFAULT '{}',
    last_heartbeat TIMESTAMP WITH TIME ZONE,
    version VARCHAR(20),
    location JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create operations table
CREATE TABLE IF NOT EXISTS operations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(200) NOT NULL,
    description TEXT,
    operation_type VARCHAR(50) NOT NULL,
    status operation_status DEFAULT 'pending',
    priority INTEGER DEFAULT 5 CHECK (priority >= 1 AND priority <= 10),
    assigned_to UUID REFERENCES users(id) ON DELETE SET NULL,
    system_id UUID REFERENCES systems(id) ON DELETE SET NULL,
    agent_id UUID REFERENCES agents(id) ON DELETE SET NULL,
    parameters JSONB DEFAULT '{}',
    result JSONB,
    error_message TEXT,
    started_at TIMESTAMP WITH TIME ZONE,
    completed_at TIMESTAMP WITH TIME ZONE,
    estimated_duration INTERVAL,
    actual_duration INTERVAL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create alerts table
CREATE TABLE IF NOT EXISTS alerts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    severity alert_severity DEFAULT 'medium',
    source VARCHAR(100),
    system_id UUID REFERENCES systems(id) ON DELETE SET NULL,
    agent_id UUID REFERENCES agents(id) ON DELETE SET NULL,
    operation_id UUID REFERENCES operations(id) ON DELETE SET NULL,
    acknowledged BOOLEAN DEFAULT false,
    acknowledged_by UUID REFERENCES users(id) ON DELETE SET NULL,
    acknowledged_at TIMESTAMP WITH TIME ZONE,
    resolved BOOLEAN DEFAULT false,
    resolved_by UUID REFERENCES users(id) ON DELETE SET NULL,
    resolved_at TIMESTAMP WITH TIME ZONE,
    metadata JSONB DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create intelligence_reports table
CREATE TABLE IF NOT EXISTS intelligence_reports (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(200) NOT NULL,
    content TEXT NOT NULL,
    report_type VARCHAR(50) NOT NULL,
    classification VARCHAR(20) DEFAULT 'unclassified',
    source VARCHAR(100),
    author_id UUID REFERENCES users(id) ON DELETE SET NULL,
    tags TEXT[],
    attachments JSONB DEFAULT '[]',
    metadata JSONB DEFAULT '{}',
    published BOOLEAN DEFAULT false,
    published_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create financial_data table
CREATE TABLE IF NOT EXISTS financial_data (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    symbol VARCHAR(20) NOT NULL,
    data_type VARCHAR(50) NOT NULL,
    period VARCHAR(20) NOT NULL,
    value DECIMAL(20,4),
    currency VARCHAR(3) DEFAULT 'USD',
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL,
    source VARCHAR(100),
    metadata JSONB DEFAULT '{}',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(symbol, data_type, period, timestamp)
);

-- Create audit_logs table
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES users(id) ON DELETE SET NULL,
    action VARCHAR(100) NOT NULL,
    resource_type VARCHAR(50),
    resource_id UUID,
    old_values JSONB,
    new_values JSONB,
    ip_address INET,
    user_agent TEXT,
    success BOOLEAN DEFAULT true,
    error_message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create webhooks table
CREATE TABLE IF NOT EXISTS webhooks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(100) NOT NULL,
    url TEXT NOT NULL,
    secret VARCHAR(255),
    events TEXT[] NOT NULL,
    active BOOLEAN DEFAULT true,
    retry_count INTEGER DEFAULT 3,
    timeout_seconds INTEGER DEFAULT 30,
    last_triggered TIMESTAMP WITH TIME ZONE,
    last_success TIMESTAMP WITH TIME ZONE,
    failure_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create webhook_deliveries table
CREATE TABLE IF NOT EXISTS webhook_deliveries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    webhook_id UUID NOT NULL REFERENCES webhooks(id) ON DELETE CASCADE,
    event_type VARCHAR(50) NOT NULL,
    payload JSONB NOT NULL,
    response_status INTEGER,
    response_body TEXT,
    response_time_ms INTEGER,
    success BOOLEAN DEFAULT false,
    attempt_number INTEGER DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create system_metrics table
CREATE TABLE IF NOT EXISTS system_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    system_id UUID REFERENCES systems(id) ON DELETE CASCADE,
    metric_name VARCHAR(100) NOT NULL,
    metric_value DECIMAL(20,4) NOT NULL,
    unit VARCHAR(20),
    tags JSONB DEFAULT '{}',
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON users(role);
CREATE INDEX IF NOT EXISTS idx_users_active ON users(is_active);

CREATE INDEX IF NOT EXISTS idx_sessions_user_id ON user_sessions(user_id);
CREATE INDEX IF NOT EXISTS idx_sessions_token ON user_sessions(session_token);
CREATE INDEX IF NOT EXISTS idx_sessions_expires ON user_sessions(expires_at);

CREATE INDEX IF NOT EXISTS idx_systems_status ON systems(status);
CREATE INDEX IF NOT EXISTS idx_systems_type ON systems(system_type);
CREATE INDEX IF NOT EXISTS idx_systems_health ON systems(health_status);

CREATE INDEX IF NOT EXISTS idx_agents_status ON agents(status);
CREATE INDEX IF NOT EXISTS idx_agents_type ON agents(agent_type);
CREATE INDEX IF NOT EXISTS idx_agents_system ON agents(system_id);
CREATE INDEX IF NOT EXISTS idx_agents_heartbeat ON agents(last_heartbeat);

CREATE INDEX IF NOT EXISTS idx_operations_status ON operations(status);
CREATE INDEX IF NOT EXISTS idx_operations_type ON operations(operation_type);
CREATE INDEX IF NOT EXISTS idx_operations_assigned ON operations(assigned_to);
CREATE INDEX IF NOT EXISTS idx_operations_system ON operations(system_id);
CREATE INDEX IF NOT EXISTS idx_operations_priority ON operations(priority);
CREATE INDEX IF NOT EXISTS idx_operations_created ON operations(created_at);

CREATE INDEX IF NOT EXISTS idx_alerts_severity ON alerts(severity);
CREATE INDEX IF NOT EXISTS idx_alerts_acknowledged ON alerts(acknowledged);
CREATE INDEX IF NOT EXISTS idx_alerts_resolved ON alerts(resolved);
CREATE INDEX IF NOT EXISTS idx_alerts_system ON alerts(system_id);
CREATE INDEX IF NOT EXISTS idx_alerts_created ON alerts(created_at);

CREATE INDEX IF NOT EXISTS idx_intelligence_type ON intelligence_reports(report_type);
CREATE INDEX IF NOT EXISTS idx_intelligence_classification ON intelligence_reports(classification);
CREATE INDEX IF NOT EXISTS idx_intelligence_published ON intelligence_reports(published);
CREATE INDEX IF NOT EXISTS idx_intelligence_author ON intelligence_reports(author_id);
CREATE INDEX IF NOT EXISTS idx_intelligence_tags ON intelligence_reports USING GIN(tags);

CREATE INDEX IF NOT EXISTS idx_financial_symbol ON financial_data(symbol);
CREATE INDEX IF NOT EXISTS idx_financial_type ON financial_data(data_type);
CREATE INDEX IF NOT EXISTS idx_financial_timestamp ON financial_data(timestamp);
CREATE INDEX IF NOT EXISTS idx_financial_symbol_type_period ON financial_data(symbol, data_type, period);

CREATE INDEX IF NOT EXISTS idx_audit_user ON audit_logs(user_id);
CREATE INDEX IF NOT EXISTS idx_audit_action ON audit_logs(action);
CREATE INDEX IF NOT EXISTS idx_audit_resource ON audit_logs(resource_type, resource_id);
CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_logs(created_at);

CREATE INDEX IF NOT EXISTS idx_webhooks_active ON webhooks(active);
CREATE INDEX IF NOT EXISTS idx_webhooks_events ON webhooks USING GIN(events);

CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_webhook ON webhook_deliveries(webhook_id);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_event ON webhook_deliveries(event_type);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_success ON webhook_deliveries(success);
CREATE INDEX IF NOT EXISTS idx_webhook_deliveries_created ON webhook_deliveries(created_at);

CREATE INDEX IF NOT EXISTS idx_metrics_system ON system_metrics(system_id);
CREATE INDEX IF NOT EXISTS idx_metrics_name ON system_metrics(metric_name);
CREATE INDEX IF NOT EXISTS idx_metrics_timestamp ON system_metrics(timestamp);
CREATE INDEX IF NOT EXISTS idx_metrics_system_name_timestamp ON system_metrics(system_id, metric_name, timestamp);

-- Create functions for updated_at triggers
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_systems_updated_at BEFORE UPDATE ON systems
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_agents_updated_at BEFORE UPDATE ON agents
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_operations_updated_at BEFORE UPDATE ON operations
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_alerts_updated_at BEFORE UPDATE ON alerts
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_intelligence_reports_updated_at BEFORE UPDATE ON intelligence_reports
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_webhooks_updated_at BEFORE UPDATE ON webhooks
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create database roles
DO $$
BEGIN
    -- Create application user
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'v0_user') THEN
        CREATE ROLE v0_user WITH LOGIN PASSWORD 'v0_secure_password_2024!';
    END IF;
    
    -- Create read-only user
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'v0_readonly') THEN
        CREATE ROLE v0_readonly WITH LOGIN PASSWORD 'v0_readonly_password_2024!';
    END IF;
    
    -- Create backup user
    IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'v0_backup') THEN
        CREATE ROLE v0_backup WITH LOGIN PASSWORD 'v0_backup_password_2024!';
    END IF;
END
$$;

-- Grant permissions to application user
GRANT CONNECT ON DATABASE v0_tactical_db TO v0_user;
GRANT USAGE ON SCHEMA public TO v0_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO v0_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO v0_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO v0_user;

-- Grant permissions to read-only user
GRANT CONNECT ON DATABASE v0_tactical_db TO v0_readonly;
GRANT USAGE ON SCHEMA public TO v0_readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO v0_readonly;

-- Grant permissions to backup user
GRANT CONNECT ON DATABASE v0_tactical_db TO v0_backup;
GRANT USAGE ON SCHEMA public TO v0_backup;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO v0_backup;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO v0_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO v0_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT EXECUTE ON FUNCTIONS TO v0_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO v0_readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO v0_backup;

-- Insert default admin user (password: admin123! - CHANGE IN PRODUCTION)
INSERT INTO users (
    username, 
    email, 
    password_hash, 
    role, 
    first_name, 
    last_name,
    is_active
) VALUES (
    'admin',
    'admin@v0-tactical.com',
    '$2b$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj/RK.PJ/...',  -- admin123!
    'admin',
    'System',
    'Administrator',
    true
) ON CONFLICT (username) DO NOTHING;

-- Insert sample systems
INSERT INTO systems (name, description, system_type, status, configuration) VALUES
    ('Primary Command Center', 'Main tactical command and control system', 'command', 'online', '{"priority": "high", "location": "HQ"}'),
    ('Intelligence Hub', 'Central intelligence gathering and analysis system', 'intelligence', 'online', '{"classification": "secret", "region": "global"}'),
    ('Operations Network', 'Field operations coordination system', 'operations', 'online', '{"coverage": "worldwide", "capacity": 1000}'),
    ('Agent Network', 'Distributed agent communication system', 'agents', 'online', '{"encryption": "AES-256", "protocols": ["secure", "stealth"]}'
) ON CONFLICT DO NOTHING;

-- Insert sample agents
INSERT INTO agents (name, agent_type, status, capabilities, configuration) VALUES
    ('Alpha-001', 'field', 'online', '["surveillance", "reconnaissance", "communication"]', '{"clearance": "top-secret", "region": "north"}'),
    ('Beta-002', 'cyber', 'online', '["network-analysis", "intrusion-detection", "data-mining"]', '{"specialization": "cyber-warfare", "tools": ["nmap", "wireshark"]}'),
    ('Gamma-003', 'intelligence', 'online', '["data-analysis", "pattern-recognition", "reporting"]', '{"focus": "financial-intelligence", "languages": ["en", "es", "fr"]}'),
    ('Delta-004', 'support', 'offline', '["logistics", "coordination", "backup"]', '{"role": "support", "availability": "24/7"}'
) ON CONFLICT DO NOTHING;

-- Create views for common queries
CREATE OR REPLACE VIEW active_operations AS
SELECT 
    o.*,
    u.username as assigned_username,
    s.name as system_name,
    a.name as agent_name
FROM operations o
LEFT JOIN users u ON o.assigned_to = u.id
LEFT JOIN systems s ON o.system_id = s.id
LEFT JOIN agents a ON o.agent_id = a.id
WHERE o.status IN ('pending', 'running');

CREATE OR REPLACE VIEW unresolved_alerts AS
SELECT 
    a.*,
    s.name as system_name,
    ag.name as agent_name,
    u.username as acknowledged_by_username
FROM alerts a
LEFT JOIN systems s ON a.system_id = s.id
LEFT JOIN agents ag ON a.agent_id = ag.id
LEFT JOIN users u ON a.acknowledged_by = u.id
WHERE a.resolved = false;

CREATE OR REPLACE VIEW system_health_summary AS
SELECT 
    s.id,
    s.name,
    s.status,
    s.health_status,
    s.last_health_check,
    COUNT(a.id) as agent_count,
    COUNT(CASE WHEN a.status = 'online' THEN 1 END) as online_agents,
    COUNT(CASE WHEN al.resolved = false THEN 1 END) as unresolved_alerts
FROM systems s
LEFT JOIN agents a ON s.id = a.system_id
LEFT JOIN alerts al ON s.id = al.system_id AND al.resolved = false
GROUP BY s.id, s.name, s.status, s.health_status, s.last_health_check;

-- Create stored procedures for common operations
CREATE OR REPLACE FUNCTION create_alert(
    p_title VARCHAR(200),
    p_message TEXT,
    p_severity alert_severity DEFAULT 'medium',
    p_source VARCHAR(100) DEFAULT NULL,
    p_system_id UUID DEFAULT NULL,
    p_agent_id UUID DEFAULT NULL,
    p_metadata JSONB DEFAULT '{}'
) RETURNS UUID AS $$
DECLARE
    alert_id UUID;
BEGIN
    INSERT INTO alerts (title, message, severity, source, system_id, agent_id, metadata)
    VALUES (p_title, p_message, p_severity, p_source, p_system_id, p_agent_id, p_metadata)
    RETURNING id INTO alert_id;
    
    RETURN alert_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION acknowledge_alert(
    p_alert_id UUID,
    p_user_id UUID
) RETURNS BOOLEAN AS $$
BEGIN
    UPDATE alerts 
    SET acknowledged = true, 
        acknowledged_by = p_user_id, 
        acknowledged_at = NOW()
    WHERE id = p_alert_id AND acknowledged = false;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION resolve_alert(
    p_alert_id UUID,
    p_user_id UUID
) RETURNS BOOLEAN AS $$
BEGIN
    UPDATE alerts 
    SET resolved = true, 
        resolved_by = p_user_id, 
        resolved_at = NOW(),
        acknowledged = true,
        acknowledged_by = COALESCE(acknowledged_by, p_user_id),
        acknowledged_at = COALESCE(acknowledged_at, NOW())
    WHERE id = p_alert_id AND resolved = false;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

-- Create function to clean old data
CREATE OR REPLACE FUNCTION cleanup_old_data() RETURNS VOID AS $$
BEGIN
    -- Clean old audit logs (older than 1 year)
    DELETE FROM audit_logs WHERE created_at < NOW() - INTERVAL '1 year';
    
    -- Clean old webhook deliveries (older than 3 months)
    DELETE FROM webhook_deliveries WHERE created_at < NOW() - INTERVAL '3 months';
    
    -- Clean old system metrics (older than 6 months)
    DELETE FROM system_metrics WHERE created_at < NOW() - INTERVAL '6 months';
    
    -- Clean old resolved alerts (older than 6 months)
    DELETE FROM alerts WHERE resolved = true AND resolved_at < NOW() - INTERVAL '6 months';
    
    -- Clean expired sessions
    DELETE FROM user_sessions WHERE expires_at < NOW();
END;
$$ LANGUAGE plpgsql;

-- Configure PostgreSQL settings for performance
ALTER SYSTEM SET shared_preload_libraries = 'pg_stat_statements';
ALTER SYSTEM SET max_connections = 200;
ALTER SYSTEM SET shared_buffers = '256MB';
ALTER SYSTEM SET effective_cache_size = '1GB';
ALTER SYSTEM SET maintenance_work_mem = '64MB';
ALTER SYSTEM SET checkpoint_completion_target = 0.9;
ALTER SYSTEM SET wal_buffers = '16MB';
ALTER SYSTEM SET default_statistics_target = 100;
ALTER SYSTEM SET random_page_cost = 1.1;
ALTER SYSTEM SET effective_io_concurrency = 200;

-- Create backup and maintenance scripts
CREATE OR REPLACE FUNCTION create_backup_info() RETURNS TABLE(
    table_name TEXT,
    row_count BIGINT,
    size_pretty TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        schemaname||'.'||tablename as table_name,
        n_tup_ins + n_tup_upd as row_count,
        pg_size_pretty(pg_total_relation_size(schemaname||'.'||tablename)) as size_pretty
    FROM pg_stat_user_tables 
    ORDER BY pg_total_relation_size(schemaname||'.'||tablename) DESC;
END;
$$ LANGUAGE plpgsql;

-- Final message
DO $$
BEGIN
    RAISE NOTICE 'V0 Tactical Database setup completed successfully!';
    RAISE NOTICE 'Default admin user created: admin / admin123! (CHANGE PASSWORD IN PRODUCTION)';
    RAISE NOTICE 'Database roles created: v0_user, v0_readonly, v0_backup';
    RAISE NOTICE 'Sample data inserted for systems and agents';
    RAISE NOTICE 'Performance indexes and triggers configured';
    RAISE NOTICE 'Views and stored procedures created';
    RAISE NOTICE 'Remember to run ANALYZE; after initial data load';
END $$;

-- Analyze tables for query optimization
ANALYZE;
```

## File: scripts/deploy.sh
```bash
#!/bin/bash

# V0 Project - Deployment Script
# Automated deployment with rollback capability

set -e

# Configuration
PROJECT_NAME="v0-project"
DEPLOY_USER="v0app"
DEPLOY_PATH="/var/www/v0-project"
BACKUP_PATH="/var/backups/v0-project"
LOG_FILE="/var/log/v0-project/deploy.log"
REPO_URL="https://github.com/your-username/v0-project.git"
BRANCH="main"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

# Check if running as correct user
if [ "$USER" != "$DEPLOY_USER" ]; then
    error "This script must be run as $DEPLOY_USER user"
fi

# Parse command line arguments
FORCE_DEPLOY=false
SKIP_TESTS=false
ROLLBACK=false
TARGET_COMMIT=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --force)
            FORCE_DEPLOY=true
            shift
            ;;
        --skip-tests)
            SKIP_TESTS=true
            shift
            ;;
        --rollback)
            ROLLBACK=true
            TARGET_COMMIT="$2"
            shift 2
            ;;
        *)
            error "Unknown option: $1"
            ;;
    esac
done

# Rollback function
rollback() {
    local commit_hash="$1"
    log "🔄 Starting rollback to commit: $commit_hash"
    
    cd "$DEPLOY_PATH"
    
    # Verify commit exists
    if ! git cat-file -e "$commit_hash^{commit}" 2>/dev/null; then
        error "Commit $commit_hash does not exist"
    fi
    
    # Create backup of current state
    local backup_name="pre-rollback-$(date +%Y%m%d-%H%M%S)"
    create_backup "$backup_name"
    
    # Checkout target commit
    git checkout "$commit_hash" || error "Failed to checkout commit $commit_hash"
    
    # Install dependencies
    npm ci --production || error "Failed to install dependencies"
    
    # Build application
    npm run build || error "Failed to build application"
    
    # Restart application
    pm2 restart "$PROJECT_NAME" || error "Failed to restart application"
    
    # Wait for application to start
    sleep 10
    
    # Health check
    if ! health_check; then
        error "Health check failed after rollback"
    fi
    
    success "✅ Rollback completed successfully"
    exit 0
}

# Health check function
health_check() {
    log "🏥 Performing health check..."
    
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -f -s http://localhost:3000/health > /dev/null; then
            success "Health check passed"
            return 0
        fi
        
        log "Health check attempt $attempt/$max_attempts failed, retrying in 2 seconds..."
        sleep 2
        ((attempt++))
    done
    
    error "Health check failed after $max_attempts attempts"
    return 1
}

# Create backup function
create_backup() {
    local backup_name="${1:-$(date +%Y%m%d-%H%M%S)}"
    local backup_dir="$BACKUP_PATH/$backup_name"
    
    log "📦 Creating backup: $backup_name"
    
    mkdir -p "$backup_dir"
    
    # Backup application files
    if [ -d "$DEPLOY_PATH" ]; then
        tar -czf "$backup_dir/app-files.tar.gz" -C "$DEPLOY_PATH" . || warning "Failed to backup application files"
    fi
    
    # Backup database
    if command -v pg_dump &> /dev/null; then
        pg_dump -h localhost -U v0_user v0_tactical_db > "$backup_dir/database.sql" || warning "Failed to backup database"
    fi
    
    # Backup PM2 configuration
    pm2 save || warning "Failed to save PM2 configuration"
    cp ~/.pm2/dump.pm2 "$backup_dir/pm2-dump.pm2" 2>/dev/null || warning "Failed to backup PM2 dump"
    
    # Create backup manifest
    cat > "$backup_dir/manifest.json" << EOF
{
    "backup_name": "$backup_name",
    "created_at": "$(date -Iseconds)",
    "git_commit": "$(cd "$DEPLOY_PATH" 2>/dev/null && git rev-parse HEAD 2>/dev/null || echo 'unknown')",
    "node_version": "$(node --version)",
    "npm_version": "$(npm --version)"
}
EOF
    
    success "Backup created: $backup_dir"
}

# Pre-deployment checks
pre_deployment_checks() {
    log "🔍 Running pre-deployment checks..."
    
    # Check disk space
    local available_space=$(df "$DEPLOY_PATH" | awk 'NR==2 {print $4}')
    if [ "$available_space" -lt 1048576 ]; then # Less than 1GB
        error "Insufficient disk space. Available: ${available_space}KB"
    fi
    
    # Check memory
    local available_memory=$(free -m | awk 'NR==2{printf "%.0f", $7}')
    if [ "$available_memory" -lt 512 ]; then
        warning "Low available memory: ${available_memory}MB"
    fi
    
    # Check if PM2 is running
    if ! pm2 list > /dev/null 2>&1; then
        error "PM2 is not running or not accessible"
    fi
    
    # Check database connectivity
    if ! pg_isready -h localhost -p 5432 -U v0_user > /dev/null 2>&1; then
        error "Database is not accessible"
    fi
    
    success "Pre-deployment checks passed"
}

# Main deployment function
deploy() {
    log "🚀 Starting deployment of $PROJECT_NAME"
    
    # Pre-deployment checks
    pre_deployment_checks
    
    # Create backup before deployment
    create_backup "pre-deploy-$(date +%Y%m%d-%H%M%S)"
    
    # Clone or update repository
    if [ ! -d "$DEPLOY_PATH/.git" ]; then
        log "📥 Cloning repository..."
        git clone "$REPO_URL" "$DEPLOY_PATH" || error "Failed to clone repository"
        cd "$DEPLOY_PATH"
    else
        log "📥 Updating repository..."
        cd "$DEPLOY_PATH"
        git fetch origin || error "Failed to fetch from origin"
    fi
    
    # Get current commit for rollback reference
    local previous_commit=$(git rev-parse HEAD 2>/dev/null || echo "")
    
    # Checkout target branch
    git checkout "$BRANCH" || error "Failed to checkout branch $BRANCH"
    git pull origin "$BRANCH" || error "Failed to pull latest changes"
    
    local current_commit=$(git rev-parse HEAD)
    log "📝 Deploying commit: $current_commit"
    
    # Install dependencies
    log "📦 Installing dependencies..."
    npm ci --production || error "Failed to install dependencies"
    
    # Run tests (unless skipped)
    if [ "$SKIP_TESTS" = false ]; then
        log "🧪 Running tests..."
        npm test || error "Tests failed"
    else
        warning "Skipping tests as requested"
    fi
    
    # Build application
    log "🔨 Building application..."
    npm run build || error "Failed to build application"
    
    # Database migrations (if any)
    if [ -f "scripts/migrate.sh" ]; then
        log "🗄️ Running database migrations..."
        ./scripts/migrate.sh || error "Database migration failed"
    fi
    
    # Update PM2 configuration
    if [ -f "ecosystem.config.js" ]; then
        log "🔄 Updating PM2 configuration..."
        pm2 startOrRestart ecosystem.config.js --update-env || error "Failed to update PM2 configuration"
    else
        # Restart existing PM2 process
        if pm2 list | grep -q "$PROJECT_NAME"; then
            log "🔄 Restarting PM2 process..."
            pm2 restart "$PROJECT_NAME" || error "Failed to restart PM2 process"
        else
            log "🚀 Starting new PM2 process..."
            pm2 start npm --name "$PROJECT_NAME" -- start || error "Failed to start PM2 process"
        fi
    fi
    
    # Wait for application to start
    log "⏳ Waiting for application to start..."
    sleep 15
    
    # Health check
    if ! health_check; then
        warning "Health check failed, attempting rollback..."
        if [ -n "$previous_commit" ]; then
            rollback "$previous_commit"
        else
            error "Health check failed and no previous commit available for rollback"
        fi
    fi
    
    # Reload Nginx configuration
    log "🌐 Reloading Nginx configuration..."
    sudo nginx -t && sudo systemctl reload nginx || warning "Failed to reload Nginx"
    
    # Save PM2 configuration
    pm2 save || warning "Failed to save PM2 configuration"
    
    # Clean up old backups (keep last 10)
    log "🧹 Cleaning up old backups..."
    find "$BACKUP_PATH" -maxdepth 1 -type d -name "*-*" | sort -r | tail -n +11 | xargs rm -rf 2>/dev/null || true
    
    success "✅ Deployment completed successfully!"
    log "📊 Deployment summary:"
    log "   - Commit: $current_commit"
    log "   - Branch: $BRANCH"
    log "   - Build time: $(date)"
    log "   - Application URL: https://your-domain.com"
}

# Handle rollback request
if [ "$ROLLBACK" = true ]; then
    if [ -z "$TARGET_COMMIT" ]; then
        error "Rollback requires a target commit hash"
    fi
    rollback "$TARGET_COMMIT"
fi

# Main deployment
deploy

log "🎉 Deployment process completed!"
```

## File: scripts/monitor.sh
```bash
#!/bin/bash

# V0 Project - Monitoring Script
# Comprehensive monitoring with alerting and reporting

set -e

# Configuration
PROJECT_NAME="v0-project"
APP_DIR="/var/www/v0-project"
LOG_FILE="/var/log/v0-project/monitor.log"
ALERT_LOG="/var/log/v0-project/alerts.log"
METRICS_FILE="/var/log/v0-project/metrics.json"
SLACK_WEBHOOK="${SLACK_WEBHOOK_URL:-}"

# Thresholds
CPU_THRESHOLD=80
MEMORY_THRESHOLD=85
DISK_THRESHOLD=90
RESPONSE_TIME_THRESHOLD=5000  # milliseconds
ERROR_RATE_THRESHOLD=5        # percentage

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE" | tee -a "$ALERT_LOG"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE" | tee -a "$ALERT_LOG"
}

# Send alert notification
send_alert() {
    local severity="$1"
    local title="$2"
    local message="$3"
    local color="danger"
    
    case $severity in
        "warning") color="warning" ;;
        "info") color="good" ;;
    esac
    
    # Log alert
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] [$severity] $title: $message" >> "$ALERT_LOG"
    
    # Send Slack notification
    if [ -n "$SLACK_WEBHOOK" ]; then
        curl -X POST -H 'Content-type: application/json' \
            --data "{
                \"attachments\": [{
                    \"color\": \"$color\",
                    \"title\": \"🚨 V0 Project Alert - $title\",
                    \"text\": \"$message\",
                    \"fields\": [
                        {
                            \"title\": \"Severity\",
                            \"value\": \"$severity\",
                            \"short\": true
                        },
                        {
                            \"title\": \"Server\",
                            \"value\": \"$(hostname)\",
                            \"short\": true
                        }
                    ],
                    \"footer\": \"V0 Project Monitor\",
                    \"ts\": $(date +%s)
                }]
            }" \
            "$SLACK_WEBHOOK" > /dev/null 2>&1 || true
    fi
}

# Check system resources
check_system_resources() {
    log "📊 Checking system resources..."
    
    # CPU usage
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | sed 's/%us,//')
    cpu_usage=${cpu_usage%.*}  # Remove decimal part
    
    if [ "$cpu_usage" -gt "$CPU_THRESHOLD" ]; then
        send_alert "critical" "High CPU Usage" "CPU usage is ${cpu_usage}% (threshold: ${CPU_THRESHOLD}%)"
    fi
    
    # Memory usage
    local memory_info=$(free | grep Mem)
    local total_memory=$(echo $memory_info | awk '{print $2}')
    local used_memory=$(echo $memory_info | awk '{print $3}')
    local memory_usage=$((used_memory * 100 / total_memory))
    
    if [ "$memory_usage" -gt "$MEMORY_THRESHOLD" ]; then
        send_alert "critical" "High Memory Usage" "Memory usage is ${memory_usage}% (threshold: ${MEMORY_THRESHOLD}%)"
    fi
    
    # Disk usage
    local disk_usage=$(df "$APP_DIR" | awk 'NR==2 {print $5}' | sed 's/%//')
    
    if [ "$disk_usage" -gt "$DISK_THRESHOLD" ]; then
        send_alert "critical" "High Disk Usage" "Disk usage is ${disk_usage}% (threshold: ${DISK_THRESHOLD}%)"
    fi
    
    # Store metrics
    local timestamp=$(date -Iseconds)
    echo "{\"timestamp\":\"$timestamp\",\"cpu\":$cpu_usage,\"memory\":$memory_usage,\"disk\":$disk_usage}" >> "$METRICS_FILE"
    
    log "System resources: CPU: ${cpu_usage}%, Memory: ${memory_usage}%, Disk: ${disk_usage}%"
}

# Check application health
check_application_health() {
    log "🏥 Checking application health..."
    
    # Check if PM2 process is running
    if ! pm2 list | grep -q "$PROJECT_NAME.*online"; then
        send_alert "critical" "Application Down" "PM2 process $PROJECT_NAME is not running"
        return 1
    fi
    
    # Check HTTP response
    local start_time=$(date +%s%3N)
    local http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health || echo "000")
    local end_time=$(date +%s%3N)
    local response_time=$((end_time - start_time))
    
    if [ "$http_status" != "200" ]; then
        send_alert "critical" "Application Unhealthy" "Health check returned HTTP $http_status"
        return 1
    fi
    
    if [ "$response_time" -gt "$RESPONSE_TIME_THRESHOLD" ]; then
        send_alert "warning" "Slow Response Time" "Health check took ${response_time}ms (threshold: ${RESPONSE_TIME_THRESHOLD}ms)"
    fi
    
    log "Application health: HTTP $http_status, Response time: ${response_time}ms"
    return 0
}

# Check database connectivity
check_database() {
    log "🗄️ Checking database connectivity..."
    
    # Check PostgreSQL service
    if ! systemctl is-active --quiet postgresql; then
        send_alert "critical" "Database Service Down" "PostgreSQL service is not running"
        return 1
    fi
    
    # Check database connection
    export PGPASSWORD="${DATABASE_PASSWORD:-}"
    if ! pg_isready -h localhost -p 5432 -U v0_user > /dev/null 2>&1; then
        send_alert "critical" "Database Connection Failed" "Cannot connect to PostgreSQL database"
        unset PGPASSWORD
        return 1
    fi
    
    # Check database query performance
    local start_time=$(date +%s%3N)
    psql -h localhost -U v0_user -d v0_tactical_db -c "SELECT 1;" > /dev/null 2>&1
    local end_time=$(date +%s%3N)
    local query_time=$((end_time - start_time))
    
    unset PGPASSWORD
    
    if [ "$query_time" -gt 1000 ]; then  # 1 second
        send_alert "warning" "Slow Database Query" "Database query took ${query_time}ms"
    fi
    
    log "Database: Connected, Query time: ${query_time}ms"
    return 0
}

# Check SSL certificate
check_ssl_certificate() {
    log "🔒 Checking SSL certificate..."
    
    local domain="your-domain.com"  # Replace with your actual domain
    local cert_file="/etc/letsencrypt/live/$domain/cert.pem"
    
    if [ ! -f "$cert_file" ]; then
        warning "SSL certificate file not found: $cert_file"
        return 1
    fi
    
    # Check certificate expiration
    local expiry_date=$(openssl x509 -enddate -noout -in "$cert_file" | cut -d= -f2)
    local expiry_timestamp=$(date -d "$expiry_date" +%s)
    local current_timestamp=$(date +%s)
    local days_until_expiry=$(( (expiry_timestamp - current_timestamp) / 86400 ))
    
    if [ "$days_until_expiry" -lt 7 ]; then
        send_alert "critical" "SSL Certificate Expiring" "SSL certificate expires in $days_until_expiry days"
    elif [ "$days_until_expiry" -lt 30 ]; then
        send_alert "warning" "SSL Certificate Expiring Soon" "SSL certificate expires in $days_until_expiry days"
    fi
    
    log "SSL certificate: Valid, expires in $days_until_expiry days"
    return 0
}

# Check log files for errors
check_error_logs() {
    log "📋 Checking error logs..."
    
    local error_log="/var/log/v0-project/error.log"
    local nginx_error_log="/var/log/nginx/v0-error.log"
    
    # Check application error logs (last 5 minutes)
    if [ -f "$error_log" ]; then
        local recent_errors=$(find "$error_log" -newermt "5 minutes ago" -exec grep -c "ERROR\|FATAL" {} \; 2>/dev/null || echo "0")
        
        if [ "$recent_errors" -gt 10 ]; then
            send_alert "warning" "High Error Rate" "Found $recent_errors errors in the last 5 minutes"
        fi
    fi
    
    # Check Nginx error logs
    if [ -f "$nginx_error_log" ]; then
        local nginx_errors=$(tail -n 100 "$nginx_error_log" | grep "$(date '+%Y/%m/%d %H:%M')" | wc -l)
        
        if [ "$nginx_errors" -gt 5 ]; then
            send_alert "warning" "Nginx Errors" "Found $nginx_errors Nginx errors in the last minute"
        fi
    fi
    
    log "Error logs: Application errors: $recent_errors, Nginx errors: $nginx_errors"
}

# Check disk space for critical directories
check_disk_space() {
    log "💾 Checking disk space..."
    
    local critical_dirs=("/" "/var" "/var/log" "/var/backups")
    
    for dir in "${critical_dirs[@]}"; do
        if [ -d "$dir" ]; then
            local usage=$(df "$dir" | awk 'NR==2 {print $5}' | sed 's/%//')
            
            if [ "$usage" -gt 95 ]; then
                send_alert "critical" "Critical Disk Space" "$dir is ${usage}% full"
            elif [ "$usage" -gt 85 ]; then
                send_alert "warning" "Low Disk Space" "$dir is ${usage}% full"
            fi
        fi
    done
}

# Check network connectivity
check_network() {
    log "🌐 Checking network connectivity..."
    
    # Check external connectivity
    if ! ping -c 1 8.8.8.8 > /dev/null 2>&1; then
        send_alert "critical" "Network Connectivity Lost" "Cannot reach external networks"
        return 1
    fi
    
    # Check DNS resolution
    if ! nslookup google.com > /dev/null 2>&1; then
        send_alert "warning" "DNS Resolution Issues" "DNS resolution is not working properly"
    fi
    
    log "Network: Connected"
    return 0
}

# Check backup status
check_backup_status() {
    log "💾 Checking backup status..."
    
    local backup_dir="/var/backups/v0-project"
    local latest_backup=$(find "$backup_dir" -name "*.tar.gz*" -type f -printf '%T@ %p\n' 2>/dev/null | sort -n | tail -1 | cut -d' ' -f2-)
    
    if [ -z "$latest_backup" ]; then
        send_alert "warning" "No Backups Found" "No backup files found in $backup_dir"
        return 1
    fi
    
    # Check backup age
    local backup_age=$(find "$latest_backup" -mtime +1 2>/dev/null | wc -l)
    
    if [ "$backup_age" -gt 0 ]; then
        send_alert "warning" "Backup Outdated" "Latest backup is older than 24 hours"
    fi
    
    log "Backup: Latest backup found: $(basename "$latest_backup")"
    return 0
}

# Generate monitoring report
generate_report() {
    local timestamp=$(date -Iseconds)
    local report_file="/var/log/v0-project/monitor-report-$(date +%Y%m%d).json"
    
    # Get system info
    local uptime=$(uptime -p)
    local load_avg=$(uptime | awk -F'load average:' '{print $2}')
    local memory_info=$(free -h | grep Mem | awk '{print "Total: "$2", Used: "$3", Free: "$4}')
    local disk_info=$(df -h "$APP_DIR" | awk 'NR==2 {print "Total: "$2", Used: "$3", Available: "$4", Usage: "$5}')
    
    # Create report
    cat > "$report_file" << EOF
{
    "timestamp": "$timestamp",
    "system": {
        "uptime": "$uptime",
        "load_average": "$load_avg",
        "memory": "$memory_info",
        "disk": "$disk_info"
    },
    "application": {
        "status": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')",
        "pid": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $6}' || echo 'unknown')",
        "uptime": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $11}' || echo 'unknown')",
        "restarts": "$(pm2 list | grep "$PROJECT_NAME" | awk '{print $9}' || echo 'unknown')"
    },
    "database": {
        "status": "$(systemctl is-active postgresql)",
        "connections": "$(sudo -u postgres psql -c "SELECT count(*) FROM pg_stat_activity;" -t 2>/dev/null | xargs || echo 'unknown')"
    },
    "checks_performed": [
        "system_resources",
        "application_health",
        "database_connectivity",
        "ssl_certificate",
        "error_logs",
        "disk_space",
        "network_connectivity",
        "backup_status"
    ]
}
EOF
    
    log "📊 Monitoring report generated: $report_file"
}

# Main monitoring function
main() {
    log "🚀 Starting monitoring checks..."
    
    local failed_checks=0
    
    # Run all checks
    check_system_resources || ((failed_checks++))
    check_application_health || ((failed_checks++))
    check_database || ((failed_checks++))
    check_ssl_certificate || ((failed_checks++))
    check_error_logs || ((failed_checks++))
    check_disk_space || ((failed_checks++))
    check_network || ((failed_checks++))
    check_backup_status || ((failed_checks++))
    
    # Generate report
    generate_report
    
    # Summary
    if [ "$failed_checks" -eq 0 ]; then
        success "✅ All monitoring checks passed"
        send_alert "info" "Monitoring Complete" "All system checks passed successfully"
    else
        warning "⚠️ $failed_checks monitoring checks failed"
        send_alert "warning" "Monitoring Issues" "$failed_checks system checks failed"
    fi
    
    log "🎉 Monitoring checks completed"
}

# Parse command line arguments
case "${1:-}" in
    --system)
        check_system_resources
        ;;
    --app)
        check_application_health
        ;;
    --database)
        check_database
        ;;
    --ssl)
        check_ssl_certificate
        ;;
    --logs)
        check_error_logs
        ;;
    --disk)
        check_disk_space
        ;;
    --network)
        check_network
        ;;
    --backup)
        check_backup_status
        ;;
    --report)
        generate_report
        ;;
    --help)
        echo "Usage: $0 [OPTION]"
        echo ""
        echo "Options:"
        echo "  --system     Check system resources only"
        echo "  --app        Check application health only"
        echo "  --database   Check database connectivity only"
        echo "  --ssl        Check SSL certificate only"
        echo "  --logs       Check error logs only"
        echo "  --disk       Check disk space only"
        echo "  --network    Check network connectivity only"
        echo "  --backup     Check backup status only"
        echo "  --report     Generate monitoring report only"
        echo "  --help       Show this help message"
        echo ""
        echo "If no option is provided, all checks will be performed."
        ;;
    *)
        main
        ;;
esac
```

## File: scripts/restore.sh
```bash
#!/bin/bash

# V0 Project - Restore Script
# Comprehensive restore solution with verification

set -e

# Configuration
PROJECT_NAME="v0-project"
BACKUP_BASE_DIR="/var/backups/v0-project"
APP_DIR="/var/www/v0-project"
LOG_FILE="/var/log/v0-project/restore.log"
ENCRYPTION_KEY="${BACKUP_ENCRYPTION_KEY:-}"

# Database configuration
DB_HOST="localhost"
DB_PORT="5432"
DB_NAME="v0_tactical_db"
DB_USER="v0_user"
DB_PASSWORD="${DATABASE_PASSWORD:-}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

# Show usage
usage() {
    echo "Usage: $0 [OPTIONS] BACKUP_FILE"
    echo ""
    echo "Options:"
    echo "  --database-only    Restore only the database"
    echo "  --files-only       Restore only application files"
    echo "  --config-only      Restore only configuration files"
    echo "  --verify           Verify backup integrity before restore"
    echo "  --dry-run          Show what would be restored without actually doing it"
    echo "  --force            Skip confirmation prompts"
    echo "  --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 /var/backups/v0-project/20240115-143022.tar.gz"
    echo "  $0 --database-only --verify backup.tar.gz.enc"
    echo "  $0 --dry-run --force latest-backup.tar.gz"
}

# Parse command line arguments
DATABASE_ONLY=false
FILES_ONLY=false
CONFIG_ONLY=false
VERIFY_BACKUP=false
DRY_RUN=false
FORCE=false
BACKUP_FILE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --database-only)
            DATABASE_ONLY=true
            shift
            ;;
        --files-only)
            FILES_ONLY=true
            shift
            ;;
        --config-only)
            CONFIG_ONLY=true
            shift
            ;;
        --verify)
            VERIFY_BACKUP=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --help)
            usage
            exit 0
            ;;
        -*)
            error "Unknown option: $1"
            ;;
        *)
            BACKUP_FILE="$1"
            shift
            ;;
    esac
done

# Validate backup file
if [ -z "$BACKUP_FILE" ]; then
    error "Backup file is required. Use --help for usage information."
fi

if [ ! -f "$BACKUP_FILE" ]; then
    error "Backup file does not exist: $BACKUP_FILE"
fi

# Extract backup
extract_backup() {
    local backup_file="$1"
    local extract_dir=$(mktemp -d)
    
    log "📦 Extracting backup: $(basename "$backup_file")"
    
    # Check if backup is encrypted
    if [[ "$backup_file" == *.enc ]]; then
        if [ -z "$ENCRYPTION_KEY" ]; then
            error "Backup is encrypted but no encryption key provided"
        fi
        
        log "🔓 Decrypting backup..."
        openssl enc -aes-256-cbc -d -salt -k "$ENCRYPTION_KEY" -in "$backup_file" | \
            tar -xzf - -C "$extract_dir" || error "Failed to decrypt and extract backup"
    else
        tar -xzf "$backup_file" -C "$extract_dir" || error "Failed to extract backup"
    fi
    
    # Find the backup directory (should be the only directory in extract_dir)
    local backup_dir=$(find "$extract_dir" -maxdepth 1 -type d ! -path "$extract_dir" | head -1)
    
    if [ -z "$backup_dir" ]; then
        error "Invalid backup structure"
    fi
    
    echo "$backup_dir"
}

# Verify backup integrity
verify_backup() {
    local backup_dir="$1"
    
    log "🔍 Verifying backup integrity..."
    
    # Check manifest file
    if [ ! -f "$backup_dir/manifest.json" ]; then
        warning "Manifest file not found, skipping integrity check"
        return
    fi
    
    # Parse manifest
    local backup_date=$(jq -r '.backup_date' "$backup_dir/manifest.json" 2>/dev/null || echo "unknown")
    local project_name=$(jq -r '.project_name' "$backup_dir/manifest.json" 2>/dev/null || echo "unknown")
    
    log "Backup Date: $backup_date"
    log "Project Name: $project_name"
    
    # Verify expected directories exist
    local expected_dirs=("database" "application" "config")
    for dir in "${expected_dirs[@]}"; do
        if [ ! -d "$backup_dir/$dir" ]; then
            warning "Expected directory not found: $dir"
        fi
    done
    
    # Verify database backup
    if [ -f "$backup_dir/database/database.sql.gz" ]; then
        log "✅ Database backup found"
        # Test gzip integrity
        gzip -t "$backup_dir/database/database.sql.gz" || error "Database backup is corrupted"
    else
        warning "Database backup not found"
    fi
    
    # Verify application backup
    if [ -f "$backup_dir/application/app-files.tar.gz" ]; then
        log "✅ Application backup found"
        # Test tar integrity
        tar -tzf "$backup_dir/application/app-files.tar.gz" > /dev/null || error "Application backup is corrupted"
    else
        warning "Application backup not found"
    fi
    
    success "Backup integrity verification completed"
}

# Create pre-restore backup
create_pre_restore_backup() {
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would create pre-restore backup"
        return
    fi
    
    log "💾 Creating pre-restore backup..."
    
    local pre_restore_backup="$BACKUP_BASE_DIR/pre-restore-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$pre_restore_backup"
    
    # Backup current database
    if [ "$FILES_ONLY" = false ] && [ "$CONFIG_ONLY" = false ]; then
        export PGPASSWORD="$DB_PASSWORD"
        pg_dump -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
            > "$pre_restore_backup/current-database.sql" || warning "Failed to backup current database"
        unset PGPASSWORD
    fi
    
    # Backup current application files
    if [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ]; then
        tar -czf "$pre_restore_backup/current-app-files.tar.gz" \
            -C "$APP_DIR" \
            --exclude='node_modules' \
            --exclude='.git' \
            --exclude='.next' \
            . || warning "Failed to backup current application files"
    fi
    
    success "Pre-restore backup created: $pre_restore_backup"
}

# Restore database
restore_database() {
    local backup_dir="$1"
    local db_backup_file="$backup_dir/database/database.sql.gz"
    
    if [ ! -f "$db_backup_file" ]; then
        warning "Database backup not found, skipping database restore"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore database from $db_backup_file"
        return
    fi
    
    log "🗄️ Restoring database..."
    
    # Stop application to prevent database connections
    pm2 stop "$PROJECT_NAME" > /dev/null 2>&1 || true
    
    # Set password for psql
    export PGPASSWORD="$DB_PASSWORD"
    
    # Drop existing connections
    psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -c "
        SELECT pg_terminate_backend(pid) 
        FROM pg_stat_activity 
        WHERE datname = '$DB_NAME' AND pid <> pg_backend_pid();
    " > /dev/null 2>&1 || true
    
    # Restore database
    gunzip -c "$db_backup_file" | psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres || \
        error "Failed to restore database"
    
    unset PGPASSWORD
    
    success "Database restored successfully"
}

# Restore application files
restore_application() {
    local backup_dir="$1"
    local app_backup_file="$backup_dir/application/app-files.tar.gz"
    
    if [ ! -f "$app_backup_file" ]; then
        warning "Application backup not found, skipping application restore"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore application files from $app_backup_file"
        return
    fi
    
    log "📁 Restoring application files..."
    
    # Stop application
    pm2 stop "$PROJECT_NAME" > /dev/null 2>&1 || true
    
    # Create temporary directory for extraction
    local temp_dir=$(mktemp -d)
    
    # Extract application files
    tar -xzf "$app_backup_file" -C "$temp_dir" || error "Failed to extract application files"
    
    # Backup current .env.local if it exists
    if [ -f "$APP_DIR/.env.local" ]; then
        cp "$APP_DIR/.env.local" "$temp_dir/.env.local.current" || true
    fi
    
    # Remove current application directory (except .env.local)
    find "$APP_DIR" -mindepth 1 -maxdepth 1 ! -name '.env.local' -exec rm -rf {} + || \
        error "Failed to clean current application directory"
    
    # Move restored files to application directory
    cp -r "$temp_dir"/* "$APP_DIR"/ || error "Failed to copy restored files"
    
    # Restore current .env.local if it was backed up
    if [ -f "$temp_dir/.env.local.current" ]; then
        mv "$temp_dir/.env.local.current" "$APP_DIR/.env.local" || true
    fi
    
    # Set correct permissions
    chown -R v0app:v0app "$APP_DIR" || warning "Failed to set file permissions"
    
    # Clean up temporary directory
    rm -rf "$temp_dir"
    
    success "Application files restored successfully"
}

# Restore configuration files
restore_config() {
    local backup_dir="$1"
    local config_backup_file="$backup_dir/config/config.tar.gz"
    
    if [ ! -f "$config_backup_file" ]; then
        warning "Configuration backup not found, skipping configuration restore"
        return
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore configuration files from $config_backup_file"
        return
    fi
    
    log "⚙️ Restoring configuration files..."
    
    # Create temporary directory for extraction
    local temp_dir=$(mktemp -d)
    
    # Extract configuration files
    tar -xzf "$config_backup_file" -C "$temp_dir" || error "Failed to extract configuration files"
    
    # Restore .env.local (with confirmation)
    if [ -f "$temp_dir/.env.local" ]; then
        if [ "$FORCE" = false ]; then
            read -p "Restore .env.local? This will overwrite current environment variables (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                cp "$temp_dir/.env.local" "$APP_DIR/.env.local" || warning "Failed to restore .env.local"
            fi
        else
            cp "$temp_dir/.env.local" "$APP_DIR/.env.local" || warning "Failed to restore .env.local"
        fi
    fi
    
    # Restore ecosystem.config.js
    if [ -f "$temp_dir/ecosystem.config.js" ]; then
        cp "$temp_dir/ecosystem.config.js" "$APP_DIR/ecosystem.config.js" || warning "Failed to restore PM2 config"
    fi
    
    # Restore Nginx configuration (requires sudo)
    if [ -f "$temp_dir/nginx.conf" ]; then
        if [ "$FORCE" = false ]; then
            read -p "Restore Nginx configuration? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                sudo cp "$temp_dir/nginx.conf" "/etc/nginx/sites-available/v0-project" || warning "Failed to restore Nginx config"
                sudo nginx -t && sudo systemctl reload nginx || warning "Failed to reload Nginx"
            fi
        else
            sudo cp "$temp_dir/nginx.conf" "/etc/nginx/sites-available/v0-project" || warning "Failed to restore Nginx config"
            sudo nginx -t && sudo systemctl reload nginx || warning "Failed to reload Nginx"
        fi
    fi
    
    # Restore PM2 dump
    if [ -f "$temp_dir/dump.pm2" ]; then
        cp "$temp_dir/dump.pm2" ~/.pm2/dump.pm2 || warning "Failed to restore PM2 dump"
    fi
    
    # Clean up temporary directory
    rm -rf "$temp_dir"
    
    success "Configuration files restored successfully"
}

# Post-restore tasks
post_restore_tasks() {
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would perform post-restore tasks"
        return
    fi
    
    log "🔧 Performing post-restore tasks..."
    
    # Install dependencies if application files were restored
    if [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ]; then
        cd "$APP_DIR"
        log "📦 Installing dependencies..."
        npm ci --production || warning "Failed to install dependencies"
        
        log "🔨 Building application..."
        npm run build || warning "Failed to build application"
    fi
    
    # Start application
    log "🚀 Starting application..."
    pm2 start "$APP_DIR/ecosystem.config.js" || pm2 restart "$PROJECT_NAME" || \
        warning "Failed to start application"
    
    # Wait for application to start
    sleep 10
    
    # Health check
    log "🏥 Performing health check..."
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -f -s http://localhost:3000/health > /dev/null; then
            success "Health check passed"
            break
        fi
        
        if [ $attempt -eq $max_attempts ]; then
            error "Health check failed after $max_attempts attempts"
        fi
        
        log "Health check attempt $attempt/$max_attempts failed, retrying in 2 seconds..."
        sleep 2
        ((attempt++))
    done
    
    # Save PM2 configuration
    pm2 save || warning "Failed to save PM2 configuration"
    
    success "Post-restore tasks completed"
}

# Generate restore report
generate_restore_report() {
    local backup_file="$1"
    local start_time="$2"
    local end_time="$3"
    
    local duration=$((end_time - start_time))
    local backup_name=$(basename "$backup_file")
    
    cat > "$BACKUP_BASE_DIR/last-restore-report.txt" << EOF
V0 Project Restore Report
=========================

Backup File: $backup_name
Start Time: $(date -d @$start_time)
End Time: $(date -d @$end_time)
Duration: ${duration} seconds
Status: SUCCESS

Restore Options:
- Database Only: $DATABASE_ONLY
- Files Only: $FILES_ONLY
- Config Only: $CONFIG_ONLY
- Dry Run: $DRY_RUN
- Force: $FORCE

Components Restored:
$([ "$DATABASE_ONLY" = true ] || [ "$FILES_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "- Database (PostgreSQL)")
$([ "$FILES_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "- Application Files")
$([ "$CONFIG_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$FILES_ONLY" = false ] && echo "- Configuration Files")

Application Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo "Unknown")
Health Check: $(curl -f -s http://localhost:3000/health > /dev/null && echo "PASSED" || echo "FAILED")
EOF

    log "📊 Restore report generated"
}

# Confirmation prompt
confirm_restore() {
    if [ "$FORCE" = true ] || [ "$DRY_RUN" = true ]; then
        return
    fi
    
    echo
    echo "⚠️  WARNING: This will restore data from the backup and may overwrite current data."
    echo
    echo "Backup File: $(basename "$BACKUP_FILE")"
    echo "Restore Options:"
    echo "  - Database: $([ "$DATABASE_ONLY" = true ] || [ "$FILES_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "YES" || echo "NO")"
    echo "  - Application Files: $([ "$FILES_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$CONFIG_ONLY" = false ] && echo "YES" || echo "NO")"
    echo "  - Configuration: $([ "$CONFIG_ONLY" = true ] || [ "$DATABASE_ONLY" = false ] && [ "$FILES_ONLY" = false ] && echo "YES" || echo "NO")"
    echo
    read -p "Are you sure you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log "Restore cancelled by user"
        exit 0
    fi
}

# Main restore function
main() {
    local start_time=$(date +%s)
    
    log "🚀 Starting restore process: $(basename "$BACKUP_FILE")"
    
    # Confirmation
    confirm_restore
    
    # Extract backup
    local backup_dir=$(extract_backup "$BACKUP_FILE")
    
    # Verify backup if requested
    if [ "$VERIFY_BACKUP" = true ]; then
        verify_backup "$backup_dir"
    fi
    
    # Create pre-restore backup
    create_pre_restore_backup
    
    # Perform restore based on options
    if [ "$DATABASE_ONLY" = true ]; then
        restore_database "$backup_dir"
    elif [ "$FILES_ONLY" = true ]; then
        restore_application "$backup_dir"
    elif [ "$CONFIG_ONLY" = true ]; then
        restore_config "$backup_dir"
    else
        # Restore everything
        restore_database "$backup_dir"
        restore_application "$backup_dir"
        restore_config "$backup_dir"
    fi
    
    # Post-restore tasks
    post_restore_tasks
    
    local end_time=$(date +%s)
    
    # Generate report
    if [ "$DRY_RUN" = false ]; then
        generate_restore_report "$BACKUP_FILE" "$start_time" "$end_time"
    fi
    
    # Clean up extracted backup
    rm -rf "$backup_dir"
    
    if [ "$DRY_RUN" = true ]; then
        success "✅ Dry run completed successfully"
    else
        success "✅ Restore completed successfully"
    fi
    
    log "🎉 Restore process finished"
}

# Check if running as correct user
if [ "$EUID" -eq 0 ]; then
    error "This script should not be run as root"
fi

# Create necessary directories
mkdir -p "$BACKUP_BASE_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# Run main restore function
main "$@"
```

## File: scripts/rollback.sh
```bash
#!/bin/bash

# V0 Project - Rollback Script
# Quick rollback to previous deployment or specific commit

set -e

# Configuration
PROJECT_NAME="v0-project"
DEPLOY_USER="v0app"
DEPLOY_PATH="/var/www/v0-project"
BACKUP_PATH="/var/backups/v0-project"
LOG_FILE="/var/log/v0-project/rollback.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging function
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1" | tee -a "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1" | tee -a "$LOG_FILE"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1" | tee -a "$LOG_FILE"
}

# Show usage
usage() {
    echo "Usage: $0 [OPTIONS] [TARGET]"
    echo ""
    echo "Options:"
    echo "  --list             List available rollback targets"
    echo "  --commit HASH      Rollback to specific commit"
    echo "  --backup NAME      Rollback from backup"
    echo "  --previous         Rollback to previous deployment (default)"
    echo "  --force            Skip confirmation prompts"
    echo "  --dry-run          Show what would be done without executing"
    echo "  --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0                           # Rollback to previous commit"
    echo "  $0 --commit abc123           # Rollback to specific commit"
    echo "  $0 --backup 20240115-143022  # Rollback from backup"
    echo "  $0 --list                    # List available targets"
}

# Parse command line arguments
ROLLBACK_TYPE="previous"
TARGET=""
FORCE=false
DRY_RUN=false
LIST_TARGETS=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --list)
            LIST_TARGETS=true
            shift
            ;;
        --commit)
            ROLLBACK_TYPE="commit"
            TARGET="$2"
            shift 2
            ;;
        --backup)
            ROLLBACK_TYPE="backup"
            TARGET="$2"
            shift 2
            ;;
        --previous)
            ROLLBACK_TYPE="previous"
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help)
            usage
            exit 0
            ;;
        *)
            error "Unknown option: $1"
            ;;
    esac
done

# Check if running as correct user
if [ "$USER" != "$DEPLOY_USER" ]; then
    error "This script must be run as $DEPLOY_USER user"
fi

# List available rollback targets
list_targets() {
    log "📋 Available rollback targets:"
    echo
    
    # Git commits
    echo -e "${BLUE}Recent Git Commits:${NC}"
    cd "$DEPLOY_PATH" 2>/dev/null || error "Cannot access deployment directory"
    git log --oneline -10 --decorate --graph || warning "Cannot access git history"
    echo
    
    # Available backups
    echo -e "${BLUE}Available Backups:${NC}"
    if [ -d "$BACKUP_PATH" ]; then
        find "$BACKUP_PATH" -name "*.tar.gz*" -type f -printf '%T@ %p\n' 2>/dev/null | \
            sort -nr | head -10 | \
            while read timestamp filepath; do
                local date_str=$(date -d @${timestamp%.*} '+%Y-%m-%d %H:%M:%S')
                local filename=$(basename "$filepath")
                echo "  $date_str - $filename"
            done
    else
        echo "  No backups found in $BACKUP_PATH"
    fi
    echo
    
    # Current deployment info
    echo -e "${BLUE}Current Deployment:${NC}"
    echo "  Commit: $(git rev-parse HEAD 2>/dev/null || echo 'unknown')"
    echo "  Branch: $(git branch --show-current 2>/dev/null || echo 'unknown')"
    echo "  Date: $(git log -1 --format=%cd 2>/dev/null || echo 'unknown')"
    echo "  PM2 Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')"
}

# Get previous commit
get_previous_commit() {
    cd "$DEPLOY_PATH"
    local current_commit=$(git rev-parse HEAD)
    local previous_commit=$(git rev-parse HEAD~1 2>/dev/null)
    
    if [ -z "$previous_commit" ] || [ "$current_commit" = "$previous_commit" ]; then
        error "Cannot determine previous commit"
    fi
    
    echo "$previous_commit"
}

# Validate commit hash
validate_commit() {
    local commit_hash="$1"
    cd "$DEPLOY_PATH"
    
    if ! git cat-file -e "$commit_hash^{commit}" 2>/dev/null; then
        error "Invalid commit hash: $commit_hash"
    fi
    
    # Check if commit is different from current
    local current_commit=$(git rev-parse HEAD)
    if [ "$commit_hash" = "$current_commit" ]; then
        warning "Target commit is the same as current commit"
        return 1
    fi
    
    return 0
}

# Validate backup
validate_backup() {
    local backup_name="$1"
    local backup_file=""
    
    # Try different backup file extensions
    for ext in ".tar.gz" ".tar.gz.enc"; do
        if [ -f "$BACKUP_PATH/$backup_name$ext" ]; then
            backup_file="$BACKUP_PATH/$backup_name$ext"
            break
        fi
    done
    
    if [ -z "$backup_file" ]; then
        error "Backup not found: $backup_name"
    fi
    
    echo "$backup_file"
}

# Create pre-rollback backup
create_pre_rollback_backup() {
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would create pre-rollback backup"
        return
    fi
    
    log "💾 Creating pre-rollback backup..."
    
    local backup_name="pre-rollback-$(date +%Y%m%d-%H%M%S)"
    local backup_script="$DEPLOY_PATH/scripts/backup.sh"
    
    if [ -f "$backup_script" ]; then
        "$backup_script" || warning "Failed to create pre-rollback backup"
    else
        warning "Backup script not found, skipping pre-rollback backup"
    fi
}

# Health check
health_check() {
    log "🏥 Performing health check..."
    
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if curl -f -s http://localhost:3000/health > /dev/null; then
            success "Health check passed"
            return 0
        fi
        
        if [ $attempt -eq $max_attempts ]; then
            error "Health check failed after $max_attempts attempts"
        fi
        
        log "Health check attempt $attempt/$max_attempts failed, retrying in 2 seconds..."
        sleep 2
        ((attempt++))
    done
    
    return 1
}

# Rollback to commit
rollback_to_commit() {
    local target_commit="$1"
    
    log "🔄 Rolling back to commit: $target_commit"
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would rollback to commit $target_commit"
        return
    fi
    
    cd "$DEPLOY_PATH"
    
    # Validate commit
    validate_commit "$target_commit" || return 1
    
    # Show commit info
    log "Target commit info:"
    git show --stat "$target_commit" | head -10
    
    # Checkout target commit
    git checkout "$target_commit" || error "Failed to checkout commit $target_commit"
    
    # Install dependencies
    log "📦 Installing dependencies..."
    npm ci --production || error "Failed to install dependencies"
    
    # Build application
    log "🔨 Building application..."
    npm run build || error "Failed to build application"
    
    # Restart application
    log "🔄 Restarting application..."
    pm2 restart "$PROJECT_NAME" || error "Failed to restart application"
    
    # Wait for application to start
    sleep 15
    
    # Health check
    health_check || error "Health check failed after rollback"
    
    success "✅ Successfully rolled back to commit: $target_commit"
}

# Rollback from backup
rollback_from_backup() {
    local backup_name="$1"
    
    log "🔄 Rolling back from backup: $backup_name"
    
    local backup_file=$(validate_backup "$backup_name")
    local restore_script="$DEPLOY_PATH/scripts/restore.sh"
    
    if [ ! -f "$restore_script" ]; then
        error "Restore script not found: $restore_script"
    fi
    
    if [ "$DRY_RUN" = true ]; then
        log "DRY RUN: Would restore from backup $backup_file"
        return
    fi
    
    # Run restore script
    if [ "$FORCE" = true ]; then
        "$restore_script" --force "$backup_file" || error "Failed to restore from backup"
    else
        "$restore_script" "$backup_file" || error "Failed to restore from backup"
    fi
    
    success "✅ Successfully rolled back from backup: $backup_name"
}

# Confirmation prompt
confirm_rollback() {
    if [ "$FORCE" = true ] || [ "$DRY_RUN" = true ]; then
        return
    fi
    
    echo
    echo "⚠️  WARNING: This will rollback the application and may cause downtime."
    echo
    echo "Rollback Details:"
    echo "  Type: $ROLLBACK_TYPE"
    echo "  Target: $TARGET"
    echo "  Current Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')"
    echo
    read -p "Are you sure you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        log "Rollback cancelled by user"
        exit 0
    fi
}

# Generate rollback report
generate_report() {
    local start_time="$1"
    local end_time="$2"
    local target="$3"
    
    local duration=$((end_time - start_time))
    
    cat > "$BACKUP_PATH/last-rollback-report.txt" << EOF
V0 Project Rollback Report
==========================

Rollback Type: $ROLLBACK_TYPE
Target: $target
Start Time: $(date -d @$start_time)
End Time: $(date -d @$end_time)
Duration: ${duration} seconds
Status: SUCCESS

Current State:
- Commit: $(cd "$DEPLOY_PATH" && git rev-parse HEAD 2>/dev/null || echo 'unknown')
- Branch: $(cd "$DEPLOY_PATH" && git branch --show-current 2>/dev/null || echo 'unknown')
- PM2 Status: $(pm2 list | grep "$PROJECT_NAME" | awk '{print $10}' || echo 'unknown')
- Health Check: $(curl -f -s http://localhost:3000/health > /dev/null && echo "PASSED" || echo "FAILED")

Options Used:
- Force: $FORCE
- Dry Run: $DRY_RUN

Pre-rollback backup created: $(ls -t "$BACKUP_PATH"/pre-rollback-* 2>/dev/null | head -1 | xargs basename 2>/dev/null || echo "none")
EOF

    log "📊 Rollback report generated"
}

# Main rollback function
main() {
    local start_time=$(date +%s)
    
    # Handle list targets request
    if [ "$LIST_TARGETS" = true ]; then
        list_targets
        exit 0
    fi
    
    log "🚀 Starting rollback process..."
    
    # Determine target based on rollback type
    case $ROLLBACK_TYPE in
        "previous")
            TARGET=$(get_previous_commit)
            log "Target: Previous commit ($TARGET)"
            ;;
        "commit")
            if [ -z "$TARGET" ]; then
                error "Commit hash is required for commit rollback"
            fi
            log "Target: Commit $TARGET"
            ;;
        "backup")
            if [ -z "$TARGET" ]; then
                error "Backup name is required for backup rollback"
            fi
            log "Target: Backup $TARGET"
            ;;
        *)
            error "Invalid rollback type: $ROLLBACK_TYPE"
            ;;
    esac
    
    # Confirmation
    confirm_rollback
    
    # Create pre-rollback backup
    create_pre_rollback_backup
    
    # Perform rollback based on type
    case $ROLLBACK_TYPE in
        "previous"|"commit")
            rollback_to_commit "$TARGET"
            ;;
        "backup")
            rollback_from_backup "$TARGET"
            ;;
    esac
    
    local end_time=$(date +%s)
    
    # Generate report
    if [ "$DRY_RUN" = false ]; then
        generate_report "$start_time" "$end_time" "$TARGET"
    fi
    
    if [ "$DRY_RUN" = true ]; then
        success "✅ Dry run completed successfully"
    else
        success "✅ Rollback completed successfully"
    fi
    
    log "🎉 Rollback process finished"
}

# Create necessary directories
mkdir -p "$BACKUP_PATH"
mkdir -p "$(dirname "$LOG_FILE")"

# Run main rollback function
main "$@"
```

## File: scripts/server-setup.sh
```bash
#!/bin/bash

# V0 Project - Server Setup Script
# Ubuntu 22.04 LTS Production Server Configuration

set -e

echo "🚀 Starting V0 Project Server Setup..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Install essential packages
echo "🔧 Installing essential packages..."
sudo apt install -y curl wget git unzip software-properties-common apt-transport-https ca-certificates gnupg lsb-release

# Install Node.js 20.x
echo "📦 Installing Node.js 20.x..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Node.js installation
node_version=$(node --version)
npm_version=$(npm --version)
echo "✅ Node.js installed: $node_version"
echo "✅ NPM installed: $npm_version"

# Install PM2 globally
echo "🔄 Installing PM2 process manager..."
sudo npm install -g pm2

# Install PostgreSQL 14
echo "🗄️ Installing PostgreSQL 14..."
sudo apt install -y postgresql postgresql-contrib postgresql-client

# Start and enable PostgreSQL
sudo systemctl start postgresql
sudo systemctl enable postgresql

# Install Redis
echo "📊 Installing Redis..."
sudo apt install -y redis-server

# Configure Redis
sudo systemctl start redis-server
sudo systemctl enable redis-server

# Install Nginx
echo "🌐 Installing Nginx..."
sudo apt install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Install Certbot for SSL
echo "🔒 Installing Certbot for SSL certificates..."
sudo apt install -y certbot python3-certbot-nginx

# Create application user
echo "👤 Creating application user..."
sudo useradd -m -s /bin/bash v0app
sudo usermod -aG sudo v0app

# Create application directories
echo "📁 Creating application directories..."
sudo mkdir -p /var/www/v0-project
sudo mkdir -p /var/log/v0-project
sudo mkdir -p /var/backups/v0-project

# Set permissions
sudo chown -R v0app:v0app /var/www/v0-project
sudo chown -R v0app:v0app /var/log/v0-project
sudo chown -R v0app:v0app /var/backups/v0-project

# Configure firewall
echo "🔥 Configuring UFW firewall..."
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw allow 5432/tcp  # PostgreSQL
sudo ufw allow 6379/tcp  # Redis
sudo ufw --force enable

# Install Docker (optional for containerized services)
echo "🐳 Installing Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Add v0app user to docker group
sudo usermod -aG docker v0app

# Configure system limits
echo "⚙️ Configuring system limits..."
sudo tee /etc/security/limits.conf << EOF
v0app soft nofile 65536
v0app hard nofile 65536
v0app soft nproc 32768
v0app hard nproc 32768
EOF

# Configure sysctl for better performance
sudo tee /etc/sysctl.d/99-v0-performance.conf << EOF
# Network performance tuning
net.core.somaxconn = 65535
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_max_syn_backlog = 65535
net.ipv4.tcp_keepalive_time = 600
net.ipv4.tcp_keepalive_intvl = 60
net.ipv4.tcp_keepalive_probes = 10

# Memory management
vm.swappiness = 10
vm.dirty_ratio = 15
vm.dirty_background_ratio = 5

# File system
fs.file-max = 2097152
EOF

sudo sysctl -p /etc/sysctl.d/99-v0-performance.conf

# Install monitoring tools
echo "📊 Installing monitoring tools..."
sudo apt install -y htop iotop nethogs ncdu

# Create log rotation configuration
sudo tee /etc/logrotate.d/v0-project << EOF
/var/log/v0-project/*.log {
    daily
    missingok
    rotate 30
    compress
    delaycompress
    notifempty
    create 0644 v0app v0app
    postrotate
        pm2 reloadLogs
    endscript
}
EOF

echo "✅ Server setup completed successfully!"
echo "📋 Next steps:"
echo "   1. Configure PostgreSQL database"
echo "   2. Set up SSL certificates"
echo "   3. Deploy the application"
echo "   4. Configure monitoring"
```

## File: styles/globals.css
```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer utilities {
  .text-balance {
    text-wrap: balance;
  }
}

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 0 0% 3.9%;
    --card: 0 0% 100%;
    --card-foreground: 0 0% 3.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 0 0% 3.9%;
    --primary: 0 0% 9%;
    --primary-foreground: 0 0% 98%;
    --secondary: 0 0% 96.1%;
    --secondary-foreground: 0 0% 9%;
    --muted: 0 0% 96.1%;
    --muted-foreground: 0 0% 45.1%;
    --accent: 0 0% 96.1%;
    --accent-foreground: 0 0% 9%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 0 0% 89.8%;
    --input: 0 0% 89.8%;
    --ring: 0 0% 3.9%;
    --chart-1: 12 76% 61%;
    --chart-2: 173 58% 39%;
    --chart-3: 197 37% 24%;
    --chart-4: 43 74% 66%;
    --chart-5: 27 87% 67%;
    --radius: 0.5rem;
    --sidebar-background: 0 0% 98%;
    --sidebar-foreground: 240 5.3% 26.1%;
    --sidebar-primary: 240 5.9% 10%;
    --sidebar-primary-foreground: 0 0% 98%;
    --sidebar-accent: 240 4.8% 95.9%;
    --sidebar-accent-foreground: 240 5.9% 10%;
    --sidebar-border: 220 13% 91%;
    --sidebar-ring: 217.2 91.2% 59.8%;
  }
  .dark {
    --background: 0 0% 3.9%;
    --foreground: 0 0% 98%;
    --card: 0 0% 3.9%;
    --card-foreground: 0 0% 98%;
    --popover: 0 0% 3.9%;
    --popover-foreground: 0 0% 98%;
    --primary: 0 0% 98%;
    --primary-foreground: 0 0% 9%;
    --secondary: 0 0% 14.9%;
    --secondary-foreground: 0 0% 98%;
    --muted: 0 0% 14.9%;
    --muted-foreground: 0 0% 63.9%;
    --accent: 0 0% 14.9%;
    --accent-foreground: 0 0% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 0 0% 98%;
    --border: 0 0% 14.9%;
    --input: 0 0% 14.9%;
    --ring: 0 0% 83.1%;
    --chart-1: 220 70% 50%;
    --chart-2: 160 60% 45%;
    --chart-3: 30 80% 55%;
    --chart-4: 280 65% 60%;
    --chart-5: 340 75% 55%;
    --sidebar-background: 240 5.9% 10%;
    --sidebar-foreground: 240 4.8% 95.9%;
    --sidebar-primary: 224.3 76.3% 48%;
    --sidebar-primary-foreground: 0 0% 100%;
    --sidebar-accent: 240 3.7% 15.9%;
    --sidebar-accent-foreground: 240 4.8% 95.9%;
    --sidebar-border: 240 3.7% 15.9%;
    --sidebar-ring: 217.2 91.2% 59.8%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}
```

## File: types/financial.ts
```typescript
export interface Conta {
  id: string
  nome: string
  valor: number
  categoria: "necessidade" | "desejo" | "divida"
  dataVencimento: number
  status: "ativo" | "suspenso"
  icone: string
}

export interface Pagamento {
  contaId: string
  mes: number
  ano: number
  pago: boolean
  dataPagamento?: string
}

export interface DepositoMeta {
  id: string
  valor: number
  data: string
  descricao?: string
}

export interface Renda {
  salarioLiquido: number
}

export interface FormData {
  nome: string
  valor: string
  categoria: "necessidade" | "desejo" | "divida"
  dataVencimento: string
  icone: string
}

export interface DepositoForm {
  valor: string
  descricao: string
}

export interface FinancialSummary {
  totalNecessidades: number
  totalDesejos: number
  totalDividas: number
  totalDespesas: number
  saldoAposDespesas: number
  saldoFinal: number
}

export type ViewType = "overview" | "manage" | "monthly" | "chile" | "export"

export type IconType =
  | "Home"
  | "Car"
  | "ShoppingCart"
  | "Smartphone"
  | "Heart"
  | "Calculator"
  | "CreditCard"
  | "DollarSign"
```

## File: utils/financial.ts
```typescript
export const formatCurrency = (value: number): string => {
  return new Intl.NumberFormat("pt-BR", {
    style: "currency",
    currency: "BRL",
  }).format(value)
}

export const formatDate = (dateString: string): string => {
  return new Date(dateString).toLocaleDateString("pt-BR")
}

export const getBalanceColor = (value: number): string => {
  if (value > 1000) return "text-emerald-600"
  if (value > 0) return "text-amber-600"
  return "text-red-600"
}

export const getBalanceBgColor = (value: number): string => {
  if (value > 1000) return "bg-emerald-50 border-emerald-200"
  if (value > 0) return "bg-amber-50 border-amber-200"
  return "bg-red-50 border-red-200"
}

export const exportToCSV = (contas: any[], pagamentos: any[], selectedYear: number): void => {
  const headers = [
    "Nome",
    "Valor",
    "Categoria",
    "Data Vencimento",
    "Status",
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro",
  ]

  const rows = contas.map((conta) => {
    const row = [conta.nome, conta.valor.toString(), conta.categoria, conta.dataVencimento.toString(), conta.status]

    // Add payment status for each month
    for (let mes = 0; mes < 12; mes++) {
      const pagamento = pagamentos.find((p) => p.contaId === conta.id && p.mes === mes && p.ano === selectedYear)
      row.push(pagamento?.pago ? "Pago" : "Não Pago")
    }

    return row
  })

  const csvContent = [headers, ...rows].map((row) => row.join(",")).join("\n")
  const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" })
  const link = document.createElement("a")
  const url = URL.createObjectURL(blob)

  link.setAttribute("href", url)
  link.setAttribute("download", `financeiro_${selectedYear}.csv`)
  link.style.visibility = "hidden"

  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

export const MESES = [
  "Janeiro",
  "Fevereiro",
  "Março",
  "Abril",
  "Maio",
  "Junho",
  "Julho",
  "Agosto",
  "Setembro",
  "Outubro",
  "Novembro",
  "Dezembro",
]

export const ANOS = [2023, 2024, 2025, 2026]

export const META_CHILE = 20000
export const DATA_META = new Date(2025, 9, 1) // October 2025
```

## File: .gitignore
```
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# dependencies
/node_modules

# next.js
/.next/
/out/

# production
/build

# debug
npm-debug.log*
yarn-debug.log*
yarn-error.log*
.pnpm-debug.log*

# env files
.env*

# vercel
.vercel

# typescript
*.tsbuildinfo
next-env.d.ts
```

## File: components.json
```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "app/globals.css",
    "baseColor": "neutral",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  },
  "iconLibrary": "lucide"
}
```

## File: ecosystem.config.js
```javascript
// V0 Project - PM2 Ecosystem Configuration
// Production-ready process management configuration

module.exports = {
  apps: [
    {
      // Main application
      name: "v0-project",
      script: "npm",
      args: "start",
      cwd: "/var/www/v0-project",
      instances: "max", // Use all available CPU cores
      exec_mode: "cluster",

      // Environment variables
      env: {
        NODE_ENV: "production",
        PORT: 3000,
        NEXT_TELEMETRY_DISABLED: 1,
      },

      // Memory and CPU management
      max_memory_restart: "1G",
      min_uptime: "10s",
      max_restarts: 10,

      // Logging configuration
      log_file: "/var/log/v0-project/combined.log",
      out_file: "/var/log/v0-project/out.log",
      error_file: "/var/log/v0-project/error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss Z",
      merge_logs: true,

      // Process monitoring
      watch: false, // Disable in production
      ignore_watch: ["node_modules", ".next", "logs", "*.log"],

      // Restart configuration
      restart_delay: 4000,
      autorestart: true,

      // Health monitoring
      health_check_grace_period: 3000,
      health_check_fatal_exceptions: true,

      // Advanced PM2 features
      instance_var: "INSTANCE_ID",
      source_map_support: true,

      // Kill timeout
      kill_timeout: 5000,

      // Listen timeout
      listen_timeout: 8000,

      // Graceful shutdown
      shutdown_with_message: true,

      // Node.js specific options
      node_args: ["--max-old-space-size=1024", "--optimize-for-size"],

      // Environment specific configuration
      env_production: {
        NODE_ENV: "production",
        PORT: 3000,
        INSTANCE_ID: 0,
      },

      env_staging: {
        NODE_ENV: "staging",
        PORT: 3000,
        INSTANCE_ID: 0,
      },
    },

    // Background worker for scheduled tasks
    {
      name: "v0-worker",
      script: "./scripts/worker.js",
      cwd: "/var/www/v0-project",
      instances: 1,
      exec_mode: "fork",

      env: {
        NODE_ENV: "production",
        WORKER_TYPE: "scheduler",
      },

      // Worker-specific settings
      max_memory_restart: "512M",
      min_uptime: "10s",
      max_restarts: 5,
      restart_delay: 10000,

      // Logging
      log_file: "/var/log/v0-project/worker-combined.log",
      out_file: "/var/log/v0-project/worker-out.log",
      error_file: "/var/log/v0-project/worker-error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss Z",

      // Cron restart (restart daily at 3 AM)
      cron_restart: "0 3 * * *",

      // Auto restart on file changes (disabled in production)
      watch: false,

      // Kill timeout
      kill_timeout: 10000,
    },

    // Monitoring and metrics collector
    {
      name: "v0-monitor",
      script: "./scripts/monitor-daemon.js",
      cwd: "/var/www/v0-project",
      instances: 1,
      exec_mode: "fork",

      env: {
        NODE_ENV: "production",
        MONITOR_INTERVAL: 30000,
        METRICS_RETENTION: "7d",
      },

      // Monitor-specific settings
      max_memory_restart: "256M",
      min_uptime: "30s",
      max_restarts: 3,
      restart_delay: 15000,

      // Logging
      log_file: "/var/log/v0-project/monitor-combined.log",
      out_file: "/var/log/v0-project/monitor-out.log",
      error_file: "/var/log/v0-project/monitor-error.log",
      log_date_format: "YYYY-MM-DD HH:mm:ss Z",

      // Auto restart
      autorestart: true,
      watch: false,

      // Kill timeout
      kill_timeout: 5000,
    },
  ],

  // Deployment configuration
  deploy: {
    production: {
      user: "v0app",
      host: ["your-server-ip"],
      ref: "origin/main",
      repo: "https://github.com/your-username/v0-project.git",
      path: "/var/www/v0-project",

      // Pre-deploy commands
      "pre-deploy-local": "",
      "pre-deploy": "git fetch --all",

      // Post-deploy commands
      "post-deploy":
        "npm ci --production && npm run build && pm2 reload ecosystem.config.js --env production && pm2 save",

      // Environment variables for deployment
      env: {
        NODE_ENV: "production",
      },
    },

    staging: {
      user: "v0app",
      host: ["staging-server-ip"],
      ref: "origin/develop",
      repo: "https://github.com/your-username/v0-project.git",
      path: "/var/www/v0-project-staging",

      "pre-deploy-local": "",
      "pre-deploy": "git fetch --all",
      "post-deploy": "npm ci && npm run build && pm2 reload ecosystem.config.js --env staging && pm2 save",

      env: {
        NODE_ENV: "staging",
      },
    },
  },
}
```

## File: next.config.mjs
```
/** @type {import('next').NextConfig} */
const nextConfig = {
  eslint: {
    ignoreDuringBuilds: true,
  },
  typescript: {
    ignoreBuildErrors: true,
  },
  images: {
    unoptimized: true,
  },
}

export default nextConfig
```

## File: package.json
```json
{
  "name": "my-v0-project",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "build": "next build",
    "dev": "next dev",
    "lint": "next lint",
    "start": "next start"
  },
  "dependencies": {
    "@hookform/resolvers": "^3.9.1",
    "@radix-ui/react-accordion": "latest",
    "@radix-ui/react-alert-dialog": "latest",
    "@radix-ui/react-aspect-ratio": "latest",
    "@radix-ui/react-avatar": "latest",
    "@radix-ui/react-checkbox": "latest",
    "@radix-ui/react-collapsible": "latest",
    "@radix-ui/react-context-menu": "latest",
    "@radix-ui/react-dialog": "latest",
    "@radix-ui/react-dropdown-menu": "latest",
    "@radix-ui/react-hover-card": "latest",
    "@radix-ui/react-label": "latest",
    "@radix-ui/react-menubar": "latest",
    "@radix-ui/react-navigation-menu": "latest",
    "@radix-ui/react-popover": "latest",
    "@radix-ui/react-progress": "latest",
    "@radix-ui/react-radio-group": "latest",
    "@radix-ui/react-scroll-area": "latest",
    "@radix-ui/react-select": "latest",
    "@radix-ui/react-separator": "latest",
    "@radix-ui/react-slider": "latest",
    "@radix-ui/react-slot": "latest",
    "@radix-ui/react-switch": "latest",
    "@radix-ui/react-tabs": "latest",
    "@radix-ui/react-toast": "latest",
    "@radix-ui/react-toggle": "latest",
    "@radix-ui/react-toggle-group": "latest",
    "@radix-ui/react-tooltip": "latest",
    "autoprefixer": "^10.4.20",
    "class-variance-authority": "^0.7.1",
    "clsx": "^2.1.1",
    "cmdk": "latest",
    "date-fns": "4.1.0",
    "embla-carousel-react": "latest",
    "geist": "^1.3.1",
    "input-otp": "latest",
    "lucide-react": "^0.454.0",
    "next": "15.2.4",
    "next-themes": "latest",
    "react": "^19",
    "react-day-picker": "latest",
    "react-dom": "^19",
    "react-hook-form": "latest",
    "react-resizable-panels": "latest",
    "recharts": "latest",
    "sonner": "latest",
    "tailwind-merge": "^2.5.5",
    "tailwindcss-animate": "^1.0.7",
    "vaul": "latest",
    "zod": "^3.24.1"
  },
  "devDependencies": {
    "@types/node": "^22",
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "postcss": "^8.5",
    "tailwindcss": "^3.4.17",
    "typescript": "^5"
  }
}
```

## File: postcss.config.mjs
```
/** @type {import('postcss-load-config').Config} */
const config = {
  plugins: {
    tailwindcss: {},
  },
};

export default config;
```

## File: README.md
```markdown
# Cyberpunk dashboard design

*Automatically synced with your [v0.dev](https://v0.dev) deployments*

[![Deployed on Vercel](https://img.shields.io/badge/Deployed%20on-Vercel-black?style=for-the-badge&logo=vercel)](https://vercel.com/prof-gabriel-ramos/v0-cyberpunk-dashboard-design)
[![Built with v0](https://img.shields.io/badge/Built%20with-v0.dev-black?style=for-the-badge)](https://v0.dev/chat/projects/oQvry1LuiDC)

## Overview

This repository will stay in sync with your deployed chats on [v0.dev](https://v0.dev).
Any changes you make to your deployed app will be automatically pushed to this repository from [v0.dev](https://v0.dev).

## Deployment

Your project is live at:

**[https://vercel.com/prof-gabriel-ramos/v0-cyberpunk-dashboard-design](https://vercel.com/prof-gabriel-ramos/v0-cyberpunk-dashboard-design)**

## Build your app

Continue building your app on:

**[https://v0.dev/chat/projects/oQvry1LuiDC](https://v0.dev/chat/projects/oQvry1LuiDC)**

## How It Works

1. Create and modify your project using [v0.dev](https://v0.dev)
2. Deploy your chats from the v0 interface
3. Changes are automatically pushed to this repository
4. Vercel deploys the latest version from this repository
```

## File: tailwind.config.ts
```typescript
import type { Config } from "tailwindcss";

// all in fixtures is set to tailwind v3 as interims solutions

const config: Config = {
    darkMode: ["class"],
    content: [
    "./pages/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "*.{js,ts,jsx,tsx,mdx}"
  ],
  theme: {
  	extend: {
  		colors: {
  			background: 'hsl(var(--background))',
  			foreground: 'hsl(var(--foreground))',
  			card: {
  				DEFAULT: 'hsl(var(--card))',
  				foreground: 'hsl(var(--card-foreground))'
  			},
  			popover: {
  				DEFAULT: 'hsl(var(--popover))',
  				foreground: 'hsl(var(--popover-foreground))'
  			},
  			primary: {
  				DEFAULT: 'hsl(var(--primary))',
  				foreground: 'hsl(var(--primary-foreground))'
  			},
  			secondary: {
  				DEFAULT: 'hsl(var(--secondary))',
  				foreground: 'hsl(var(--secondary-foreground))'
  			},
  			muted: {
  				DEFAULT: 'hsl(var(--muted))',
  				foreground: 'hsl(var(--muted-foreground))'
  			},
  			accent: {
  				DEFAULT: 'hsl(var(--accent))',
  				foreground: 'hsl(var(--accent-foreground))'
  			},
  			destructive: {
  				DEFAULT: 'hsl(var(--destructive))',
  				foreground: 'hsl(var(--destructive-foreground))'
  			},
  			border: 'hsl(var(--border))',
  			input: 'hsl(var(--input))',
  			ring: 'hsl(var(--ring))',
  			chart: {
  				'1': 'hsl(var(--chart-1))',
  				'2': 'hsl(var(--chart-2))',
  				'3': 'hsl(var(--chart-3))',
  				'4': 'hsl(var(--chart-4))',
  				'5': 'hsl(var(--chart-5))'
  			},
  			sidebar: {
  				DEFAULT: 'hsl(var(--sidebar-background))',
  				foreground: 'hsl(var(--sidebar-foreground))',
  				primary: 'hsl(var(--sidebar-primary))',
  				'primary-foreground': 'hsl(var(--sidebar-primary-foreground))',
  				accent: 'hsl(var(--sidebar-accent))',
  				'accent-foreground': 'hsl(var(--sidebar-accent-foreground))',
  				border: 'hsl(var(--sidebar-border))',
  				ring: 'hsl(var(--sidebar-ring))'
  			}
  		},
  		borderRadius: {
  			lg: 'var(--radius)',
  			md: 'calc(var(--radius) - 2px)',
  			sm: 'calc(var(--radius) - 4px)'
  		},
  		keyframes: {
  			'accordion-down': {
  				from: {
  					height: '0'
  				},
  				to: {
  					height: 'var(--radix-accordion-content-height)'
  				}
  			},
  			'accordion-up': {
  				from: {
  					height: 'var(--radix-accordion-content-height)'
  				},
  				to: {
  					height: '0'
  				}
  			}
  		},
  		animation: {
  			'accordion-down': 'accordion-down 0.2s ease-out',
  			'accordion-up': 'accordion-up 0.2s ease-out'
  		}
  	}
  },
  plugins: [require("tailwindcss-animate")],
};
export default config;
```

## File: tsconfig.json
```json
{
  "compilerOptions": {
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "target": "ES6",
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "paths": {
      "@/*": ["./*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
```
