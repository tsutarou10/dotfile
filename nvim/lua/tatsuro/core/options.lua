vim.cmd("autocmd!")
local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- title
opt.title = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true

-- line wrapping
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.wildignore:append({ "*/node_modules/*" })
opt.smartcase = true
opt.hlsearch = true
opt.path:append("**") -- Findig files - Search down into subfolders

-- backup
opt.backup = false
opt.backupskip = { "/tmp/*" }

-- command
opt.showcmd = true
opt.cmdheight = 1
opt.inccommand = "split"

-- status
opt.laststatus = 2

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- scroll
opt.scrolloff = 10

-- shell
opt.shell = "zsh"

opt.iskeyword:append("-")
