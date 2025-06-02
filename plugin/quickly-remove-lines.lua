-- Verwijder regels die het woord onder de cursor bevatten
vim.keymap.set("n", "<leader>ld", function()
  local word = vim.fn.expand("<cword>")
  -- \V = very nomagic (exacte stringmatch zonder regex-interpretatie)
  vim.cmd(string.format([[g/\V%s/d]], word))
end, { desc = "Delete lines with word under cursor" })

-- Behoud alleen regels die het woord onder de cursor bevatten
vim.keymap.set("n", "<leader>lk", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd(string.format([[v/\V%s/d]], word))
end, { desc = "Keep only lines with word under cursor" })

-- Helper om tekst uit visuele selectie op te halen
local function get_visual_selection()
  local _, ls_row, ls_col = unpack(vim.fn.getpos("'<"))
  local _, le_row, le_col = unpack(vim.fn.getpos("'>"))
  if ls_row ~= le_row then return nil end -- één regel selecties alleen
  local line = vim.fn.getline(ls_row)
  return string.sub(line, ls_col, le_col)
end

-- Verwijder regels die het woord in visuele selectie bevatten
vim.keymap.set("v", "<leader>ld", function()
  local selection = get_visual_selection()
  if selection then
    vim.cmd("normal! \\<Esc>") -- terug naar normale modus
    vim.cmd(string.format([[g/\V%s/d]], selection))
  else
    print("Selecteer één woord of één regeltekst")
  end
end, { desc = "Delete lines with visual selection" })

-- Behoud alleen regels die het woord in visuele selectie bevatten
vim.keymap.set("v", "<leader>lk", function()
  local selection = get_visual_selection()
  if selection then
    vim.cmd("normal! \\<Esc>")
    vim.cmd(string.format([[v/\V%s/d]], selection))
  else
    print("Selecteer één woord of één regeltekst")
  end
end, { desc = "Keep only lines with visual selection" })

-- Verwijder lege regels
vim.keymap.set("n", "<leader>le", function()
  vim.cmd([[g/^\s*$/d]])
end, { desc = "Delete empty lines" })

-- Condenseer meerdere lege regels (incl. whitespace-only) tot precies één lege regel
vim.keymap.set("n", "<leader>lc", function()
  vim.cmd([[silent! %s/\v(\n\s*){2,}/\r\r/g]])
end, { desc = "Condense empty lines to one" })
