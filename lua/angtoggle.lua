local path_utils = require "utils.path_utils"
local command_utils = require("utils.command_utils")

local file_name, extension = path_utils.retrieve_file_info()

local function toggle()
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
  if path_utils.check_css_file(file_name, "css") == 0 then
    final_extension = "css"
  elseif path_utils.check_css_file(file_name, "scss") == 0 then
    final_extension = "scss"
  elseif path_utils.check_css_file(file_name, "sass") == 0 then
    final_extension = "sass"
  elseif path_utils.check_css_file(file_name, "less") == 0 then
    final_extension = "less"
  end

  command_utils.execute_swap_command(file_name, final_extension)
end

-- creating table to act as a switch
local func_table = {
  toggle = toggle,
  swap_ts = swap_ts,
  swap_css = swap_css,
  swap_html = swap_html
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
