return {
  {
    "mhartington/formatter.nvim",
    -- lazy = false,
    --    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "lua" },
    keys = {
      {
        "gb",
        "<cmd>Format<CR>",
        desc = "Format lines",
        mode = "n",
        noremap = true,
        silent = false,
      },
    },
    opts = {},

    init = function()
      -- Utilities for creating configurations
      local util = require("formatter.util")
      local formatter_prettier = { require("formatter.defaults.prettier") }

      -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
      require("formatter").setup({
        -- Enable or disable logging
        logging = true,
        -- Set the log level
        log_level = vim.log.levels.WARN,
        -- All formatter configurations are opt-in
        filetype = {
          javascript = formatter_prettier,
          javascriptreact = formatter_prettier,
          typescript = formatter_prettier,
          typescriptreact = formatter_prettier,
          ["*.js"] = formatter_prettier,

          -- Formatter configurations for filetype "lua" go here
          -- and will be executed in order
          lua = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.lua").stylua,

            -- You can also define your own configuration
            function()
              -- Supports conditional formatting
              if util.get_current_buffer_file_name() == "special.lua" then
                return nil
              end

              -- Full specification of configurations is down below and in Vim help
              -- files
              return {
                exe = "stylua",
                args = {
                  "--search-parent-directories",
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                  "--",
                  "-",
                },
                stdin = true,
              }
            end,
          },

          markdown = {
            function()
              return {
                exe = "mdformat",
                args = {
                  "-",
                },
                stdin = true,
              }
            end,
          },
          sh = {
            function()
              return {
                exe = "shfmt",
                args = {
                  "-",
                },
                stdin = true,
              }
            end,
          },
          yaml = {
            function()
              return {
                exe = "yamlfmt",
                args = {
                  "-in",
                },
                stdin = true,
              }
            end,
          },
          sql = {
            function()
              return {
                exe = "sqlfluff",
                args = {
                  "format",
                  "--disable-progress-bar",
                  "--nocolor",
                  "--dialect postgres",
                  "-",
                },
                stdin = true,
                ignore_exitcode = false,
              }
            end,
          },

          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
          },
        },
      })
    end,
  },
}
