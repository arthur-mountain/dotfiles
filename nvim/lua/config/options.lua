------------------------------------
-- Leader key
------------------------------------
vim.g.mapleader = " "

------------------------------------
-- Encoding
------------------------------------
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

------------------------------------
-- General
------------------------------------
vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
vim.opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options

vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.backup = false
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }

vim.opt.writebackup = false
vim.opt.swapfile = false

vim.opt.mouse = ""

------------------------------------
-- UI
------------------------------------
vim.opt.title = true
vim.opt.ignorecase = true -- Ignore case letters when search
-- vim.opt.smartcase = true -- Ignore lowercase for the whole pattern
vim.opt.linebreak = true -- Wrap on word boundary
vim.opt.termguicolors = true -- Enable 24-bit RGB colors vim.opt.laststatus = 2 -- Set global statusline
vim.opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')

------------------------------------
-- Tabs, Indent
------------------------------------
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

------------------------------------
-- Memory, CPU
------------------------------------
vim.opt.hidden = true -- Enable background buffers
vim.opt.history = 100 -- Remember N lines in history
vim.opt.lazyredraw = true -- Faster scrolling
vim.opt.synmaxcol = 240 -- Max column for syntax highlight
vim.opt.updatetime = 700 -- ms to wait for trigger an event

------------------------------------
-- Unorganizeed
------------------------------------
vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 10
vim.opt.inccommand = "split"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"

------------------------------------
-- Setup terminal shell
------------------------------------
vim.opt.shell = "zsh"

------------------------------------
-- Fold
------------------------------------
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

------------------------------------
-- Add asterisks in block comments
------------------------------------
vim.opt.formatoptions:append({ "r" })

if vim.fn.has("nvim-0.8") == 1 then
  vim.opt.cmdheight = 0
end

------------------------------------
-- Spell
------------------------------------
vim.opt.spell = true
vim.opt.spelllang = "en_us"
