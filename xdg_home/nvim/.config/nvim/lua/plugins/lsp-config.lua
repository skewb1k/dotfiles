return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'b0o/schemastore.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      {
        'artemave/workspace-diagnostics.nvim',
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          Nmap('<leader>r', vim.lsp.buf.rename)
          Nmap('<leader>a', vim.lsp.buf.code_action)
          Nmap('gr', require('telescope.builtin').lsp_references)
          Nmap('gi', require('telescope.builtin').lsp_implementations)

          Nmap('K', function()
            vim.lsp.buf.hover { border = 'rounded', max_height = 25, max_width = 120 }
          end)

          Nmap('gd', require('telescope.builtin').lsp_definitions)
          Nmap('gD', vim.lsp.buf.declaration)
          Nmap('grt', require('telescope.builtin').lsp_type_definitions)

          Nmap('<leader>S', require('telescope.builtin').lsp_document_symbols)
          Nmap('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols)

          -- local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client then
          --   require('workspace-diagnostics').populate_workspace_diagnostics(client, event.buf)
          -- end
        end,
      })

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
          on_attach = function(client, bufnr)
            -- Disable formatting capability for jsonls
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
              schemas = require('schemastore').json.schemas(),
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
              schemaStore = {
                enable = false,
                url = '',
              },
              schemas = require('schemastore').yaml.schemas(),
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

      vim.lsp.log.set_format_func(vim.json.encode)
    end,
  },
}
