return {
  --------- lazygit ---------
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
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
