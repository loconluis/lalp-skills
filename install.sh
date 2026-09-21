#!/usr/bin/env bash
# lalp-skills installer — 28 individual lalp skills for pi, Claude Code, and Codex.
# One canonical copy lives here; harnesses get a symlink (or a copy) into their skills dir.
# Each playbook, principle, and discipline is its own individually-invocable skill (/skill:lalp-*).
#
# Usage:
#   ./install.sh              # symlink every skill into pi, Claude Code, and Codex
#   ./install.sh link         # same as above
#   ./install.sh copy         # copy instead of symlink (re-run to refresh)
#   ./install.sh uninstall    # remove the stack from all harnesses (incl. stale leftovers)
#   ./install.sh remove       # alias of uninstall
#   HARNESSES="pi claude" ./install.sh   # limit to specific harnesses
#   LALP_OVERWRITE=1 ./install.sh        # replace foreign same-name skills without backing them up
#
# Safety: this script never deletes anything it did not create. A pre-existing
# skill of the same name that is not ours is moved to a backup dir and reported,
# not overwritten. Stale leftovers (including dangling symlinks from an older
# version or a moved repo) are swept on every run, not just on uninstall.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${1:-link}"
HARNESSES="${HARNESSES:-pi claude codex}"
MARKER=".luis-skills"   # dropped into copied skills so uninstall can find them later
OVERWRITE="${LALP_OVERWRITE:-0}"
BACKUP_ROOT="$HOME/.lalp-skills-backup"
STAMP="$(date +%Y%m%d-%H%M%S)"

[ "$MODE" = "uninstall" ] && MODE="remove"

case "$MODE" in
  link|copy|remove) ;;
  *) echo "usage: $0 [link|copy|uninstall]" >&2; exit 1 ;;
esac

# Every top-level directory containing a SKILL.md is a skill in this stack
# (lalp = the orchestrator, lalp-* = individual playbooks/principles/disciplines).
SKILLS=()
for d in "$SRC_DIR"/*/; do
  [ -f "$d/SKILL.md" ] && SKILLS+=("$(basename "$d")")
done
[ "${#SKILLS[@]}" -gt 0 ] || { echo "ERROR: no skills found in $SRC_DIR" >&2; exit 1; }

target_dir_for() {
  case "$1" in
    pi)        echo "$HOME/.agents/skills" ;;      # shared, tool-agnostic dir pi discovers
    pi-native) echo "$HOME/.pi/agent/skills" ;;    # pi-only dir (use if you prefer separation)
    claude)    echo "$HOME/.claude/skills" ;;
    codex)     echo "$HOME/.codex/skills" ;;
    *) echo ""; return 1 ;;
  esac
}

# Is this name one of the skills this repo ships?
in_skills() {
  local n="$1" s
  for s in "${SKILLS[@]}"; do
    [ "$s" = "$n" ] && return 0
  done
  return 1
}

# Is this entry safe for us to remove?
#   - a symlink whose target lives in this repo (link mode, current or stale)
#   - a DANGLING symlink: it holds no data by definition (older version, moved repo)
#   - a directory carrying our marker (copy mode)
# Anything else is somebody's data and must be backed up, never deleted.
is_ours() {
  local p="$1"
  if [ -L "$p" ]; then
    case "$(readlink "$p")" in
      "$SRC_DIR"/*) return 0 ;;
    esac
    [ -e "$p" ] || return 0        # dangling symlink -> no data, safe
    return 1
  fi
  [ -d "$p" ] && [ -f "$p/$MARKER" ]
}

# Move a foreign entry aside instead of destroying it. Echoes the backup path.
back_up() {
  local p="$1" harness="$2" dest
  dest="$BACKUP_ROOT/$harness/$(basename "$p").$STAMP"
  mkdir -p "$(dirname "$dest")"
  mv "$p" "$dest"
  echo "$dest"
}

for h in $HARNESSES; do
  dir="$(target_dir_for "$h")" || { echo "unknown harness: $h" >&2; exit 1; }
  mkdir -p "$dir"

  for name in "${SKILLS[@]}"; do
    src="$SRC_DIR/$name"
    dest="$dir/$name"

    case "$MODE" in
      remove)
        if [ -e "$dest" ] || [ -L "$dest" ]; then
          if is_ours "$dest"; then
            rm -rf "$dest"
          else
            saved="$(back_up "$dest" "$h")"
            echo "uninstall  NOT ours, backed up -> $saved"
          fi
        fi
        ;;
      link|copy)
        # Guard: never clobber a foreign skill of the same name.
        if [ -e "$dest" ] || [ -L "$dest" ]; then
          if is_ours "$dest"; then
            rm -rf "$dest"
          elif [ "$OVERWRITE" = "1" ]; then
            echo "overwrite  foreign $dest (LALP_OVERWRITE=1)"
            rm -rf "$dest"
          else
            saved="$(back_up "$dest" "$h")"
            echo "backup     foreign $name -> $saved"
          fi
        fi
        if [ "$MODE" = "link" ]; then
          ln -s "$src" "$dest"
        else
          cp -R -L "$src" "$dest"
          touch "$dest/$MARKER"
        fi
        ;;
    esac
  done

  # Sweep leftovers from older versions of the stack: renamed or dropped skills
  # are not in SKILLS anymore, but their symlinks/copies are still installed.
  # Runs on EVERY mode so a version downgrade can't leave dangling entries behind.
  for e in "$dir"/*; do
    [ -e "$e" ] || [ -L "$e" ] || continue
    base="$(basename "$e")"
    if [ "$MODE" != "remove" ] && in_skills "$base"; then
      continue          # just installed above; leave it alone
    fi
    if is_ours "$e"; then
      rm -rf "$e"
      echo "sweep      stale leftover -> $e"
    fi
  done

  echo "$MODE  ${#SKILLS[@]} skills -> $dir"
done

if [ "$MODE" != "remove" ]; then
  echo ""
  echo "Done (${#SKILLS[@]} skills). Edit files in $SRC_DIR — every harness sees changes instantly."
  if [ -d "$BACKUP_ROOT" ]; then
    echo "Foreign same-name skills were backed up under $BACKUP_ROOT"
  fi
fi

# Exit cleanly: the last test above must not become the script's status.
exit 0
