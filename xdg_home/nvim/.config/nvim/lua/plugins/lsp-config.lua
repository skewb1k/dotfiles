return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'j-hui/fidget.nvim', opts = {} },
      {
        'Jari27/lazydev.nvim', -- https://github.com/folke/lazydev.nvim/issues/114
        branch = 'deprecate_client_notify',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
      -- vim.keymap.set('n', 'K', function()
      --   vim.lsp.buf.hover { max_height = 25, max_width = 120 }
      -- end)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)

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
          cmd = { '/home/skewb1k/dev/lua-language-server/bin/lua-language-server' },
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
          -- single_file_support = true,
        },
        rust_analyzer = {},
        golangci_lint_ls = {
          cmd = { 'golangci-lint-langserver', '-nolintername' },
        },
        ts_ls = {},
        biome = {},
        clangd = {},
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
        config.capabilities = capabilities
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
      -- vim.lsp.log.set_format_func(function(_, ...)
      --   return vim.json.encode(...)
      -- end)
    end,
  },
}
