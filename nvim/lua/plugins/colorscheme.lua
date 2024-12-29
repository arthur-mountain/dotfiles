return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm", --  `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day",
      transparent = true,
      terminal_colors = true,
      lualine_bold = true,
      styles = { sidebars = "transparent", floats = "transparent" },
      -- on_colors = function(colors) end,
      on_highlights = function(hl, colors)
        -- Relative number
        hl.LineNr = { fg = colors.purple, bold = true }
        hl.CursorLineNr = { fg = colors.orange }
        -- Comment
        colors.comment = "#A0A0A0"
        hl.Comment = { bg = "#4B5268", fg = colors.comment, italic = true }
      end,
    },
  },
}
