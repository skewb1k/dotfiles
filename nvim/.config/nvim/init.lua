vim.g.mapleader = " "

vim.g.matchparen_disable_cursor_hl = 1

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
