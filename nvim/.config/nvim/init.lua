vim.g.mapleader = " "

vim.g.matchparen_disable_cursor_hl = 1

require("vim._extui").enable({ enable = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_tutor_mode_plugin = 0
vim.g.loaded_2html_plugin = 0

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.o.winborder = "rounded"

vim.o.number = true
vim.o.relativenumber = true

vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

vim.o.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.smartindent = true

vim.o.timeout = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = "split"

vim.o.scrolloff = 4

vim.o.guicursor = ""
vim.o.confirm = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = "menuone,noinsert,popup,preview"
vim.o.wildmode = "noselect:lastused"

vim.o.path = "**"
vim.o.grepprg = "rg --vimgrep --hidden" -- respect .gitignore
