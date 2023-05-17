local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugins-options.lsp.mason"
require("plugins-options.lsp.handlers").setup()
require "plugins-options.lsp.null-ls"