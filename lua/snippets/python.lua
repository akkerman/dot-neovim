local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
  s({ trig="aoc", dscr="Create advent of code starting point"},
  fmt(
  [[
import fileinput
import heapq
import re
from collections import deque, defaultdict, Counter
from functools import lru_cache
from utils import perf_timer

def part_one(lines):
    """Solution to part one."""
    return 'todo'


def part_two(lines):
    """Solution to part two."""
    return 'todo'


def main():
    """Parse input file, pass to puzzle solvers."""
    lines = []
    for line in fileinput.input():
        line = line.strip()
        line = list(map(int, line.split(',')))
       	<>
        lines.append(line)

    print('part_one', part_one(lines))

    print('part_two', part_two(lines))


if __name__ == '__main__':
    main()
]],
  { i(1) },
  { delimiters = "<>" }
  )
  ),
})

