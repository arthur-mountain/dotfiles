return {
  --------- lazygit ---------
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("lazyvim.util").on_load("telescope.nvim", function()
        require("telescope").load_extension("lazygit")
      end)
    end,
  },

  --------- git signs ---------
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {
      current_line_blame = true,
    },
  },
}
