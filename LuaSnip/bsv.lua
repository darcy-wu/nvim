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

return {
    s({trig = "package", snippetType = "autosnippet" }, fmt([[
        package {};

        endpackage : {}
        ]],{
            i(1, "<Package>"),
            d(2, function(args)
                return sn(nil, { i(1, args[1])})
            end, {1})
        }
    )),
    s({trig = "import", snippetType = "autosnippet" }, fmt([[import {}:: *;]], {
            i(1, "<lib>"),
        }
    )),
    s({trig = "synth", snippetType = "autosnippet" }, {
        t"(* synthesize *)"
    }),
    s({trig = "module", snippetType = "autosnippet" }, fmt([[
        module {} ({});

        endmodule : {}
        ]], {
            i(1, "<Module>"),
            i(2, "<Interface>"),
            d(3, function(args)
                return sn(nil, { i(1, args[1])})
            end, {1})
        }
    )),
}
