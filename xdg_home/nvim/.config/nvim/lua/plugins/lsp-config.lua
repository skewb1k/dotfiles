return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} },
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      -- {
      --   'artemave/workspace-diagnostics.nvim',
      -- },
    },
    config = function()
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
      -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references)
      -- vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations)
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover { border = 'rounded', max_height = 25, max_width = 120 }
      end)
      -- vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
      -- vim.keymap.set('n', 'grt', require('telescope.builtin').lsp_type_definitions)
      -- vim.keymap.set('n', '<leader>S', require('telescope.builtin').lsp_document_symbols)
      -- vim.keymap.set('n', 'gW', require('telescope.builtin').lsp_dynamic_workspace_symbols)

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      --   callback = function(event)
      --     local client = vim.lsp.get_client_by_id(event.data.client_id)
      --     if client then
      --       require('workspace-diagnostics').populate_workspace_diagnostics(client, event.buf)
      --     end
      --   end,
      -- })

      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
        },
      }

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              telemetry = {
                enable = false,
              },
              runtime = {
                version = 'LuaJIT',
              },
            },
          },
          single_file_support = true,
        },
        rust_analyzer = {},
        -- golangci_lint_ls = {},
        ts_ls = {},
        basedpyright = {},
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
              completeUnimported = true,
            },
          },
        },
        bashls = {
          filetypes = { 'bash', 'sh', 'zsh' },
        },
        biome = {},
        jsonls = {
          on_attach = function(client, _)
            -- Disable formatting
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
          init_options = {
            provideFormatter = false,
          },
          settings = {
            json = {
              format = {
                enable = false,
              },
              validate = { enable = true },
            },
          },
        },
        yamlls = {
          -- on_attach = function(client, bufnr)
          --   client.server_capabilities.documentFormattingProvider = true
          -- end,
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              validate = true,
            },
          },
        },
        taplo = {},
      }

      for name, config in pairs(servers) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
    end,
  },
}
