return {
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

		-- Buffers
		vim.keymap.set(
			"n",
			"<leader>b",
			require('fzf-lua').buffers,
			{ desc = "Search [B]uffers" }
		)

		-- Files
		vim.keymap.set(
			"n",
			"<leader>p",
			require('fzf-lua').files,
			{ desc = "Search Files" }
		)

		-- Live grep
		vim.keymap.set(
			"n",
			"<leader>f",
			require('fzf-lua').live_grep,
			{ desc = "Search by Live Grep" }
		)

		-- Marks
		vim.keymap.set(
			"n",
			"<leader>m",
			require('fzf-lua').marks,
			{ desc = "Search [M]arks" }
		)
	end,
}
