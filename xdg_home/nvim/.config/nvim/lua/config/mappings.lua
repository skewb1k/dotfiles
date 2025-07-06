local map = vim.keymap.set

map('n', '<Esc>', exec 'nohlsearch')
map('i', 'jk', '<esc>')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map_non_i('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map_non_i('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map_non_i('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map_non_i('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map_non_i('<leader>y', '"+y', { noremap = true, silent = true })
map_non_i('<leader>p', '"+p', { noremap = true, silent = true })

map_non_i('<leader>w', exec 'wa', { noremap = true, silent = true })

map_non_i('<leader>u', exec 'checktime', { noremap = true, silent = true })

-- nmap('<C-u>', '<C-u>zz', { noremap = true, silent = true })
-- nmap('<C-d>', '<C-d>zz', { noremap = true, silent = true })

map_non_i('<C-s>', 'm`', { noremap = true, desc = 'mark [S]ave point' })

map_non_i('<leader>e', vim.diagnostic.open_float)

map_non_i('<A-z>', exec 'set wrap!', { noremap = true, silent = true })

map_non_i('gn', exec 'bprev', { noremap = true, silent = true })
map_non_i('gp', exec 'bnext', { noremap = true, silent = true })

map_non_i('<F5>', exec 'LspRestart', { noremap = true })

map_non_i('<leader>l', require('lazy').home)
-- Nmap('<leader>m', exec 'Mason')
