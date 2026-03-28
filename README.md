# SHINE Agent Mesh

**An AI operating system for your business. Free. No catch.**

Built by [David Caldicott](https://shineon.world) — founder of Shine On Cleans, where this system runs live.

---

## What Is This?

SHINE is a framework for running your business with a squad of named AI agents — each with a defined role, working together through a shared task system.

Not a chatbot. Not a prompt library. An operating model.

You get a **Service Advisor** that handles enquiries and quotes. An **Ops Captain** that thinks strategically and dispatches work. A **Task Manager** that schedules and follows up. A **Receptionist** that triages inbound. A **Support Agent** that handles complaints.

They share context. They hand off to each other. They log everything.

And a 10-minute setup wizard names them whatever you want and customises everything for your business.

---

## What You Need

- [Claude desktop app](https://claude.ai/download)
- Claude Pro ($20/month) or Max ($100/month)
- Cowork mode enabled (beta — available in Claude settings)

**No database. No automation platform. No coding.**

Those are optional layers you can add later. This works out of the box.

---

## Quick Install

```bash
git clone https://github.com/davidshineoncleans/shine-agent-mesh
```

Then follow `Setup/01_QUICK_START.md`.

Or: **one-click plugin install coming soon** — watch [shineon.world](https://shineon.world) for updates.

---

## What's Included

```
shine-agent-mesh/
├── CLAUDE.md              ← The operating system (read every session)
├── TASKS.md               ← Your single source of truth for work in progress
├── INDEX.md               ← Directory map
│
├── Agents/                ← Agent prompt templates for each role
│   ├── service-advisor/   ← Customer-facing: quotes, enquiries, calls
│   ├── ops-captain/       ← Strategic brain: pipeline, dispatch, decisions
│   ├── task-manager/      ← Execution: scheduling, follow-ups, reminders
│   ├── receptionist/      ← Inbound: routing and triage
│   └── support-agent/     ← Support: complaints and aftercare
│
├── Skills/
│   ├── shine-setup/       ← First-time setup wizard (/shine-setup)
│   └── shine-reports/     ← Session reporting format (/shine-reports)
│
├── Memory/                ← Your glossary, branding, and business reference
├── Ops/                   ← Your operational docs (pricing, pipelines, etc.)
├── Dev/                   ← Technical assets when you're ready
├── Reports/               ← Session reports (auto-named by date)
│
└── Setup/
    ├── 01_QUICK_START.md  ← Up and running in 10 minutes
    └── 02_ADD_YOUR_STACK.md ← n8n, Supabase, Retell when you're ready
```

---

## How It Works

**Sessions are structured.** Every session opens a live report, works through problems with your agents, and closes with an updated task list. Nothing falls through the cracks.

**Agents have roles.** Your Service Advisor handles all customer communication. Your Ops Captain thinks strategically. Your Task Manager executes. They don't step on each other.

**Context persists.** Session reports, your glossary, and your task tracker give your AI squad memory across days, weeks, and months — without a database.

**It grows with you.** Start with the framework and two agents. Add the full automation stack when you're ready. The methodology works the same either way.

---

## The Stack (Optional)

When you're ready to automate:

| Layer | Tool | What it adds |
|-------|------|-------------|
| Data | [Supabase](https://supabase.com) | Persistent task storage, session history, lead records |
| Automation | [n8n](https://n8n.io) | Agents trigger each other automatically |
| Voice | [Retell](https://retell.ai) | AI phone agents that make and take calls |

See `Setup/02_ADD_YOUR_STACK.md` for setup guides.

---

## Who Built This and Why

I'm David Caldicott. I run [Shine On Cleans](https://shineon.uk) — an AI-supported cleaning service in the UK.

I built SHINE because I needed a system, not just tools. This is what runs my business live: AI agents that handle enquiries, take calls, manage tasks, and dispatch each other — while I focus on growing the company.

I'm releasing the framework because the problem is universal. Every founder with a service business is drowning in the same operational noise. And most AI tools just add to it.

This is different. Fork it, use it, and if you build something interesting on top of it, tell me about it.

---

## Read More

- [Use Cases & Day-to-Day Experience](USE_CASES.md) — real examples for trades, consultants, agencies, property managers
- [Honest Limitations](LIMITATIONS.md) — what this doesn't do, what it costs, where it breaks down
- [Design Decisions](Memory/design-decisions.md) — the reasoning behind every architectural choice

---

## Contribute / Feedback

Found a bug? Improved something? Built an extension?

📧 hello@shineon.world

I read everything.

---

## Licence

MIT. Fork it, use it commercially, ship it to clients.
Attribution appreciated but not required. Just don't remove the contact line from `CLAUDE.md`.

---

*SHINE Agent Mesh — created by David Caldicott · [shineon.world](https://shineon.world)*
