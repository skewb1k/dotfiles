return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    CustomOilBar = function()
      local path = vim.fn.expand '%'
      path = path:gsub('oil://', '')

      return '  ' .. vim.fn.fnamemodify(path, ':.')
    end

    require('oil').setup {
      default_file_explorer = true,
      columns = {
        'icon',
      },
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
        ['<C-k>'] = false,
        ['<C-j>'] = false,
        ['<M-h>'] = 'actions.select_split',
      },
      view_options = {
        show_hidden = true,
        -- is_always_hidden = function(name, _)
        --   local folder_skip = { 'dev-tools.locks', 'dune.lock', '_build' }
        --   return vim.tbl_contains(folder_skip, name)
        -- end,
      },
    }

    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
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
