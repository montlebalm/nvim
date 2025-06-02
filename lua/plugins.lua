return {
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",

	-- Change surround characters
	"tpope/vim-surround",

	-- Support for aliases when using "gf"
	"PsychoLlama/further.vim",

	-- AI completion
	{
		"olimorris/codecompanion.nvim",
		config = function()
			require('codecompanion').setup({
				strategies = {
					inline = {
						adapter = "anthropic",
					},
				},
			})
		end
	},

	-- Text objects
	{
		"kana/vim-textobj-user",
		dependencies = {
			"glts/vim-textobj-comment",
			"kana/vim-textobj-entire",
			"kana/vim-textobj-indent",
		},
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		keys = {
			{ "-",         "<cmd>Oil<cr>", desc = "Open file browser" },
			{ "<leader>k", "<cmd>Oil<cr>", desc = "Open file browser" },
		},
	},

	-- Better buffer deletion
	{
		"qpkorr/vim-bufkill",
		config = function()
			vim.cmd([[
				let g:BufKillCreateMappings = 0

				" Overwrite default "bd" command
				cnoremap bd BD
			]])
		end,
	},

	{
		"klen/nvim-config-local",
		opts = {
			lookup_parents = true,
		}
	},

	-- Useful plugin to show you pending keybinds.
	{
		"folke/which-key.nvim",
		opts = {
			delay = 2000,
		}
	},

	-- Adds git releated signs to the gutter (and utils)
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			attach_to_untracked = false,
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
		keys = {
			{ "<leader>hn", "<cmd>Gitsigns next_hunk<cr>",  desc = "Next Git hunk", },
			{ "<leader>hp", "<cmd>Gitsigns prev_hunk<cr>",  desc = "Prev Git hunk", },
			{ "<leader>hu", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Git hunk", },
		},
	},

	{
		'sindrets/diffview.nvim',
		opts = {
			use_icons = false,
		},
	},

	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"suy/vim-context-commentstring",
		},
		opts = {},
	},

	-- Automatically create missing directories
	"duggiefresh/vim-easydir",

	-- Github Copilot
	{
		"github/copilot.vim",
		enabled = false,
		config = function()
			vim.g.copilot_filetypes = {
				TelescopePrompt = false,
			}

			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
		end,
		keys = {
			{ "<C-J>", 'copilot#Accept("<CR>")', "i", desc = "Accept suggestion", expr = true, replace_keycodes = false },
		},
	},

	-- Reload browser
	{
		"montlebalm/vim-reload-browser",
		config = function()
			vim.g.reload_browser_chrome = 1
			-- vim.g.reload_browser_firefox = 1
			-- vim.g.reload_browser_safari = 1
			-- vim.g.reload_browser_safari_tech_preview = 1
		end,
		keys = {
			{ "<leader>rs", "<cmd>call ReloadBrowser()<cr>", desc = "Reload browser", silent = true },
		},
	},
}
