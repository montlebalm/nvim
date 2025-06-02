return {
	"ibhagwan/fzf-lua",
	opts = {
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
			-- Current line
			["fg+"]     = { "fg", "Normal" },
			-- ["bg+"]     = { "bg", { "Visual", "Normal" } },
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
	},
	keys = {
		{ "<leader>b", "<cmd>FzfLua buffers<cr>",   desc = "Search buffers" },
		{ "<leader>p", "<cmd>FzfLua files<cr>",     desc = "Search files" },
		{ "<leader>f", "<cmd>FzfLua live_grep<cr>", desc = "Search live grep" },
		{ "<leader>m", "<cmd>FzfLua marks<cr>",     desc = "Search marks" },
	},
}
