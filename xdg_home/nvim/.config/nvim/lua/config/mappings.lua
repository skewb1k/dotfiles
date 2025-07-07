local map = vim.keymap.set

map('n', '<Esc>', Exec 'nohlsearch')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

Map_non_i('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Map_non_i('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Map_non_i('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Map_non_i('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

Map_non_i('<leader>y', '"+y', { noremap = true, silent = true })
Map_non_i('<leader>p', '"+p', { noremap = true, silent = true })

Map_non_i('<leader>w', Exec 'wa', { noremap = true, silent = true })

Map_non_i('<leader>u', Exec 'checktime', { noremap = true, silent = true })

-- nmap('<C-u>', '<C-u>zz', { noremap = true, silent = true })
-- nmap('<C-d>', '<C-d>zz', { noremap = true, silent = true })

Map_non_i('<C-s>', 'm`', { noremap = true, desc = 'mark [S]ave point' })

Map_non_i('<leader>e', vim.diagnostic.open_float)

Map_non_i('<A-z>', Exec 'set wrap!', { noremap = true, silent = true })

Map_non_i('gn', Exec 'bprev', { noremap = true, silent = true })
Map_non_i('gp', Exec 'bnext', { noremap = true, silent = true })

Map_non_i('<F5>', Exec 'LspRestart', { noremap = true })

Map_non_i('<leader>l', require('lazy').home)
-- Nmap('<leader>m', exec 'Mason')
