return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      check_ts = false,
      enable_moveright = true,
      enable_afterquote = true, -- add bracket pairs after quote
      enable_check_bracket_line = true, --- check bracket in same line
      enable_bracket_in_quote = true, --
      enable_abbr = false, -- trigge
      map_bs = true,
    },

    -- If you want insert `(` after select function or method item
    -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    -- local cmp = require("cmp")
    -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  },
}
