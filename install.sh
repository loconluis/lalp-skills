#!/usr/bin/env bash
# lalp-skills installer — the lalp skill stack (Intent Specs Driven Development mode) for pi, Claude Code, and Codex.
# One canonical copy lives here; harnesses get a symlink (or a copy) into their skills dir.
#
# Usage:
#   ./install.sh              # symlink every skill into pi, Claude Code, and Codex
#   ./install.sh link         # same as above
#   ./install.sh copy         # copy instead of symlink (re-run to refresh)
#   ./install.sh uninstall    # remove the stack from all harnesses (incl. stale leftovers)
#   ./install.sh remove       # alias of uninstall
#   HARNESSES="pi claude" ./install.sh   # limit to specific harnesses
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${1:-link}"
HARNESSES="${HARNESSES:-pi claude codex}"
MARKER=".luis-skills"   # dropped into copied skills so uninstall can find them later

[ "$MODE" = "uninstall" ] && MODE="remove"

# Every top-level directory containing a SKILL.md is a skill in this stack (currently: lalp, the mode).
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

# Is this entry something this installer put here?
# - a symlink whose target lives in this repo (link mode, current or stale)
# - a directory carrying our marker (copy mode)
is_ours() {
  local p="$1"
  if [ -L "$p" ]; then
    case "$(readlink "$p")" in
      "$SRC_DIR"/*) return 0 ;;
    esac
    return 1
  fi
  [ -d "$p" ] && [ -f "$p/$MARKER" ]
}

for h in $HARNESSES; do
  dir="$(target_dir_for "$h")" || { echo "unknown harness: $h" >&2; exit 1; }
  mkdir -p "$dir"

  for name in "${SKILLS[@]}"; do
    src="$SRC_DIR/$name"
    dest="$dir/$name"
    case "$MODE" in
      remove) rm -rf "$dest" ;;
      link)   rm -rf "$dest"; ln -s "$src" "$dest" ;;
      copy)   rm -rf "$dest"; cp -R -L "$src" "$dest"; touch "$dest/$MARKER" ;;
      *) echo "usage: $0 [link|copy|uninstall]" >&2; exit 1 ;;
    esac
  done

  # Sweep leftovers from older versions of the stack: renamed or dropped skills
  # are not in SKILLS anymore, but their symlinks/copies are still installed.
  if [ "$MODE" = "remove" ]; then
    for e in "$dir"/*; do
      [ -e "$e" ] || [ -L "$e" ] || continue
      if is_ours "$e"; then
        rm -rf "$e"
        echo "uninstall  stale leftover -> $e"
      fi
    done
  fi

  echo "$MODE  ${#SKILLS[@]} skills -> $dir"
done

if [ "$MODE" = "link" ]; then
  echo ""
  echo "Done (${#SKILLS[@]} skills). Edit files in $SRC_DIR — every harness sees changes instantly."
fi
