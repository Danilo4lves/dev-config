local status, gitsigns = pcall(require, "gitsigns")

if not status then
  print("gitsigns plugin could not be loaded")
  return
end

gitsigns.setup()
