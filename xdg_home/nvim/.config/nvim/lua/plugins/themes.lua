local theme_priority = 1000

local themes = {
  {
    name = 'folke/tokyonight.nvim',
    setup = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          italic = false,
        },
      }
    end,
  },
  { name = 'blazkowolf/gruber-darker.nvim' },
  { name = 'ellisonleao/gruvbox.nvim' },
  {
    name = 'vague2k/vague.nvim',
    setup = function()
      require('vague').setup {
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
      vim.cmd.colorscheme 'vague'
    end,
  },
  {
    name = 'rose-pine/neovim',
    as = 'rose-pine',
    setup = function()
      require('rose-pine').setup {
        styles = {
          italic = false,
        },
      }
    end,
  },
}

return function()
  local plugins = {}

  for _, theme in ipairs(themes) do
    local plugin = {
      theme.name,
      priority = theme_priority,
    }

    if theme.setup then
      plugin.config = theme.setup
    end

    if theme.as then
      plugin.name = theme.as
    end

    table.insert(plugins, plugin)
  end

  return plugins
end
