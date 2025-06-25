local map = vim.keymap.set

map('n', '<Esc>', exec 'nohlsearch')
map('i', 'jk', '<esc>')
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

Nmap('<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Nmap('<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Nmap('<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Nmap('<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

Nmap('<leader>y', '"+y', { noremap = true, silent = true })
Nmap('<leader>p', '"+p', { noremap = true, silent = true })

Nmap('<leader>w', exec 'wa', { noremap = true, silent = true })

Nmap('<leader>u', exec 'checktime', { noremap = true, silent = true })

-- Nmap('<C-u>', '<C-u>zz', { noremap = true, silent = true })
-- Nmap('<C-d>', '<C-d>zz', { noremap = true, silent = true })

Nmap('<C-s>', 'm`', { noremap = true, desc = 'mark [S]ave point' })

Nmap('<leader>e', vim.diagnostic.open_float)

Nmap('<A-z>', exec 'set wrap!', { noremap = true, silent = true })

Nmap('gn', exec 'bprev', { noremap = true, silent = true })
Nmap('gp', exec 'bnext', { noremap = true, silent = true })

Nmap('<F5>', exec 'LspRestart', { noremap = true })

Nmap('<leader>l', require('lazy').home)
-- Nmap('<leader>m', exec 'Mason')
