return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?

    -- -- NeoTree
    -- vim.keymap.set({ "n" }, "<leader>i", function()
    -- 	if vim.bo.filetype == "neo-tree" then
    -- 		vim.cmd.wincmd("p")
    -- 	else
    -- 		vim.cmd.Neotree("focus")
    -- 	end
    -- end, { desc = "Toggle Explorer Focus" })
    -- -- NeoTree
    -- vim.keymap.set("n", "<leader>o", ":Neotree float toggle<CR>")
    -- vim.keymap.set("n", "<leader>e", ":Neotree left toggle<CR>")
    -- vim.keymap.set("n", "<leader>gm", ":Neotree float git_status<CR>")
    keys = {
      {
        "<F8>",
        ":Neotree float toggle<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>e",
        ":Neotree left toggle<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>gm",
        ":Neotree float git_status<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
    opts = function()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

      require("neo-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      })
    end,
  },
}
