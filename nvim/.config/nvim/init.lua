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

vim.o.confirm = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cot = "noinsert,menuone,popup"

vim.o.grepprg = "rg --vimgrep --hidden --glob='!.git' --color=never" -- respect .gitignore

function FindFunc(arg)
	local cmd = vim.o.grepprg .. " --files"
	if #arg ~= 0 then
		cmd = cmd .. "| fzf -f " .. arg
	end
	return vim.fn.systemlist(cmd)
end
vim.o.findfunc = "v:lua.FindFunc"

-- TODO: make it portable.
vim.fn.setreg("t", "ITODO(skewb1k): gccA.i")

vim.pack.add({
	"https://github.com/skewb1k/vague.nvim",
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/nvim-mini/mini.trailspace",
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	-- "https://github.com/skewb1k/colorscheme-preview.nvim",
}, { confirm = false })

vim.cmd.colorscheme("vague")
vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })

require("nvim-highlight-colors").setup({})

vim.api.nvim_set_hl(0, "MiniTrailspace", { bg = vim.api.nvim_get_hl(0, { name = "Error" }).fg })
require("mini.trailspace").setup()
