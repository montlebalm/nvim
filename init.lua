-- Set <space> as the leader key
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.keymap.set("n", "<SPACE>", "<Nop>", {})
vim.g.mapleader = " "

--
-- lazy.nvim
--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Keep cursor in the center of the screen
vim.opt.scrolloff = 0

-- Set highlight on search
vim.o.hlsearch = true

-- Don't wrap when hitting final search result
vim.o.wrapscan = false

-- Enable mouse mode
vim.o.mouse = "a"

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Tabs
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Optionally enable true color
-- vim.cmd([[
--   if (has("termguicolors"))
--    set termguicolors
--   endif
-- ]])

-- Don't wrap
vim.o.wrap = false

--
-- Basic keymaps
--

-- Easier command character
vim.keymap.set("n", ";", ":")

-- Easier escape
vim.keymap.set("i", "jj", "<esc>")

-- Keymaps for better default experience
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window navigation
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-h>", "<c-w>h")

-- Stay at current occurence when using "*"
vim.keymap.set("n", "*", "*``")

-- Resize splits equally
vim.keymap.set("n", "<leader>=", "<c-W>=")

-- Clear seach highlight
vim.keymap.set("n", "<leader>/", ":noh<CR>")

-- Eslint fix
vim.keymap.set("n", "gl", ":EslintFixAll<CR>:w<CR>")

-- Open the directory of the current file
vim.cmd([[map <leader>o :silent !open <C-R>=expand("%:p:h")<CR><CR>]])

-- Start edit command with the path of the current file
vim.cmd([[map <leader>e :e <C-R>=expand("%:h") . "/"<CR>]])
vim.cmd([[nnoremap <leader>ec :let @*=expand("%:~:.")<CR>]])

-- <enter> makes a newline (except in quickfix)
vim.cmd([[nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'o<esc>']])

-- Visual shifting (does not exit Visual mode)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move current line / visual line selection up or down.
vim.keymap.set("v", "<C-j>", ":m'>+<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m-2<CR>gv=gv")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = 'Visual' })
	end,
	group = highlight_group,
	pattern = "*",
})

--
-- Custom filetype detection
--

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = {
		"*.aliases",
		"*.exports",
		"*.extra",
		"*.path",
		"*.private",
		"*.ripgreprc",
	},
	callback = function(event)
		vim.api.nvim_buf_set_option(event.buf, "filetype", "bash")
	end,
})

--
-- Statusline
--

vim.cmd([[

set statusline=
set statusline+=\ %{expand('%:p:h:t')}/%t   " file name
set statusline+=%m%r                        " modified, readonly
set statusline+=\                           " spacer
set statusline+=%<                          " truncate here if needed
set statusline+=%=                          " switch to RHS
set statusline+=%l/%L:%c\                   " number of lines

]])
