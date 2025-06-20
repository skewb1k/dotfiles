vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.termguicolors = true

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- vim.o.winborder = 'rounded'

-- vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

vim.opt.expandtab = false -- Use real tabs
vim.opt.tabstop = 4 -- Display tabs as 4 spaces wide
vim.opt.shiftwidth = 4 -- Indent with 4 spaces (when using >>, etc.)
vim.opt.softtabstop = 4 -- Tab key acts like 4 spaces, but inserts a tab
vim.opt.autoindent = true -- Keep indent from previous line
vim.opt.smartindent = true -- Enable smart indenting for code

vim.opt.wrap = false

vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.fn.setreg('p', 'viwP')
vim.fn.setreg('t', 'ITODO: gccA')
vim.fn.setreg('f', 'IFIXME: gccA')

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

local map = vim.keymap.set

function exec(cmd)
  return function()
    vim.api.nvim_command(cmd)
  end
end

---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
function Nmap(lhs, rhs, opts)
  local default_modes = { 'n', 'v', 'x', 'o' }
  local modes = default_modes

  if opts and opts.mode then
    if type(opts.mode) == 'string' then
      modes = vim.list_extend(default_modes, { opts.mode })
    elseif type(opts.mode) == 'table' then
      modes = vim.list_extend(default_modes, opts.mode)
    end
    opts.mode = nil
  end

  map(modes, lhs, rhs, opts)
end

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

-- buffers
Nmap('gn', exec 'bprev', { noremap = true, silent = true })
Nmap('gp', exec 'bnext', { noremap = true, silent = true })

Nmap('<F5>', exec 'LspRestart', { noremap = true })

Nmap('<leader>l', exec 'Lazy')
Nmap('<leader>m', exec 'Mason')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
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

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.themes'(),

  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.lsp-config',
  require 'plugins.mini',
  require 'plugins.colorizer',
  require 'plugins.diffview',
  require 'plugins.cord',
  require 'plugins.conform',
  require 'plugins.blink',
  require 'plugins.harpoon',
  require 'plugins.todo-comments',
  require 'plugins.treesitter-context',
  require 'plugins.kulala',
  require 'plugins.oil',
  require 'plugins.surround',
  -- 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- require 'plugins.neotest',
  -- require 'plugins.leap',
  -- require 'plugins.render-markdown',
}
