local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
	  'nvim-lua/plenary.nvim',
	  'nvim-tree/nvim-web-devicons',
	  'nvim-telescope/telescope.nvim',
	  {'williamboman/mason.nvim', opts = {}},
	  'neovim/nvim-lspconfig',
	  'hrsh7th/cmp-nvim-lsp',
	  'hrsh7th/nvim-cmp',
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

require('lsp')
require('nvim-cmp')

