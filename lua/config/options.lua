local opt = vim.opt

-- Options

opt.colorcolumn = '80,120'
opt.cursorline = true
opt.ignorecase = true
opt.ignorecase = true
opt.mouse = 'n' -- only in normal mode
opt.number = true
opt.relativenumber = false
opt.scrolloff = 3
opt.scrolloff = 3
opt.smartcase = true
opt.smartcase = true
opt.swapfile = false
opt.undofile = true
opt.virtualedit = 'block'  -- In visual block mode, allow cursor to move where there is no text
opt.wrap = false

-- line wrapping behavior

vim.opt.linebreak = true -- Enable linebreak for wrapping at word boundaries
vim.opt.showbreak = "↳ " -- Symbol to display before wrapped lines
vim.opt.breakindent = true -- Every wrapped line will continue visually indented
vim.opt.breakindentopt = "shift:2" -- Wrapped line will be indented by 2 spaces

-- Global scope variable

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3 -- Tree style

-- neovide
if vim.g.neovide then
  opt.guifont = { "Source Code Pro", ":h8" }
  vim.g.neovide_cursor_animation_length = 0
end
