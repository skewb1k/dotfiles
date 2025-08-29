vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/echasnovski/mini.extra" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/echasnovski/mini.trailspace" },
})

require("nvim-highlight-colors").setup({})

local ensure_installed = {
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
	"yaml",
	"toml",
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
	"go",
	"gomod",
	"gowork",
	"rust",
	"sql",
	"zig",
	"python",
	"html",
	"css",
	"cpp",
	"just",
	"nginx",
}

require("nvim-treesitter").install(ensure_installed)

local filetypes = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()
vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
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
