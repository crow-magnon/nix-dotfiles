-- Source: https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/keymaps.lua
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Map space as leader key
keymap("","<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Telescope command keymaps
keymap("n", "<leader>fb", ":Telescope file_browser<CR>", opts)
