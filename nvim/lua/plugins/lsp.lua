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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")

      -- default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/coding.lua#L21
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      })

      -- cmp emoji
      table.insert(opts.sources, { name = "emoji" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- disable inlay hints, as they are enabled by default in LazyVim if Neovim >= 0.10.0
      opts.inlay_hints.enabled = false
    end,
  },
}
