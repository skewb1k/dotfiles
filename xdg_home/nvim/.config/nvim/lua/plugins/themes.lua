return {
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          italic = false,
        },
      }
    end,
  },
  {
    'vague2k/vague.nvim',
    config = function()
      require('vague').setup {
        style = {
          italic = false,
        },
      }
      vim.cmd.colorscheme 'vague'
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        styles = {
          italic = false,
        },
      }
    end,
  },
}
