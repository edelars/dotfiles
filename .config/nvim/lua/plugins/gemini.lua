if true then
  return {}
end

return {
  {
    "mrf/gemini-code-assist.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("gemini").setup({
        auth = {
          -- api_key = nil, -- Uses GEMINI_API_KEY env var if not set
        },

        model = {
          completion = "gemini-3.1-flash-lite-preview",
          chat = "gemini-2.0-flash",
          actions = "gemini-2.0-flash",
        },

        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce_ms = 150,
          max_tokens = 256,
          hide_during_completion = true,
          filetypes = {
            ["*"] = true,
            gitcommit = false,
            gitrebase = false,
          },
        },

        chat = {
          enabled = false,
          window_type = "floating", -- "floating" | "vsplit" | "split" | "tab"
          width = 0.6,
          height = 0.8,
          persist_history = true,
          auto_context = true,
        },

        actions = {
          enabled = true,
          preview_diff = true,
          auto_apply = false,
        },

        keymaps = {
          accept = "<Tab>",
          accept_word = "<C-Right>",
          accept_line = "<C-Down>",
          dismiss = "<C-]>",
          next = "<M-]>",
          prev = "<M-[>",
          toggle_chat = "<leader>gz",
          generate = "<leader>gg",
          fix = "<leader>gF",
          test = "<leader>gT",
        },

        ui = {
          suggestion_hl = "Comment",
          icons = {
            suggestion = "",
            loading = "",
            error = "",
          },
        },

        log = {
          level = "debug", -- "debug" | "info" | "warn" | "error"
          -- file = nil,
          file = "/tmp/gemini.log",
        },
      })
    end,
  },
}
