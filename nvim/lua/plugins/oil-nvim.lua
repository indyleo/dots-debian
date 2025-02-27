return {
	"stevearc/oil.nvim",
	---@module "oil"
	dependencies = { "nvim-tree/nvim-web-devicons" },
	---@type oil.SetupOpts
	opts = {},
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".git"
				end,
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
					number = false,
					relativenumber = false,
				},
				override = function(conf)
					return conf
				end,
			},
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-s>"] = "actions.select_vsplit",
				["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["cp"] = "actions.parent",
				["cw"] = "actions.open_cwd",
				["cn"] = "actions.cd",
				["q"] = { "actions.close", mode = "n" },
			},
			ssh = {
				border = "rounded",
			},
			keymaps_help = {
				border = "rounded",
			},
		})
	end,
}
