if true then return {} end


return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    keys = {
      {
        "<leader>ff",
        builtin.find_files,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>fw",
        builtin.live_grep,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>fb",
        builtin.buffers,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>fw",
        builtin.live_grep,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>fd",
        builtin.diagnostics,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>fh",
        builtin.help_tags,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>gb",
        builtin.git_branches,
        desc = "git branches",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>gc",
        builtin.git_commits,
        desc = "git commits",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>gs",
        builtin.git_status,
        desc = "git status",
        desc = "git commits",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>ls",
        builtin.lsp_document_symbols,
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "gi",
        builtin.lsp_implementations,
        noremap = true,
        silent = true,
        desc = "Find implementations",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "gr",
        builtin.lsp_references,
        noremap = true,
        silent = true,
        desc = "Find references",
        desc = "git commits",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "gd",
        builtin.lsp_definitions,
        noremap = true,
        silent = true,
        desc = "Find definitions",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>gc",
        builtin.git_commits,
        desc = "git commits",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
    -- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    -- vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
    -- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    -- vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
    --
    -- -- vim.keymap.set('n', '<Tab>', builtin.buffers, {})
    -- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    -- vim.keymap.set("n", "<leader>gb", builtin.git_branches, {desc = "git branches" })
    -- vim.keymap.set("n", "<leader>gc", builtin.git_commits, {desc = "git commits" })
    -- vim.keymap.set("n", "<leader>gs", builtin.git_status, {desc = "git status" })
    -- vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
    --
    -- vim.keymap.set("n", "gi", builtin.lsp_implementations, { noremap = true, silent = true, desc = "Find implementations" })
    -- vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true, desc = "Find references" })
    -- vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true, desc = "Find definitions" })
  },
}
