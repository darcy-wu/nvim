local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local function trig4_fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent,   -- parent snippet or parent node
  user_args -- user_args from opts.user_args 
)
   return '[' .. args[1][1] .. user_args .. ']'
end

return {
    s("trig", {
            t{"text", "another line"}
        }, {
            dscr = "trig_dscr"
    }),
    s("trig0", {
            i(1), t"text", i(2), t"text again", i(3)
        }, {
            name = "trig0_name"
    }),
    s("trig1", {
        i(1), t"node01 ", sn(2, {
            t"node02 ", i(1), t"node03 ", i(2)
        })
    }),
    s("trig3", {
        i(1, "First jump"),
        t(" :: "),
        sn(2, {
            i(1, "Second jump"),
            t" : ",
            i(2, "Third jump")
        })
    }),
    s("trig4", {
        i(1), t '<-i(1) ',
        f(trig4_fn,  -- callback (args, parent, user_args) -> string
        {2}, -- node indice(s) whose text is passed to fn, i.e. i(2)
        { user_args = { "user_args_value" }} -- opts
        ),
        t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
    })
--  s(
--    "localreq",
--    fmt('local {} = require("{}")', {
--      l(l._1:match("[^.]*$"):gsub("[^%a]+", "_"), 1),
--      i(1, "module"),
--    })
--  ),
--  s(
--    { trig = "add", snippetType = "autosnippet" },
--    fmta('["<>"] = "<>",', {
--      i(1),
--      i(2),
--    })
--  ),
--  ls.parser.parse_snippet("lm", "local M = {}\n\n$1 \n\nreturn M"),
--  s(
--    { trig = "optsnip", snippetType = "autosnippet" },
--    fmta(
--      [[
--      s(
--        { trig = "<>", snippetType = "autosnippet" },
--        c(1, { sn(nil, { t("\\<>{"), i(1), t("}") }), sn(nil, { t("\\<>["), i(1), t("]{"), i(2), t("}") }) }),
--        { condition = tex.<> }
--      ),
--      ]],
--      { i(1), rep(1), rep(1), c(2, { t("in_quantikz"), t("in_mathzone") }) }
--    ),
--    { condition = line_begin }
--  ),
--  s(
--    { trig = "fmtasnip", snippetType = "autosnippet" },
--    fmta(
--      [[
--      s({ trig = "<>", snippetType = "autosnippet" },
--        fmta("\\<>{<<>>}", {
--        <>
--        }),
--       { condition = tex.<> }),
--      ]],
--      { i(1), rep(1), i(2, "i(0),"), c(3, { t("in_mathzone"), t("in_quantikz") }) }
--    ),
--    { condition = line_begin }
--  ),
--  s(
--    { trig = "tsnip", snippetType = "autosnippet" },
--    fmta(
--      [[
--      s({ trig = "<>", snippetType = "autosnippet" }, {
--        t("<>"),
--      }, { condition = tex.<> }),
--      ]],
--      { i(1), rep(1), c(2, { t("in_mathzone"), t("in_quantikz") }) }
--    ),
--    { condition = line_begin }
--  ),
}
