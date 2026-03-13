return {
  {
    "ibhagwan/fzf-lua",
    -- TODO optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    dependencies = { "nvim-mini/mini.icons" },
    opts = {},
    keys = {
      {
        "gi",
        "<cmd>FzfLua lsp_implementations<CR>",
        desc = "Goto lsp_implementations",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "gr",
        "<cmd>FzfLua lsp_references<CR>",
        noremap = true,
        silent = true,
        desc = "Goto lsp_references",
        mode = "n",
      },
      {
        "gd",
        "<cmd>FzfLua lsp_definitions<CR>",
        noremap = true,
        silent = true,
        desc = "Goro lsp_definitions",
        mode = "n",
      },
      {
        "gp",
        "<cmd>FzfLua diagnostics_workspace<CR>",
        noremap = true,
        silent = true,
        desc = "Goro diagnostics_workspace",
        mode = "n",
      },

      {
        "<leader>fw",
        "<cmd>FzfLua live_grep<CR>",
        desc = "Find in files",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
  },
}
