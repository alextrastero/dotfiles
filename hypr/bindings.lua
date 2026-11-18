-- Keybinding overrides shared across machines.
-- omarchy-setup.sh links this to ~/.config/hypr/bindings.lua, which Omarchy's hyprland.lua requires.
-- See current bindings and descriptions: omarchy menu keybindings --print

-- Terminal opens straight into herdr; plain terminal moves to herdr's default key.
o.rebind("SUPER + RETURN", "Herdr", { omarchy = "terminal-herdr" })
o.rebind("SUPER + CTRL + RETURN", "Terminal", o.launch_terminal())

-- Agent runs in its own tmux session in the dotfiles repo, so the window can be split.
o.rebind("SUPER + SHIFT + CTRL + A", "Agent",
  "omarchy-launch-tui --app-id=org.omarchy.agent tmux new-session -c ~/dev/dotfiles omarchy-agent --inline --pick")
