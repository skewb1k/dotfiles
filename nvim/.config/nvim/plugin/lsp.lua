local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.protocol.make_client_capabilities = function()
	capabilities.textDocument.semanticTokens = nil
	capabilities.workspace.semanticTokens = nil
	return capabilities
end

vim.diagnostic.config({
	severity_sort = true,
	float = { source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	virtual_text = {
		source = "if_many",
		spacing = 2,
	},
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
})
