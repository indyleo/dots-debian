return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		-- Define Dark+ inspired colors for different modes
		local colors = {
			normal = { bg = "#5E81AC", fg = "#D8DEE9" }, -- Nord Blue
			insert = { bg = "#EBCB8B", fg = "#D8DEE9" }, -- Nord Yellow
			visual = { bg = "#B48EAD", fg = "#D8DEE9" }, -- Nord Purple
			replace = { bg = "#BF616A", fg = "#D8DEE9" }, -- Nord Red
			command = { bg = "#A3BE8C", fg = "#D8DEE9" }, -- Nord Green
			inactive = { bg = "#2E3440", fg = "#D8DEE9" }, -- Nord Default inactive
		}

		-- Configure lualine with dynamic mode color changing based on Dark+ colors
		lualine.setup({
			options = {
				theme = {
					normal = {
						a = colors.normal,
						b = { bg = "#2E3440", fg = "#D8DEE9" },
						c = { bg = "#2E3440", fg = "#D8DEE9" },
					},
					insert = {
						a = colors.insert,
						b = { bg = "#2E3440", fg = "#D8DEE9" },
						c = { bg = "#2E3440", fg = "#D8DEE9" },
					},
					visual = {
						a = colors.visual,
						b = { bg = "#2E3440", fg = "#D8DEE9" },
						c = { bg = "#2E3440", fg = "#D8DEE9" },
					},
					replace = {
						a = colors.replace,
						b = { bg = "#2E3440", fg = "#D8DEE9" },
						c = { bg = "#2E3440", fg = "#D8DEE9" },
					},
					command = {
						a = colors.command,
						b = { bg = "#2E3440", fg = "#D8DEE9" },
						c = { bg = "#2E3440", fg = "#D8DEE9" },
					},
					inactive = {
						a = colors.inactive,
						b = { bg = "#2E3440", fg = "#D8DEE9" },
						c = { bg = "#2E3440", fg = "#D8DEE9" },
					},
				},
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#D08770" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_c = {
					{ "filename" },
				},
			},
		})
	end,
}
