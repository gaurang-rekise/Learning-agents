#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Install Learning Agents into another AI-agent workspace.

Usage:
  install/install_learning_agents.sh --provider <openai|claude|gemini|antigravity|all> [--target DIR] [--force]

Options:
  --provider   Provider integration to install.
  --target     Workspace/repo directory to install into. Defaults to current directory.
  --force      Overwrite generated provider files instead of preserving existing files.
  -h, --help   Show this help.

What gets installed:
  - .learning-agents/agents, prompts, schemas, examples
  - Provider-specific context files:
      openai:      AGENTS.md section
      claude:      CLAUDE.md section
      gemini:      GEMINI.md and .gemini/settings.json
      antigravity: GEMINI.md and .antigravity/workflows/learning-agents.md
USAGE
}

PROVIDER=""
TARGET="$(pwd)"
FORCE=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --provider)
      PROVIDER="${2:-}"
      shift 2
      ;;
    --target)
      TARGET="${2:-}"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

if [[ -z "$PROVIDER" ]]; then
  echo "Missing required --provider." >&2
  usage >&2
  exit 2
fi

case "$PROVIDER" in
  openai|claude|gemini|antigravity|all) ;;
  *)
    echo "Unsupported provider: $PROVIDER" >&2
    usage >&2
    exit 2
    ;;
esac

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(mkdir -p "$TARGET" && cd "$TARGET" && pwd)"
PACK_DIR="$TARGET/.learning-agents"

copy_dir() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  rm -rf "$dst"
  cp -R "$src" "$dst"
}

write_file() {
  local path="$1"
  local content="$2"
  mkdir -p "$(dirname "$path")"
  if [[ -e "$path" && "$FORCE" -ne 1 ]]; then
    local tmp
    tmp="$(mktemp)"
    printf '%s\n' "$content" > "$tmp"
    if cmp -s "$path" "$tmp"; then
      rm -f "$tmp"
      echo "Keeping unchanged generated file: $path"
      return 0
    fi
    rm -f "$tmp"
    if grep -q "Learning Agents integration" "$path" 2>/dev/null; then
      echo "Keeping existing generated file: $path (use --force to overwrite)"
      return 0
    fi
    local backup="$path.learning-agents.bak.$(date +%Y%m%d%H%M%S)"
    cp "$path" "$backup"
    echo "Backed up existing file: $backup"
  fi
  printf '%s\n' "$content" > "$path"
}

install_pack() {
  mkdir -p "$PACK_DIR"
  copy_dir "$REPO_ROOT/agents" "$PACK_DIR/agents"
  copy_dir "$REPO_ROOT/prompts" "$PACK_DIR/prompts"
  copy_dir "$REPO_ROOT/schemas" "$PACK_DIR/schemas"
  copy_dir "$REPO_ROOT/examples" "$PACK_DIR/examples"
  cat > "$PACK_DIR/README.md" <<'PACKREADME'
# Installed Learning Agents

This folder was installed from the Learning-agents repository.

Use `.learning-agents/prompts/orchestrator.md` as the main orchestration prompt and `.learning-agents/agents/*.yaml` as the specialist agent definitions.
PACKREADME
}

openai_content() {
  cat <<'OPENAI'
# Learning Agents integration for OpenAI-compatible coding agents

Use the reusable learning-agent pack installed at `.learning-agents/`.

## How to operate
1. Read `.learning-agents/prompts/orchestrator.md` first.
2. Load agent definitions from `.learning-agents/agents/*.yaml` as needed.
3. For learning-plan requests, start with `autonomous-curriculum-architect`.
4. Use `diagnostic-assessment-agent` when learner level is unclear.
5. Use `learning-resource-researcher`, `practice-project-generator`, `socratic-tutor-agent`, and `progress-mentor-agent` for specialist tasks.

## Output expectation
Return a learner profile, diagnostic or gap analysis, curriculum map, module plan, resource recommendations, practice projects, progress rules, and next action.
OPENAI
}

claude_content() {
  cat <<'CLAUDE'
# Learning Agents integration for Claude agents

Use the reusable learning-agent pack installed at `.learning-agents/`.

## Instructions for Claude
- Treat `.learning-agents/prompts/orchestrator.md` as the coordination prompt.
- Treat `.learning-agents/agents/*.yaml` as source-of-truth specialist personas.
- Ask clarifying questions only when the learner's topic, outcome, current level, or time budget is missing.
- Prefer concise plans with measurable mastery checks, practical projects, and remediation steps.

## Agent routing
Start with the Autonomous Curriculum Architect, then call on Diagnostic Assessment, Learning Resource Research, Practice Project Generation, Socratic Tutoring, and Progress Mentoring as appropriate.
CLAUDE
}

gemini_content() {
  cat <<'GEMINI'
# Learning Agents integration for Gemini

Use the reusable learning-agent pack installed at `.learning-agents/`.

## Primary workflow
1. Read `.learning-agents/prompts/orchestrator.md`.
2. Load relevant YAML agents from `.learning-agents/agents/`.
3. Build adaptive learning plans with diagnostics, resources, projects, and progress tracking.

## Compatibility rules
- Keep prompts model-neutral and portable.
- Use YAML agent definitions as the source of truth.
- When a resource recommendation depends on current availability, verify before finalizing.
GEMINI
}

antigravity_workflow_content() {
  cat <<'ANTIGRAVITY'
# Learning Agents workflow for Google Antigravity

## When to use
Use when a learner asks to master a topic, build a study plan, collect resources, test knowledge, or create practice projects.

## Source files
- `.learning-agents/prompts/orchestrator.md`
- `.learning-agents/agents/autonomous-curriculum-architect.yaml`
- `.learning-agents/agents/diagnostic-assessment-agent.yaml`
- `.learning-agents/agents/learning-resource-researcher.yaml`
- `.learning-agents/agents/practice-project-generator.yaml`
- `.learning-agents/agents/progress-mentor-agent.yaml`
- `.learning-agents/agents/socratic-tutor-agent.yaml`

## Steps
1. Gather topic, target outcome, current level, deadline/time horizon, weekly time budget, preferred formats, and constraints.
2. Use the Autonomous Curriculum Architect as the lead agent.
3. Run diagnostics when level is uncertain.
4. Select resources and practice projects.
5. Define progress checks and remediation rules.
6. Return the learner's immediate next action.
ANTIGRAVITY
}

install_openai() {
  write_file "$TARGET/AGENTS.md" "$(openai_content)"
}

install_claude() {
  write_file "$TARGET/CLAUDE.md" "$(claude_content)"
}

install_gemini() {
  write_file "$TARGET/GEMINI.md" "$(gemini_content)"
  write_file "$TARGET/.gemini/settings.json" '{
  "contextFileName": "GEMINI.md"
}'
}

install_antigravity() {
  install_gemini
  write_file "$TARGET/.antigravity/workflows/learning-agents.md" "$(antigravity_workflow_content)"
}

install_pack
case "$PROVIDER" in
  openai) install_openai ;;
  claude) install_claude ;;
  gemini) install_gemini ;;
  antigravity) install_antigravity ;;
  all)
    install_openai
    install_claude
    install_antigravity
    ;;
esac

echo "Learning Agents installed for provider '$PROVIDER' into: $TARGET"
echo "Agent pack: $PACK_DIR"
