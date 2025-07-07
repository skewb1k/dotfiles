function Exec(cmd)
  return function()
    vim.api.nvim_command(cmd)
  end
end

---@param lhs string
---@param rhs string|function
---@param opts? table
function Map_non_i(lhs, rhs, opts)
  local default_modes = { 'n', 'v', 'x', 'o' }
  local modes = default_modes

  if opts and opts.mode then
    if type(opts.mode) == 'string' then
      modes = vim.list_extend(default_modes, { opts.mode })
    elseif type(opts.mode) == 'table' then
      modes = vim.list_extend(default_modes, opts.mode)
    end
    opts.mode = nil
  end

  vim.keymap.set(modes, lhs, rhs, opts)
end

-- vim.filetype.add({
--   extension = {
--     flow = "flow",
--     ft = "flow",
--   },
-- })
--
-- vim.treesitter.language.add('flow', { path = "/home/skewb1k/dev/tree-sitter-flow/flow.so" })

require 'config.options'
require 'config.lazy'
require 'config.autocmds'
require 'config.mappings'
require 'config.registers'
