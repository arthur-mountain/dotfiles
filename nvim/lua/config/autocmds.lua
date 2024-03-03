------------------------------------
-- Default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
------------------------------------

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Load extend snippets
vim.api.nvim_create_autocmd("FileType", {
  group = "filetypedetect",
  callback = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/snippets" } })
  end,
})

-- Save latest cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd.normal("g'\"")
    end
  end,
})
