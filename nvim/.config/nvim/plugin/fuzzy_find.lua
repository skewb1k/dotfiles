--- Implements fuzzy-find for :find command.
function FuzzyFind(arg, _)
	local paths = vim.fn.globpath(".", "**", true, true)

	-- Filter out directories and format the paths.
	-- Iterate backwards to safely remove elements while
	-- modifying the table.
	for i = #paths, 1, -1 do
		local path = paths[i]
		if vim.fn.isdirectory(path) ~= 0 then
			table.remove(paths, i)
		else
			-- Strip leading ./
			-- TODO: test on Windows.
			paths[i] = string.sub(path, 3)
		end
	end

	if arg == "" then
		return paths
	end
	return vim.fn.matchfuzzy(paths, arg)
end

vim.o.grepprg = "rg --vimgrep --hidden --glob='!.git' --color=never"
vim.o.findfunc = "v:lua.FuzzyFind"
