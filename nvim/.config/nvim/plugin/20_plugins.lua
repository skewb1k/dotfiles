vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
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

require("mini.trailspace").setup()

require("treesitter-context").setup({
	enable = true,
	max_lines = 5,
	mode = "topline",
	multiwindow = true,
})

local fzf = require("fzf-lua")
fzf.setup()
fzf.register_ui_select()
vim.keymap.set("", "<leader>f", FzfLua.files)
vim.keymap.set("", "<leader>sg", FzfLua.git_status)
