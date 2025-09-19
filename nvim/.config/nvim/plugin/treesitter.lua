vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
}, { load = true })

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

require("treesitter-context").setup({
	enable = true,
	max_lines = 5,
	mode = "topline",
	multiwindow = true,
})
