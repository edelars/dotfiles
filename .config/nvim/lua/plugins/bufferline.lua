return {
  {
    "akinsho/bufferline.nvim",
    version = false,

    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- after = "catppuccin",
    init = function()
      local bufline = require("catppuccin.special.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,

    -- config = function()
    --   require("bufferlinex").setup({
    --     highlights = require("catppuccin.special.bufferline").get_theme(),
    --   })
    -- end,

    keys = {
      {
        "<Tab>",
        ":BufferLineCycleNext<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
      {
        "<S-Tab>",
        ":BufferLineCyclePrev<CR>",
        mode = "n",
        noremap = true,
        silent = true,
      },
    },
    --     vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
    -- vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")

    opts = {

      options = {
        always_show_bufferline = true,
        buffer_close_icon = "",
        mode = "buffers",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = true,
            padding = 1,
          },
        },
        diagnostics = "nvim_lsp",
        indicator = {
          icon = "  ", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        -- separator_style = "slope"
      },
    },
  },
}
