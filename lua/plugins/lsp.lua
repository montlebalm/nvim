return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
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
			opts = {}
		},

		{
			"antosha417/nvim-lsp-file-operations",
			opts = {}
		},
	},

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	config = function()
		-- vim.lsp.log.set_level(vim.log.levels.INFO)

		--
		-- Servers
		--

		vim.lsp.config('bashls', {})
		vim.lsp.config('cssls', {})
		vim.lsp.config('graphql', {})
		vim.lsp.config('html', {})
		vim.lsp.config('jsonls', {})
		vim.lsp.config('svelte', {})
		vim.lsp.config('vimls', {})
		vim.lsp.config('yamlls', {})

		vim.lsp.config('eslint', {
			codeActionOnSave = {
				enable = true,
				mode = 'all',
			},
			settings = {
				format = false,
			},
		})

		vim.lsp.config('lua_ls', {
			settings = {
				Lua = {
					diagnostics = {
						-- Recognize "vim" global
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ts_ls.lua
		vim.lsp.config('ts_ls', {
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

		--
		-- Capabilities
		--

		local lsp_defaults = require('lspconfig').util.default_config
		lsp_defaults.capabilities =
				vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('cmp_nvim_lsp').default_capabilities())

		--
		-- mason
		--

		require("mason").setup({})

		require("mason-lspconfig").setup({
			automatic_enable = true,
			automatic_installation = true,
			ensure_installed = {},
		})

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
			end
		})

		--
		-- Diagnostics
		--

		-- Diagnostic icons
		local signs = {
			Error = "•",
			Warn = "◦",
			Hint = "?",
			Info = "ⁱ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Diagnostic text
		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = false,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = false,
		})

		-- You will likely want to reduce updatetime which affects CursorHold
		-- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-line-diagnostics-automatically-in-hover-window
		vim.o.updatetime = 250
		vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
	end,
}
