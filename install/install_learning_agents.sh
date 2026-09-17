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
  - .learning-agents/pedagogy, agents, prompts, schemas, examples, templates
  - learner_records/ seeded from templates (existing records are never touched)
  - Provider-specific context files:
      openai:      AGENTS.md section
      claude:      CLAUDE.md section, plus .claude/ native runtime
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
    if grep -qE "learning-agents:generated|Learning Agents integration" "$path" 2>/dev/null; then
      echo "Keeping existing generated file: $path (use --force to overwrite)"
      return 0
    fi
    local backup="$path.learning-agents.bak.$(date +%Y%m%d%H%M%S)"
    cp "$path" "$backup"
    echo "Backed up existing file: $backup"
  fi
  printf '%s\n' "$content" > "$path"
}

TPL_DIR="$REPO_ROOT/install/templates"

tpl() {
  cat "$TPL_DIR/$1"
}

# Seed a file only if it does not already exist. Learner records are the one
# thing an install must never clobber: they are the course.
seed_file() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" ]]; then
    echo "Keeping existing learner record: $dst"
    return 0
  fi
  cp "$src" "$dst"
  echo "Seeded: $dst"
}

install_pack() {
  mkdir -p "$PACK_DIR"
  copy_dir "$REPO_ROOT/pedagogy" "$PACK_DIR/pedagogy"
  copy_dir "$REPO_ROOT/agents" "$PACK_DIR/agents"
  copy_dir "$REPO_ROOT/prompts" "$PACK_DIR/prompts"
  copy_dir "$REPO_ROOT/schemas" "$PACK_DIR/schemas"
  copy_dir "$REPO_ROOT/examples" "$PACK_DIR/examples"
  copy_dir "$REPO_ROOT/learner_records/TEMPLATES" "$PACK_DIR/templates"
  write_file "$PACK_DIR/README.md" "$(tpl pack.README.md)"
}

# The orchestrator opens with "you MUST load learner_records/profile.md". Before
# this existed, a fresh install booted straight into that against a directory
# that was never created.
install_records() {
  local tpl="$REPO_ROOT/learner_records/TEMPLATES"
  local dst="$TARGET/learner_records"
  mkdir -p "$dst/sessions" "$dst/resources" "$dst/drills"
  seed_file "$tpl/profile.md" "$dst/profile.md"
  seed_file "$tpl/roadmap.md" "$dst/roadmap.md"
  seed_file "$tpl/mastery.md" "$dst/mastery.md"
  seed_file "$tpl/deck.md"    "$dst/deck.md"
  seed_file "$tpl/session.md" "$dst/sessions/_TEMPLATE.md"
  seed_file "$tpl/drills-README.md" "$dst/drills/README.md"
}

install_claude_runtime() {
  copy_dir "$REPO_ROOT/.claude/skills" "$TARGET/.claude/skills"
  copy_dir "$REPO_ROOT/.claude/agents" "$TARGET/.claude/agents"
  copy_dir "$REPO_ROOT/.claude/commands" "$TARGET/.claude/commands"
  copy_dir "$REPO_ROOT/.claude/hooks" "$TARGET/.claude/hooks"
  chmod +x "$TARGET/.claude/hooks/"*.sh 2>/dev/null || true
  if [[ -e "$TARGET/.claude/settings.json" ]]; then
    echo "Keeping existing .claude/settings.json — merge hooks manually from:"
    echo "  $REPO_ROOT/.claude/settings.json"
  else
    mkdir -p "$TARGET/.claude"
    cp "$REPO_ROOT/.claude/settings.json" "$TARGET/.claude/settings.json"
    echo "Seeded: $TARGET/.claude/settings.json"
  fi
}

openai_content()              { tpl openai.AGENTS.md; }
claude_content()              { tpl claude.CLAUDE.md; }
gemini_content()              { tpl gemini.GEMINI.md; }
antigravity_workflow_content() { tpl antigravity.workflow.md; }

install_openai() {
  write_file "$TARGET/AGENTS.md" "$(openai_content)"
}

install_claude() {
  write_file "$TARGET/CLAUDE.md" "$(claude_content)"
  install_claude_runtime
}

install_gemini() {
  write_file "$TARGET/GEMINI.md" "$(gemini_content)"
  write_file "$TARGET/.gemini/settings.json" "$(tpl gemini.settings.json)"
}

install_antigravity() {
  install_gemini
  write_file "$TARGET/.antigravity/workflows/learning-agents.md" "$(antigravity_workflow_content)"
}

install_pack
install_records
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
echo "Learner records: $TARGET/learner_records"
