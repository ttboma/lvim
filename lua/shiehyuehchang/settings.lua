-- [How to use true colors in vim under tmux?](https://github.com/tmux/tmux/issues/1246)
vim.cmd [[
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
]]

-- General
lvim.log.level = "warn"
lvim.use_icons = true -- enable icons
lvim.colorscheme = "tokyonight-night"
lvim.transparent_window = false

-- nvimtree
lvim.builtin.nvimtree.setup.filters.dotfiles = true

-- toggleterm setting
lvim.builtin.terminal.active = true
lvim.builtin.terminal.shell = "/bin/zsh"

-- lualine
lvim.builtin.lualine.options.theme = "tokyonight"
lvim.builtin.lualine.sections.lualine_a = {
	{ 'mode', separator = { left = '' }, right_padding = 2 },
}
lvim.builtin.lualine.sections.lualine_z = {
  { 'progress', separator = { right = '' }, left_padding = 2 },
}

-- dashboard
lvim.builtin.alpha.mode = "dashboard"

-- dap
lvim.builtin.dap.active = true

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
  "marksman"
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


-- set a formatter, this will override the language server formatting capabilities (if it exists)
lvim.format_on_save.enabled = false -- use <leader>lf mapping which maps to <cmd>LvimToggleFormatOnSave<cr>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ command = "black", filetypes = { "python" } },
	{ command = "markdownlint", filetypes = { "markdown", "vimwiki" } },
	--  { command = "clang-format", filetypes = { "c", "cpp" }, extra_args = { "--style", "{IndentWidth: 2}" } },
	--  { command = "rustfmt", filetypes = { "rust" } },
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
	{ command = "markdownlint", filetypes = { "markdown", "vimwiki" } },
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
