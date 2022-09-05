local o = vim.opt
o.clipboard = "unnamedplus"
o.syntax = "on"
o.relativenumber = true
o.nu = true
o.hlsearch = false
o.hidden = true
o.errorbells = false
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.autoindent = true
o.wrap = false
o.swapfile = false
o.backup = false
o.undofile = true
o.incsearch = true
o.scrolloff = 8
o.colorcolumn = "80"
o.signcolumn = "yes"
o.mouse = "a"
o.autoread = true
o.background = "dark"
o.completeopt = "menu,menuone,noselect"
o.pumblend = 30
o.pumheight = 8
o.splitbelow = true
o.splitright = true
o.undodir = vim.fn.stdpath("config") .. "/undo"
vim.cmd [[colorscheme gruvbox]]
