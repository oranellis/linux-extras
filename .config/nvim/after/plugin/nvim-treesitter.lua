require('nvim-treesitter.configs').setup {
	modules = {},
	ensure_installed = { "c", "cpp", "lua", "vim", "rust", "bash" },
	ignore_install = {},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		-- additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
}