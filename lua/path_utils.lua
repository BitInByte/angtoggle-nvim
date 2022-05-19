local function retrieve_file_info()
  local file_name = vim.fn.expand("%:t:r")
  local extension = vim.fn.expand("%:e")

  return file_name, extension
end

return {
  retrieve_file_info = retrieve_file_info
}
