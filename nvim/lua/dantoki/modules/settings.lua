local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- General Settings {{{
-- ----------------------------------------------------------------------------
-- use filetype.lua instead of filetype.vim. it's enabled by default in neovim 0.8 (nightly)
if vim.version().minor < 8 then
	g.did_load_filetypes = 0
	g.do_filetype_lua = 1
end

-- Global settings
o.laststatus = 3
o.guifont = "JetBrainsMono Nerd Font"
vim.cmd([[let g:neovide_cursor_vfx_mode = "ripple"]])
o.cul = true -- cursor line
o.mouse = "nv" -- Enable mouse
o.backup = false -- Recommended by CoC
o.writebackup = false -- Recommended by CoC
o.softtabstop = 4 -- 4 Spaces per tab
o.tabstop = 4 -- 4 Spaces per tab
o.shiftwidth = 4 -- 4 Spaces per tab
o.smarttab = true -- Makes tabbing smarter. Will use 4 vs 2
o.expandtab = true -- Converts tabs to spaces
o.termguicolors = true -- Enable 16bit colours
o.hidden = true -- Required to keep multiple buffers open
o.showmode = false -- We don't need things like -- INSERT -- anymore
o.splitbelow = true -- Horizontal splits will automatically be below
o.splitright = true -- Vertical splits will automatically be to the right
o.ignorecase = true -- Ignore case when searching
o.smartcase = true -- Ignore case if search pattern is lowercase
o.list = true -- enable displaychars
-- o.syntax = 'on'
vim.cmd([[ syntax enable ]])
-- o.filetype.plugin = 'on'
vim.cmd([[ filetype plugin on ]])
-- o.guicursor = 'n-v-c-sm:ver25-blinkon0,i-ci-ve:ver25,r-cr-o:hor20'
o.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
o.foldlevelstart = 20
o.pumblend = 17
-- o.wildmode = o.wildmode:gsub('[list]', '')
o.wildmode = "longest:full"
-- o.match = true -- Show matching brackets when text indicator is over them
o.clipboard = "unnamedplus"
-- o.paste = true
o.wildoptions = "pum"
o.inccommand = "nosplit" -- Preview substitute
o.cmdheight = 1
-- o.autoread = true -- Autoread on by default
o.lazyredraw = true
o.completeopt = "menu,menuone,noselect,noinsert"
-- o.completeopt = 'menu,noselect,noinsert'
vim.opt.shortmess:append("sI")
-- o.listchars = "trail:·,extends:»,precedes:«,nbsp:░,eol:,tab:» " -- setup list chars
o.conceallevel = 0 -- Show `` in MD
-- o.t_Co = "256" -- Enable true colours, deprecated
o.wildignore = "*.git,.hg.*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**" -- File patterns to ignore expanding
o.grepprg = "rg --hidden --vimgrep --smart-case --"
o.timeoutlen = 400
o.undofile = true
o.signcolumn = "yes"
o.updatetime = 250 -- interval for writing swap to disk
vim.opt.whichwrap:append("<>[]hl")

-- Buffer settings
bo.swapfile = false
bo.smartindent = true
bo.autoindent = true -- Keep indent style
bo.iskeyword = "-"
bo.formatoptions = bo.formatoptions:gsub("[cro]", "")
-- TODO: How to do this via lua?
vim.cmd([[ autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o ]])

-- Window settings
wo.relativenumber = true -- Show line numbers as relative
wo.number = true -- Show line numbers
wo.wrap = false -- Disable line wrap
wo.cursorline = true -- Highlight current line
wo.foldmethod = "marker"

vim.g.python_2_host_prog = "/usr/bin/python"
if vim.g.os == "mac" or vim.loop.os_uname().sysname == "Darwin" then
	vim.g.python3_host_prog = "/usr/local/bin/python3"

	vim.g.clipboard = {
		name = "macOS-clipboard",
		copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
		paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
		cache_enabled = 0,
	}
else
	vim.g.python3_host_prog = "/usr/bin/python3"
end

-- Load autocommands
vim.cmd(
	[[ au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vim alternatively you can run :source $MYVIMRC ]]
)

-- ----------------------------------------------------------------------------
-- }}}

-- set shada path
vim.schedule(function()
	vim.opt.shadafile = vim.fn.stdpath(vim.version().minor > 7 and "state" or "data") .. "/shada/main.shada"
	vim.cmd([[ silent! rsh ]])
end)
