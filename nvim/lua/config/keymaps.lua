------------------------------------
-- Default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
------------------------------------
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local mergeTables = function(...)
  vim.tbl_deep_extend("force", ...)
end

-- Reload configuration without restart nvim
keymap.set("n", "<leader>r", ":so %<CR>", mergeTables(opts, { desc = "Reload configuration" }))

-- ESC to ;;
keymap.set({ "n", "i", "v", "t" }, ";;", "<ESC>", mergeTables(opts, { desc = "ESC" }))

-- Save
keymap.set({ "i", "x", "n", "s" }, ";w", ":w<CR><ESC>", mergeTables(opts, { desc = "Save file" }))

-- Quit
keymap.set("n", ";q", ":q<CR>", mergeTables(opts, { desc = "Quit file" }))

-- Increment/Decrement
keymap.set("n", "+", "<C-a>", { desc = "Increment" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
keymap.set({ "n", "v" }, "gL", "$", mergeTables(opts, { desc = "Jump to end of line" }))
keymap.set({ "n", "v" }, "gH", "^", mergeTables(opts, { desc = "Jump to start of line" }))

-- Prevent delete a char that overwrite what's in the clipboard
keymap.set({ "n", "v" }, "x", '"_x', mergeTables(opts, { desc = "Delete char(s) without write into clipboard" }))

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", mergeTables(opts, { desc = "Select All" }))

-- Tabs
keymap.set("n", "<Leader><Tab>e", ":tabedit", mergeTables(opts, { desc = "Edit new file" }))

keymap.del("n", "<Leader><Tab>f")
keymap.del("n", "<Leader><Tab>l")
keymap.set("n", "<Leader><Tab>0", ":tabfirst<CR>", mergeTables(opts, { desc = "Go to first tab" }))
keymap.set("n", "<Leader><Tab>$", ":tablast<CR>", mergeTables(opts, { desc = "Go to last tab" }))

keymap.del("n", "<Leader><Tab>[")
keymap.del("n", "<Leader><Tab>]")
keymap.set("n", "<Leader><Tab>h", ":tabprev<CR>", mergeTables(opts, { desc = "Go to prev tab" }))
keymap.set("n", "<Leader><Tab>l", ":tabnext<CR>", mergeTables(opts, { desc = "Go to next tab" }))

keymap.del("n", "<Leader><Tab>d")
keymap.set("n", "<Leader><Tab>q", ":tabclose<CR>", mergeTables(opts, { desc = "Quit tab" }))

-- Delete window
keymap.del("n", "<Leader>wd")
keymap.set("n", "<Leader>wq", "<C-W>c", mergeTables(opts, { desc = "Delete window" }))

-- Split window
keymap.del("n", "<Leader>w-")
keymap.del("n", "<Leader>w|")
keymap.set("n", "s\\", ":vsplit<CR>", mergeTables(opts, { desc = "Split window verticaly" }))
keymap.set("n", "s-", ":split<CR>", mergeTables(opts, { desc = "Split window horizontaly" }))

-- Resize window
keymap.set("n", "<C-w><left>", ":vertical resize -10<CR>", mergeTables(opts, { desc = "Decrease window verticaly" }))
keymap.set("n", "<C-w><right>", ":vertical resize +10<CR>", mergeTables(opts, { desc = "Increase window verticaly" }))
keymap.set("n", "<C-w><up>", ":horizontal resize +10<CR>", mergeTables(opts, { desc = "Increase window verticaly" }))
keymap.set("n", "<C-w><down>", ":horizontal resize -10<CR>", mergeTables(opts, { desc = "Decrease window verticaly" }))

-- Terminal
keymap.set("t", ";;", "<C-\\><C-n>", mergeTables(opts, { desc = "Enter Normal Mode" }))
keymap.set("t", "<C-h>", ":wincmd h<CR>", mergeTables(opts, { desc = "Go to left window" }))
keymap.set("t", "<C-j>", ":wincmd j<CR>", mergeTables(opts, { desc = "Go to lower window" }))
keymap.set("t", "<C-k>", ":wincmd k<CR>", mergeTables(opts, { desc = "Go to upper window" }))
keymap.set("t", "<C-l>", ":wincmd l<CR>", mergeTables(opts, { desc = "Go to right window" }))
keymap.set("n", "st-", ":split +term<CR>:startinsert<CR>", mergeTables(opts, { desc = "Open Terminal horizontaly" }))
keymap.set("n", "st\\", ":vsplit +term<CR>:startinsert<CR>", mergeTables(opts, { desc = "Open Terminal verticaly" }))

-- Delete all buffers
keymap.set("n", "<Leader>ba", ":%bd<CR>")

-- Marks
keymap.set("n", "<Leader>md", ":delmarks ", mergeTables(opts, { desc = "Delete a mark" }))
keymap.set("n", "<Leader>m!", ":delmarks!<CR>", mergeTables(opts, { desc = "Delete marks" }))
keymap.set("n", "<Leader>m?", ":marks<CR>", mergeTables(opts, { desc = "List of mark" }))

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
