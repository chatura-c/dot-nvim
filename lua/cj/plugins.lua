local fn = vim.fn

-- Install packer if not installed
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  print "Packer not installed, installing Packer now."
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }

  print "Installing Packer close and reopen Neovim ..."
end

vim.cmd [[packadd packer.nvim]]

-- Reload nvim whenever plugins.lua is updated
 vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
 ]]

-- Make sure Packer is available 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Use popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  
  use "wbthomason/packer.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"
  
  -- Theme
  use "sainnhe/gruvbox-material"

  -- Auto completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use "L3MON4D3/LuaSnip"--snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
 
  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "folke/neodev.nvim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4'
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
