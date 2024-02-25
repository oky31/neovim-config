-- -- Default options:
-- require('kanagawa').setup({
--     compile = false,             -- enable compiling the colorscheme
--     undercurl = true,            -- enable undercurls
--     commentStyle = { italic = false },
--     functionStyle = {},
--     keywordStyle = { italic = false },
--     statementStyle = { bold = false },
--     typeStyle = {},
--     transparent = true,         -- do not set background color
--     dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
--     terminalColors = true,       -- define vim.g.terminal_color_{0,17}
--     theme = "wave",              -- "wave" "dragon" "lotus" 
--     background = {               -- map the value of 'background' option to a theme
--         dark = "wave",           -- try "dragon" !
--         light = "lotus"
--     },
-- })
-- 
-- -- setup must be called before loading
-- vim.cmd("colorscheme kanagawa")