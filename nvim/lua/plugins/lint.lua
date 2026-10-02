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

-- lunte output: "<file>:<line>:<col>  ERROR (rule)  message" (rule is missing on parse errors)
local function parse_lunte(output)
  local diagnostics = {}
  for line in output:gmatch("[^\n]+") do
    local lnum, col, label, rest = line:match(":(%d+):(%d+)%s+(%u+)%s+(.*)$")
    if lnum then
      local code, message = rest:match("^%((.-)%)%s+(.*)$")
      table.insert(diagnostics, {
        lnum = tonumber(lnum) - 1,
        col = tonumber(col) - 1,
        severity = label == "ERROR" and vim.diagnostic.severity.ERROR or vim.diagnostic.severity.WARN,
        code = code,
        message = message or rest,
        source = "lunte",
      })
    end
  end
  return diagnostics
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

    lint.linters.lunte = {
      stdin = true,
      ignore_exitcode = true,
      parser = parse_lunte,
    }

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

        -- lunte projects: run the project's own lunte from its root so it picks up .lunterc
        local lunte_root = vim.fs.root(ev.buf, { ".lunterc", ".lunterc.json" })
        if lunte_root then
          local lunte = lint.linters.lunte
          lunte.cmd = lunte_root .. "/node_modules/.bin/lunte"
          -- filename lets lunte pick the TS parser for .ts/.tsx
          lunte.args = { "--stdin", vim.api.nvim_buf_get_name(ev.buf) }
          lint.try_lint("lunte", { cwd = lunte_root })
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
