--------------------------------------------------------------------------------
-- Git
--------------------------------------------------------------------------------

-- Basic git functionality
vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

-- Enable "GBrowse"
vim.pack.add({ "https://github.com/tpope/vim-rhubarb" })

-- Support for aliases when using "gf"
vim.pack.add({ "https://github.com/PsychoLlama/further.vim" })

--
-- Add git signs to the gutter
--

vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	attach_to_untracked = false,
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

vim.keymap.set("n", "<leader>hn", "<cmd>Gitsigns next_hunk<cr>", {
	desc = "Next Git hunk",
})
vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns prev_hunk<cr>", {
	desc = "Prev Git hunk",
})
vim.keymap.set("n", "<leader>hu", "<cmd>Gitsigns reset_hunk<cr>", {
	desc = "Reset Git hunk",
})

--------------------------------------------------------------------------------
-- Pathing/directories
--------------------------------------------------------------------------------

-- Automatically create missing directories
vim.pack.add({ "https://github.com/duggiefresh/vim-easydir" })

--------------------------------------------------------------------------------
-- Reload browser
--------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/montlebalm/vim-reload-browser" })

vim.g.reload_browser_chrome = 1
-- vim.g.reload_browser_firefox = 1
-- vim.g.reload_browser_safari = 1
-- vim.g.reload_browser_safari_tech_preview = 1

vim.keymap.set("n", "<leader>rs", "<cmd>call ReloadBrowser()<cr>", {
	desc = "Reload browser",
	silent = true,
})

--------------------------------------------------------------------------------
-- Text editing
--------------------------------------------------------------------------------

-- Detect tabstop and shiftwidth automatically
vim.pack.add({ "https://github.com/tpope/vim-sleuth" })

-- Change surround characters
vim.pack.add({ "https://github.com/tpope/vim-surround" })

-- Text objects
vim.pack.add({
	"https://github.com/kana/vim-textobj-user",
	-- Dependencies
	"https://github.com/kana/vim-textobj-entire",
	"https://github.com/kana/vim-textobj-indent",
})

--------------------------------------------------------------------------------
-- File browser
--------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup()

vim.keymap.set("n", "-", "<cmd>Oil<cr>", {
	desc = "Open file browser",
})
vim.keymap.set("n", "<leader>k", "<cmd>Oil<cr>", {
	desc = "Open file browser",
})

--------------------------------------------------------------------------------
-- Buffers
--------------------------------------------------------------------------------

-- Better buffer deletion
vim.pack.add({ "https://github.com/qpkorr/vim-bufkill" })

vim.cmd([[
	let g:BufKillCreateMappings = 0

	" Overwrite default "bd" command
	cnoremap bd BD
]])

--------------------------------------------------------------------------------
-- Local project config
--------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/klen/nvim-config-local" })

require("config-local").setup({
	lookup_parents = true,
})

--------------------------------------------------------------------------------
-- Keymap explainer
--------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
	delay = 2000,
})

------------------------------------------------------------------------------
-- Formatting
------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
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
})

------------------------------------------------------------------------------
-- Treesitter
------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").install({
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
})

vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Incremental selection
vim.keymap.set("n", "<C-space>", "van", { remap = true })
vim.keymap.set("v", "<C-space>", "an", { remap = true })

------------------------------------------------------------------------------
-- Pickers
------------------------------------------------------------------------------

vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
	"telescope",
	defaults = {
		-- Icons
		color_icons = false,
		file_icons = false,
		git_icons = false,

		-- Remove help text
		header = false,
	},
	fzf_colors = {
		true,
		-- Current line
		["fg+"] = { "fg", "Normal" },
		["bg+"] = { "bg", "Visual" },
		["prompt"] = { "fg", "Comment" },

		-- Disable
		["fg"] = "-1",
		["bg"] = "-1",
		["hl"] = "-1",
		["hl+"] = "-1",
		["info"] = "-1",
		["pointer"] = "-1",
		["marker"] = "-1",
		["spinner"] = "-1",
		["header"] = "-1",
		["gutter"] = "-1",
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
			layout = "vertical",
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
			["ctrl-d"] = {
				fn = require("fzf-lua").actions.buf_del,
				reload = true,
			},
		},
	},
	marks = {
		actions = {
			["ctrl-d"] = {
				fn = require("fzf-lua").actions.mark_del,
				reload = true,
			},
		},
		marks = "%a",
	},
})

vim.keymap.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>", {
	desc = "Search buffers",
})
vim.keymap.set("n", "<leader>p", "<cmd>FzfLua files<cr>", {
	desc = "Search files",
})
vim.keymap.set("n", "<leader>f", "<cmd>FzfLua live_grep<cr>", {
	desc = "Search live grep",
})
vim.keymap.set("n", "<leader>m", "<cmd>FzfLua marks<cr>", {
	desc = "Search marks",
})

------------------------------------------------------------------------------
-- Completion
------------------------------------------------------------------------------

--
-- LuaSnip (dependency)
--

vim.pack.add({
	{
		src = "https://github.com/L3MON4D3/LuaSnip",
		version = vim.version.range("v2.*"),
	},
})

require("luasnip.loaders.from_vscode").lazy_load({
	paths = { "./snippets" },
})

--
-- Blink
--

vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
})

require("blink.cmp").setup({
	completion = {
		documentation = {
			auto_show = true,
		},
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind" },
				},
			},
		},
	},
	fuzzy = {
		implementation = "prefer_rust_with_warning",
	},
	keymap = {
		preset = "none",
		["<tab>"] = { "select_next", "fallback" },
		["<s-tab>"] = { "select_prev", "fallback" },
		["<enter>"] = { "accept", "fallback" },
	},
	snippets = {
		preset = "luasnip",
	},
	sources = {
		default = {
			"lsp",
			"path",
			"snippets",
			"buffer",
		},
		per_filetype = {
			-- Disable completion
			markdown = {},
		},
	},
})

------------------------------------------------------------------------------
-- LSP
------------------------------------------------------------------------------

vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
})

require("mason").setup({
	ensure_installed = {
		"bash-language-server",
		"css-lsp",
		"eslint-lsp",
		"graphql-language-service-cli",
		"html-lsp",
		"json-lsp",
		"lua-language-server",
		"svelte-language-server",
		"typescript-language-server",
		"vim-language-server",
		"yaml-language-server",
	},
})

-- (Dependency) Lua util library
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })

-- (Dependency) Useful status updates for LSP
vim.pack.add({ "https://github.com/j-hui/fidget.nvim" })
require("fidget").setup({
	notification = {
		override_vim_notify = true,
		window = {
			border = "solid",
			normal_hl = "NormalFloat",
			winblend = 0,
			x_padding = 0,
			y_padding = 1,
		},
	},
})

-- (Dependency) Additional lua configuration, makes nvim stuff amazing!
vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
require("lazydev").setup()

-- (Dependency) Support for file operations using built-in LSP
vim.pack.add({ "https://github.com/antosha417/nvim-lsp-file-operations" })
require("lsp-file-operations").setup()

--
-- Servers
--

-- Add completion for all LSPs
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.enable("bashls")
vim.lsp.enable("cssls")
vim.lsp.enable("graphql", false)
vim.lsp.enable("html")
vim.lsp.enable("jsonls")
vim.lsp.enable("stylelint_lsp")
vim.lsp.enable("svelte", false)
vim.lsp.enable("vimls")
vim.lsp.enable("yamlls", false)

vim.lsp.config("eslint", {
	settings = {
		format = false,
	},
})
vim.lsp.enable("eslint")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
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
vim.lsp.enable("lua_ls")

-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ts_ls.lua
vim.lsp.config("ts_ls", {
	init_options = {
		-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md#preferences-options
		preferences = {
			-- canUseWatchEvents = true,
			disableAutomaticTypingAcquisition = true,
			-- Prefer project-relative imports (e.g., "foo/bar" instead of "../bar")
			importModuleSpecifierPreference = "non-relative",
		},
		-- tsserver = {
		-- 	logDirectory = '/Users/cmontrois/Desktop/ts-logs',
		-- 	logVerbosity = 'verbose',
		-- },
	},
	settings = {
		typescript = {
			-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md#tsserver-options
			tsserver = {
				maxTsServerMemory = 32768,
			},
		},
	},
})
vim.lsp.enable("ts_ls", false)

vim.lsp.config("tsgo_ls", {
	cmd = { "/Users/cmontrois/Developer/slack/webapp/node_modules/.bin/tsgo", "--lsp", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
		"tsconfig.base.json",
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
vim.lsp.enable("tsgo_ls")

--
-- Keymaps
--

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)

		vim.keymap.set("n", "<c-p>", vim.diagnostic.open_float, opts)

		vim.keymap.set("n", "<leader>ap", function()
			vim.diagnostic.jump({
				count = -1,
				severity = vim.diagnostic.severity.ERROR,
			})
		end, opts)

		vim.keymap.set("n", "<leader>an", function()
			vim.diagnostic.jump({
				count = 1,
				severity = vim.diagnostic.severity.ERROR,
			})
		end, opts)

		-- Eslint fix
		vim.keymap.set("n", "gl", "<cmd>LspEslintFixAll<CR>", opts)
	end,
})
