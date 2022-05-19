local function retrieve_file_info()
  local file_name = vim.fn.expand("%:t:r")
  local extension = vim.fn.expand("%:e")

  return file_name, extension
end

local function check_css_file(file_name, extension)
  return vim.fn.empty(vim.fn.glob("%p:h/" .. file_name .. "." .. extension))
end

return {
  retrieve_file_info = retrieve_file_info,
  check_css_file = check_css_file
}
