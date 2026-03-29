# SHINE OS

**An AI operating system for your business. Works with any AI. Free. No catch.**

Built by [David Caldicott](https://shineon.world) — founder of Shine On Cleans, where this system runs a live business every day.

---

## 👋 Start here.

Download this folder. Open your AI. Say:

> **"I've just downloaded SHINE OS. Let's get set up."**

Your AI reads `CLAUDE.md`, understands the system, and walks you through a 10-minute setup. When you're done, you've got a named squad of AI agents, a task tracker, session reports, and something you can actually use today.

---

## Works With Any AI

| Platform | How it works |
|----------|-------------|
| **Claude Cowork** | Best experience — select this folder as your workspace, start talking. `CLAUDE.md` loads automatically. |
| **ChatGPT / Gemini / any AI** | Copy the contents of `CLAUDE.md` and paste it as your first message each session. Or use Custom Instructions to load it permanently. |
| **Obsidian + any AI** | Open this folder as an Obsidian vault. The wiki-links work natively. Copy context into your AI when you need it. |
| **Google Drive + any AI** | Upload the files to a Drive folder. Reference them when working with your AI. How this system was originally built. |

The AI is the reader. The files are the system.

---

## What Is This?

SHINE OS is a framework for running your business with a squad of named AI agents — each with a defined role, working together through a shared task system.

Not a chatbot. Not a prompt library. An operating model.

You get a **Service Advisor** that handles enquiries and quotes. An **Ops Captain** that thinks strategically and dispatches work. A **Task Manager** that schedules and follows up. A **Receptionist** that triages inbound. A **Support Agent** that handles complaints.

They share context. They hand off to each other. They log everything.

---

## Three Tiers

SHINE works at whatever level you need it.

| Tier | What you get | What you need | Cost |
|------|-------------|--------------|------|
| **shine-os** (this repo) | The methodology — sessions, tasks, agents, decision logs. Works with any AI + any file system. | Any AI subscription + a folder | Free |
| **shine-activated** | Full infrastructure — automated workflows, persistent database, AI voice agents. Self-hosted on your own accounts. | n8n + Supabase + Retell | ~$50-150/mo |
| **shine-integrated** | Managed platform — run on SHINE infrastructure, access Atlas and ShineOn apps under your own brand. | A subscription | Free tier available |

Start with shine-os. Add the rest when you hit the ceiling.

→ **shine-activated:** [shineon.world/install](https://shineon.world/install)
→ **shine-integrated:** [shineon.world/platform](https://shineon.world/platform)

---

## What You Need (Tier 1 — shine-os)

- Any AI that can read text (Claude, ChatGPT, Gemini, local models, anything)
- A folder on your computer
- 10 minutes

**No database. No automation platform. No coding. No specific AI tool.**

---

## Quick Install

**Option A — Download ZIP** (easiest)

Click the green **Code** button above → **Download ZIP** → unzip → open your AI → paste the contents of `CLAUDE.md` or select the folder in Cowork → say "I've just downloaded SHINE OS. Let's get set up."

**Option B — Git clone**

```bash
git clone https://github.com/davidshineoncleans/shine-os
```

---

## What's Included

```
shine-os/
├── CLAUDE.md              ← The operating system (your AI reads this every session)
├── TASKS.md               ← Single source of truth for work in progress
├── INDEX.md               ← Directory map
│
│── ─── TIER 1: shine-os (works now) ───
│
├── Agents/                ← Agent prompt templates for each role
│   ├── service-advisor/   ← Customer-facing: quotes, enquiries, calls
│   ├── ops-captain/       ← Strategic brain: pipeline, dispatch, decisions
│   ├── task-manager/      ← Execution: scheduling, follow-ups, reminders
│   ├── receptionist/      ← Inbound: routing and triage
│   └── support-agent/     ← Support: complaints and aftercare
│
├── Memory/                ← Your glossary, branding, and business reference
├── Ops/                   ← Your operational docs (pricing, pipelines, etc.)
├── Dev/                   ← Technical assets and build notes
├── Reports/               ← Session reports (auto-named by date)
├── Setup/                 ← Quick start and stack setup guides
│
│── ─── TIER 2: shine-activated (coming soon — git pull) ───
│
├── Stack/                 ← Infrastructure install
│   ├── n8n-workflows/     ← Importable workflow JSON files
│   ├── supabase/          ← SQL migrations and table schemas
│   └── retell/            ← Voice agent configs and prompts
│
│── ─── TIER 3: shine-integrated (coming soon — git pull) ───
│
└── Platform/              ← Managed platform connection
    └── README.md          ← What's coming + how to register interest
```

---

## How It Works

**Sessions are structured.** Every session opens a live report, works through problems with your agents, and closes with an updated task list. Nothing falls through the cracks.

**Agents have roles.** Your Service Advisor handles all customer communication. Your Ops Captain thinks strategically. Your Task Manager executes. They don't step on each other.

**Context persists.** Session reports, your glossary, and your task tracker give your AI squad memory across days, weeks, and months — without a database.

**It grows with you.** Start with the methodology alone. Add the full automation stack when you outgrow it. The operating model works the same either way.

---

## Who Built This and Why

I'm David Caldicott. I run [Shine On Cleans](https://shineon.uk) — an AI-supported cleaning service in the UK.

I built SHINE because I needed a system, not just tools. This is what runs my business live: AI agents that handle enquiries, take calls, manage tasks, and dispatch each other — while I focus on growing the company.

I started this in Google Drive, pasting context into ChatGPT. Then I moved to Obsidian. Then Claude Cowork came along and made it seamless. But the methodology worked before any specific tool existed — and it'll work after.

I'm releasing the framework because the problem is universal. Every founder with a service business is drowning in the same operational noise. And most AI tools just add to it.

---

## Read More

- [Use Cases & Day-to-Day Experience](USE_CASES.md) — real examples for trades, consultants, agencies, property managers
- [Honest Limitations](LIMITATIONS.md) — what this doesn't do, what it costs, where it breaks down
- [Design Decisions](Memory/design-decisions.md) — the reasoning behind every architectural choice
- [Architecture: shine-os vs shine-activated](Dev/ARCHITECTURE_DECISION.md) — why two products, not one

---

## Contribute / Feedback

Found a bug? Improved something? Built an extension? Want to run your business on our platform?

📧 hello@shineon.world

I read everything.

---

## Licence

CC0 1.0 Universal. Public domain. Use it however you want.

---

*SHINE OS — created by David Caldicott · [shineon.world](https://shineon.world)*
