vim.lsp.config("*", {
	before_init = function(p)
		p.capabilities.textDocument.semanticTokens = nil
		p.capabilities.workspace.semanticTokens = nil
	end,
})

vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"stylua",
	-- "emmylua_ls",
	"rust_analyzer",
	"biome",
	"ts_ls",
	-- "tsgo",
	"tailwindcss",
	"cssls",
	"zls",
	"golangci_lint_ls",
	"jsonls",
	"bashls",
	"yamlls",
	"clangd",
	"basedpyright",
	"ruff",
	"ty",
	"taplo",
	"tinymist",
	"chroma_ls",
})
