require("nvim-highlight-colors").setup()

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"query",
		"c",
		"diff",
		"editorconfig",
		"git_config",
		"git_rebase",
		"gitattributes",
		"gitcommit",
		"gitignore",
		"javascript",
		"typescript",
		"tsx",
		"jsdoc",
		"json",
		"jsonc",
		"lua",
		"luadoc",
		"make",
		"markdown",
		"markdown_inline",
		"ssh_config",
		"vim",
		"vimdoc",
	},
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = false,
})

-- vim.keymap.set("", "<leader>gd", Gitsigns.)

require("mini.extra").setup()

local pick = require("mini.pick")
pick.setup({
	source = {
		show = pick.default_show,
	},
})

vim.keymap.set("", "<leader>f", MiniPick.builtin.files)
vim.keymap.set("", "<leader>'", MiniPick.builtin.resume)
vim.keymap.set("", "<leader>sg", MiniExtra.pickers.git_hunks)
vim.ui.select = MiniPick.ui_select

require("mini.trailspace").setup()

require("treesitter-context").setup({
	enable = true,
	max_lines = 5,
	mode = "topline",
	multiwindow = true,
})
