vim.api.nvim_create_autocmd("User", {
	pattern = "TSUpdate",
	group = vim.api.nvim_create_augroup("ts-custom-parsers", {}),
	callback = function()
		local parsers = require("nvim-treesitter.parsers")
		---@diagnostic disable-next-line: missing-fields
		parsers.cst = {
			---@diagnostic disable-next-line: missing-fields
			install_info = {
				url = "https://github.com/tree-sitter-grammars/tree-sitter-cst",
				revision = "d58f8a6a4fb60789fab750e86b1976cffc1528e1",
				queries = "queries",
			},
		}
	end,
})

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
	"lua",
	"luadoc",
	"ssh_config",
	"go",
	"gosum",
	"gomod",
	"gowork",
	"gotmpl",
	"rust",
	"sql",
	"zig",
	"vie",
	"python",
	"html",
	"css",
	"cpp",
	"nix",
	"dockerfile",
	"svelte",
	"nginx",
	"cst",
}

require("nvim-treesitter").install(ensure_installed)

local filetypes = vim.iter(ensure_installed):map(vim.treesitter.language.get_filetypes):flatten():totable()

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})
