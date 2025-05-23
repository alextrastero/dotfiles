-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Toggle 'number' when buffer line count exceeds window height
local function toggle_numbers()
  local buflines = vim.fn.line("$")
  local winh = vim.api.nvim_win_get_height(0)
  local show = (buflines > winh)

  -- enable/disable both absolute and relative numbers
  vim.wo.number = show
  vim.wo.relativenumber = show
  vim.wo.signcolumn = show and "yes" or "no"
end

-- Create an autocmd group to avoid dupes
vim.api.nvim_create_augroup("ToggleNumbersOnOverflow", { clear = true })

-- 3) Hook it up to events that cover:
--    • opening or switching windows/buffers
--    • resizing Vim
--    • scrolling
--    • text changes (in case lines are added/removed)
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinScrolled", "VimResized", "TextChanged", "TextChangedI" }, {
  group = "ToggleNumbersOnOverflow",
  callback = toggle_numbers,
})

-- 4) Run once now (so it’s correct on initial startup)
toggle_numbers()
