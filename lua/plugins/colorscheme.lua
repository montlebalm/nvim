--
-- Neovim Default (Light)
--

-- Invert the statusline when in insert mode
vim.cmd([[
	autocmd InsertEnter * hi Statusline ctermbg=0 ctermfg=15
	autocmd InsertLeave * hi Statusline ctermbg=15 ctermfg=0
]])

return {
	{
		"montlebalm/greybeard",
		dir = "~/Developer/greybeard",
		dev = true,
		enabled = true,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("greybeard")
		end,
	},

	{
		'rose-pine/neovim',
		enabled = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = false,
					italic = false,
					transparency = false,
				},
				variant = 'dawn',
			})

			vim.o.background = "light"
			vim.cmd.colorscheme("rose-pine")

			vim.cmd("hi Normal guibg=NONE")

			vim.cmd("hi Comment guifg=#bbb4ac")

			vim.cmd("hi Statusline guibg=#f3ddd7")
			vim.cmd("hi WinSeparator guifg=#f3ddd7 guibg=#f3ddd7")
			-- vim.cmd("hi NormalFloat guibg=#f3ddd7")
		end,
	},
}
