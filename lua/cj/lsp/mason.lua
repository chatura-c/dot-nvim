local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print("Mason loading failed")
  return
end

mason.setup()
