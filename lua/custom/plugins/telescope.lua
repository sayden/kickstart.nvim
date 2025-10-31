return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  -- tag = '0.1.8',
  branch = 'master',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local cwd = vim.fn.getcwd()
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        debug = true,
        file_ignore_patterns = {
          'Godot.SourceGenerators',
          '%.lock',
          '%.work',
          '%.work.sum',
          '.git',
          'node_modules',
          '%.svg',
          'addons',
          '%.tscn',
          'go.sum',
          '%.jpg',
          '%.png',
          '%.uid',
          '%.blend',
          '%.import',
          '%.blend1',
          '%.mesh',
          '%.material',
          '%.gltf',
          '%.glb',
          '%.obj',
          '%.mtl',
          '%.fbx',
          '%.bin',
          '%.mp3',
          '%.wav',
          '%.scn',
          '%.res',
        },
        scroll_strategy = 'limit',
        symbol_width = 120,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },
        preview = {
          hide_on_startup = false,
        },
        layout_config = {
          horizontal = {
            width = { padding = 0 },
            height = { padding = 0 },
          },
        },
        -- Show relative paths instead of absolute paths
        path_display = { 'truncate' },
        mappings = {
          i = {
            -- MARIO: Colemak bindings
            ['<c-e>'] = 'move_selection_next',
            ['<c-u>'] = 'move_selection_previous',

            ['<c-n>'] = 'results_scrolling_down',
            ['<c-i>'] = 'results_scrolling_up',

            ['<c-j>'] = 'preview_scrolling_up',
            ['<c-k>'] = 'preview_scrolling_down',

            ['<c-c>'] = 'close',
            ['<esc>'] = 'close',
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = false, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        -- aerial = {
        --   -- Display symbols as <root>.<parent>.<symbol>
        --   sorting_strategy = 'ascending',
        --   show_nesting = {
        --     ['.'] = true, -- This key will be the default
        --     json = true, -- You can set the option for specific filetypes
        --     yaml = true,
        --   },
        -- },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'mapper')
    -- pcall(require('telescope').load_extension, 'aerial')
    -- pcall(require('telescope').load_extension 'persisted')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })
    -- vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]elect Telescope' })
    -- vim.keymap.set('n', '<leader>sa', ':AerialNavOpen<CR>', { desc = '[A]erial' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '?', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[?] Fuzzily search in current buffer' })

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    vim.keymap.set('n', '<leader>cs', function()
      builtin.lsp_document_symbols {
        symbol_width = 80,
        symbol_type_width = 20,
        symbols = { 'function', 'method', 'struct' }, -- Add or remove symbol types as needed
      }
    end, { desc = '[C]ode [S]ymbols' })

    vim.keymap.set('n', '<leader>sw', function()
      builtin.grep_string {
        cwd = vim.g.cwd,
      }
    end, { desc = 'current [W]ord' })

    vim.keymap.set('n', '<leader>sf', function()
      builtin.find_files { cwd = cwd }
    end, { desc = '[f]iles' })

    vim.keymap.set('n', '<leader>sF', function()
      builtin.find_files { cwd = vim.fn.getcwd() }
    end, { desc = '[F]iles in current folder' })

    vim.keymap.set('n', '<leader>sg', function()
      builtin.live_grep { cwd = cwd }
    end, { desc = 'by [G]rep' })

    vim.keymap.set('n', '<leader>sG', function()
      builtin.live_grep { cwd = vim.fn.getcwd() }
    end, { desc = 'by [G]rep' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = false,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
