-- Inspiration and starting point taken from https://github.com/LunarVim/Neovim-from-scratch/blob/05-completion/lua/user/options.lua

local options = {
    showmode = false,
    swapfile = false,
    backup = false,
    undofile = true,

    -- Completions
    completeopt = {"menuone", "noselect" }, -- mostly just for cmp
    updatetime = 200, -- faster completion (4000ms default)

    -- Cursor and line formatting
    cursorline = true,
    cursorlineopt = "number",
    number = true,
    relativenumber = true,
    wrap = true,
    linebreak = true,

    -- Line indentation
    list = true,
    tabstop = 4,
    expandtab = true,
    shiftwidth = 4,
    smartindent = true,

    -- Colorscheme
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Line indent TODO: Figure out how the append function works for a table and how I can set a table with specific characters added
vim.opt.listchars:append "eol:↴"

