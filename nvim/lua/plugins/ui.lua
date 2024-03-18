return {
  --------- animations ---------
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = { enable = false }
    end,
  },

  --------- dashboard view ---------
  {
    "nvimdev/dashboard-nvim",
    event = "vimenter",
    opts = function(_, opts)
      local logo = [[
 █████╗ ██████╗ ████████╗██╗  ██╗██╗   ██╗██████╗ 
██╔══██╗██╔══██╗╚══██╔══╝██║  ██║██║   ██║██╔══██╗
███████║██████╔╝   ██║   ███████║██║   ██║██████╔╝
██╔══██║██╔══██╗   ██║   ██╔══██║██║   ██║██╔══██╗
██║  ██║██║  ██║   ██║   ██║  ██║╚██████╔╝██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝
      ]]

      logo = string.rep("\n", 3) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
