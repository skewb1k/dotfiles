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
      local lspconfig = require 'lspconfig'
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
      vim.keymap.set('n', 'K', function()
        vim.lsp.buf.hover { max_height = 25, max_width = 120 }
      end)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      --   callback = function(event)
      --     local client = vim.lsp.get_client_by_id(event.data.client_id)
      --     if client then
      --       require('workspace-diagnostics').populate_workspace_diagnostics(client, event.buf)
      --     end
      --   end,
      -- })

      -- vim.lsp.inlay_hint.enable()

      vim.diagnostic.config {
        severity_sort = true,
        float = { source = 'if_many' },
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
        golangci_lint_ls = {},
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
