#!/bin/sh
# Claude Code hook: sets @claude_status on the tmux window running this session.
# Usage: tmux-status.sh working|waiting|done|off

cat >/dev/null

[ -n "$TMUX_PANE" ] || exit 0

case "$1" in
  working) icon="●" ;;
  waiting) icon="◐" ;;
  done)    icon="✓" ;;
  off)     tmux set-option -wu -t "$TMUX_PANE" @claude_status >/dev/null 2>&1; exit 0 ;;
  *)       exit 0 ;;
esac

tmux set-option -w -t "$TMUX_PANE" @claude_status "$icon" >/dev/null 2>&1
exit 0
