-- Treesitter
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"bash",
		"json",
		"lua",
		"python",
		"yaml",
		"markdown",
		"markdown_inline",
		"vim",
		"regex",
		"html",
		"javascript",
		"tsx",
		"typescript",
		"css",
	},

	ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css" } },
})
