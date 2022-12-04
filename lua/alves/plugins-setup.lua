-- Verifies if packer is already installed, else installs it
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Auto command that reloads neovim whenever this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local packer_status, packer = pcall(require, "packer")

if not packer_status then
  print("packer could not be started")
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'bluz71/vim-nightfly-colors' -- color scheme
  use 'christoomey/vim-tmux-navigator' -- tmux and vim window navigation
  use 'szw/vim-maximizer' -- maximizes and restores current window
  use 'numToStr/Comment.nvim' -- commenting with gc
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } } -- status line
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } } -- file tree explorer
  use ({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- file searcher native sorter
  use ({ "nvim-telescope/telescope.nvim", tag = "0.1.x" }) -- file searching
  use {'neoclide/coc.nvim', branch = 'release'} -- Auto completion and LSP

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
