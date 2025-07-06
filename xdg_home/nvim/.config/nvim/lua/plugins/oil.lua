return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = {},
      delete_to_trash = true,
      watch_for_changes = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-k>'] = false,
        ['<C-j>'] = false,
      },
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set('n', '-', require('oil').open, { desc = 'Open parent directory' })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        local oil = require 'oil'
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
    })
  end,
}
