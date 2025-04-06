return {
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
}
