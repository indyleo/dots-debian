return {
	"MeanderingProgrammer/render-markdown.nvim",
	opts = {},
	config = function()
		require("render-markdown").setup({})
	end,
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" }, 
}
