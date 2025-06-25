vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescriptreact', 'json', 'jsonc', 'lua' },
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    -- Disable comment on new line
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
})

local group_cdpwd = vim.api.nvim_create_augroup('group_cdpwd', { clear = true })
vim.api.nvim_create_autocmd('VimEnter', {
  group = group_cdpwd,
  pattern = '*',
  callback = function()
    local argv = vim.v.argv
    if #argv >= 3 then
      local first_arg = argv[3]
      if first_arg ~= '' then
        local stat = vim.uv.fs_stat(first_arg)
        if stat and stat.type == 'directory' then
          vim.fn.chdir(first_arg)
        end
      end
    end
  end,
})
