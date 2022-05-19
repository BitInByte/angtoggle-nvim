local path_utils = require "path_utils"

local function toggle()
  local file_name, extension = path_utils.retrieve_file_info()
  local toggled_extension = "html"

  if extension == "html" then
    toggled_extension = "ts"
  end

  print(file_name .. " " .. toggled_extension)

  vim.api.nvim_command(":e %:p:h/" .. file_name .. "." .. toggled_extension)
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
