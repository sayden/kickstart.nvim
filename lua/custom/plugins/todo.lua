-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    keywords = {
      MARIO = { icon = '⏲ ', color = 'test' },
    },
  },
  config = function()
    require('todo-comments').setup()
    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })

    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })

    vim.keymap.set('n', ']T', function()
      require('todo-comments').jump_next { keywords = { 'NOTE' } }
    end, { desc = 'Next error/warning todo comment' })
  end,
}
