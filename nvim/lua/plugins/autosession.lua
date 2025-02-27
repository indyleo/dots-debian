return {
	"rmagatti/auto-session",
	lazy = false,
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_restore = false,
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "~/Documents", "~/Desktop" },
		previewer = true,
	},
}
