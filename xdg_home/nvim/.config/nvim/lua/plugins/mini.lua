return {
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      require('mini.trailspace').setup()
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('trailspace', { clear = true }),
        callback = require('mini.trailspace').trim,
      })

      require('mini.move').setup()

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
  },
}
