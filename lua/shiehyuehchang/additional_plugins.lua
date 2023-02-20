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
  { 'jghauser/follow-md-links.nvim' },
	{ 'mzlogin/vim-markdown-toc' },
	{ 'junegunn/fzf' },
	{
    'junegunn/fzf.vim',
    config = function()
      vim.g.fzf_layout = { down = '40%' }
    end,
  },
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
  {
    "giusgad/pets.nvim",
    requires = {
      "edluffy/hologram.nvim",
      "MunifTanjim/nui.nvim",
    },
		config = function()
			require("pets").setup()
		end,
  },
	-- {
	-- 	'vimwiki/vimwiki',
	-- 	config = function()
	-- 		vim.cmd [[
	-- 		let g:vimwiki_list = [
	-- 			\ 	{ 'path'               : '$HOME/SYCNotes',
	-- 			\     'index'              : 'README',
  --      \     'ext'                : '.md',
  --      \     'syntax'             : 'markdown',
	-- 			\ 	  'path_html'          : '$HOME/SYCNotes/html_site/',
	-- 			\     'template_path'      : '$HOME/SYCNotes/templates/',
	-- 			\ 	  'template_default'   : 'def_template',
	-- 			\     'template_ext'       : '.html',
  --      \     'links_space_char'   : '_'
  --      \     'custom_wiki2html'   : 'make -C /Users/shiehyuehchang/SYCNotes/'
	-- 			\   },
	-- 			\ ]
	-- 		]]
	-- 		-- add the pre tag for inserting code snippets
	-- 		vim.cmd [[let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr, pre, script']]
	-- 	end,
	-- },
}
