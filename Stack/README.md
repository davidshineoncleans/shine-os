# Stack — Tier 2: shine-activated

Parent: [[CLAUDE]]
Related: [[TASKS]] · [[glossary]]

---

## What This Is

This folder contains the infrastructure layer — n8n workflows, Supabase migrations, and Retell agent configs that turn your shine-os methodology into an automated system.

**Status: Coming soon.** The placeholders below will be populated as each component is ready. Run `git pull` to get updates.

---

## What's Here

| Folder | What it will contain | Status |
|--------|---------------------|--------|
| `n8n-workflows/` | Importable workflow JSON files — agent dispatch, task processing, lead pipeline | Placeholder |
| `supabase/` | SQL migrations — tables for leads, tasks, sessions, agents | Placeholder |
| `retell/` | Agent configs and prompt templates for AI voice agents | Placeholder |

---

## How to Install (when ready)

```bash
cd shine-os
./install.sh
```

The install script will:
1. Ask for your n8n API key, Supabase project URL, and Retell API key
2. Import workflows to your n8n instance
3. Run SQL migrations on your Supabase project
4. Create Retell agents with your business context
5. Update your `CLAUDE.md` with connection details

**Not ready yet?** That's fine. Tier 1 (shine-os methodology) works perfectly without any of this.

---

## Requirements

- [n8n Cloud](https://n8n.io) account (~$20-50/mo)
- [Supabase](https://supabase.com) project (free tier works to start)
- [Retell](https://retell.ai) account (pay per minute, ~$0.10-0.20/min)

See `Setup/02_ADD_YOUR_STACK.md` for detailed setup guides.

---

## Updates

When new components are added, run:

```bash
cd shine-os
git pull origin main
```

Your local files (CLAUDE.md, TASKS.md, agent prompts, reports) won't be overwritten — git only pulls changes to tracked files you haven't modified.
