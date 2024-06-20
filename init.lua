--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Integrate system's clipboard
vim.opt.clipboard = 'unnamedplus'

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Configure tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Disable timeout
vim.opt.ttimeoutlen = 0

-- Folding
vim.opt.foldmethod = 'manual'
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Color column
vim.opt.colorcolumn = '100'
vim.opt.updatetime = 100

-- QOL
vim.keymap.set('', ';', ':', { noremap = true })
vim.keymap.set('', '?', '/', { noremap = true })

-- undo operation
vim.keymap.set('n', 'l', 'u', { noremap = true })

-- insert key
vim.keymap.set('', 'k', 'i', { noremap = true })
vim.keymap.set('', 'K', 'I', { noremap = true })

-- copy to system clipboard
vim.keymap.set('v', 'Y', '"+y', { noremap = true })

-- jump lines
vim.keymap.set({ 'n', 'v' }, 'U', '5k', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'E', '5j', { silent = true })

-- Cursor movement
vim.keymap.set({ 'n', 'v' }, 'n', 'h', { silent = true, noremap = false })
vim.keymap.set({ 'n', 'v' }, 'u', 'k', { silent = true, noremap = false })
vim.keymap.set({ 'n', 'v' }, 'e', 'j', { silent = true, noremap = false })
vim.keymap.set({ 'n', 'v' }, 'i', 'l', { silent = true, noremap = false })

-- search forward / backwards
vim.keymap.set('n', '=', 'n', { silent = true })
vim.keymap.set('n', '-', 'N', { silent = true })

-- go to start of the lines
vim.keymap.set('', 'N', '0', { silent = true })
-- go to end of the lines
vim.keymap.set('', 'I', '$', { silent = true })
vim.keymap.set('i', '<C-a>', '<ESC>A', { silent = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- set h (same as n, cursor left) to 'end of word'
vim.keymap.set('', 'h', 'e', { silent = true })

-- move viewport
vim.keymap.set('n', '<C-u>', '10<C-y>', { silent = true })
vim.keymap.set('n', '<C-e>', '10<C-e>', { silent = true })

-- Custom cursor movement
vim.cmd 'source $HOME/.config/nvim/cursor.vim'

-- Insert mode Cursor movement
-- tnoremap <Esc> <C-\><C-n>
-- inoremap <C-a> <ESC>A

-- exec "nohlsearch"
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true })

-- Open the vimrc file anytime
vim.keymap.set('n', '<leader>rc', ':e $HOME/.config/nvim/init.lua<CR>', { noremap = true })
vim.keymap.set('n', '<leader>no', ':e $HOME/.config/nvim/notes.md<CR>', { noremap = true })
vim.keymap.set('n', '<leader>km', ':e $HOME/.config/nvim/keymap.vim<CR>', { noremap = true })

-- Avoid overriding content when pasting in visual mode
vim.keymap.set('x', 'p', 'P', { noremap = true })
-- xnoremap p P

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- ==================== Window management ===================================
-- Resize with arrows
vim.keymap.set('n', '<leader>w', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>u', '<C-w>k', { desc = 'Go to window up' })
vim.keymap.set('n', '<leader>e', '<C-w>j', { desc = 'Go to window down' })
vim.keymap.set('n', '<leader>i', '<C-w>l', { desc = 'Go to window right' })
vim.keymap.set('n', '<leader>n', '<C-w>h', { desc = 'Go to window left' })

-- Resize with arrows
vim.keymap.set('n', '<up>', ':res +5<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<down>', ':res -5<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<left>', ':vertical resize -5<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<right>', ':vertical resize +5<CR>', { desc = 'Increase window width' })

-- Diagnostic keymaps TODO review and uncomment
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ========================= Colemak keybindings =======================
-- ---------------------------- basic mappings --------------------------
vim.keymap.set('n', 'Q', ':q<CR>', { noremap = true })
vim.keymap.set('n', 'S', ':w<CR>', { noremap = true })
--
-- -- undo
-- vim.keymap.set('n', 'l', 'u', { noremap = true })
-- -- insert key
-- vim.keymap.set('n', 'k', 'i', { noremap = true })
-- vim.keymap.set('n', 'K', 'I', { noremap = true })
-- -- copy to system clipboard
-- vim.keymap.set('v', 'Y', '+y', { noremap = true })
--
-- ------------------------------- Tab management ------------------------
vim.keymap.set('n', 'Tu', ':tabe<CR>', { noremap = true })
vim.keymap.set('n', 'TU', ':tab split<CR>', { noremap = true })

vim.keymap.set('', 'Tn', ':-tabnext<CR>', { noremap = true })
vim.keymap.set('', 'Ti', ':+tabnext<CR>', { noremap = true })
vim.keymap.set('t', 'Tn', ':-tabnext<CR>', { noremap = true })
vim.keymap.set('t', 'Ti', ':+tabnext<CR>', { noremap = true })

--
-- -- ---------------------------- cursor movement -------------------------
vim.keymap.set({ 'n', 'v' }, 'n', 'h', { silent = true, remap = false })
vim.keymap.set({ 'n', 'v' }, 'u', 'k', { silent = true, remap = false })
vim.keymap.set({ 'n', 'v' }, 'e', 'j', { silent = true, remap = false })
vim.keymap.set({ 'n', 'v' }, 'i', 'l', { silent = true, remap = false })
--
-- -- search forward / backwards
-- vim.keymap.set('n', '=', 'n', { silent = true })
-- vim.keymap.set('n', '-', 'N', { silent = true })
--
-- -- jump lines
-- vim.keymap.set('n', 'U', '5k', { silent = true })
-- vim.keymap.set('n', 'E', '5j', { silent = true })
--
-- -- go to start of the line
-- vim.keymap.set('n', 'N', '0', { silent = true })
-- -- go to end of the line
-- vim.keymap.set('n', 'I', '$', { silent = true })
--
-- -- faster in-line navigation
-- vim.keymap.set('n', 'W', '5w', { silent = false })
-- vim.keymap.set('n', 'B', '5b', { silent = false })
--
-- -- set h (same as n, cursor left) to 'end of word'
-- vim.keymap.set('', 'h', 'e', { silent = false })
--
-- -- move viewport
-- vim.keymap.set('n', '<C-u>', '10<C-y>', { silent = false })
-- vim.keymap.set('n', '<C-e>', '10<C-e>', { silent = false })

------------------------------------------------------------------------
vim.cmd 'source $HOME/.config/nvim/keymap.vim'
-- =====================================================================

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- MARIO:
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- MARIO: Help to close pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  -- MARIO: Detect indentation
  'tpope/vim-sleuth',

  -- MARIO: Word wrap
  {
    'andrewferrier/wrapping.nvim',
    lazy = false,
    config = function()
      require('wrapping').setup {}
    end,
  },

  -- MARIO: To manipulate files with sudo
  'lambdalisue/suda.vim',

  -- MARIO: zig
  'ziglang/zig.vim',
  'NTBBloodbath/zig-tools.nvim',

  -- MARIO: Terminal
  { 'akinsho/toggleterm.nvim', version = '*', config = true },

  -- MARIO: Hex editor
  {
    'RaafatTurki/hex.nvim',
    config = function()
      require('hex').setup()
      vim.keymap.set('n', '<leader>x', ':HexToggle<CR>', { silent = true, desc = 'Toggle Hex editor' }) -- Aerial
    end,
  },

  -- MARIO: activate capslock
  'tpope/vim-capslock',

  -- MARIO: switch between single line statement and multi line with gS and gJ
  'AndrewRadev/splitjoin.vim',

  -- MARIO: show vertical lines at indentation levels
  'Yggdroot/indentLine',

  -- MARIO:
  -- 'ErichDonGubler/lsp_lines.nvim',

  -- MARIO: Cmake, for C++ project
  {
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
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    event = 'VeryLazy',
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      dapui.setup()
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
  'rhysd/vim-clang-format',
  {
    'nvimtools/none-ls.nvim',
    event = 'VeryLazy',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.clang_format,
        },
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds {
              group = augroup,
              buffer = bufnr,
            }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end,
      }
      vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {})
    end,
  },
  'mfussenegger/nvim-dap',
  { 'leoluz/nvim-dap-go', opts = {
    event = 'VeryLazy',
    config = function()
      require('dap-go').setup()
    end,
  } },

  -- MARIO: helps with pairing quotes, brackets, etc
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        keymaps = {}, -- Defines plugin keymaps
        surrounds = {}, -- Defines surround keys and behavior
        aliases = {}, -- Defines aliases
      }
    end,
  },

  -- MARIO: something to achieve something like AceJump
  {
    'smoka7/hop.nvim',
    version = '*',
    opts = {
      -- keys = 'etovxqpdygfblzhckisuran',
      keys = 'tnseriaodhplufmvckywxbzqjg',
    },
  },

  -- MARIO: multiple cursors
  'mg979/vim-visual-multi',

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      on_attach = function(bufnr)
        -- custom mappings
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end

        -- default mappings DO NOT add default mappings or they'll override the ones from colemak
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', 'j', api.tree.change_root_to_parent, opts 'Up')
        vim.keymap.set('n', 'k', api.tree.change_root_to_node, opts 'CD')
        vim.keymap.set('n', '-', 'N', opts 'Nothing')
        vim.keymap.set('n', 'i', api.node.open.edit, opts 'Open')
        vim.keymap.set('n', 'n', api.node.open.edit, opts 'Close')
        vim.keymap.del('n', '<C-e>', opts 'Open in place')
        vim.keymap.set('n', 'u', 'k', opts 'Move up')
        vim.keymap.set('n', 'U', '10k', opts 'Move up 15')
        vim.keymap.set('n', 'e', 'j', opts 'Move down')
        vim.keymap.set('n', 'E', '10j', opts 'Move down 15')
        vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
      end,
    },
  },
  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = '[H]Search', _ = 'which_key_ignore' },
      }
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

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
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--trim',
          },
          layout_config = {
            height = 0.95,
            width = 0.95,
          },
          -- Show relative paths instead of absolute paths
          path_display = { 'smart' },
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
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          ['aerial'] = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
              ['_'] = false, -- This key will be the default
              json = true, -- You can set the option for specific filetypes
              yaml = true,
            },
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'mapper')
      pcall(require('telescope').load_extension, 'aerial')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]elect Telescope' })
      vim.keymap.set('n', '<leader>sa', ':AerialNavOpen<CR>', { desc = '[A]erial' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      {
        'williamboman/mason.nvim',
        config = true,
        opts = {
          ensure_installed = {
            'clangd',
            'clang_format',
            'codelldb',
          },
        },
      }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      {
        'jay-babu/mason-nvim-dap.nvim',
        event = 'VeryLazy',
        dependencies = {
          'williamboman/mason.nvim',
          'mfussenegger/nvim-dap',
        },
        opts = {
          ensure_installed = {
            'codelldb',
          },
        },
      },

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a -suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })
          end

          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event.buf }
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        clangd = {},
        gopls = {},
        -- pyright = {},
        rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-e>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-u>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-n>'] = cmp.mapping.scroll_docs(-4),
          ['<C-i>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<CR>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- MARIO: Aerial - Code outline
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        -- Jump forward and backward
        keymaps = {
          jump = { '<C-j>', '<C-e>' },
          jump_back = { '<C-k>', '<C-u>' },
        },
        backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },
        min_width = 20,
        filter_kind = {
          'Class',
          'Constructor',
          'Enum',
          'Function',
          'Interface',
          'Module',
          'Method',
          'Struct',
        },
        -- Jump to symbol in source window when the cursor moves
        autojump = true,
        -- Show box drawing characters for the tree hierarchy
        show_guides = true,
      }
      vim.keymap.set('n', '<leader>aa', ':AerialToggle<CR>', { silent = true, desc = 'Toggle Aerial' }) -- Aerial
    end,
  },

  -- MARIO: copilot
  'github/copilot.vim',

  -- MARIO: stuff seen in theniceboy for colemak users
  'itchyny/vim-cursorword', -- Highlight word under cursor

  -- MARIO: Golang Debugger
  'sebdah/vim-delve',
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      -- 'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'leoluz/nvim-dap-go',
    dependencies = { 'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio' },
    config = function()
      require('dap-go').setup()
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
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
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup {
      --   add = 'sa',
      -- }

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'vim',
        'vimdoc',
        'go',
        'rust',
        'zig',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        -- additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
--
-- MARIO: Plugins that require initialization after setup
-- vim.g.loaded_netrw = 1 -- Disable netrw
-- vim.g.loaded_netrwPlugin = 1 -- Disable netrw
-- -- optionally enable 24-bit colour
-- vim.opt.termguicolors = true
--
-- local function on_attach_nvim_tree(bufnr)
--   -- custom mappings
--   local api = require 'nvim-tree.api'
--
--   local function opts(desc)
--     return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end
--
--   -- default mappings DO NOT add default mappings or they'll override the ones from colemak
--   api.config.mappings.default_on_attach(bufnr)
--
--   -- custom mappings
--   vim.keymap.set('n', 'l', api.tree.change_root_to_parent, opts 'Up')
--   vim.keymap.set('n', 'k', api.tree.change_root_to_node, opts 'CD')
--   vim.keymap.set('n', '-', 'N', opts 'Nothing')
--   vim.keymap.set('n', '<C-y>', api.node.open.replace_tree_buffer, opts 'Open in place')
--   vim.keymap.set('n', 'i', api.node.open.edit, opts 'Open')
--   vim.keymap.set('n', 'n', api.node.open.edit, opts 'Close')
--   vim.keymap.set('n', 'u', 'k', opts 'Move up')
--   vim.keymap.set('n', 'e', 'j', opts 'Move down')
--   vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Help')
-- end
-- --
-- -- empty setup using defaults
-- require('nvim-tree').setup {
--   on_attach = on_attach_nvim_tree,
-- }

-- MARIO: Copilot -----------------------------------------------------------------------------------
vim.g.copilot_enabled = 1
vim.keymap.set('n', '<leader>co', ':Copilot<CR>', { silent = true, desc = 'Open Copilot' })
vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { silent = true, desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { silent = true, desc = 'Disable Copilot' })
vim.keymap.set('i', '<c-i>', '<Plug>(copilot-next)', { silent = true, desc = 'Next suggestion' })
vim.keymap.set('i', '<C-o>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true -- Disable tab mapping
vim.keymap.set('i', '<C-p>', '<Plug>(copilot-suggest)', { silent = true, expr = true, desc = 'Suggest' })
-----------------------------------------------------------------------------------------------------------

-- MARIO: Jump in code (hop) ------------------------------------------------------------------------------
local hop = require 'hop'
vim.keymap.set('', '<leader>h', function()
  hop.hint_char2 { current_line_only = false }
end, { remap = true, desc = '2 char hop' })

vim.keymap.set('', 't', function()
  hop.hint_char2 { current_line_only = false }
end, { remap = true, desc = '2 char hop' })

vim.keymap.set('', 'f', function()
  hop.hint_char1 { current_line_only = true }
end, { remap = true, desc = '1 char line hop' })
vim.keymap.set('', 'F', function()
  hop.hint_char1 { current_line_only = true }
end, { remap = true, desc = '1 char line hop' })
----------------------------------------------------------------------------------------------------------

-- MARIO: Golang ----------------------------------------------------------------------------------------
local format_sync_grp = vim.api.nvim_create_augroup('GoImport', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

local nvim_lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp
nvim_lsp['gopls'].setup {
  cmd = { 'gopls' },
  -- on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}
----------------------------------------------------------------------------------------------------------

--MARIO: Zig -------------------------------------------------------------------------------------------
require('lspconfig').zls.setup {}
vim.g.zig_fmt_autosave = 0
----------------------------------------------------------------------------------------------------------

-- MARIO: other keybindings
vim.keymap.set('n', '<leader>aa', ':AerialToggle<CR>', { silent = true, desc = 'Toggle Aerial' }) -- Aerial
vim.keymap.set('n', '<leader>nn', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle NvimTree' }) -- NvimTree
vim.keymap.set('n', '<leader>todo', ':TodoTelescope<CR>', { silent = true, desc = 'Search TODOs' }) -- Todo Telescope

-- MARIO: Setup plugin to display error messages in LSP properly
-- require('lsp_lines').setup()

-- MARIO: Golang's debugger
vim.api.nvim_set_keymap('n', '<C-t>', ':GoTestFile<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-D>', ':DlvTestCurrent<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-B>', ':DlvToggleBreakpoint<CR>', { silent = true })

-- MARIO: Terminal
vim.api.nvim_set_keymap('n', '<leader>te', ':ToggleTerm<CR>', { silent = true })

local dap = require 'dap'
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'gdb',
    request = 'launch',
    program = function()
      return vim.fn.getcwd() .. '/build/tests'
      -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/test_main', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtBeginningOfMainSubprogram = false,
  },
}
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '-i', 'dap' },
}
