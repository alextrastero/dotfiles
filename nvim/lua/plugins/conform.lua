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

local function has_eslint()
  local root = vim.fn.getcwd()
  for _, name in ipairs(eslint_configs) do
    if vim.uv.fs_stat(root .. "/" .. name) then
      return true
    end
  end
  -- also check for eslintConfig key in package.json
  local pkg = root .. "/package.json"
  if vim.uv.fs_stat(pkg) then
    local ok, data = pcall(vim.fn.readfile, pkg)
    if ok then
      local content = table.concat(data, "\n")
      if content:find('"eslintConfig"') then
        return true
      end
    end
  end
  return false
end

local function js_formatters()
  if has_eslint() then
    return { "prettier" }
  else
    return { "oxfmt" }
  end
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = js_formatters,
      javascriptreact = js_formatters,
      typescript = js_formatters,
      typescriptreact = js_formatters,
      jsonc = { "prettier" },
      ["*"] = { "trim_whitespace" },
    },
  },
}
