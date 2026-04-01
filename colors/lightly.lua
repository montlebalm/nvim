--
-- Colors
-- https://github.com/nshern/neovim-default-colorscheme-extras
--

local colors
if vim.o.background == "dark" then
	colors = {
		bg_default = "NvimDarkGrey1",
		bg_primary = "NvimDarkGrey2",
		bg_secondary = "NvimDarkGrey3",
		bg_tertiary = "NvimDarkGrey4",
		fg_primary = "NvimLightGrey1",
		fg_secondary = "NvimLightGrey2",
		fg_tertiary = "NvimLightGrey3",
		highlight = "NvimLightYellow",
	}
else
	colors = {
		bg_default = "White",
		bg_primary = "NvimLightGrey3",
		bg_secondary = "NvimLightGrey2",
		bg_tertiary = "NvimLightGrey1",
		fg_primary = "NvimDarkGrey3",
		fg_secondary = "NvimDarkCyan",
		fg_tertiary = "NvimLightGrey4",
		highlight = "NvimLightYellow",
	}
end

local function set(name, options)
	vim.api.nvim_set_hl(0, name, options)
end

vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.g.colors_name = "lightly"

--
-- Reset
--

set("Comment", {})
set("Constant", {})
set("Delimiter", {})
set("Error", {})
set("Function", {})
set("Identifier", {})
set("Normal", {})
set("Special", {})
set("Statement", {})
set("StatusLine", {})
set("String", {})
set("Type", {})
set("Visual", {})
set("@variable", {})
set("@constant.tsx", {})

--
-- Text
--

set("Visual", { bg = colors.highlight, fg = colors.fg_primary })
set("VisualNOS", { bg = colors.bg_tertiary })
set("CurSearch", { bg = colors.fg_primary, fg = colors.bg_default })
set("IncSearch", { link = "CurSearch" })

-- Primary
set("Normal", { bg = colors.bg_default, fg = colors.fg_primary })

-- Secondary
set("String", { fg = colors.fg_secondary, italic = true })
set("Constant", { link = "String" })

-- Tertiary
set("Comment", { fg = colors.fg_tertiary })

-- Bold
set("@tag.tsx", { bold = true })
set("@tag.builtin.tsx", { link = "@tag.tsx" })
set("@keyword.return.tsx", { link = "@tag.tsx" })
set("@keyword.return.typescript", { link = "@tag.tsx" })

--
-- Chrome
--

set("StatusLine", { bg = colors.bg_tertiary })
set("StatusLineNC", { link = "StatusLine" })
set("VertSplit", { link = "StatusLine" })
set("WinSeparator", { bg = colors.bg_secondary, fg = colors.bg_secondary })

set("Pmenu", { bg = colors.bg_tertiary })
set("PmenuSel", { bg = colors.fg_primary, fg = colors.bg_default })
set("PmenuSbar", { bg = colors.bg_secondary, fg = colors.bg_tertiary })
set("PmenuThumb", { link = "PmenuSbar" })

-- Floats
set("NormalFloat", { bg = colors.bg_secondary })
set("DiagnosticFloatingInfo", { link = "NormalFloat" })
set("DiagnosticFloatingError", { link = "NormalFloat" })
set("DiagnosticFloatingWarn", { link = "NormalFloat" })
set("DiagnosticFloatingHint", { link = "NormalFloat" })

-- Fzf
set("FzfLuaLivePrompt", { link = "Identifier" })
set("FzfLuaHeaderBind", { link = "Comment" })
set("FzfLuaPathLineNr", { link = "Comment" })
set("FzfLuaTabMarker", { link = "Comment" })

-- Markdown
set("@markup.heading.2.markdown", { fg = colors.fg_secondary, bold = true })
set("@markup.heading.3.markdown", { fg = colors.fg_secondary, bold = true })

-- Gitcommit
set("@markup.heading.gitcommit", {})
