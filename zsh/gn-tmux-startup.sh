#!/bin/zsh

# Check if in the specific folder
if [ "$(pwd)" != "/home/odella/dev/gn/studio" ]; then
  echo "not in studio folder /home/odella/dev/gn/studio"
fi

# Run tmux commands
tmux send-keys "npm start" C-m
tmux split-window -h
tmux send-keys "npm run proxy:cms" C-m
tmux split-window -v
tmux select-pane -t 3
tmux send-keys "npm run proxy" C-m
