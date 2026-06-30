param(
  [Parameter(Mandatory=$true)]
  [ValidateSet('openai','claude','gemini','antigravity','all')]
  [string]$Provider,
  [string]$Target = (Get-Location).Path,
  [switch]$Force
)

$ErrorActionPreference = 'Stop'
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..')
$TargetPath = New-Item -ItemType Directory -Force -Path $Target | Select-Object -ExpandProperty FullName
$PackDir = Join-Path $TargetPath '.learning-agents'

function Copy-PackDir($Source, $Destination) {
  if (Test-Path $Destination) { Remove-Item -Recurse -Force $Destination }
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Destination) | Out-Null
  Copy-Item -Recurse -Force $Source $Destination
}

function Write-ProviderFile($Path, $Content) {
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Path) | Out-Null
  $normalized = $Content.TrimEnd() + [Environment]::NewLine
  if ((Test-Path $Path) -and -not $Force) {
    $existing = Get-Content -Raw -Path $Path
    if ($existing -eq $normalized) {
      Write-Host "Keeping unchanged generated file: $Path"
      return
    }
    if ($existing -match 'Learning Agents integration') {
      Write-Host "Keeping existing generated file: $Path (use -Force to overwrite)"
      return
    }
    $backup = "$Path.learning-agents.bak.$(Get-Date -Format yyyyMMddHHmmss)"
    Copy-Item -Force $Path $backup
    Write-Host "Backed up existing file: $backup"
  }
  Set-Content -Path $Path -Value $normalized -NoNewline
}

function Install-Pack {
  New-Item -ItemType Directory -Force -Path $PackDir | Out-Null
  Copy-PackDir (Join-Path $RepoRoot 'agents') (Join-Path $PackDir 'agents')
  Copy-PackDir (Join-Path $RepoRoot 'prompts') (Join-Path $PackDir 'prompts')
  Copy-PackDir (Join-Path $RepoRoot 'schemas') (Join-Path $PackDir 'schemas')
  Copy-PackDir (Join-Path $RepoRoot 'examples') (Join-Path $PackDir 'examples')
  Write-ProviderFile (Join-Path $PackDir 'README.md') @'
# Installed Learning Agents

This folder was installed from the Learning-agents repository.

Use `.learning-agents/prompts/orchestrator.md` as the main orchestration prompt and `.learning-agents/agents/*.yaml` as the specialist agent definitions.
'@
}

function Install-OpenAI {
  Write-ProviderFile (Join-Path $TargetPath 'AGENTS.md') @'
# Learning Agents integration for OpenAI-compatible coding agents

Use the reusable learning-agent pack installed at `.learning-agents/`.

1. Read `.learning-agents/prompts/orchestrator.md` first.
2. Load agent definitions from `.learning-agents/agents/*.yaml` as needed.
3. Start learning-plan requests with `autonomous-curriculum-architect`.
4. Use specialist agents for diagnostics, resources, practice, tutoring, and progress tracking.
'@
}

function Install-Claude {
  Write-ProviderFile (Join-Path $TargetPath 'CLAUDE.md') @'
# Learning Agents integration for Claude agents

Use the reusable learning-agent pack installed at `.learning-agents/`.

- Treat `.learning-agents/prompts/orchestrator.md` as the coordination prompt.
- Treat `.learning-agents/agents/*.yaml` as source-of-truth specialist personas.
- Ask clarifying questions only when topic, outcome, level, or time budget is missing.
'@
}

function Install-Gemini {
  Write-ProviderFile (Join-Path $TargetPath 'GEMINI.md') @'
# Learning Agents integration for Gemini

Use the reusable learning-agent pack installed at `.learning-agents/`.

1. Read `.learning-agents/prompts/orchestrator.md`.
2. Load relevant YAML agents from `.learning-agents/agents/`.
3. Build adaptive learning plans with diagnostics, resources, projects, and progress tracking.
'@
  Write-ProviderFile (Join-Path $TargetPath '.gemini/settings.json') @'
{
  "contextFileName": "GEMINI.md"
}
'@
}

function Install-Antigravity {
  Install-Gemini
  Write-ProviderFile (Join-Path $TargetPath '.antigravity/workflows/learning-agents.md') @'
# Learning Agents workflow for Google Antigravity

Use `.learning-agents/prompts/orchestrator.md` and `.learning-agents/agents/*.yaml` to create diagnostics, curricula, resources, practice projects, and progress checks.

Steps:
1. Gather topic, target outcome, current level, deadline/time horizon, weekly time budget, preferred formats, and constraints.
2. Use the Autonomous Curriculum Architect as lead.
3. Use specialist agents for diagnostics, resources, projects, tutoring, and progress mentoring.
4. Return the learner's immediate next action.
'@
}

Install-Pack
switch ($Provider) {
  'openai' { Install-OpenAI }
  'claude' { Install-Claude }
  'gemini' { Install-Gemini }
  'antigravity' { Install-Antigravity }
  'all' { Install-OpenAI; Install-Claude; Install-Antigravity }
}

Write-Host "Learning Agents installed for provider '$Provider' into: $TargetPath"
Write-Host "Agent pack: $PackDir"
