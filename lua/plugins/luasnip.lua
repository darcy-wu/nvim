return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "`",
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/LuaSnip" })
    end,
    keys = function()
      return {
        {
          --"fj",
          "<c-j>",
          function()
            return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
              or "<c-\\><c-n>:call searchpair('[([{<|]', '', '[)\\]}>|]', 'W')<cr>a"
          end,
          expr = true,
          silent = true,
          mode = "i",
        },
        {
          --"fj",
          "<c-j>",
          function()
            require("luasnip").jump(1)
          end,
          mode = "s",
        },
        {
          --"fh",
          "<c-k>",
          function()
            require("luasnip").jump(-1)
          end,
          mode = { "i", "s" },
        },
        {
          "<c-l>",
          "<Plug>luasnip-next-choice",
          mode = { "i", "s" },
        },
        {
          "<c-h>",
          "<Plug>luasnip-prev-choice",
          mode = { "i", "s" },
        },
      }
    end,
  },
}
