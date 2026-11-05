# Copies every agent in this repo into the global OpenCode agents folder, overwriting same-named files.
# First it lists every other agent in the orchestrator's allowed subagents, so adding an agent file is enough.
$agents = Join-Path $PSScriptRoot "agents"
$orchestrator = Join-Path $agents "orchestrator.md"
$allow = Get-ChildItem $agents -Filter *.md | Where-Object BaseName -ne "orchestrator" |
    ForEach-Object { "  - { action: subagent, resource: $($_.BaseName), effect: allow }`n" }
$text = [IO.File]::ReadAllText($orchestrator)
$text = $text -replace '(?s)(# subagents:begin[^\n]*\n).*?(  # subagents:end)', "`$1$(-join $allow)`$2"
[IO.File]::WriteAllText($orchestrator, $text)

$dest = Join-Path $HOME ".config/opencode/agents"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Path (Join-Path $agents "*.md") -Destination $dest -Force -PassThru | ForEach-Object { "installed $($_.Name)" }
