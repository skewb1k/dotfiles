vim.pack.add({
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-mini/mini.trailspace",
	"https://github.com/neovim/nvim-lspconfig",
	-- "https://github.com/skewb1k/colorscheme-preview.nvim",
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

vim.api.nvim_set_hl(0, "MiniTrailspace", { bg = vim.api.nvim_get_hl(0, { name = "Error" }).fg })
require("mini.trailspace").setup()
