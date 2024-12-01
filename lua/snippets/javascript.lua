local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node

ls.add_snippets("javascript", {
  s({ trig="aoc", dscr="Create advent of code starting point"},
  fmt(
  [[
  const readline = require('readline')
  const rl = readline.createInterface({ input: process.stdin })
  
  const lines = []
  
  rl.on('line', data => {
    const line = data
    /; 
    lines.push(line)
  })
  
  rl.on('close', () => {
    console.log('partOne', partOne(lines))
    console.log('partTwo', partTwo(lines))
  })
  
  function partOne (lines) {
    return 'todo'
  }
  
  function partTwo (lines) {
    return 'todo'
  }
  ]],
  { i(1) },
  { delimiters = "/;" }
  )
  ),
})
