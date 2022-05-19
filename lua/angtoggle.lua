local function toggle()
  print("About to toggle")
end

local function load_command(args)
  print(args)

  -- creating table to act as a switch
  local func_table = {
    toggle = toggle
  }

  local func = func_table[args]

  if (func) then
    func()
  else
    -- echohl Error
    print("Sorry this plugin only works with versions of neovim that support lua")
    return
  end
end

return {
  load_command = load_command
}
