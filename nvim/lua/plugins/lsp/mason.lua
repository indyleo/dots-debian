return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- Text
				"jsonls",
				"yamlls",
				"taplo",
				"ltex",

				-- Web
				"html",
				"cssls",
				"eslint",

				-- Langs
				"pyright",
				"lua_ls",
				"powershell_es",
				"bashls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- Text
				"yamllint",
				"jsonlint",
				"markdownlint-cli2",
				"codespell",

				-- Web
				"htmlhint",
				"stylelint",
				"eslint_d",

				-- Langs
				"prettier",
				"stylua",
				"isort",
				"black",
				"pylint",
				"selene",

				-- Script/Shell
				"beautysh",
				"shellcheck",
				"shellharden",
			},
		})
	end,
}
