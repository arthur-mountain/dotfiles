------------------------------------
-- Default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
------------------------------------
local keymap = vim.keymap
local getOptions = function(...)
  return vim.tbl_deep_extend("force", { noremap = true, silent = true }, ...)
end

-- Reload configuration without restart nvim
keymap.set("n", "<leader>r", ":so %<CR>", getOptions({ desc = "Reload configuration" }))

-- ESC to ;;
keymap.set({ "n", "i", "v", "t" }, ";;", "<ESC>", getOptions({ desc = "ESC" }))

-- Save
keymap.set({ "i", "x", "n", "s" }, ";w", ":w<CR><ESC>", getOptions({ desc = "Save file" }))
keymap.set({ "i", "x", "n", "s" }, ";W", ":w!<CR><ESC>", getOptions({ desc = "Force Save file" }))

-- Quit
keymap.set("n", ";q", ":q<CR>", getOptions({ desc = "Quit file" }))
keymap.set("n", ";Q", ":q!<CR>", getOptions({ desc = "Force quit file" }))

-- Increment/Decrement
keymap.set("n", "+", "<C-a>", getOptions({ desc = "Increment" }))
keymap.set("n", "-", "<C-x>", getOptions({ desc = "Decrement" }))

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
keymap.set({ "n", "v" }, "E", "$", getOptions({ desc = "Jump to end of line" }))
keymap.set({ "n", "v" }, "B", "^", getOptions({ desc = "Jump to start of line" }))

-- Prevent delete a char that overwrite what's in the clipboard
keymap.set({ "n", "v" }, "x", '"_x', getOptions({ desc = "Delete char(s) without write into clipboard" }))

-- Paste without losing the contents of the register
keymap.set("x", "<Leader>p", '"_dP', getOptions({ desc = "Paste without closing the content of the register" }))

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", getOptions({ desc = "Select All" }))

-- Tabs
keymap.set("n", "<Leader><Tab>e", ":tabedit", getOptions({ desc = "Edit new file" }))

keymap.del("n", "<Leader><Tab>f")
keymap.del("n", "<Leader><Tab>l")
keymap.set("n", "<Leader><Tab>B", ":tabfirst<CR>", getOptions({ desc = "Go to first tab" }))
keymap.set("n", "<Leader><Tab>E", ":tablast<CR>", getOptions({ desc = "Go to last tab" }))

keymap.del("n", "<Leader><Tab>[")
keymap.del("n", "<Leader><Tab>]")
keymap.set("n", "<Leader><Tab>h", ":tabprev<CR>", getOptions({ desc = "Go to prev tab" }))
keymap.set("n", "<Leader><Tab>l", ":tabnext<CR>", getOptions({ desc = "Go to next tab" }))

-- keymap.del("n", "<Leader><Tab>d")
-- keymap.set("n", "<Leader><Tab>q", ":tabclose<CR>", getOptions({ desc = "Quit tab" }))

-- Resize window
keymap.set("n", "<C-w><left>", ":vertical resize -10<CR>", getOptions({ desc = "Decrease window verticaly" }))
keymap.set("n", "<C-w><right>", ":vertical resize +10<CR>", getOptions({ desc = "Increase window verticaly" }))
keymap.set("n", "<C-w><up>", ":horizontal resize +10<CR>", getOptions({ desc = "Increase window verticaly" }))
keymap.set("n", "<C-w><down>", ":horizontal resize -10<CR>", getOptions({ desc = "Decrease window verticaly" }))

-- Terminal
keymap.set("t", ";;", "<C-\\><C-n>", getOptions({ desc = "Enter Normal Mode" }))
keymap.set("t", "<C-h>", ":wincmd h<CR>", getOptions({ desc = "Go to left window" }))
keymap.set("t", "<C-j>", ":wincmd j<CR>", getOptions({ desc = "Go to lower window" }))
keymap.set("t", "<C-k>", ":wincmd k<CR>", getOptions({ desc = "Go to upper window" }))
keymap.set("t", "<C-l>", ":wincmd l<CR>", getOptions({ desc = "Go to right window" }))
keymap.set("n", "st-", ":split +term<CR>:startinsert<CR>", getOptions({ desc = "Open Terminal horizontaly" }))
keymap.set("n", "st\\", ":vsplit +term<CR>:startinsert<CR>", getOptions({ desc = "Open Terminal verticaly" }))

-- Delete all buffers
keymap.set("n", "<Leader>ba", ":%bd<CR>", getOptions({ desc = "Delete all buffers" }))

-- Marks
keymap.set("n", "<Leader>md", ":delmarks ", getOptions({ desc = "Delete a mark" }))
keymap.set("n", "<Leader>m!", ":delmarks!<CR>", getOptions({ desc = "Delete all marks" }))
keymap.set("n", "<Leader>m?", ":marks<CR>", getOptions({ desc = "List of mark" }))

-- Center buffer while navigating
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "n", "Nzz")
keymap.set("n", "N", "nzz")
keymap.set("n", "%", "%zz")
keymap.set("n", "*", "*zz")

-- Remap the clear search, diff update and redraw
keymap.del("n", "<Leader>ur")
keymap.set(
  "n",
  "ss",
  ":nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  getOptions({ desc = "Redraw / Clear hlsearch / Diff Update" })
)

-- Press 'S' for quick find/replace for the word under the cursor
keymap.set("n", "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)
