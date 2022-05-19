local function load_command(cmd, ...)
  local args = {...}
  print(args[1])
end

return {
  load_command = load_command
}
