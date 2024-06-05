return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("fzf")
          end)
        end,
      },
      -- {
      --   "nvim-telescope/telescope-media-files.nvim",
      --   config = function()
      --     require("lazyvim.util").on_load("telescope.nvim", function()
      --       require("telescope").setup({
      --         extensions = {
      --           media_files = {
      --             -- filetypes whitelist
      --             -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      --             filetypes = { "png", "jpg", "jpeg", "gif", "bmp", "webp", "pdf", "svg" },
      --             -- find_cmd = "rg", -- find command (defaults to `fd`)
      --           },
      --         },
      --       })
      --       require("telescope").load_extension("media_files")
      --     end)
      --   end,
      -- },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
          },
        },
      })
    end,
  },
}
