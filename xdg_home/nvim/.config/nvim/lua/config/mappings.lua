local map = vim.keymap.set

local function exec(cmd)
  return function()
    vim.api.nvim_command(cmd)
  end
end

map('n', '<Esc>', exec 'nohlsearch')
map('t', '<Esc><Esc>', '<C-\\><C-n>')

map('', '<C-h>', '<C-w><C-h>')
map('', '<C-l>', '<C-w><C-l>')
map('', '<C-j>', '<C-w><C-j>')
map('', '<C-k>', '<C-w><C-k>')

map('', '<C-M-h>', exec 'vertical resize -2')
map('', '<C-M-l>', exec 'vertical resize +2')
map('', '<C-M-j>', exec 'resize +2')
map('', '<C-M-k>', exec 'resize -2')

map('', '<leader>y', '"+y')
map('', '<leader>p', '"+p')

map('', '<leader>w', function()
  vim.lsp.buf.format { async = true }
  exec 'w'
end)

map('', '<leader>u', exec 'checktime')

map('', '<C-s>', 'm`')

map('', '<leader>e', vim.diagnostic.open_float)

map('', '<A-z>', exec 'set wrap!')

map('', 'gn', exec 'bprev')
map('', 'gp', exec 'bnext')

map('', '<F5>', exec 'LspRestart')

map('', '<leader>l', require('lazy').home)
