local default_theme = 'vague'

local themes = {
  {
    name = 'folke/tokyonight.nvim',
    as = 'tokyonight',
    opts = {
      styles = {
        italic = false,
      },
    },
  },
  {
    name = 'ellisonleao/gruvbox.nvim',
    as = 'gruvbox',
  },
  {
    name = 'vague2k/vague.nvim',
    as = 'vague',
    lazy = false,
    config = function()
      local theme = require 'vague'
      theme.setup {
        style = {
          boolean = 'bold',
          number = 'none',
          float = 'none',
          error = 'bold',
          comments = 'none',
          conditionals = 'none',
          functions = 'none',
          headings = 'bold',
          operators = 'none',
          strings = 'none',
          variables = 'none',
          keywords = 'none',
          keyword_return = 'none',
          keywords_loop = 'none',
          keywords_label = 'none',
          keywords_exception = 'none',
          builtin_constants = 'bold',
          builtin_functions = 'none',
          builtin_types = 'bold',
          builtin_variables = 'none',
        },
      }
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          if vim.g.colors_name ~= 'vague' then
            return
          end
          local c = theme.get_palette()

          -- Now you can use the colors dynamically
          vim.api.nvim_set_hl(0, 'StatusLine', {
            fg = c.fg,
            bg = c.bg,
          })
        end,
      })
    end,
  },
  {
    name = 'rose-pine/neovim',
    as = 'rose-pine',
    opts = {
      styles = {
        italic = false,
      },
    },
  },
}

return function()
  local plugins = {}

  for _, theme in ipairs(themes) do
    local is_default = theme.as == default_theme

    local plugin = {
      theme.name,
      name = theme.as,
      lazy = not is_default,
      priority = 1000,
      config = function()
        if theme.opts then
          require(theme.as).setup(theme.opts)
        end

        if theme.config then
          theme.config()
        end

        if is_default then
          vim.cmd.colorscheme(default_theme)
        end
      end,
    }

    table.insert(plugins, plugin)
  end

  return plugins
end
