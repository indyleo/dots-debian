-- Glow
local status_ok, glow = pcall(require, "glow")
if not status_ok then
  return
end

glow.setup{
  border = "shadow", 
  style = "dark", 
  pager = true,
  width = 80,
  height = 100,
  width_ratio = 0.7, 
  height_ratio = 0.7,
}
