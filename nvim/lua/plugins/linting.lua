return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- Text
			markdown = { "markdownlint-cli2" },
			json = { "jsonlint" },
			yaml = { "yamllint" },

			-- Web
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			html = { "htmlhint" },
			css = { "stylelint" },

			-- Langs
			python = { "pylint" },
			lua = { "luacheck" },

      -- Script
      bash = { "bash" },
      dash = { "dash" },
      zsh = { "zsh" },
      ShellCheck = { "shellcheck" },

			-- All
			["*"] = { "codespell" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
