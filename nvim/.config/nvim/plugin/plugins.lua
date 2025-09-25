vim.pack.add({
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-mini/mini.trailspace" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/skewb1k/colorscheme-preview.nvim" },
}, { load = true, confirm = false })

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
