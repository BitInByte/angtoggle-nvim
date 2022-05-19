local function execute_swap_command(file_name, extension)
  vim.api.nvim_command(":e %:p:h/" .. file_name .. "." .. extension)
end

return {
  execute_swap_command = execute_swap_command
}
