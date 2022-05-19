local function toggle()
  local file_name = vim.fn.expand("%:t:r")
  local extension = vim.fn.expand("%:e")
  print(file_name .. " " .. extension)
end

-- creating table to act as a switch
local func_table = {
  toggle = toggle
}

local function action_handler(option)
  local func = func_table[option]

  if (func) then
    func()
  else
    -- echohl Error
    print("This argument (" .. option .. ") is not a valid argument!")
    return
  end
end

local function load_command(args)
  action_handler(args)
end

return {
  load_command = load_command
}
