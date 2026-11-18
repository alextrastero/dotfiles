-- Window and workspace rules shared across machines.
-- omarchy-setup.sh links this to ~/.config/hypr/windows.lua and requires it from hyprland.lua.

-- Open each new browser window on the first empty workspace (PiP overlays stay put).
o.window({ tag = "firefox-based-browser", title = "negative:(Picture.?in.?[Pp]icture)" }, { workspace = "empty" })

-- Keep the screensaver off while a browser window is fullscreen (e.g. video).
o.window({ tag = "firefox-based-browser" }, { idle_inhibit = "fullscreen" })

-- Open file manager windows floating and centered (Super + T tiles them).
o.window("org.gnome.Nautilus", { tag = "+floating-window" })

-- Smart gaps: no gaps or border when a workspace holds a single tiled or maximized window.
-- Special workspaces (scratchpad, console) keep their own gaps.
-- https://wiki.hypr.land/configuring/code-snippets/
for _, workspace in ipairs({ "w[tv1]s[false]", "f[1]s[false]" }) do
  hl.workspace_rule({ workspace = workspace, gaps_in = 0, gaps_out = 0 })
  o.window({ float = false, workspace = workspace }, { border_size = 0 })
end
