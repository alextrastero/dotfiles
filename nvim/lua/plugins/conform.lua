local jsFormaters = { "eslint_d", "prettier", stop_after_first = true }

return {
  "stevearc/conform.nvim",
  opts = function()
    local u = require("conform.util")
    return {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = jsFormaters,
        javascriptreact = jsFormaters,
        typescript = jsFormaters,
        typescriptreact = jsFormaters,
        jsonc = { "prettier" },
        ["*"] = { "trim_whitespace" },
      },
    }
  end,
}
