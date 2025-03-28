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
				formatter = 'path.filename_first',

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
			}
		})

		-- Buffers
		vim.keymap.set(
			"n",
			"<leader>b",
			require('fzf-lua').buffers,
			{ desc = "Find [B]uffers" }
		)

		-- Files
		vim.keymap.set(
			"n",
			"<leader>p",
			require('fzf-lua').files,
			{ desc = "[S]earch [F]iles" }
		)

		-- Live grep
		vim.keymap.set(
			"n",
			"<leader>f",
			require('fzf-lua').live_grep,
			{ desc = "[S]earch by [G]rep" }
		)

		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>g",
		-- 	telescope.extensions.live_grep_args.live_grep_args,
		-- 	{ desc = "[S]earch by [G]rep" }
		-- )
		--
		-- vim.keymap.set("n", "<leader>k", ":Telescope file_browser path=%:p:h select_buffer=true<CR><esc>")
	end,
}
