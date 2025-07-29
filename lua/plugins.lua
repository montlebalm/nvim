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

	-- Local config per project
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
		lazy = false,
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

	{
		'kiddos/gemini.nvim',
		opts = {
			completion = {
				insert_result_key = "<c-j>",
			},
		}
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

	------------------------------------------------------------------------------
	-- Colorscheme
	------------------------------------------------------------------------------

	{
		"montlebalm/greybeard",
		dir = "~/Developer/montlebalm/greybeard",
		dev = true,
		enabled = true,
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "light"
			vim.cmd.colorscheme("greybeard")
		end,
	},

	------------------------------------------------------------------------------
	-- Formatting
	------------------------------------------------------------------------------

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				json = { "prettier" },
				lua = { "stylua" },
				-- JavaScript and friends
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				-- Styling
				css = { "prettier" },
				less = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
		},
	},

	------------------------------------------------------------------------------
	-- Treesitter
	------------------------------------------------------------------------------

	{
		"nvim-treesitter/nvim-treesitter",

		build = ":TSUpdate",

		event = { "BufReadPre", "BufNewFile" },

		lazy = false,

		config = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					-- Web
					"css",
					"html",
					"javascript",
					"scss",
					"svelte",
					"tsx",
					"typescript",
					-- Data
					"graphql",
					"json",
					"yaml",
					-- Git
					"git_config",
					"git_rebase",
					"gitcommit",
					"gitignore",
					-- Vim
					"lua",
					"vim",
					"vimdoc",
					-- Other
					"markdown",
					"ssh_config",
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
					disable = { "python" },
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<c-space>",
						node_incremental = "<c-space>",
						scope_incremental = "<c-s>",
						node_decremental = "<M-space>",
					},
				},
			})

			vim.opt.foldlevel = 99
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
		end,
	},


	------------------------------------------------------------------------------
	-- Completion
	------------------------------------------------------------------------------

	-- https://cmp.saghen.dev/installation
	{
		'saghen/blink.cmp',

		-- use a release tag to download pre-built binaries
		version = '1.*',

		dependencies = {
			"L3MON4D3/LuaSnip", version = "v2.*",
		},

		opts = {
			completion = {
				documentation = {
					auto_show = true,
				},
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning"
			},
			keymap = {
				preset = 'none',
				['<tab>'] = { 'select_next', 'fallback' },
				['<s-tab>'] = { 'select_prev', 'fallback' },
				['<enter>'] = { 'accept', 'fallback' },
			},
			snippets = {
				preset = 'luasnip',
			},
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
		},
		opts_extend = { "sources.default" }
	},

	------------------------------------------------------------------------------
	-- Pickers
	------------------------------------------------------------------------------

	{
		"ibhagwan/fzf-lua",
		config = function()
			require('fzf-lua').setup({
				"telescope",
				defaults = {
					-- Icons
					color_icons = false,
					file_icons = false,
					git_icons = false,

					-- Paths
					-- formatter = 'path.filename_first',

					-- Remove help text
					header = false,
				},
				fzf_colors = {
					true,
					-- Current line
					["fg+"]     = { "fg", "Normal" },
					["bg+"]     = { "bg", "Visual" },
					["prompt"]  = { "fg", "Comment" },

					-- Disable
					["fg"]      = "-1",
					["bg"]      = "-1",
					["hl"]      = "-1",
					["hl+"]     = "-1",
					["info"]    = "-1",
					["pointer"] = "-1",
					["marker"]  = "-1",
					["spinner"] = "-1",
					["header"]  = "-1",
					["gutter"]  = "-1",
				},
				grep = {
					fzf_opts = {
						-- Allow cycling through history with <ctrl-p> and <ctrl-n>
						["--history"] = vim.fn.stdpath("data") .. "/fzf_grep_hist",
					},
					rg_glob = true,
				},
				winopts = {
					fullscreen = true,
					preview = {
						winopts = {
							number = false,
						},
					},
					scrollbar = "border",
				},
				--
				-- Picker options
				--
				buffers = {
					actions = {
						['ctrl-d'] = {
							fn = require('fzf-lua').actions.buf_del,
							reload = true,
						},
					},
				},
				marks = {
					actions = {
						['ctrl-d'] = {
							fn = require('fzf-lua').actions.mark_del,
							reload = true,
						},
					},
					marks = '%a',
				},
			})
		end,
		keys = {
			{ "<leader>b", "<cmd>FzfLua buffers<cr>",   desc = "Search buffers" },
			{ "<leader>p", "<cmd>FzfLua files<cr>",     desc = "Search files" },
			{ "<leader>f", "<cmd>FzfLua live_grep<cr>", desc = "Search live grep" },
			{ "<leader>m", "<cmd>FzfLua marks<cr>",     desc = "Search marks" },
		},
	},

	------------------------------------------------------------------------------
	-- LSP
	------------------------------------------------------------------------------

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			automatic_enable = false,
			automatic_installation = true,
			ensure_installed = {
				'bashls',
				'cssls',
				'eslint',
				'graphql',
				'html',
				'jsonls',
				'lua_ls',
				'svelte',
				'ts_ls',
				'vimls',
				'yamlls',
			},
		},

		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
		},
	},

	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"nvim-lua/plenary.nvim",

			-- Useful status updates for LSP
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							border = "solid",
							normal_hl = "NormalFloat",
							winblend = 0,
							x_padding = 0,
							y_padding = 1,
						}
					}
				}
			},

			-- Additional lua configuration, makes nvim stuff amazing!
			{
				"folke/neodev.nvim",
				opts = {},
			},

			{
				"antosha417/nvim-lsp-file-operations",
				opts = {},
			},
		},

		event = { "BufReadPre", "BufNewFile", },

		config = function()
			-- vim.lsp.log.set_level(vim.log.levels.DEBUG)

			--
			-- Servers
			--

			vim.lsp.enable('bashls')
			vim.lsp.enable('cssls')
			vim.lsp.enable('graphql', false)
			vim.lsp.enable('html')
			vim.lsp.enable('jsonls')
			vim.lsp.enable('stylelint_lsp')
			vim.lsp.enable('svelte', false)
			vim.lsp.enable('vimls')
			vim.lsp.enable('yamlls', false)

			vim.lsp.config('eslint', {
				settings = {
					format = false,
				},
			})
			vim.lsp.enable('eslint')

			vim.lsp.config('lua_ls', {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						telemetry = {
							enable = false,
						},
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
			vim.lsp.enable('lua_ls')

			-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ts_ls.lua
			vim.lsp.config('ts_ls', {
				init_options = {
					-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md#preferences-options
					preferences = {
						-- canUseWatchEvents = true,
						disableAutomaticTypingAcquisition = true,
						-- Prefer project-relative imports (e.g., "foo/bar" instead of "../bar")
						importModuleSpecifierPreference = "non-relative",
					},
					tsserver = {
						logDirectory = '/Users/cmontrois/Desktop/ts-logs',
						logVerbosity = 'verbose',
					},
				},
				settings = {
					typescript = {
						-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md#tsserver-options
						tsserver = {
							maxTsServerMemory = 32768,
							tsdk = './node_modules/typescript/lib',
						},
					},
				},
			})
			vim.lsp.enable('ts_ls')

			vim.lsp.config('tsgo_ls', {
				cmd = {
					vim.loop.os_homedir() .. "/Developer/libs/typescript-go/built/local/tsgo", "--lsp", "-stdio"
				},
				init_options = {
					preferences = {
						-- Prefer project-relative imports (e.g., "foo/bar" instead of "../bar")
						importModuleSpecifierPreference = "non-relative",
					},
				},
				settings = {
					typescript = {
						tsserver = {
							maxTsServerMemory = 32768,
						},
					},
				},
			})
			vim.lsp.enable('tsgo_ls', false)

			--
			-- Keymaps
			--

			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "grt", vim.lsp.buf.type_definition, opts)

					vim.keymap.set("n", "<leader>af", vim.diagnostic.open_float, opts)

					vim.keymap.set("n", "<leader>ap", function()
						vim.diagnostic.goto_prev({
							severity = vim.diagnostic.severity.ERROR,
						})
					end, opts)

					vim.keymap.set("n", "<leader>an", function()
						vim.diagnostic.goto_next({
							severity = vim.diagnostic.severity.ERROR,
						})
					end, opts)

					-- Eslint fix
					vim.keymap.set("n", "gl", ":LspEslintFixAll<CR>")
				end
			})
		end,
	},
}
