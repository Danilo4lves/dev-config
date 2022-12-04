local status, nvimtree = pcall(require, "nvim-tree")

if not status then
  print("nvim tree could not be set up")
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()
