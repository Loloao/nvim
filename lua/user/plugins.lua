local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use("git@github.com:wbthomason/packer.nvim.git") -- Have packer manage itself use "git@github.com:nvim-lua/popup.nvim.git" -- An implementation of the Popup API from vim in Neovim
  use("git@github.com:nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("git@github.com:nvim-lua/plenary.nvim.git") -- Useful lua functions used ny lots of plugins
  use("git@github.com:windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("git@github.com:numToStr/Comment.nvim") -- Easily comment stuff
  use("git@github.com:kyazdani42/nvim-web-devicons")
  use("git@github.com:kyazdani42/nvim-tree.lua")
  use("git@github.com:akinsho/bufferline.nvim")
  use("git@github.com:moll/vim-bbye")
  use("git@github.com:nvim-lualine/lualine.nvim")
  use("git@github.com:akinsho/toggleterm.nvim")
  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use("git@github.com:LunarVim/darkplus.nvim.git")

  -- cmp plugins
  use("git@github.com:hrsh7th/nvim-cmp.git") -- The completion plugin
  use("git@github.com:hrsh7th/cmp-buffer.git") -- buffer completions
  use("git@github.com:hrsh7th/cmp-path.git") -- path completions
  use("git@github.com:hrsh7th/cmp-cmdline.git") -- cmdline completions
  use("git@github.com:saadparwaiz1/cmp_luasnip.git") -- snippet completions
  use("git@github.com:hrsh7th/cmp-nvim-lsp.git")
  use("git@github.com:hrsh7th/cmp-nvim-lua.git")

  -- snippets
  use("git@github.com:L3MON4D3/LuaSnip.git") --snippet engine
  use("git@github.com:rafamadriz/friendly-snippets.git") -- a bunch of snippets to use

  -- LSP
  use("git@github.com:neovim/nvim-lspconfig.git") -- enable LSP
  use("git@github.com:williamboman/mason.nvim.git") -- simple to use language server installer
  use("git@github.com:williamboman/mason-lspconfig.nvim.git") -- simple to use language server installer
  use("git@github.com:jose-elias-alvarez/null-ls.nvim.git") -- LSP diagnostics and code actions
  use("git@github.com:tamago324/nlsp-settings.nvim") -- language server settings defined in json for

  -- Telescope
  use("git@github.com:nvim-telescope/telescope.nvim")
  use("git@github.com:nvim-telescope/telescope-media-files.nvim")

  -- Treesitter
  use({
    "git@github.com:nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("git@github.com:p00f/nvim-ts-rainbow")
  use("git@github.com:nvim-treesitter/playground")
  use("git@github.com:JoosepAlviste/nvim-ts-context-commentstring")
  use("git@github.com:JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("git@github.com:lewis6991/gitsigns.nvim")

  -- Text edit plugins
  use("git@github.com:gbprod/substitute.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
