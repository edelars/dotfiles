if true then return {} end

return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
    keys = {
      {
        "<leader><leader>;",
        function()
          require("luasnip").jump(1)
        end,
        desc = "Jump forward a snippet placement",
        mode = "i",
        noremap = true,
        silent = true,
      },
      {
        "<leader><leader>,",
        function()
          require("luasnip").jump(-1)
        end,
        desc = "Jump backward a snippet placement",
        mode = "i",
        noremap = true,
        silent = true,
      },
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.snippets" } })
      require("luasnip.loaders.from_lua").load({ paths = "~/.snippets" })
    end,
  },
}
