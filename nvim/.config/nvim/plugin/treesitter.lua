vim.cmd.packadd("nvim-treesitter")

local ensure_installed = {
	"c",
	"markdown",
	"markdown_inline",
	"vim",
	"make",
	"vimdoc",
	"query",
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
	"lua",
	"luadoc",
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})
