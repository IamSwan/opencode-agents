# Copies every agent in this repo into the global OpenCode agents folder, overwriting same-named files.
$dest = Join-Path $HOME ".config/opencode/agents"
New-Item -ItemType Directory -Force -Path $dest | Out-Null
Copy-Item -Path (Join-Path $PSScriptRoot "agents/*.md") -Destination $dest -Force -PassThru | ForEach-Object { "installed $($_.Name)" }
