local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
  s({ trig="aoc", dscr="Create advent of code starting point"}, 
  fmt(
  [[
import sys
import string

def part_one(lines):
    """Solution to part one."""
    return 'todo'


def part_two(lines):
    """Solution to part two."""
    return 'todo'


def main():
    """Parse input file, pass to puzzle solvers."""
    lines = []
    for line in sys.stdin:
        line = line.strip()
        line = list(map(int, line.split(',')))
       	<>
        lines.append(line)

    print('part_one', part_one(lines))

    print('part_two', part_two(lines))


main()
]],
  { i(1) },
  { delimiters = "<>" }
  )
  ),
})

