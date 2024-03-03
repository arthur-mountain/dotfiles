return {
  --------- messages, cmdline and the popupmenu ---------
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  --------- animations ---------
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  --------- dashboard view ---------
  {
    "nvimdev/dashboard-nvim",
    event = "vimenter",
    opts = function(_, opts)
      local logo = [[
 █████╗ ██████╗ ██╗  ██╗████████╗██╗   ██╗██████╗ 
██╔══██╗██╔══██╗██║  ██║╚══██╔══╝██║   ██║██╔══██╗
███████║██████╔╝███████║   ██║   ██║   ██║██████╔╝
██╔══██║██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗
██║  ██║██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
      ]]

      logo = string.rep("\n", 3) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
