local map = vim.keymap.set

local function exec(cmd)
	return function()
		vim.api.nvim_command(cmd)
	end
end

map("t", "<Esc><Esc>", "<C-\\><C-n>")

map("", "<C-M-h>", exec("vertical resize -2"))
map("", "<C-M-l>", exec("vertical resize +2"))
map("", "<C-M-j>", exec("resize +2"))
map("", "<C-M-k>", exec("resize -2"))

map("", "<leader>y", '"+y')
map("", "<leader>Y", '"+y$')
map("", "<leader>d", '"+d')
map("", "<leader>D", '"+D')

map("", "<leader>w", function()
	-- require("mini.trailspace").trim()
	vim.lsp.buf.format()
	vim.cmd("write")
end)

map("", "<leader>u", exec("checktime"))

map("", "<A-z>", exec("set wrap!"))

map("", "gd", vim.lsp.buf.definition)
