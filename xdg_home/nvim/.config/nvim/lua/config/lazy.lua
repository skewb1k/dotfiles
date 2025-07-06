local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
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
  -- require 'plugins.conform',
  require 'plugins.blink',

  { 'ngynkvn/gotmpl.nvim', opts = {} },
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
