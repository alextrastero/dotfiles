#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dev/dotfiles"

# ID from /etc/os-release: "ubuntu", "omarchy", ...
. /etc/os-release
case "$ID" in
  ubuntu)  exec "$DOTFILES/ubuntu-setup.sh" ;;
  omarchy) exec "$DOTFILES/omarchy-setup.sh" ;;
  *) echo "unsupported OS: $ID" >&2; exit 1 ;;
esac
