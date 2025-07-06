vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'typescriptreact', 'json', 'jsonc', 'lua' },
--   callback = function()
--     vim.bo.shiftwidth = 2
--     vim.bo.tabstop = 2
--     vim.bo.softtabstop = 2
--     vim.bo.expandtab = true
--   end,
-- })

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  desc = 'Disable auto-comment on new line',
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})
