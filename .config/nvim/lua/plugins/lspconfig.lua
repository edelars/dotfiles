return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    -- example using `opts` for defining servers
    opts = {
      servers = {
        -- lua_ls = {},
      },
    },
    -- vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float)
    --
    keys = {
      {
        "<leader>ld",
        "vim.diagnostic.open_float",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>k",
        function()
          vim.lsp.buf.signature_help()
        end,
        silent = true,
        noremap = true,
        desc = "toggle signature",
        mode = "n",
      },
      {
        "gm",
        function()
          vim.lsp.buf.format()
          -- vim.lsp.buf.formatting()
        end,
        silent = true,
        noremap = true,
        desc = "Format code with lsp",
        mode = "n",
      },
    },

    -- config = function(_, opts)
    --   local lspconfig = require("lspconfig")
    --   for server, config in pairs(opts.servers) do
    --     -- passing config.capabilities to blink.cmp merges with the capabilities in your
    --     -- `opts[server].capabilities, if you've defined it
    --     config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    --     lspconfig[server].setup(config)
    --   end
    -- end,

    -- example calling setup directly for each LSP
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.basedpyright.setup({})
      -- lspconfig.ts_ls.setup({
      --   on_attach = function(client)
      --     client.server_capabilities.documentFormattingProvider = false
      --     client.server_capabilities.documentRangeFormattingProvider = false
      --   end,
      -- })
      lspconfig.prismals.setup({})
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.volar.setup({
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        init_options = {
          vue = {
            -- disable hybrid mode
            hybridMode = false,
          },
        },
      })
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (e.g., 'LuaJIT' for Neovim)
              version = "LuaJIT",
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global for Neovim configuration
              globals = { "vim" },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files for better completion and diagnostics
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false, -- Disable telemetry
            },
          },
        },
        -- You can add more configurations here, like on_attach for keybindings
        -- on_attach = function(client, bufnr)
        --     -- Example: Set up keybindings for LSP actions
        --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to definition' })
        -- end,
      })
      lspconfig.gopls.setup({
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          -- vim.lsp.buf.inlay_hint(bufnr, true)
          -- vim.lsp.inlay_hint(bufnr, true)
          -- require("shared/lsp")(client, bufnr)
          require("illuminate").on_attach(client)
          -- require("lsp_signature").on_attach(signature_setup, bufnr)

          vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            group = vim.api.nvim_create_augroup("FixGoImports", { clear = true }),
            pattern = "*.go",
            callback = function()
              -- ensure imports are sorted and grouped correctly
              -- local params = vim.lsp.util.make_range_params(0, "utf-8")
              -- params.context = { only = { "source.organizeImports" } }
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
              for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                  else
                    vim.lsp.buf.execute_command(r.command)
                  end
                end
              end
            end,
          })

          vim.keymap.set(
            "n",
            "<leader><leader>lv",
            "<Cmd>cex system('revive -exclude vendor/... ./...') | cwindow<CR>",
            {
              noremap = true,
              silent = true,
              buffer = bufnr,
              desc = "lint project code (revive)",
            }
          )
        end,
        settings = {
          -- https://go.googlesource.com/vscode-go/+/HEAD/docs/settings.md#settings-for
          gopls = {
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            experimentalPostfixCompletions = true,
            gofumpt = true,
            -- staticcheck = true,
            --
            -- DISABLED because gopls doesn't invoke the staticcheck binary.
            -- Instead it imports the analyzers directly and this means it can report on issues the binary doesn't.
            -- But rather than that being a good thing, it can be annoying because you can't then use line directives to ignore the issue if it's not important.
            -- So instead I use null-ls to invoke the staticcheck binary.
            -- https://github.com/golang/go/issues/36373#issuecomment-570643870
            --
            -- See also my longer explanation of issues here:
            -- https://github.com/golangci/golangci-lint/issues/741#issuecomment-1488116634
            usePlaceholders = false,
            hints = {
              assignVariableTypes = false,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
        -- DISABLED: as it overlaps with `lvimuser/lsp-inlayhints.nvim`
        init_options = {
          usePlaceholders = true,
        },
      })
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
          },
        },
      })
    end,
  },
}
