local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/iguanacucumber/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=main', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.vague',
  require 'plugins.lsp-config',
  require 'plugins.oil',
  require 'plugins.treesitter',
  require 'plugins.snacks',
  require 'plugins.treesitter-context',
  require 'plugins.mini',
  require 'plugins.diffview',
  require 'plugins.surround',
  require 'plugins.colorizer',
  require 'plugins.todo-comments',
  require 'plugins.kulala',
  require 'plugins.conform',
  require 'plugins.blink',

  -- require 'plugins.neotest',
  -- require 'plugins.leap',
  -- require 'plugins.render-markdown',
  -- {
  --   'f-person/git-blame.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     enabled = true, -- if you want to enable the plugin
  --     message_template = ' <summary> • <date> • <author> • <<sha>>', -- template for the blame message, check the Message template section for more options
  --     date_format = '%m-%d-%Y %H:%M:%S', -- template for the date, check Date format section for more options
  --     virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
  --   },
  -- },
}
