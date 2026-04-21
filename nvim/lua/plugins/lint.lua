local eslint_configs = {
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
}

local function has_eslint(root)
  for _, name in ipairs(eslint_configs) do
    if vim.uv.fs_stat(root .. "/" .. name) then
      return true
    end
  end
  local pkg = root .. "/package.json"
  if vim.uv.fs_stat(pkg) then
    local ok, data = pcall(vim.fn.readfile, pkg)
    if ok and table.concat(data, "\n"):find('"eslintConfig"') then
      return true
    end
  end
  return false
end

local js_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

return {
  "mfussenegger/nvim-lint",
  opts = {
    -- disable LazyVim's default linter-by-ft table; we set it dynamically
    linters_by_ft = {},
  },
  config = function(_, opts)
    local lint = require("lint")

    -- Apply any other opts (e.g. from LazyVim defaults)
    lint.linters_by_ft = opts.linters_by_ft or {}

    -- Lint on open and save
    local group = vim.api.nvim_create_augroup("nvim-lint-dynamic", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      group = group,
      callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        local is_js = vim.tbl_contains(js_filetypes, ft)
        if not is_js then
          lint.try_lint()
          return
        end

        local root = vim.fn.getcwd()
        if has_eslint(root) then
          lint.try_lint("eslint_d")
        else
          -- Build oxlint args at lint-time so we can check for .oxlintrc.json
          local oxlint = lint.linters.oxlint
          oxlint.args = { "--format", "github" }
          if vim.uv.fs_stat(root .. "/.oxlintrc.json") then
            vim.list_extend(oxlint.args, { "--config", root .. "/.oxlintrc.json" })
          end
          lint.try_lint("oxlint")
        end
      end,
    })
  end,
}
