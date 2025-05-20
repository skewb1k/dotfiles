return {
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
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
    name = 'workspace-diagnostics',
  },
  { -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
      'workspace-diagnostics',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            Nmap(keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>r', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>a', vim.lsp.buf.code_action, 'Code [A]ction')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          map('K', function()
            vim.lsp.buf.hover { border = 'rounded', max_height = 25, max_width = 120 }
          end, 'Hover')

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          map('<leader>S', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client then
            require('workspace-diagnostics').populate_workspace_diagnostics(client, event.buf)
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        clangd = {},
        -- sqls = {
        --   on_attach = function(client, bufnr)
        --     client.server_capabilities.documentFormattingProvider = false
        --   end,
        --   settings = {
        --     sqls = {
        --       connections = {
        --         {
        --           driver = 'postgresql',
        --           dataSourceName = 'host=127.0.0.1 port=5432 user=postgres password=postgres dbname=postgres sslmode=disable',
        --         },
        --       },
        --     },
        --   },
        -- },
        gopls = {
          filetypes = { 'go', 'gomod' },
          settings = {
            gopls = {
              gofumpt = true,
              goimports = true,
            },
          },
          -- on_attach = function(client, bufnr)
          --   local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', { clear = true })
          --
          --   vim.api.nvim_create_autocmd('BufWritePre', {
          --     group = format_sync_grp,
          --     pattern = '*.go',
          --     callback = function()
          --       -- Run LSP formatting
          --       vim.lsp.buf.format()
          --
          --       -- Run golangci-lint --fix
          --       -- vim.fn.jobstart({ 'golangci-lint', 'run', '--fix' }, {
          --       --   on_exit = function(_, code, _)
          --       --     if code ~= 0 then
          --       --       vim.notify('golangci-lint --fix failed', vim.log.levels.WARN)
          --       --     end
          --       --   end,
          --       --   stdout_buffered = true,
          --       --   stderr_buffered = true,
          --       -- })
          --     end,
          --   })
          -- end,
        },
        sqruff = {
          cmd = { 'sqruff', 'fix' },
          filetypes = { 'sql' },
        },
        golangci_lint_ls = {
          cmd = { 'golangci-lint-langserver', '-nolintername' },
          -- init_options = { command = { 'golangci-lint', 'run', '--output.json.path', 'stdout', '--show-stats=false', '--issues-exit-code=1' } },
          root_dir = require('lspconfig').util.root_pattern('.golangci.yml', '.golangci.yaml', '.golangci.toml', '.golangci.json', 'go.work', 'go.mod'),
        },
        -- pyright = {},
        cssls = {},
        rust_analyzer = {
          completion = {
            callable = { snippets = 'fill_arguments' },
            fullFunctionSignatures = { enable = true },
          },
          procMacro = { enable = true },
          check = {
            command = 'clippy',
          },
          cargo = {
            features = 'all',
          },
        },
        biome = {},
        ts_ls = {
          init_options = { hostInfo = 'neovim' },
          preferences = {
            includeCompletionsForModuleExports = true,
            includeCompletionsForImportStatements = true,
            importModuleSpecifierPreference = 'relative',
          },
        },
        yamlls = {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
          end,
          capabilities = capabilities,
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              schemaStore = {
                enable = true,
              },
            },
          },
        },
        jsonls = {},
        taplo = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
        automatic_enable = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}

            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
