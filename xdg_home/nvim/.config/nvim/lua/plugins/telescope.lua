return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          '.git/',
          'node_modules/',
          '*.pyc',
          '.venv',
          '__pycache__/',
        },
      },
      pickers = {
        live_grep = {
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
        find_files = {
          find_command = { 'rg', '--files', '--hidden', '--glob', '!.git' },
        },
        colorscheme = {
          enable_preview = true,
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    map_non_i('<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    map_non_i('<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    map_non_i('<leader>f', builtin.find_files, { desc = '[S]earch [F]iles' })
    map_non_i('<leader>*', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    map_non_i('<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    -- Nmap('<leader>st', builtin.tagstack, { desc = '[S]earch [T]ags' })
    map_non_i('<leader>st', exec 'TodoTelescope', { desc = 'Todos' })
    map_non_i('<leader>sm', builtin.man_pages, { desc = '[S]earch [M]an pages' })
    map_non_i('<leader>g', builtin.git_status, { desc = '[G]it [S]tatus' })
    map_non_i('<leader>d', function()
      builtin.diagnostics { sort_by = 'severity' }
    end, { desc = '[S]earch [D]iagnostics' })
    map_non_i('<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    map_non_i('<leader>b', builtin.buffers, { desc = '[ ] Find existing buffers' })
    map_non_i("<leader>'", builtin.resume, { desc = 'Resume last Telescope list' })
    map_non_i('<F10>', builtin.colorscheme)

    map_non_i('<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Shortcut for searching your Neovim configuration files
    map_non_i('<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
