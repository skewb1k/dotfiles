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
