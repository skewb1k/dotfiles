vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
}, { load = true, confirm = false })

local ensure_installed = {
	"bash",
	"diff",
	"comment",
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
	"luadoc",
	"make",
	"ssh_config",
	"go",
	"gosum",
	"gotmpl",
	"gomod",
	"gowork",
	"rust",
	"sql",
	"zig",
	"ziggy",
	"ziggy_schema",
	"kdl",
	"python",
	"html",
	"css",
	"cpp",
	"just",
	"sway",
	"nix",
	"dockerfile",
	"nginx",
}

require("nvim-treesitter").install(ensure_installed)

local filetypes = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()

vim.list_extend(filetypes, { "c", "markdown", "markdown_inline", "vim", "vimdoc", "query", "lua" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})

vim.api.nvim_set_hl(0, "TreesitterContext", { link = "CursorLine" })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { link = "Folded" })
require("treesitter-context").setup({
	enable = true,
	max_lines = 5,
	mode = "topline",
	multiwindow = true,
})
