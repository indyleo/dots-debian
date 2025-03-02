---@diagnostic disable: undefined-field
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}
		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", ":AskNewFileName<CR>"),
			dashboard.button("SPC ee", "  > File explorer", ":Oil --float<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", ":Telescope find_files<CR>"),
			dashboard.button("SPC wr", "  > Restore Session", ":SessionRestore<CR>"),
			dashboard.button("SPC wf", "  > Search Sessions", ":SessionSearch<CR>"),
			dashboard.button("ce", "  > Config Nvim", ":OilDir $XDG_CONFIG_HOME/nvim<CR>"),
			dashboard.button("ct", "  > Config Alacritty", ":EditFile ~/.config/alacritty/ alacritty.toml<CR>"),
			dashboard.button("cs", "  > Config Zsh", ":EditFile ~ .zshrc<CR>"),
			dashboard.button("cp", "  > Config OhMyPosh", ":EditFile ~/.config/ohmyposh/ base.toml<CR>"),
			dashboard.button("cf", "  > Config FastFetch", ":EditFile ~/.config/fastfetch/ config.jsonc<CR>"),
			dashboard.button("md", "  > Opens My Markdown Folder", ":OilDir $HOME/Documents/Markdown<CR>"),
			dashboard.button("q", "  > Quit Nvim", ":qa!<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
