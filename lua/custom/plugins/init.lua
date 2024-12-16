-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local plugins = {
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'VeryLazy',
    opts = function()
      local null_ls = require 'null-ls'
      local_opts = {
        souces = {
          null_ls.builtins.formatting.clang_format,
        },
      }
      return local_opts
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'clangd',
        'clang-format',
      },
    },
  },
}
return plugins
