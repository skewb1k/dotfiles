return {
  'stevearc/conform.nvim',
  lazy = false,
  -- https://github.com/stevearc/conform.nvim/issues/192#issuecomment-2573170631
  keys = {
    {
      '<leader>tf',
      function()
        -- If autoformat is currently disabled for this buffer,
        -- then enable it, otherwise disable it
        if vim.b.disable_autoformat then
          vim.cmd 'FormatEnable'
        else
          vim.cmd 'FormatDisable!'
        end
      end,
      desc = 'Toggle autoformat for current buffer',
    },
    {
      '<leader>tF',
      function()
        -- If autoformat is currently disabled globally,
        -- then enable it globally, otherwise disable it globally
        if vim.g.disable_autoformat then
          vim.cmd 'FormatEnable'
        else
          vim.cmd 'FormatDisable'
        end
      end,
      desc = 'Toggle autoformat globally',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      local disable_filetypes = { c = false, cpp = false }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- yaml = { 'yamlfmt' },
      json = { 'biome' },
      jsonc = { 'biome' },
      javascript = { 'biome' },
      typescript = { 'biome' },
      markdown = { 'prettier' },
      typescriptreact = { 'biome' },
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- :FormatDisable! disables autoformat for this buffer only
        vim.b.disable_autoformat = true
      else
        -- :FormatDisable disables autoformat globally
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true, -- allows the ! variant
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
  end,
}
