-- Modularized setup because I'm cool like that
require('user.keymaps')
require('user.options')require('user.plugins')
require('user.cmp')
require('user.indent_blankline')
require('user.lsp')
require('user.telescope')
require('user.treesitter')
require('user.autopairs')

-- Colorscheme
-- https://github.com/tiagovla/tokyodark.nvim 
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"
vim.cmd("colorscheme tokyodark")

-- Chezmoi-specific autocommand to automatically apply Chezmoi source changes to the destination
vim.cmd [[
    augroup chezmoi_user_config
        autocmd!
        autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
    augroup end
]]
