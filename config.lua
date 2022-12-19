-- TODO: (Who can help me please!!)
-- [ ] How to config dap
-- [ ] How to configure Startup screen to have fortune like https://alpha2phi.medium.com/neovim-startup-screen-edd933ec8261
-- [ ] How to Have Startify bookmarks in alpha

-- Options
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 2 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.foldmethod = "manual" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.cursorline = true -- highlight the current line
vim.opt.cursorcolumn = true -- highlight the current column
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 8 -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.tags = "tags"

-- General
lvim.log.level = "warn"
lvim.use_icons = true -- enable icons
lvim.leader = "," -- keymappings [view all the defaults by pressing <leader>Lk]
lvim.colorscheme = "dracula"
lvim.transparent_window = true
lvim.builtin.alpha.mode = "dashboard"

-- Mappings
---- fast recover from insert_mode to normal_mode
lvim.keys.insert_mode["jk"] = "<esc>"
---- ALT jumps between buffers and tags
lvim.keys.normal_mode["<M-n>"] = "<cmd>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<M-p>"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<M-l>"] = "<C-]>"
lvim.keys.normal_mode["<M-h>"] = "<C-t>"
lvim.keys.normal_mode["<M-k>"] = "<cmd>tp<CR>" -- overide ":m .-2<CR>==", but still works under visual mode
lvim.keys.normal_mode["<M-j>"] = "<cmd>tn<CR>" -- overide ":m .+1<CR>==", but still works under visual mode
---- CTRL moves betweens windows
lvim.keys.normal_mode["<S-l>"] = "g_"
lvim.keys.normal_mode["<S-h>"] = "_"
lvim.keys.normal_mode["<S-j>"] = "<C-d>"
lvim.keys.normal_mode["<S-k>"] = "<C-u>" -- overide "<Cmd>lua vim.lsp.buf.hover()<CR>", which requires (1) (2) to resolve
lvim.keys.normal_mode["<S-up>"] = "<C-w>+"
lvim.keys.normal_mode["<S-down>"] = "<C-w>-"
lvim.keys.normal_mode["<S-right>"] = "<C-w>>"
lvim.keys.normal_mode["<S-left>"] = "<C-w><"
------
lvim.lsp.buffer_mappings.normal_mode["K"] = nil -- (1)
lvim.keys.normal_mode["gk"] = "<Cmd>lua vim.lsp.buf.hover()<CR>" -- (2)
---- gt jumps between tabs
lvim.keys.normal_mode["gt"] = "<cmd>tabnext<CR>"
lvim.keys.normal_mode["gT"] = "<cmd>tabNext<CR>"

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings[","] = {
	name = "+Extra",
	t = { "<cmd>Vista!!<cr>", "Vista" },
	r = { "<cmd>Rg<cr>", "fzf-Rg" },
	R = { "<cmd>RnvimrToggle<cr>", "Ranger" },
	o = { "<cmd>SymbolsOutline<cr>", "symbols-outline" },
	d = { "<cmd>DrawIt<cr>", "Draw-It" },
	s = { "<cmd>Startify<cr>", "Startify" }
}
lvim.builtin.which_key.mappings['w'] = {
	name = "+Vimwiki",
}


-- lualine settup
lvim.builtin.lualine.options.theme = "dracula"

-- toggleterm setting
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "/bin/zsh"
lvim.builtin.terminal.open_mapping = "<esc><esc>" -- This is required some how to get (1) (2) to work
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]) -- (1)
vim.keymap.set('t', ',q', [[<C-\><C-n><cmd>q<cr>]]) -- (2)
lvim.keys.normal_mode["<M-x>"] = '<cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>'
lvim.keys.normal_mode["<M-v>"] = '<cmd>exe v:count1 . "ToggleTerm direction=vertical size=50"<CR>'
lvim.keys.normal_mode["<M-t>"] = '<cmd>exe v:count1 . "ToggleTerm direction=float"<CR>'
lvim.keys.insert_mode["<M-x>"] = '<esc><cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>'
lvim.keys.insert_mode["<M-v>"] = '<esc><cmd>exe v:count1 . "ToggleTerm direction=vertical size=50"<CR>'
lvim.keys.insert_mode["<M-t>"] = '<esc><cmd>exe v:count1 . "ToggleTerm direction=float"<CR>'


-- nvimtree setup
lvim.builtin.nvimtree.setup.filters.dotfiles = true
lvim.builtin.nvimtree.setup.view.mappings.list = {
	-- user mappings go here
	{ key = { "l", "<CR>", "<2-LeftMouse>" }, action = "edit" },
	{ key = { "h", "<BS>" }, action = "close_node" },
	{ key = { "H", }, action = "dir_up" },
	{ key = { "L", "<2-RightMouse>" }, action = "cd" },
	{ key = { "K", }, action = "first_sibling" },
	{ key = { "J", }, action = "last_sibling" },
	{ key = "C", action = "collapse_all" },
	{ key = "E", action = "expand_all" },
	---
	{ key = "<C-v>", action = "vsplit" },
	{ key = "<C-x>", action = "split" },
	{ key = "<C-t>", action = "tabnew" },
	{ key = "<C-e>", action = "edit_in_place" },
	{ key = "<C-o>", action = "edit_no_picker" },
	{ key = "<Tab>", action = "preview" },
	---
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "D", action = "trash" },
	{ key = "r", action = "rename" },
	{ key = "gr", action = "full_rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "y", action = "copy_name" },
	{ key = "Y", action = "copy_path" },
	{ key = "gy", action = "copy_absolute_path" },
	{ key = "p", action = "paste" },
	---
	{ key = "g?", action = "toggle_help" },
	{ key = "z", action = "toggle_dotfiles" },
	{ key = "m", action = "toggle_mark" },
	{ key = "i", action = "toggle_file_info" },
	{ key = "I", action = "toggle_git_ignored" },
	{ key = "U", action = "toggle_custom" },
	---
	{ key = ".", action = "run_file_command" },
	{ key = "s", action = "system_open" },
	---
	{ key = "R", action = "refresh" },
	{ key = "S", action = "search_node" },
	{ key = "q", action = "close" },
	---
	{ key = "[p", action = "parent_node" },
	{ key = "[e", action = "prev_diag_item" },
	{ key = "[c", action = "prev_git_item" },
	{ key = "[s", action = "prev_sibling" },
	{ key = "]e", action = "next_diag_item" },
	{ key = "]c", action = "next_git_item" },
	{ key = "]s", action = "next_sibling" },
	{ key = "f", action = "live_filter" },
	{ key = "F", action = "clear_live_filter" },
	{ key = "bmv", action = "bulk_move" },
}

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
	-- for input mode
	i = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
		["<C-n>"] = actions.cycle_history_next,
		["<C-p>"] = actions.cycle_history_prev,
	},
	-- for normal mode
	n = {
		["<C-j>"] = actions.move_selection_next,
		["<C-k>"] = actions.move_selection_previous,
	},
}


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"cpp",
	"rust",
	"python",
	"lua",
	"make",
	"markdown",
	"css",
	"json",
	"yaml",
	"java",
	"javascript",
	"typescript",
	"tsx",
}


-- generic LSP settings

-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
	"sumneko_lua",
	"jsonls",
	"clangd",
	"rust_analyzer",
}
-- change UI setting of `LspInstallInfo`
-- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
-- 	uninstall_server = "d",
-- 	toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

lvim.builtin.dap.active = true



-- set a formatter, this will override the language server formatting capabilities (if it exists)
lvim.format_on_save.enabled = false -- use <leader>lf mapping which maps to <cmd>LvimToggleFormatOnSave<cr>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ command = "black", filetypes = { "python" } },
	-- { command = "clang-format", filetypes = { "c", "cpp" }, extra_args = { "--style", "{IndentWidth: 2}" } },
	-- { command = "rustfmt", filetypes = { "rust" } },
	--  { command = "luaformatter", filetypes = { "lua" } },
	-- 	{ command = "isort", filetypes = { "python" } },
	-- 	{
	-- 		-- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	-- 		command = "prettier",
	-- 		---@usage arguments to pass to the formatter
	-- 		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	-- 		extra_args = { "--print-with", "100" },
	-- 		---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	-- 		filetypes = { "typescript", "typescriptreact" },
	-- 	},
}


-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
	--  { command = "cpplint", filetypes = { "cpp" } },
	--  { command = "rstcheck", filetypes = { "rust" } },
	-- 	{ command = "flake8", filetypes = { "python" } },
	-- 	{
	-- 		-- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
	-- 		command = "shellcheck",
	-- 		---@usage arguments to pass to the formatter
	-- 		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
	-- 		extra_args = { "--severity", "warning" },
	-- 	},
	-- 	-- {
	-- 	-- 	command = "codespell",
	-- 	-- 	---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
	-- 	-- 	filetypes = { "javascript", "python" },
	-- 	-- },
}

-- Additional Plugins
lvim.plugins = {
	{ "Mofiqul/dracula.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"kevinhwang91/rnvimr",
		cmd = "RnvimrToggle",
		config = function()
			vim.g.rnvimr_draw_border = 1
			vim.g.rnvimr_pick_enable = 1
			vim.g.rnvimr_bw_enable = 1
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit"
		},
		ft = { "fugitive" }
	},
	{
		"sindrets/diffview.nvim",
		event = "BufRead",
	},
	{
		'liuchengxu/vista.vim',
		config = function()
			vim.g.vista_echo_cursor = 0
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},
	{ 'mzlogin/vim-markdown-toc' },
	{
		'vimwiki/vimwiki',
		config = function()
			vim.cmd [[
			let g:vimwiki_list = [
				\ 	{ 'path'               : '$HOME/SYCvimwiki',
				\     'index'              : 'README',
				\     'auto_toc'           : 1,
				\ 	  'path_html'          : '$HOME/SYCvimwiki/html_site/',
				\     'template_path'      : '$HOME/SYCvimwiki/templates/',
				\ 	  'template_default'   : 'def_template',
				\     'template_ext'       : '.html',
				\     'nested_syntaxes'    : {'python': 'python', 'c++': 'cpp', 'yaml': 'yaml' },
				\     'auto_tags'          : 1,
				\     'auto_diary_index'   : 1,
				\     'auto_generate_links': 1,
				\     'auto_generate_tags' : 1,
				\   },
				\ ]
			]]

			-- add the pre tag for inserting code snippets
			vim.cmd [[let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script']]
		end,
	},
	{ 'junegunn/fzf' },
	{ 'junegunn/fzf.vim' },
	{ 'vim-scripts/DrawIt' },
	{
		'rcarriga/nvim-notify',
		config = require("notify").setup{
			background_colour = "#000000",
		}
	},
	{
		'tversteeg/registers.nvim',
		config = function()
			require("registers").setup()
		end,
	},
	{
		'chentoast/marks.nvim',
		config = function()
			require'marks'.setup()
		end,
	},
	{
		'mhinz/vim-startify',
		config = function()
			vim.g.startify_session_dir='~/.vim/session'
			vim.g.startify_change_to_dir = 1
			vim.g.startify_session_delete_buffers = 1
			--vim.g.startify_files_number = 20
			vim.cmd [[
			let s:bookmarks1 = [
				\ '~/SYCvimwiki/README.wiki',
				\ ]
			let s:bookmarks2 = [
				\ '~/.zshrc',
				\ '~/.tmux.conf',
				\ '~/.vim/vimrc',
				\ '~/.config/nvim/init.lua',
				\ '~/.config/lvim/config.lua',
				\ '~/.config/kitty/kitty.conf',
				\ '~/.config/ranger/rc.conf',
				\ ]
			let s:bookmarks3 = [
				\ '~/.vim/SYCsnippets/cpp.snippets',
				\ ]
			let s:bookmarks4 = [
				\ '~/.local/share/Trash',
				\ ]
			let g:startify_lists = [
				\ {'header': ['   Wiki'    ], 'type': {-> map(s:bookmarks1, '{"line": v:val, "path": v:val}')}},
				\ {'header': ['   RC Files'], 'type': {-> map(s:bookmarks2, '{"line": v:val, "path": v:val}')}},
				\ {'header': ['   Snippets'], 'type': {-> map(s:bookmarks3, '{"line": v:val, "path": v:val}')}},
				\ {'header': ['   Trash'   ], 'type': {-> map(s:bookmarks4, '{"line": v:val, "path": v:val}')}},
				\ {'header': ['   Sessions'], 'type': 'sessions'},
				\ {'header': ['   Commands'], 'type': 'commands'},
				\ ]
			]]
		end,
	},
}



-- Autocommands (https://neovim.io/doc/user/autocmd.html)
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.json", "*.jsonc" },
	-- enable wrap mode for json files only
	command = "setlocal wrap",
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "zsh",
	callback = function()
		-- let treesitter use bash highlight for zsh files as well
		require("nvim-treesitter.highlight").attach(0, "bash")
	end,
})
vim.api.nvim_create_autocmd("VimEnter", {
	command = 'lua require("notify")("Hello Shieh Yueh-Chang")',
})
vim.api.nvim_create_autocmd("VimEnter", {
	command = 'lua require("notify")("Let\'s code!!")',
})
vim.api.nvim_create_autocmd("BufEnter", {
	command = 'delmarks!',
})

