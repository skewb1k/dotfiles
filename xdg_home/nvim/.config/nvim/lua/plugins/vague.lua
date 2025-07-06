return {
  'vague2k/vague.nvim',
  lazy = false,
  config = function()
    require('vague').setup {
      italic = false,
    }
    vim.cmd.colorscheme 'vague'
    vim.cmd ':hi statusline guibg=NONE'
  end,
}
