return {
  {
    'monaqa/dial.nvim',
    config = function()
      local augend = require 'dial.augend'
      local dialMap = require 'dial.map'

      local opts = { noremap = true, silent = true }
      require('dial.config').augends:register_group {
        default = {
          augend.case.new {
            types = { 'camelCase', 'snake_case', 'kebab-case', 'PascalCase', 'SCREAMING_SNAKE_CASE' },
            cyclic = true,
          },
          augend.constant.new {
            elements = { 'and', 'or' },
            word = true,
            cyclic = true,
          },
          augend.constant.new {
            elements = { '&&', '||' },
            word = false,
            cyclic = true,
          },
          augend.constant.new {
            elements = { 'True', 'False' },
            word = true,
            cyclic = true,
          },
          augend.constant.alias.bool,
          augend.constant.alias.de_weekday,
          augend.constant.alias.de_weekday_full,
          augend.date.alias['%Y/%m/%d'],
          augend.date.alias['%Y-%m-%d'],
          augend.hexcolor.new { case = 'lower' },
          augend.integer.alias.decimal_int,
          augend.semver.alias.semver,
        },
      }
      vim.keymap.set('n', '<C-a>', dialMap.inc_normal(), opts)
      vim.keymap.set('n', '<C-x>', dialMap.dec_normal(), opts)
      vim.keymap.set('v', '<C-a>', dialMap.inc_visual(), opts)
      vim.keymap.set('v', '<C-x>', dialMap.dec_visual(), opts)
      vim.keymap.set('v', 'g<C-a>', dialMap.inc_gvisual(), opts)
      vim.keymap.set('v', 'g<C-x>', dialMap.dec_gvisual(), opts)
    end,
  },
}
