# The Repository Split: shine-os vs shine-agent-mesh

Parent: [[CLAUDE]]
Related: [[decisions]] · [[glossary]]

**Status:** DECISION DOCUMENT — Implementation plan for repository architecture
**Date:** 2026-03-28
**Author:** David Caldicott

---

## Executive Summary

SHINE is being split into two repositories with distinct audiences and distribution models:

1. **shine-os** — The free, no-infrastructure Cowork methodology layer
2. **shine-agent-mesh** — The premium, full-stack infrastructure layer

This document defines the split, the user journeys, and what changes must happen in the current repo to enable it.

---

## The Split: Two Products, One Codebase Philosophy

### Repo 1: shine-os (FREE)

**What it is:**
- The Claude Cowork methodology layer and agent framework
- Pure markdown + skills + Obsidian conventions
- Works with JUST Claude Pro + a folder, no infrastructure needed
- The setup skill names agents and customises workspace in ~10 minutes

**Who it's for:**
- Solo founders and small teams (1-5 people)
- Anyone with Claude Pro ($20/mo)
- Service businesses, consultants, agencies, trades
- Builders who want to customize and extend

**What's included:**
- CLAUDE.md — the operating system file (generic, no Shine On refs)
- Agent prompt templates (design docs, not deployed agents)
- Session report format + task tracking conventions
- Setup skill that asks business questions and populates workspace
- Documentation: quick start, limitations, use cases, design decisions

**Distribution:**
- GitHub repo: `davidshineoncleans/shine-os` (public, MIT license)
- Free download: ZIP or `git clone`
- One-click plugin install coming to Claude desktop (future)
- TikTok & word-of-mouth

**What's NOT included:**
- n8n workflows or integrations
- Supabase tables or migrations
- Retell agent configs
- Welcome call infrastructure
- Any deployment mechanism

**Cost to user:**
- Claude Pro: $20/month
- Everything else: free

---

### Repo 2: shine-agent-mesh (PREMIUM / LATER)

**What it is:**
- The full infrastructure install
- n8n workflows, Supabase tables/migrations, Retell agent configs
- Onboarding workflow that provisions everything automatically
- A pre-configured Cowork workspace (shine-os + infrastructure connection skills)
- The welcome call webhook and intake pipeline

**Who it's for:**
- Founders ready to automate their full operation
- Teams that need persistent data and multi-person workflows
- Businesses making > $50k/month (can afford infrastructure costs)
- Builders who want to run SHINE as a commercial SaaS

**Installation path:**
- Go to `shineon.world/install`
- Fill form: business name, email, phone, API keys (n8n, Supabase)
- n8n onboarding webhook provisions everything:
  - Supabase tables created + schema migrations run
  - n8n workflows imported to their instance
  - Retell agents configured with their API keys
  - Pre-configured workspace downloaded
- Get email with setup summary + dashboard credentials
- Open workspace in Cowork
- Receive welcome call from Retell agent within 60 seconds
- Everything's connected and ready to go

**Distribution:**
- Separate GitHub repo: `davidshineoncleans/shine-agent-mesh`
- Install via web form at `shineon.world/install`
- Install via Terminal: `curl -fsSL https://shineon.world/install | bash` (wraps the web form)
- Email delivery of pre-configured workspace

**Infrastructure costs (paid by user):**
- n8n Cloud: ~$10-50/month (depending on workflows)
- Supabase: ~$25-100/month (depending on data volume)
- Retell: ~$0.05-0.10 per minute of call time
- Total: ~$50-150/month for full stack

**What's included:**
- Everything from shine-os
- Plus n8n workflow templates (Lead_Intake, Task_Dispatcher, Session_Logger, etc.)
- Plus Supabase migrations + RLS policies
- Plus Retell agent configurations
- Plus infrastructure connection skills (n8n trigger handler, Supabase sync, etc.)
- Plus HTML control panel / dashboard
- Plus onboarding workflow (the installer)

---

## User Journeys

### Journey 1: shine-os (Free Path)

**Time to first win:** ~10 minutes
**Cost:** $20/mo (Claude Pro)

```
1. Download shine-os from GitHub
   ↓
2. Open in Claude desktop (select folder as Cowork workspace)
   ↓
3. Say: "I've just downloaded SHINE OS. Let's get set up."
   ↓
4. Run /shine-setup skill
   - What's your business name?
   - What do you do?
   - What's driving you mad right now?
   - Name your 5 agents (Archer, Marshall, Gale, etc. or custom)
   - CLAUDE.md + TASKS.md populated
   ↓
5. Say: "Marshall, I want to work on [problem] — where do we start?"
   ↓
6. First real win (usually a lead follow-up, task assignment, or decision made)
   ↓
7. Ready for next session
   • All agents are named
   • TASKS.md tracks everything
   • Session reports build memory
   • No infrastructure, no code, no config
```

**What they get immediately:**
- Named AI squad with defined roles
- Session tracking and task lists
- Obsidian wiki-links (knowledge graph)
- Agent prompt templates they can customize
- A system that actually works (no setup hell)

**When they hit the ceiling:**
- Manual syncing between sessions gets tedious
- Want voice agents (Retell)
- Want persistent lead records
- Want automated dispatch
- Say: "I'm ready for the full stack."

---

### Journey 2: shine-agent-mesh (Full Stack Path)

**Time to full automation:** ~30-45 minutes (mostly API key gathering)
**Cost:** $20 (Claude) + $50-150/mo (infrastructure)

```
1. Go to shineon.world/install
   ↓
2. Fill form:
   - Business name
   - Business type
   - Your email
   - Your phone
   - n8n URL (optional — can skip and we provision for you)
   - Supabase URL (optional — same)
   ↓
3. Click "Install"
   ↓
4. n8n onboarding workflow runs:
   - Check or create Supabase tables (tasks, session_reports, leads)
   - Import n8n workflows to user's instance
   - Configure Retell agent with their API keys
   - Build custom CLAUDE.md for their business
   - Generate HTML control panel
   ↓
5. Get email: "Your SHINE instance is ready"
   - Download link for pre-configured workspace
   - Credentials for dashboard
   - Links to docs
   ↓
6. Open workspace in Cowork
   ↓
7. Within 60 seconds: Retell agent calls to say hello
   - Demonstrates your welcome call (the real one)
   - "This is your Service Advisor speaking"
   ↓
8. Fully connected:
   - n8n handles dispatch automatically
   - Supabase persists all data
   - Retell agents make/take calls
   - Session reports sync to database
   - Everything in one workspace
```

**What they get immediately:**
- Everything from shine-os
- Plus persistent data layer
- Plus voice agents (phone calls)
- Plus automated dispatch
- Plus multi-person access
- Plus a control panel dashboard
- Plus a live demo (the welcome call)

---

## What Changes to Current Repo to Become shine-os

The current `shine-agent-mesh` repo is the full stack. To become `shine-os`, these changes are needed:

### 1. Update README.md

**Remove:**
- References to n8n setup
- "When you're ready to automate" section (move to separate doc)
- Setup/02_ADD_YOUR_STACK.md mention
- Any infrastructure installation steps

**Add:**
- "This works without any infrastructure — just Claude Pro"
- Link to `shineon.world/install` for "Ready for full automation?"
- Quick start emphasizes simplicity

**Example section to add:**

```markdown
## Ready for Full Automation?

Once you've mastered SHINE OS, you can upgrade to the full stack:
- Add persistent data (Supabase)
- Add voice agents (Retell)
- Add automated dispatch (n8n)

Visit **[shineon.world/install](https://shineon.world/install)** to set up in 30 minutes.
```

### 2. Update CLAUDE.md

**Remove from core sections:**
- References to n8n workflows
- Supabase table structures
- Retell agent provisioning
- Any infrastructure-specific instructions

**Move to new section: "Optional: Adding Infrastructure"**

```markdown
## Adding Infrastructure (Optional)

Once you've used SHINE OS without infrastructure, you can add:

### n8n Cloud — Automation
Agents can trigger each other automatically instead of requiring manual coordination.
[Setup guide →](https://shineon.world/install)

### Supabase — Persistent Data
Tasks, leads, and session history persist across sessions without re-reading files.
[Setup guide →](https://shineon.world/install)

### Retell — Voice Agents
Your Service Advisor can make and take phone calls.
[Setup guide →](https://shineon.world/install)

**How to add:** Visit shineon.world/install and follow the onboarding workflow.
```

**Safety: Keep the credit line**

```markdown
> Built by David Caldicott · hello@shineon.world · shineon.world
> Fork this. Use it. If you improve it, tell us: hello@shineon.world
```

### 3. Update File Structure

**Keep in shine-os:**
- Agents/ — prompt templates
- Memory/ — glossary, branding, design decisions
- Ops/ — business operation templates
- Reports/ — session report format
- .claude/skills/shine-setup — customized, but mark webhook as optional
- .claude/skills/shine-reports — session report skill
- Setup/01_QUICK_START.md — how to use SHINE OS
- LIMITATIONS.md — honest constraints
- USE_CASES.md — who this is for
- INDEX.md
- CLAUDE.md
- TASKS.md

**Remove from shine-os (move to shine-agent-mesh):**
- Setup/02_ADD_YOUR_STACK.md (move to separate repo)
- Dev/ folder (move to separate repo, or keep as placeholder)
- Any n8n workflow exports
- Any Supabase migration files
- Any infrastructure config files

### 4. Update shine-setup Skill

**Change Step 3 (the webhook stub):**

Currently:
```markdown
## STEP 3 — The Demo Call ⭐ [WEBHOOK STUB — activate when endpoint is live]

Say:
> Here's something a bit different. Instead of telling you what your AI agent
> will sound like — I want to let you hear it.
>
> If you give me your phone number, I'll send a message to the SHINE system
> and one of our agents will call you within 60 seconds...

Fire this webhook: POST https://shineon.world/api/welcome-call
```

Change to:

```markdown
## STEP 3 — The Demo Call ⭐ [OPTIONAL — activates when full stack installed]

Say:
> You can skip this for now — it works with SHINE OS alone.
>
> But if you ever want to add voice agents, automated dispatch, and persistent
> data, visit shineon.world/install. You'll get a demo call like this and
> a fully-automated version of what we're building right now.

If they ask: "Want to install the full stack now?"
- If yes: direct to shineon.world/install
- If no: skip to Step 4

**[BUILDER NOTE: This step is a stub and optional. The webhook endpoint lives
in the shine-agent-mesh repo. To activate: build the onboarding workflow in
shine-agent-mesh, configure the Retell agents, and update the URL here.]**
```

### 5. Rename and License

**Option A: Rename the repo**
- Current: `davidshineoncleans/shine-agent-mesh`
- New name: `davidshineoncleans/shine-os`

**Option B: Keep name, clarify in README**
- Add note: "This is the free, open-source layer. For the full stack version with n8n + Supabase + Retell, see shine-agent-mesh (coming soon)."

**License:** Keep MIT (allow commercial use, forking, etc.)

---

## What Changes to Create shine-agent-mesh

The new repo (built from current repo or branched) includes:

### 1. New files

```
shine-agent-mesh/
├── Dev/
│   ├── ONBOARDING_ARCHITECTURE.md  ← Full spec
│   ├── n8n-workflows/              ← Exported workflows
│   │   ├── Lead_Intake.json
│   │   ├── Task_Dispatcher.json
│   │   ├── Session_Logger.json
│   │   └── Welcome_Call.json
│   ├── supabase/
│   │   ├── migrations/
│   │   │   ├── 001_create_tasks.sql
│   │   │   ├── 002_create_session_reports.sql
│   │   │   ├── 003_create_leads.sql
│   │   │   └── 004_rls_policies.sql
│   │   └── schema.md
│   ├── retell/
│   │   ├── welcome-call-agent.json
│   │   └── setup.md
│   └── setup-form/
│       ├── install.html            ← Web form
│       └── webhook-handler.md      ← n8n workflow that runs on submission
│
├── Setup/02_ADD_YOUR_STACK.md      ← Moved from shine-os
│
└── .claude/skills/shine-setup/SKILL.md
    └── Updated Step 3 with real webhook endpoint
```

### 2. Modified files

- README.md — changed to describe full stack (not base layer)
- CLAUDE.md — includes infrastructure setup section
- shine-setup skill — Step 3 webhook is live and tested
- Setup/02_ADD_YOUR_STACK.md — comprehensive guides for n8n, Supabase, Retell

### 3. New infrastructure

- `shineon.world/install` — web form + n8n endpoint
- n8n workflow (runs on David's instance): accepts form → provisions user's stack
- Retell agents configured: welcome call + standard service advisor
- HTML control panel (self-contained, no server needed)

---

## Timeline & Dependencies

### Phase 1: Extract shine-os (Week 1)
1. Make changes listed in "What Changes to Current Repo"
2. Rename repo or clarify in README
3. Release as public GitHub
4. Test with 3-5 beta users (friends, early supporters)

### Phase 2: Build shine-agent-mesh (Weeks 2-3)
1. Create separate repo from current full stack
2. Build n8n onboarding workflow
3. Write Supabase migrations
4. Build HTML control panel
5. Build web form at shineon.world/install
6. Test full install flow (form → provision → workspace → welcome call)

### Phase 3: Go Live (Week 4)
1. TikTok videos showing both paths
2. Marketing copy: "Free if you prefer to do it yourself, $50-150/mo if you want fully automated"
3. Support: email + GitHub issues

---

## Marketing & Messaging

### shine-os (FREE)

**Headline:** "Your AI operating system. No infrastructure. Just Claude."

**Tagline:** "Download SHINE OS and run a squad of AI agents for your business in 10 minutes. No database, no automation platform, no coding."

**For:** Founders who like control and want to customize everything.

**Distribution:** GitHub + TikTok + word of mouth

**Call to action:** "Download the repo → Open in Claude → Type /shine-setup"

---

### shine-agent-mesh (PREMIUM)

**Headline:** "SHINE Agent Mesh — Your AI workforce, fully automated."

**Tagline:** "One form, 30 minutes, and you have voice agents, persistent data, and automated dispatch. Your agents handle everything."

**For:** Founders ready to scale operations without hiring.

**Distribution:** shineon.world/install + marketing videos

**Call to action:** "Visit shineon.world/install → Fill form → Get setup email → See your agent in action"

---

## Success Metrics

### shine-os Success = Adoption
- GitHub stars (target: 500+ in first month)
- Forks and community contributions
- Beta user feedback
- TikTok engagement (watch time, shares)

### shine-agent-mesh Success = Conversion
- Users who start with shine-os and upgrade to full stack
- Retention (how long they stay subscribed to infrastructure)
- Lifetime value (n8n + Supabase + Retell spend)

**Key insight:** shine-os is the acquisition channel. shine-agent-mesh is the revenue driver.

---

## Risk Mitigation

### Risk: Users get confused between the two repos

**Mitigation:**
- Crystal clear README in both repos
- shine-os explicitly states "this is the free layer"
- Link to shine-agent-mesh prominent in shine-os README
- Setup wizard mentions the upgrade path

### Risk: shine-os users don't convert to full stack

**Mitigation:**
- Hit the ceiling early (make task syncing tedious after ~10 days)
- Make upgrade path obvious in every session
- shine-setup skill mentions full stack in Step 6
- TikTok content shows both "free" and "automated" workflows

### Risk: shine-agent-mesh onboarding is too complex

**Mitigation:**
- Start simple: require only email + n8n URL
- Supabase can be optional (we provision one for them if they skip)
- Test with 3 beta users before going live
- Have fallback: email-based setup if form breaks

### Risk: Shine On Cleans data leaks into the open-source repos

**Mitigation:**
- Audit both repos before release
- Use only generic templates (service business, not cleaning-specific)
- Keep all real customer workflows in separate private repo
- Add safety rules to CLAUDE.md
- Document "do not use Shine On data" prominently

---

## Appendix: File Paths & References

**Current repo:** `/mnt/Claude's Files/Dev/Local Repositories/shine-agent-mesh/`

**After split:**

shine-os (public, free):
```
GitHub: davidshineoncleans/shine-os
Folder: ~/Documents/shine-os/
Files to keep:
- README.md (updated)
- CLAUDE.md (updated)
- Agents/**
- Memory/**
- Ops/**
- Reports/**
- .claude/skills/shine-setup/**
- .claude/skills/shine-reports/**
- Setup/01_QUICK_START.md
- LIMITATIONS.md
- USE_CASES.md
- INDEX.md
- TASKS.md
- LICENSE (MIT)
```

shine-agent-mesh (public, premium):
```
GitHub: davidshineoncleans/shine-agent-mesh
Folder: ~/Documents/shine-agent-mesh/
Files to include:
- Everything from shine-os PLUS:
- Dev/n8n-workflows/**
- Dev/supabase/migrations/**
- Dev/retell/agents/**
- Dev/setup-form/**
- Setup/02_ADD_YOUR_STACK.md
- .claude/skills/shine-setup/SKILL.md (Step 3 webhook live)
```

---

## Decision Checkpoints

**Before starting Phase 1:**
- [ ] Confirm repo renaming strategy (rename vs clarify)
- [ ] Audit all files for Shine On Cleans specific data
- [ ] Get feedback from 2-3 beta users on shine-os

**Before starting Phase 2:**
- [ ] Finalize n8n onboarding workflow architecture
- [ ] Define exact Supabase schema for shared tables
- [ ] Design HTML control panel mockup

**Before going live:**
- [ ] Test full shine-agent-mesh install flow (user perspective)
- [ ] Write comprehensive troubleshooting guide
- [ ] Plan TikTok content calendar (free + premium versions)

---

**Next step:** Confirm this architecture with stakeholders, then execute Phase 1.

For questions or changes: hello@shineon.world
