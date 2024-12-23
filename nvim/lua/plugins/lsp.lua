return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "shellcheck",
        "css-lsp",
        "mdx-analyzer",
        -- "rust-analyzer",
        -- "haskell-language-server",
        -- "haskell-debug-adapter",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- disable inlay hints, as they are enabled by default in LazyVim if Neovim >= 0.10.0
      opts.inlay_hints.enabled = false
    end,
  },
  -- {
  --   "saghen/blink.cmp",
  --   opts = function(_, opts)
  --     -- default: https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/keymap/presets.lua
  --     -- TODO: the <C-k> keymap exists currently, so not allowed to temporarily override  when cmp menu opened
  --     opts.keymap = vim.tbl_extend("force", opts.keymap, {
  --       ["<C-k>"] = { "select_prev", "fallback" }, -- previous suggestion
  --       ["<C-j>"] = { "select_next", "fallback" }, -- next suggestion
  --     })
  --   end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --
  --     -- default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/coding.lua#L21
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
  --       ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
  --     })
  --
  --     -- cmp emoji
  --     table.insert(opts.sources, { name = "emoji" })
  --   end,
  -- },
}
