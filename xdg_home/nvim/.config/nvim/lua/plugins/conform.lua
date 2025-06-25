return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- yaml = { 'yamlfmt' },
      json = { 'biome' },
      jsonc = { 'biome' },
      javascript = { 'biome' },
      typescript = { 'biome' },
      -- markdown = { 'prettier' },
      typescriptreact = { 'biome' },
    },
  },
}
