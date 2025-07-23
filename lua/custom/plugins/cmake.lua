-- Cmake, for C++ project
return {
  'Civitasv/cmake-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    config = function()
      require('cmake-tools').setup {
        cmake_dap_configuration = { -- debug settings for cmake
          name = 'cpp',
          type = 'gdb',
          request = 'launch',
          stopOnEntry = false,
          runInTerminal = true,
          console = 'integratedTerminal',
        },
      }
    end,
  },
}
