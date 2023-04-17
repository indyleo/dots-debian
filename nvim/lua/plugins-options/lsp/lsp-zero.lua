-- Lsp-Zero
local status_ok, lsp = pcall "require, 'lsp-zero'.preset({})"
if not status_ok then
  return
end

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- Servers I Want Installed
-- lsp.setup_server({'sumneko_lua', 'pyright', 'bashls', 'jsonls', 'yamlls', 'marksman'})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
