local function retrieve_file_info()
  local file_name = vim.fn.expand("%:t:r")
  local extension = vim.fn.expand("%:e")

  return file_name, extension
end

local function check_file_exists(file_name, extension)
  local is_selected_css = vim.fn.empty(vim.fn.glob("%:p:h/" .. file_name .. "." .. extension))
  -- print(extension .. " " .. is_selected_css)
  return is_selected_css
end

return {
  retrieve_file_info = retrieve_file_info,
  check_file_exists = check_file_exists
}
