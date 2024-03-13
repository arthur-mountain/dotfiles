return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm", --  `storm`, `moon`, a darker variant `night` and `day`
      transparent = true,
      lualine_bold = true,
      styles = { sidebars = "transparent", floats = "transparent" },
      on_colors = function(colors)
        colors.comment = "#88C0D0"
      end,
      on_highlights = function(hl, colors)
        -- Relative number
        hl.LineNr = { fg = colors.blue }
        hl.CursorLineNr = { fg = colors.orange }
      end,
    },
  },
}
