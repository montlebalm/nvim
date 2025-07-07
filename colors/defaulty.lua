--
-- Setup
--

vim.cmd('hi clear')
vim.g.colors_name = 'defaulty'

--
-- Helpers
--

local hi = function(group, opts) vim.api.nvim_set_hl(0, group, opts) end

--
-- Highlights
--

hi('Normal', { fg = nil })

hi('Identifier', { fg = 'NvimDarkGrey1' })

hi('Statement', { bold = false })

hi('String', { fg = 'NvimDarkCyan' })

hi('Comment', { fg = 'NvimLightGrey4' })

hi('Statusline', { bg = 'NvimLightGrey2', fg = 'NvimDarkGrey1' })
hi('StatuslineNC', { bg = 'NvimLightGray1', fg = 'NvimLightGrey4' })

hi('WinSeparator', { bg = 'NvimLightGrey2', fg = 'NvimLightGrey2' })

hi('@keyword.return.tsx', { link = '@tag.builtin.tsx' })

hi('Pmenu', { link = 'NormalFloat' })

hi('MatchParen', { bold = false })

-- Highlight/search
hi('Visual', { bg = 'NvimLightYellow' })
hi('IncSearch', { bg = 'NvimLightGrey1', fg = 'NvimDarkGrey1' })
hi('CurSearch', { link = 'IncSearch' })

-- JSX/TSX
hi('@tag.builtin.tsx', { fg = 'NvimDarkGrey4', bold = true })
hi('@tag.tsx', { link = '@tag.builtin.tsx' })

-- Plugin: Oil
hi('OilFile', { fg = 'NvimDarkGrey1' })

-- Plugin: FzfLua
hi('FzfLuaNormal', { fg = 'NvimDarkGrey1' })
hi('FzfLuaFilePart', { fg = 'NvimDarkGrey1' })
hi('FzfLuaHeaderBind', { link = 'Comment' })
hi('FzfLuaPathLineNr', { link = 'Comment' })
hi('FzfLuaTabMarker', { link = 'Comment' })
