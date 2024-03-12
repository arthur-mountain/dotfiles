return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css",
        "gitignore",
        "dockerfile",
        "sql",
        "graphql",
        "http",
        "go",
        "rust",
        "haskell",
        "markdown",
      })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({ extension = { mdx = "mdx" } })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
