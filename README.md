# opencode-agents

Custom [OpenCode](https://opencode.ai) agents: one orchestrator and the workers it delegates to.

## Agents

| Agent | Model | Purpose |
| --- | --- | --- |
| [orchestrator](agents/orchestrator.md) | `claude-agent/opus#high` | Primary agent. Plans, splits the request, briefs the workers below, checks their results. |
| [design](agents/design.md) | `claude-agent/opus#high` | Architecture, API and data design, UX flows, plans and specs. No code. |
| [dev](agents/dev.md) | `claude-agent/sonnet#high` | Features, bug fixes, debugging, refactors, tests. |
| [audit](agents/audit.md) | `claude-agent/sonnet#xhigh` | Reviews a diff, branch, PR or repo: bugs, security, load, tests, cuts. Read-only. |
| [chores](agents/chores.md) | `claude-agent/haiku` | Commits, pushes, pulls, merges, conflict resolution, doc rewrites. |

Models follow cost per task times quality: Opus only where judgment is the product and the output is short (planning,
design); Sonnet for the token-heavy work (writing code at high, reviewing at xhigh, since a missed bug costs more than
the extra reasoning); Haiku for mechanical git and doc work.

## Use

Pick `orchestrator` as the session's agent and ask for the whole task. It sends each part to the worker whose
description fits, and does a part itself when none fits. The workers are subagents only, so the agent picker shows just
`orchestrator`.

## Install

Copy the agent files into your global OpenCode agents folder:

```powershell
./install.ps1
```

Or by hand: copy `agents/*.md` to `~/.config/opencode/agents/`. OpenCode picks them up without a restart.

Models use the `claude-agent` provider. Edit the `model:` line in each file if you use another provider.

## Add an agent

1. Write `agents/<name>.md` (frontmatter + system prompt, see the [agents docs](https://opencode.ai/v2/docs/agents)).
   Its `description` is what the orchestrator routes by: say what it does and its model.
2. Add a row to the table above.
3. Run `./install.ps1`. It adds the agent to the orchestrator's allowed subagents, then installs everything.
