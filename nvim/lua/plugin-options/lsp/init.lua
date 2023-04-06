local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "plugin-options.lsp.mason"
require("plugin-options.lsp.handlers").setup()
require "plugin-options.lsp.null-ls"
