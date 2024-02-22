local opt = vim.opt

-- Tab/indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true

-- Search 
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
-- opt.colorcolumn = '100'
opt.signcolumn = 'yes'
opt.cmdheight = 1
opt.scrolloff = 10

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backspace = "indent,eol,start"
opt.iskeyword:append("-")
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
