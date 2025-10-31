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

--]]

-- Get the current working directory
vim.g.cwd = vim.fn.getcwd()
vim.opt.title = true
vim.g.initial_cwd = vim.g.cwd
vim.opt.titlestring = [[%{fnamemodify(g:initial_cwd, ':t')} - %f - Neovim %h%m%r%w]]
-- vim.opt.titlestring = [[%{fnamemodify(getcwd(), ':t')} - %f %h%m%r%w]]

-- Print or use the cwd as needed
vim.notify('Neovim started from: ' .. vim.g.cwd)

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

-- In init.lua or a separate settings.lua file
vim.o.autoindent = true
vim.o.cindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.indentexpr = ''
vim.o.showtabline = 2
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

-- Save undo history
vim.opt.undofile = false
vim.opt.undodir = '$XDG_STATE_HOME/nvim/undo/'

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
-- vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

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
-- vim.keymap.set('', ';', ':', { noremap = true })

-- undo operation
-- vim.keymap.set('n', 'l', 'u', { noremap = true })

-- insert key
-- vim.keymap.set('', 'k', 'i', { noremap = true })
-- vim.keymap.set('', 'K', 'I', { noremap = true })

-- copy to system clipboard
-- vim.keymap.set('v', 'Y', '"+y', { noremap = true })

-- jump lines
-- vim.keymap.set({ 'n', 'v' }, 'U', '5k', { silent = true })
-- vim.keymap.set({ 'n', 'v' }, 'E', '5j', { silent = true })

-- Cursor movement
-- vim.keymap.set({ 'n', 'v' }, 'n', 'h', { silent = true, noremap = false })
-- vim.keymap.set({ 'n', 'v' }, 'u', 'k', { silent = true, noremap = false })
-- vim.keymap.set({ 'n', 'v' }, 'e', 'j', { silent = true, noremap = false })
-- vim.keymap.set({ 'n', 'v' }, 'i', 'l', { silent = true, noremap = false })

-- search forward / backwards
-- vim.keymap.set('n', '=', 'n', { silent = true })
-- vim.keymap.set('n', '-', 'N', { silent = true })

-- go to start of the lines
-- go to end of the lines
-- vim.keymap.set('i', '<C-a>', '<ESC>A', { silent = true })
-- vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- set h (same as n, cursor left) to 'end of word'
-- vim.keymap.set('', 'h', 'e', { silent = true })

-- Custom cursor movement
vim.cmd 'source $HOME/.config/nvim/cursor.vim'

-- Insert mode Cursor movement
-- tnoremap <Esc> <C-\><C-n>
-- inoremap <C-a> <ESC>A

-- exec "nohlsearch"
-- vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { noremap = true })

-- Open the vimrc file anytime
-- vim.keymap.set('n', '<leader>rc', ':e $HOME/.config/nvim/init.lua<CR>', { noremap = true })
-- vim.keymap.set('n', '<leader>no', ':e $HOME/.config/nvim/notes.md<CR>', { noremap = true })
-- vim.keymap.set('n', '<leader>km', ':e $HOME/.config/nvim/keymap.vim<CR>', { noremap = true })

-- Avoid overriding content when pasting in visual mode
-- vim.keymap.set('x', 'p', 'P', { noremap = true })
-- xnoremap p P

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Custom function to handle <N> behavior: Go to leftmost character of the line of go to beginning
-- of line if already at leftmost character
local function custom_move_to_first_char_or_beginning()
  local col = vim.fn.col '.'
  local first_non_blank = vim.fn.col '^'
  if col == first_non_blank then
    vim.cmd 'normal! 0'
  else
    vim.cmd 'normal! ^'
  end
end
-- Indentation for mere mortals
-- vim.keymap.set('v', '<Tab>', '>gv', { silent = true, desc = 'Indent' })
vim.keymap.set('v', '<S-Tab>', '<gv', { silent = true, desc = 'Outdent' })
-- CTRL+/ to comment/uncomment like other editors
vim.keymap.set('n', '<C-/>', '<cmd>CommentToggle<CR>', { noremap = true, silent = true })

-- Map <C-n> to the custom function
vim.keymap.set('n', 'N', custom_move_to_first_char_or_beginning, { noremap = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- ==================== Window management ===================================
-- Resize with arrows
-- vim.keymap.set('n', '<leader>w', '<C-w>v', { desc = 'Split window vertically' })
-- vim.keymap.set('n', '<leader>u', '<C-w>k', { desc = 'Go to window up' })
-- vim.keymap.set('n', '<leader>e', '<C-w>j', { desc = 'Go to window down' })
-- vim.keymap.set('n', '<leader>i', '<C-w>l', { desc = 'Go to window right' })
-- vim.keymap.set('n', '<leader>n', '<C-w>h', { desc = 'Go to window left' })

-- Resize with arrows
-- vim.keymap.set('n', '<up>', ':res +5<CR>', { desc = 'Increase window height' })
-- vim.keymap.set('n', '<down>', ':res -5<CR>', { desc = 'Decrease window height' })
-- vim.keymap.set('n', '<left>', ':vertical resize -5<CR>', { desc = 'Decrease window width' })
-- vim.keymap.set('n', '<right>', ':vertical resize +5<CR>', { desc = 'Increase window width' })

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
-- vim.keymap.set('n', 'Q', ':q<CR>', { noremap = true })
-- vim.keymap.set('n', 'S', ':w<CR>', { noremap = true })
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

-- vim.keymap.set('', '<A-n>', ':-tabnext<CR>', { noremap = true })
-- vim.keymap.set('', '<A-i>', ':+tabnext<CR>', { noremap = true })
vim.keymap.set('', '<A-n>', ':BufferPrevious<CR>', { noremap = true })
vim.keymap.set('', '<A-i>', ':BufferNext<CR>', { noremap = true })

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
--

------------------------------------------------------------------------
vim.cmd 'source $HOME/.config/nvim/keymap.vim'
vim.cmd 'source $HOME/.config/nvim/keymap_advanced.vim'

-- =====================================================================
vim.keymap.set('', 'Q', ':BufferClose<CR>', { noremap = true })
vim.keymap.set('', '<C-A-q?', ':qall<CR>', { noremap = true })

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
-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  -- Use `opts = {}` to force a plugin to be loaded.
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- MARIO: Word wrap
  {
    'andrewferrier/wrapping.nvim',
    lazy = false,
    config = function()
      require('wrapping').setup {}
    end,
  },

  'lambdalisue/suda.vim', -- MARIO: To manipulate files with sudo
  'tpope/vim-capslock', -- MARIO: activate capslock
  'AndrewRadev/splitjoin.vim', -- MARIO: switch between single line statement and multi line with gS and gJ

  -- MARIO: Help to close pairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  -- MARIO: helps with pairing quotes, brackets, etc
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    dependencies = {
      'jay-babu/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'anuvyklack/hydra.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'rcarriga/cmp-dap',
    },
    keys = {
      { '<leader>d', desc = '[D]ebug Menu' },
    },
    config = function()
      require('nvim-surround').setup {
        keymaps = {}, -- Defines plugin keymaps
        surrounds = {}, -- Defines surround keys and behavior
        aliases = {}, -- Defines aliases
      }
    end,
  },

  -- MARIO: multiple cursors
  'mg979/vim-visual-multi',

  -- NOTE: Here is a more advanced example where we pass configuration
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

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded with
  --  config = function() ... end

  -- MARIO: stuff seen in theniceboy for colemak users
  'itchyny/vim-cursorword', -- Highlight word under cursor

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

  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- MARIO: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  { import = 'custom.plugins' },
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
-- END Lazy setup

vim.api.nvim_exec_autocmds('FileType', {})
vim.opt.textwidth = 100
vim.cmd 'colorscheme cyberdream'
