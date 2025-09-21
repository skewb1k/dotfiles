vim.pack.add({
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/echasnovski/mini.trailspace" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
}, { load = true })

require("nvim-highlight-colors").setup({})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
})

require("mini.trailspace").setup()

local fzf = require("fzf-lua")
fzf.setup()
fzf.register_ui_select()
vim.keymap.set("", "<leader>f", FzfLua.files)
vim.keymap.set("", "<leader>sg", FzfLua.git_status)
