# External Agent Integration — How Any Tool Can Work With SHINE OS

Parent: [[CLAUDE]] · [[Dev/ARCHITECTURE_DECISION]]
Related: [[glossary]] · [[TASKS]]

---

## The Core Idea

SHINE OS is file-based by design. That means **any tool that can read and write markdown files can participate in your SHINE workspace** — no proprietary API, no vendor lock-in, no special SDK.

Your files are the API.

---

## How It Works Across Tiers

### Tier 1: shine-os (Files Only)

At the simplest level, SHINE OS is a folder of markdown files. Any external agent, script, or tool that can read/write files can integrate immediately.

**What external agents can read:**

| File | What it gives them |
|------|--------------------|
| `CLAUDE.md` | Full business context — agents, roles, conventions, active projects |
| `TASKS.md` | Current work in progress, priorities, blockers |
| `Reports/*.md` | Session history — what happened, what was decided, what's next |
| `Memory/glossary.md` | Agent registry, system IDs, key terms |
| `Agents/*/` | Individual agent specs, prompts, knowledge bases |

**What external agents can write:**

| File | What they'd add |
|------|--------------------|
| `TASKS.md` | New tasks, status updates, completed items |
| `Reports/` | Session reports from their own work sessions |
| `Agents/*/` | Updated agent specs, new knowledge base entries |

**The contract is simple:** read `CLAUDE.md` for context, read/write `TASKS.md` for coordination, write to `Reports/` so nothing gets lost. Follow the naming conventions and wiki-link patterns documented in `CLAUDE.md` and your work becomes part of the graph.

### Tier 2: shine-activated (Files + HTTP Endpoints)

When you add n8n, Supabase, and Retell, external agents gain access to real-time APIs alongside the file system.

**HTTP endpoints (via n8n webhooks):** Your endpoints will follow your own naming — here are the typical patterns:

| Example Endpoint | What it does |
|----------|-------------|
| `/api/task` | Create a task in the universal task table |
| `/api/lead` | Submit a new lead into the pipeline |
| `/api/welcome-call` | Trigger a welcome call via your voice agent |
| `/api/dispatch` | Fire an event into your dispatch agent's queue |

**Database access (via Supabase HTTP API):** Your tables will match your schema — these are the common ones:

| Typical Table | What's in it |
|-------|-------------|
| `leads` | Lead pipeline — status, source, contact info, timeline |
| `tasks` | Universal task queue — assigned agent, priority, due date, status |
| `sessions` | Session report metadata — searchable from any interface |
| `outbound_queue` | Queued communications — emails, SMS, calls |

**Voice agents (via Retell or similar):**

| Example Agent | What they do |
|-------|-------------|
| Receptionist | Inbound routing — routes calls, takes messages |
| Service Advisor | Handles lead calls, quote discussions, follow-ups |

External agents can trigger outbound calls, check call logs, or register custom voice agents using voice AI APIs — all coordinated through the same task system.

### Tier 3: shine-integrated (Managed Platform)

At this level, external agents interact with the SHINE platform via managed APIs. Your business runs on SHINE infrastructure, and external tools connect through authenticated endpoints with rate limits, permissions, and audit logging.

This tier is coming — but the principle is the same. Files at the bottom, HTTP in the middle, managed APIs at the top. Each layer builds on the one below.

---

## Integration Patterns

### Pattern 1: Read-Only Observer

The simplest integration. Your external agent reads SHINE workspace files for context but doesn't write anything back.

**Use case:** A ClawdBot/OpenClaw user who wants their messaging agent to understand their business context.

**How:**
1. Point your agent at `CLAUDE.md` as its system prompt or context file
2. It now knows your business, your agents, your conventions
3. When it answers questions, it has the full picture

**Example:** A WhatsApp bot powered by OpenClaw reads `CLAUDE.md` + `TASKS.md` at session start. When a team member messages "what's the status on the Johnson lead?", the bot can check `TASKS.md` and recent reports for context.

### Pattern 2: Task Contributor

Your external agent reads context AND writes tasks back into the SHINE system.

**Use case:** A scheduling tool, CRM, or automation script that creates follow-up tasks.

**How (Tier 1):**
1. Read `TASKS.md` to understand current state
2. Append new tasks using the existing format
3. Follow the `- [ ] Task description` convention

**How (Tier 2):**
1. POST to `/api/task` with: `{ "title", "assigned_to", "priority", "due_date", "source" }`
2. The task lands in Gale's universal task table
3. Gale processes it on the next cycle

### Pattern 3: Full Participant

Your external agent operates as a member of the SHINE squad — reading context, executing work, writing reports, updating tasks.

**Use case:** A custom AI agent built on any platform (LangChain, CrewAI, AutoGen, OpenClaw) that handles a specific business function.

**How:**
1. Read `CLAUDE.md` for full context at session start
2. Read `TASKS.md` for assigned work
3. Do the work (using whatever tools your agent has)
4. Write a session report to `Reports/YYYY-MM-DD_session-{topic}_COMPLETE.md`
5. Update `TASKS.md` with completed items and new discoveries
6. At Tier 2: also POST results to Supabase and fire relevant webhooks

**The key insight:** Your agent doesn't need to be built on Claude, or n8n, or any specific platform. It just needs to follow the SHINE conventions — which are documented in plain English in `CLAUDE.md`.

---

## OpenClaw / ClawdBot Specifically

OpenClaw (formerly ClawdBot) is a messaging bridge — it connects WhatsApp, Telegram, and other messaging platforms to Claude via a local machine. It's a different category from SHINE (single-agent gateway vs multi-agent operating model), but they're complementary.

**How an OpenClaw user would integrate with SHINE OS:**

1. **Install SHINE OS** alongside OpenClaw — they live in separate folders, no conflict
2. **Feed CLAUDE.md to OpenClaw** as context — now your messaging agent understands your business
3. **Let OpenClaw handle messaging, SHINE handle operations** — OpenClaw routes WhatsApp messages, SHINE manages the pipeline, tasks, and agent squad
4. **At Tier 2:** OpenClaw agents can fire webhooks to SHINE's n8n endpoints when a customer messages something actionable (like requesting a quote)

**What this looks like in practice:**

A customer messages via WhatsApp → OpenClaw receives it → reads `CLAUDE.md` for context → recognises it's a quote request → writes a task to `TASKS.md` (Tier 1) or fires `/api/lead` (Tier 2) → Marshall dispatches Archer → Archer calls the customer → the whole pipeline runs.

The messaging bridge handles the channel. SHINE handles the business logic.

---

## For Developers Building Integrations

### File Format Contract

All SHINE workspace files are markdown with a predictable structure:

- **Headers** use `##` for sections, `###` for subsections
- **Task format:** `- [ ] Task` (pending) or `- [x] Task` (done)
- **Wiki-links:** `[[filename]]` or `[[filename|Display Text]]`
- **Metadata:** YAML-style key-value pairs in headers (e.g., `Parent: [[CLAUDE]]`)
- **Reports:** Follow the S-H-I-N-E dispatch format (Situation, Highlights, Identified Issues, Next Actions, Execution Log)

### Webhook Payload Conventions (Tier 2)

We recommend a consistent JSON structure for all webhooks:

```json
{
  "source": "your-agent-name",
  "timestamp": "ISO 8601",
  "type": "task|lead|event|report",
  "payload": { }
}
```

### Authentication (Tier 2+)

- Supabase: Your project's `anon` key for read, `service_role` key for write
- n8n webhooks: URL-based auth (webhook URLs act as secrets)
- Voice APIs: API key in headers

### Rate Limits (Tier 3)

Managed platform endpoints have rate limits based on subscription tier. Details published when Tier 3 launches.

---

## The Philosophy

SHINE OS is designed to be the opposite of a walled garden. The files are plain text. The conventions are documented in English. The APIs (at Tier 2+) are standard HTTP.

If your tool can read a markdown file, it can understand SHINE.
If your tool can write a markdown file, it can participate in SHINE.
If your tool can fire an HTTP request, it can trigger SHINE.

That's it. No SDK. No vendor dependency. No lock-in. Bring whatever AI you want.

---

*Built by David Caldicott · [shineon.world](https://shineon.world) · hello@shineon.world*
