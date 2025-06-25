return {
  'vague2k/vague.nvim',
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
    vim.cmd.colorscheme 'vague'
  end,
}
