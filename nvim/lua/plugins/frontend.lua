return {
  {
    import = "lazyvim.plugins.extras.lang.typescript",
    enabled = function()
      local nodeVersion = require("lazy.manage.process").exec({ "node", "-v" })[1]

      if nodeVersion then
        -- extras.lang uses vtsls, which requires Node version 16 or higher
        return tonumber(string.match(nodeVersion, "^v(%d+)")) >= 16
      end

      -- bypass enabled if node version is not found successfully
      return true
    end,
  },
}
