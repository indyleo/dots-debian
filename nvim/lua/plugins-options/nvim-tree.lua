-- File Explorer nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

tree.setup()
