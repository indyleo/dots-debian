return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")

		-- Define highlight groups for darker rainbow colors
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		-- Register a hook to set highlight colors according to the desired darker theme
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#BF616A" }) -- Nord Red
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EBCB8B" }) -- Nord Yellow
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#81A1C1" }) -- Nord Blue
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D08770" }) -- Nord Orange
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A3BE8C" }) -- Nord Green
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B48EAD" }) -- Nord Violet
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#88C0D0" }) -- Nord Cyan

			-- Set normal gray for the in-scope line
			vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#808080" }) -- Normal gray
		end)

		-- Setup ibl with the highlight settings
		require("ibl").setup({
			indent = {
				char = "▎",
				highlight = highlight,
			},
			scope = {
				char = "▎",
				highlight = "IndentBlanklineContextChar", -- Use the normal gray highlight here
			},
		})
	end,
}
