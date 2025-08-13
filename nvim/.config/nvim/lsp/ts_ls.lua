---@type vim.lsp.Config
return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	-- commands = {
	--   ['editor.action.showReferences'] = function(command, ctx)
	--     local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
	--     local file_uri, position, references = unpack(command.arguments)
	--
	--     local quickfix_items = vim.lsp.util.locations_to_items(references, client.offset_encoding)
	--     vim.fn.setqflist({}, ' ', {
	--       title = command.title,
	--       items = quickfix_items,
	--       context = {
	--         command = command,
	--         bufnr = ctx.bufnr,
	--       },
	--     })
	--
	--     vim.lsp.util.show_document({
	--       uri = file_uri,
	--       range = {
	--         start = position,
	--         ['end'] = position,
	--       },
	--     }, client.offset_encoding)
	--
	--     vim.cmd('botright copen')
	--   end,
	-- },
}
