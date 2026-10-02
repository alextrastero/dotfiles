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

local prettier_configs = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
}

local function has_prettier(bufnr)
  local path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
  return #vim.fs.find(prettier_configs, { upward = true, path = path }) > 0
end

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

local function js_formatters(bufnr)
  if has_prettier(bufnr) or has_eslint() then
    return { "prettier" }
  else
    return { "oxfmt" }
  end
end

return {
  "stevearc/conform.nvim",
  init = function()
    -- autoformat is off globally (options.lua); turn it on for files with a prettier config
    vim.api.nvim_create_autocmd("BufReadPost", {
      callback = function(ev)
        if has_prettier(ev.buf) then
          vim.b[ev.buf].autoformat = true
        end
      end,
    })
  end,
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
