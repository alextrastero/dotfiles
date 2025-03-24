--- List of node types to reject.
--- @type string[]
local reject = {
  "comment",
  "line_comment",
  "binary_expression",
  "description",
  "comment_content",
  "block_comment",
  "string_start",
  -- "string_fragment",
  "string_content",
  "string_end",
}

local getNode = function()
  -- Get cursor position
  local row, column = unpack(vim.api.nvim_win_get_cursor(0))

  -- Check if we're inside a comment or string
  local success, node = pcall(vim.treesitter.get_node, {
    pos = { row - 1, math.max(0, column - 1) },
    ignore_injections = false,
  })

  return success and node
end

--- Checks wether node under cursor is of type `reject`
--- @param _reject string[]
--- @return boolean
local isDisabled = function(_reject)
  -- Get cursor position
  local row, column = unpack(vim.api.nvim_win_get_cursor(0))

  -- Check if we're inside a comment or string
  local success, node = pcall(vim.treesitter.get_node, {
    pos = { row - 1, math.max(0, column - 1) },
    ignore_injections = false,
  })

  -- DEBUG which node type is undercursor
  -- print("Node Type:", success and node and node:type() or "No Node")
  return not not (success and node and vim.tbl_contains(_reject, node:type()))
end

local isComment = function()
  return isDisabled({
    "comment",
    "line_comment",
    "comment_content",
  })
end

return {
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      enabled = function()
        -- if isDisabled() then
        --   return false
        -- -- **Disable Blink in LSP rename popup**
        if vim.bo.buftype == "nofile" then
          return true
        else
          -- Keep Blink disabled for `gitcommit` and prompts
          return not vim.tbl_contains({ "gitcommit" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
        end
      end,
      completion = {
        ghost_text = {
          enabled = false,
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline"
          end,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
      cmdline = {
        sources = {},
      },
      keymap = {
        -- https://cmp.saghen.dev/configuration/keymap#super-tab
        preset = "enter",
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
      sources = {
        default = function()
          if vim.bo.filetype == "markdown" then
            return { "lsp", "path" }
          elseif isComment() then
            return { "buffer" }
          else
            -- Default sources for all file types
            return { "buffer", "lsp", "snippets", "path" }
          end
        end,
      },
    },
    opts_extend = { "sources.default" },
  },
}
