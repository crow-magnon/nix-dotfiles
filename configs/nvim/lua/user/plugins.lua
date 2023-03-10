-- Adding bootstrapping logic in so Neovim verifies that packer is installed when Neovim starts up and installs it if not. Makes the machine to machine transition easier. https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer. Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever the plugins.lua file is saved
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Installing plugins. Packer setup ideas taken from https://github.com/wbthomason/packer.nvim
return packer.startup(function(use)
  -- Core, general stuff
  use "wbthomason/packer.nvim" -- Have Packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs"

  -- Completions (cmp)
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP and formatting tools
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- package/tool manager for LSPs and formatting/linting tools
  use "williamboman/mason-lspconfig.nvim" -- extension to mason that makes LSP installation and management easier
  use "RubixDev/mason-update-all" -- extension to mason that allows for updating all servers at once

  --Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
  use { 
      "nvim-telescope/telescope-file-browser.nvim", -- file explorer plugin with tree view and functionality on the way
      requires = {
          "nvim-tree/nvim-web-devicons", -- dev icons bc I want my terminal to feel pretty
      },
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Colorscheme and other eye candy
  use 'lukas-reineke/indent-blankline.nvim' -- Guide showing indent levels. https://github.com/lukas-reineke/indent-blankline.nvim
  use 'tiagovla/tokyodark.nvim' -- Colorscheme: https://github.com/tiagovla/tokyodark.nvim

  if packer_bootstrap then
    require('packer').sync()
  end
end)
