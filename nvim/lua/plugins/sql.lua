local sql_ft = { "sql", "mysql", "plsql" }

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "sql" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqlls = {},
      },
      settings = {
        sqlls = {
          validate = true,
        },
      },
    },
  },
  -- Linters & formatters
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "sqlfluff" } },
  },
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      for _, ft in ipairs(sql_ft) do
        opts.linters_by_ft[ft] = opts.linters_by_ft[ft] or {}
        table.insert(opts.linters_by_ft[ft], "sqlfluff")
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters.sqlfluff = {
        cwd = require("conform.util").root_file({ ".sqlfluff" }),
        require_cwd = false,
        args = { "fix", "--dialect=ansi", "-" },
      }
      for _, ft in ipairs(sql_ft) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "sqlfluff")
      end
    end,
  },
}
