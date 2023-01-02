lvim.leader = "," -- keymappings [view all the defaults by pressing <leader>Lk]

-- overides default mappings
lvim.lsp.buffer_mappings.normal_mode["K"] = nil -- (1)

---- fast recover from insert_mode to normal_mode
vim.keymap.set('i', 'jk', "<esc>")

---- ALT jumps between buffers and tags
vim.keymap.set('n', "<M-n>", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set('n', "<M-p>", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set('n', "<M-l>", "<C-]>")
vim.keymap.set('n', "<M-h>", "<C-t>")
vim.keymap.set('n', "<M-k>", "<cmd>tp<CR>") -- overide ":m .-2<CR>==", but still works under visual mode
vim.keymap.set('n', "<M-j>", "<cmd>tn<CR>") -- overide ":m .+1<CR>==", but still works under visual mode

vim.keymap.set('n', "<S-l>", "g_")
vim.keymap.set('n', "<S-h>", "_")
vim.keymap.set('n', "<S-j>", "<C-d>")
vim.keymap.set('n', "<S-k>", "<C-u>") -- overide "<Cmd>lua vim.lsp.buf.hover()<CR>", which requires (1) (2) to resolve
vim.keymap.set('x', "<S-l>", "g_")
vim.keymap.set('x', "<S-h>", "_")
vim.keymap.set('x', "<S-j>", "<C-d>")
vim.keymap.set('x', "<S-k>", "<C-u>")

vim.keymap.set('n', "<S-up>", "<C-w>+")
vim.keymap.set('n', "<S-down>", "<C-w>-")
vim.keymap.set('n', "<S-right>", "<C-w>>")
vim.keymap.set('n', "<S-left>", "<C-w><")

vim.keymap.set('n', "gt", "<cmd>tabnext<CR>")
vim.keymap.set('n', "gT", "<cmd>tabNext<CR>")
vim.keymap.set('n', "gk", "<Cmd>lua vim.lsp.buf.hover()<CR>") -- (2)

-- ToggleTerm mappings
lvim.builtin.terminal.open_mapping = "<esc><esc>" -- This is required some how to get (3) (4) to work
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]]) -- (3)
vim.keymap.set('t', ',q', [[<C-\><C-n><cmd>q<cr>]]) -- (4)
vim.keymap.set('t', '<C-l>', [[clear<cr>]])
vim.keymap.set('n', "<M-x>", '<cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>')
vim.keymap.set('n', "<M-v>", '<cmd>exe v:count1 . "ToggleTerm direction=vertical size=50"<CR>')
vim.keymap.set('n', "<M-t>", '<cmd>exe v:count1 . "ToggleTerm direction=float"<CR>')
vim.keymap.set('i', "<M-x>", '<esc><cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>')
vim.keymap.set('i', "<M-v>", '<esc><cmd>exe v:count1 . "ToggleTerm direction=vertical size=50"<CR>')
vim.keymap.set('i', "<M-t>", '<esc><cmd>exe v:count1 . "ToggleTerm direction=float"<CR>')

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
	d = { "<cmd>DrawIt<cr>", "Draw-It" },
	s = { "<cmd>Startify<cr>", "Startify" }
}
lvim.builtin.which_key.mappings['w'] = {
	name = "+Vimwiki",
}

-- nvimtree mappings
lvim.builtin.nvimtree.setup.view.mappings.list = {
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
