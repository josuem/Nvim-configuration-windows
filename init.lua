require 'config.global'
require 'config.lazy'
require 'config.autocommands'
require 'config.keymap'

--- init.lua:
{
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
}
