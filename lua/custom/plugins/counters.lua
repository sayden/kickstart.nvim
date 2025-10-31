-- MARIO: Send buffer contents to an API endpoint (counters) -------------------------------------
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { '~/projects/prototypes', '*.json' },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local content = table.concat(lines, '\n')

    -- Create a temporary file to store the buffer contents
    local tmp_file = vim.fn.tempname()
    local file = io.open(tmp_file, 'w')
    if file then
      file:write(content)
      file:close()
    else
      print 'Failed to create temporary file'
      return
    end

    -- Construct the curl command using the temporary file
    local cmd = string.format("curl -X POST -H 'Content-Type: text/plain' --data-binary @%s localhost:34115/api/code", vim.fn.shellescape(tmp_file))

    -- Execute the curl command
    vim.fn.jobstart(cmd, {
      on_exit = function(_, exit_code)
        -- Remove the temporary file
        os.remove(tmp_file)

        if exit_code == 0 then
          print 'Buffer contents sent successfully'
        else
          print 'Failed to send buffer contents'
        end
      end,
    })
  end,
})

return {}
