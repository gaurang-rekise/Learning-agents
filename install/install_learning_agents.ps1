param(
  [Parameter(Mandatory=$true)]
  [ValidateSet('openai','claude','gemini','antigravity','all')]
  [string]$Provider,
  [string]$Target = (Get-Location).Path,
  [switch]$Force
)

# Provider file contents are NOT embedded here. They live in install/templates/
# and are read by both this script and install_learning_agents.sh, so the two
# implementations cannot drift apart. Edit the templates, never this file.

$ErrorActionPreference = 'Stop'
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Resolve-Path (Join-Path $ScriptDir '..')
$TplDir = Join-Path $ScriptDir 'templates'
$TargetPath = New-Item -ItemType Directory -Force -Path $Target | Select-Object -ExpandProperty FullName
$PackDir = Join-Path $TargetPath '.learning-agents'

function Get-Template($Name) {
  Get-Content -Raw -Path (Join-Path $TplDir $Name)
}

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
    if ($existing -match 'learning-agents:generated|Learning Agents integration') {
      Write-Host "Keeping existing generated file: $Path (use -Force to overwrite)"
      return
    }
    $backup = "$Path.learning-agents.bak.$(Get-Date -Format yyyyMMddHHmmss)"
    Copy-Item -Force $Path $backup
    Write-Host "Backed up existing file: $backup"
  }
  Set-Content -Path $Path -Value $normalized -NoNewline
}

# Seed a file only if it does not already exist. Learner records are the one
# thing an install must never clobber: they are the course.
function Copy-SeedFile($Source, $Destination) {
  New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Destination) | Out-Null
  if (Test-Path $Destination) {
    Write-Host "Keeping existing learner record: $Destination"
    return
  }
  Copy-Item -Force $Source $Destination
  Write-Host "Seeded: $Destination"
}

function Install-Pack {
  New-Item -ItemType Directory -Force -Path $PackDir | Out-Null
  Copy-PackDir (Join-Path $RepoRoot 'pedagogy')  (Join-Path $PackDir 'pedagogy')
  Copy-PackDir (Join-Path $RepoRoot 'agents')    (Join-Path $PackDir 'agents')
  Copy-PackDir (Join-Path $RepoRoot 'prompts')   (Join-Path $PackDir 'prompts')
  Copy-PackDir (Join-Path $RepoRoot 'schemas')   (Join-Path $PackDir 'schemas')
  Copy-PackDir (Join-Path $RepoRoot 'examples')  (Join-Path $PackDir 'examples')
  Copy-PackDir (Join-Path $RepoRoot 'learner_records/TEMPLATES') (Join-Path $PackDir 'templates')
  Write-ProviderFile (Join-Path $PackDir 'README.md') (Get-Template 'pack.README.md')
}

# The orchestrator opens with "you MUST load learner_records/profile.md". Before
# this existed, a fresh install booted straight into that against a directory
# that was never created.
function Install-Records {
  $tpl = Join-Path $RepoRoot 'learner_records/TEMPLATES'
  $dst = Join-Path $TargetPath 'learner_records'
  foreach ($sub in @('sessions','resources','drills')) {
    New-Item -ItemType Directory -Force -Path (Join-Path $dst $sub) | Out-Null
  }
  Copy-SeedFile (Join-Path $tpl 'profile.md') (Join-Path $dst 'profile.md')
  Copy-SeedFile (Join-Path $tpl 'roadmap.md') (Join-Path $dst 'roadmap.md')
  Copy-SeedFile (Join-Path $tpl 'mastery.md') (Join-Path $dst 'mastery.md')
  Copy-SeedFile (Join-Path $tpl 'deck.md')    (Join-Path $dst 'deck.md')
  Copy-SeedFile (Join-Path $tpl 'session.md') (Join-Path $dst 'sessions/_TEMPLATE.md')
}

function Install-ClaudeRuntime {
  $src = Join-Path $RepoRoot '.claude'
  $dst = Join-Path $TargetPath '.claude'
  foreach ($sub in @('skills','agents','commands','hooks')) {
    Copy-PackDir (Join-Path $src $sub) (Join-Path $dst $sub)
  }
  $settings = Join-Path $dst 'settings.json'
  if (Test-Path $settings) {
    Write-Host "Keeping existing .claude/settings.json - merge hooks manually from:"
    Write-Host "  $(Join-Path $src 'settings.json')"
  } else {
    New-Item -ItemType Directory -Force -Path $dst | Out-Null
    Copy-Item -Force (Join-Path $src 'settings.json') $settings
    Write-Host "Seeded: $settings"
  }
}

function Install-OpenAI {
  Write-ProviderFile (Join-Path $TargetPath 'AGENTS.md') (Get-Template 'openai.AGENTS.md')
}

function Install-Claude {
  Write-ProviderFile (Join-Path $TargetPath 'CLAUDE.md') (Get-Template 'claude.CLAUDE.md')
  Install-ClaudeRuntime
}

function Install-Gemini {
  Write-ProviderFile (Join-Path $TargetPath 'GEMINI.md') (Get-Template 'gemini.GEMINI.md')
  Write-ProviderFile (Join-Path $TargetPath '.gemini/settings.json') (Get-Template 'gemini.settings.json')
}

function Install-Antigravity {
  Install-Gemini
  Write-ProviderFile (Join-Path $TargetPath '.antigravity/workflows/learning-agents.md') (Get-Template 'antigravity.workflow.md')
}

Install-Pack
Install-Records

switch ($Provider) {
  'openai'      { Install-OpenAI }
  'claude'      { Install-Claude }
  'gemini'      { Install-Gemini }
  'antigravity' { Install-Antigravity }
  'all'         { Install-OpenAI; Install-Claude; Install-Antigravity }
}

Write-Host "Learning Agents installed for provider '$Provider' into: $TargetPath"
Write-Host "Agent pack: $PackDir"
Write-Host "Learner records: $(Join-Path $TargetPath 'learner_records')"
