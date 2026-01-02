-- https://github.com/neovim/neovim/pull/35360#issuecomment-3212327279
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("vim.pack-build-system", {}),
	desc = "Execute the plugin's `data.build`",
	callback = function(e)
		if e.data.kind == "delete" then
			return
		end

		local build = (e.data.spec.data or {}).build
		if type(build) == "string" then
			vim.system({ "sh" }, { stdin = "cd " .. e.data.path .. ";" .. build }):wait()
		elseif type(build) == "function" then
			pcall(build, e.data)
		end
	end,
})
