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
  use "nvimtools/none-ls.nvim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.4'
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  }

  -- "gc" to comment visual regions/lines
  use { 'numToStr/Comment.nvim', opts = {} }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use "folke/trouble.nvim"
  use "nvim-tree/nvim-web-devicons"
  -- git
  use "https://github.com/lewis6991/gitsigns.nvim"

  -- Explorer
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
  }
  use "3rd/image.nvim"
  use "MunifTanjim/nui.nvim"

  -- Bufferline
  use "akinsho/bufferline.nvim"

  -- Hardtime
  use "m4xshen/hardtime.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


