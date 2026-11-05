# opencode-agents

Custom [OpenCode](https://opencode.ai) agents.

## Agents

| Agent | Model | Purpose |
| --- | --- | --- |
| [chores](agents/chores.md) | `claude-agent/haiku` | Commits, pushes, pulls, merges, conflict resolution, doc rewrites. |

## Install

Copy the agent files into your global OpenCode agents folder:

```powershell
./install.ps1
```

Or by hand: copy `agents/*.md` to `~/.config/opencode/agents/`. OpenCode picks them up without a restart.

Models use the `claude-agent` provider. Edit the `model:` line in each file if you use another provider.

## Add an agent

1. Write `agents/<name>.md` (frontmatter + system prompt, see the [agents docs](https://opencode.ai/v2/docs/agents)).
2. Add a row to the table above.
3. Run `./install.ps1`.
