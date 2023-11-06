local status_ok, copilot = pcall(require, 'copilot')
if not status_ok then
  return
end

copilot.setup({
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  filetypes = {
    javascript = true,
    typescript = true,
    typescriptreact = true,
  },
  suggestion = { enabled = false },
  panel = { enabled = false },
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,
    },
  },
})
