local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  -- The same equation snippet, using LuaSnip's fmt function.
  -- The snippet is not shorter, but it is more *human-readable*.
  s(
    { trig = "aoc", dscr = "Create advent of code starting point" },
    fmt(
      [[
  function partOne (lines)
    return 'todo'
  end

  function partTwo (lines)
    return 'todo'
  end

  function main()
    lines = {}
    for line in io.lines() do
      <>
      table.insert(lines, line)
    end
    print('partOne', partOne(lines))
    print('partTwo', partTwo(lines))
  end
  main()
  ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
})
