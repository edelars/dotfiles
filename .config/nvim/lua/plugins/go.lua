return {
  {
    "ray-x/go.nvim",
    -- branch = "treesitter-main",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("go").setup({
        verbose = false,
        lsp_semantic_highlights = true, -- use highlights from gopls
      })
    end,
    -- event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    lazy = true,
    keys = {
      {
        "<leader>zt",
        ":GoAddTest<CR>",
        desc = "Add test for function",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>zf",
        ":GoFillStruct<CR>",
        desc = "Fill struct",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>zb",
        ":GoAddTag<CR>",
        desc = "Add tags for struct",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<leader>zn",
        ":GoRmTag<CR>",
        desc = "Remove all tags for struct",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },

    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
