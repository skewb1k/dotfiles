vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.loaded_tutor_mode_plugin = 0
vim.g.loaded_2html_plugin = 0

vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.g.mapleader = " "

vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>Y", '"+y$')
vim.keymap.set("", "<leader>d", '"+d')
vim.keymap.set("", "<leader>D", '"+D')

vim.keymap.set("", "<leader>f", ":find ")
vim.keymap.set("", "<leader>g", ":grep ")

vim.keymap.set("", "gd", vim.lsp.buf.definition)
vim.keymap.set("", "grf", vim.lsp.buf.format)

vim.o.guicursor = ""
vim.g.matchparen_disable_cursor_hl = 1

vim.o.winborder = "rounded"

vim.o.number = true
vim.o.relativenumber = true

vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

vim.o.signcolumn = "yes"
vim.opt.fillchars = { eob = " " }

vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.smartindent = true

vim.o.timeout = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = "split"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.list = true
vim.opt.listchars = { tab = "> ", lead = "·" }

vim.opt.cot = { "noinsert", "menuone", "popup" }

vim.pack.add({
	"https://github.com/skewb1k/vague.nvim",
	"https://github.com/vietmpl/vie.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/tree-sitter-grammars/tree-sitter-test",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
}, { confirm = false })

vim.cmd.colorscheme("vague")
