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

vim.o.winborder = "solid"

vim.o.number = true
vim.o.relativenumber = true

vim.o.breakindent = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.writebackup = false

vim.o.foldenable = false

vim.o.signcolumn = "yes"
vim.opt.fillchars = { eob = " " }

vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.smartindent = true

vim.o.timeout = false

vim.o.exrc = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = "split"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.list = true
vim.opt.listchars = { tab = "> ", space = "·" }

vim.opt.cot = { "noinsert", "menuone", "popup" }

require("pack_build")
vim.pack.add({
	{ src = "https://github.com/skewb1k/vague.nvim", version = "quiet" },
	"https://github.com/nvim-mini/mini.trailspace",
	{
		src = "https://github.com/tree-sitter-grammars/tree-sitter-test",
		data = {
			build = "mkdir parser && tree-sitter build -o parser/test.so",
		},
	},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
}, { confirm = false })

require("mini.trailspace").setup()
