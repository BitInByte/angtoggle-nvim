local path_utils = require "utils.path_utils"
local command_utils = require("utils.command_utils")

local file_name, extension = path_utils.retrieve_file_info()

local function ang_toggle()
  file_name, extension = path_utils.retrieve_file_info()
  local toggled_extension = "html"

  print(extension)
  if extension == "html" then
    print("html")
    toggled_extension = "ts"
  end

  print(file_name .. " " .. toggled_extension)

  command_utils.execute_swap_command(file_name, toggled_extension)
  -- vim.api.nvim_command(":e %:p:h/" .. file_name .. "." .. toggled_extension)
end

local function swap_ts()
  command_utils.execute_swap_command(file_name, "ts")
end

local function swap_html()
  command_utils.execute_swap_command(file_name, "html")
end

local function swap_css()
  local final_extension = ""
  if path_utils.check_file_exists(file_name, "css") == 0 then
    final_extension = "css"
  elseif path_utils.check_file_exists(file_name, "scss") == 0 then
    final_extension = "scss"
  elseif path_utils.check_file_exists(file_name, "sass") == 0 then
    final_extension = "sass"
  elseif path_utils.check_file_exists(file_name, "less") == 0 then
    final_extension = "less"
  end

  command_utils.execute_swap_command(file_name, final_extension)
end

local function swap_test()
  local final_extension = ""
  if path_utils.check_file_exists(file_name, "test.ts") == 0 then
    final_extension = "test.ts"
  elseif path_utils.check_file_exists(file_name, "spec.ts") == 0 then
    final_extension = "scss.ts"
  elseif path_utils.check_file_exists(file_name, "test.js") == 0 then
    final_extension = "test.js"
  elseif path_utils.check_file_exists(file_name, "spec.js") == 0 then
    final_extension = "spec.js"
  end

  command_utils.execute_swap_command(file_name, final_extension)
end

local function swap_file()
  local final_extension = ""
  if path_utils.check_file_exists(file_name, "ts") == 0 then
    final_extension = "ts"
  elseif path_utils.check_file_exists(file_name, "js") == 0 then
    final_extension = "js"
  end

  command_utils.execute_swap_command(file_name, final_extension)
end

local function test_toggle()
  file_name, extension = path_utils.retrieve_file_info()
  local is_test = false

  for w in file_name.gmatch("([^.]+)") do
    if w == "spec" then
      is_test = true
    elseif w == "test" then
      is_test = true
    end
  end

  if is_test == true then
    swap_test()
  else
    swap_file()
  end
end

-- creating table to act as a switch
local func_table = {
  ang_toggle = ang_toggle,
  swap_ts = swap_ts,
  swap_css = swap_css,
  swap_html = swap_html,
  swap_test = swap_test,
  test_toggle = test_toggle
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
