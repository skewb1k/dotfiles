local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.protocol.make_client_capabilities = function()
	capabilities.textDocument.semanticTokens = nil
	capabilities.workspace.semanticTokens = nil
	vim.lsp.semantic_tokens.enable(false)
	return capabilities
end

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
-- 		client.server_capabilities.semanticTokensProvider = nil
-- 	end,
-- })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function()
-- 		vim.lsp.semantic_tokens.enable(false)
-- 	end,
-- })

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
