return {
  'echasnovski/mini.nvim',
  config = function()
    local trailspace = require 'mini.trailspace'
    trailspace.setup()
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('trailspace', { clear = true }),
      callback = trailspace.trim,
    })

    require('mini.move').setup()

    require('mini.align').setup()

    require('mini.diff').setup {
      view = {
        style = 'sign',
        signs = { add = '+', change = '~', delete = '_' },
        priority = 1,
      },
      mappings = {
        -- Apply hunks inside a visual/operator region
        apply = '',
        -- Reset hunks inside a visual/operator region
        reset = 'gH',
        -- Hunk range textobject to be used inside operator
        -- Works also in Visual mode if mapping differs from apply and reset
        textobject = 'gh',
      },
    }
    vim.keymap.set('n', '<leader>gd', require('mini.diff').toggle_overlay)
  end,
}
