local status, dashboard = pcall(require, 'dashboard')

if not status then
  print("dashboard plugin could not be loaded")
  return
end

dashboard.custom_header = {
  '',
  '',
  '  █████╗  ██╗     ██╗   ██╗ ███████╗ ███████╗ ',
  ' ██╔══██╗ ██║     ██║   ██║ ██╔════╝ ██╔════╝ ',
  ' ███████║ ██║     ██║   ██║ █████╗   ███████╗ ',
  ' ██╔══██║ ██║     ╚██╗ ██╔╝ ██╔══╝   ╚════██║ ',
  ' ██║  ██║ ███████╗ ╚████╔╝  ███████╗ ███████║ ',
  ' ╚═╝  ╚═╝ ╚══════╝  ╚═══╝   ╚══════╝ ╚══════╝ ',
  '',
  '',
}
