-- file: plugin/abbreviate.lua
-- for: misc abbreviations

-- spelling
vim.cmd([[
  iabbrev widht width
  iabbrev lenght length
  iabbrev heigth height
  iabbrev Discipilnes Disciplines
  iabbrev discipilnes disciplines
  iabbrev Discipilne Discipline
  iabbrev discipilne discipline
  iabbrev discipine discipline
  iabbrev discpline discipline
  iabbrev retreive retrieve
  iabbrev Retreive Retrieve
  iabbrev briks bricks
  iabbrev brik brick
]])

-- code snippets
vim.cmd([[ 
  iabbrev edl // eslint-disable-line 
]])

-- command-line mode
vim.cmd([[
  cnoreabbrev cd. cd %:p:h
  cnoreabbrev lcd. lcd %:p:h:h
]])
