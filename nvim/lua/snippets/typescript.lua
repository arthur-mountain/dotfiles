local ls = require("luasnip")
-- local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
-- local t = ls.text_node
-- local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local fmt = extras.fmt
-- local m = extras.m
-- local l = extras.l
local status, postfix = pcall(require("luasnip.extras.postfix").postfix)

if not status then
  return {}
else
  return {
    postfix(".log", {
      f(function(_, parent)
        local matched = parent.snippet.env.POSTFIX_MATCH
        return "console.log('" .. matched .. ":" .. " '" .. ", " .. matched .. ")"
      end, {}),
    }),
  }
end