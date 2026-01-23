vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_tutor_mode_plugin = 0
vim.g.loaded_2html_plugin = 0

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.g.mapleader = " "

vim.o.guicursor = ""
vim.g.matchparen_disable_cursor_hl = 1

vim.o.number = true
vim.o.relativenumber = true

vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

vim.o.signcolumn = "yes"
vim.opt.fillchars = { eob = " " }

vim.o.exrc = true

vim.o.inccommand = "split"

vim.o.list = true
vim.opt.listchars = { tab = "> ", space = "·" }

vim.pack.add({
	{ src = "https://github.com/skewb1k/vague-quiet.nvim" },
}, { confirm = false })
