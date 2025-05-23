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
		config = function()
			require('oil').setup({})

			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open file browser" })
			vim.keymap.set("n", "<leader>k", "<cmd>Oil<cr>", { desc = "Open file browser" })
		end,
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
	{ "folke/which-key.nvim", opts = {} },

	-- Adds git releated signs to the gutter (and utils)
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				attach_to_untracked = false,
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "<leader>hn", gs.next_hunk)
					map("n", "<leader>hp", gs.prev_hunk)

					-- Actions
					-- map("n", "<leader>hu", gs.undo_stage_hunk)
					map("n", "<leader>hs", gs.stage_hunk)
					map("n", "<leader>hu", gs.reset_hunk)

					-- Text object
					map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
				end,
			})
		end,
	},

	{
		'sindrets/diffview.nvim',
		config = function()
			require('diffview').setup({
				use_icons = false,
			})
		end,
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
		config = function()
			vim.g.copilot_filetypes = {
				TelescopePrompt = false,
			}

			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""

			vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
				expr = true,
				replace_keycodes = false,
			})
		end,
	},

	-- Reload browser
	{
		"montlebalm/vim-reload-browser",
		config = function()
			vim.g.reload_browser_chrome = 1
			-- vim.g.reload_browser_firefox = 1
			-- vim.g.reload_browser_safari = 1
			-- vim.g.reload_browser_safari_tech_preview = 1

			vim.keymap.set("n", "<leader>rs", ":call ReloadBrowser()<cr>", { silent = true, noremap = true })
		end,
	},
}
