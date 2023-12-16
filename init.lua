--Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- [mario] add packer which seems like the only way to install some stuff
  'wbthomason/packer.nvim',

  -- [mario] Auto close brackets
  'm4xshen/autoclose.nvim',

  -- [mario] something to achieve stuff like acejump
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- [mario] Something about the terminal
  -- 'Shougo/deol.nvim',

  -- [mario] allows CTRL+D like selection
  'mg979/vim-visual-multi',

  -- [mario] Zig dude, zig
  'ziglang/zig.vim',

  -- [mario] I think I needed this to install zig
  {
    'neoclide/coc.nvim',
    branch = 'release'
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- [mario] Sidebar, still don't know about this one
  'sidebar-nvim/sidebar.nvim',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  -- [mario] Golang stuff
  'sebdah/vim-delve',
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- [mario] Why I installed this? no idea
      'hrsh7th/vim-vsnip',
      'neoclide/coc.nvim',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk' })

        map({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk' })

        -- Actions
        -- visual mode
        -- map('v', '<leader>hs', function()
        --   gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        -- end, { desc = 'stage git hunk' })
        -- map('v', '<leader>hr', function()
        --   gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        -- end, { desc = 'reset git hunk' })
        -- -- normal mode
        -- map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
        -- map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
        -- map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
        -- map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
        -- map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
        -- map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
        -- map('n', '<leader>hb', function()
        --   gs.blame_line { full = false }
        -- end, { desc = 'git blame line' })
        -- map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
        -- map('n', '<leader>hD', function()
        --   gs.diffthis '~'
        -- end, { desc = 'git diff against last commit' })
        --
        -- -- Toggles
        -- map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
        -- map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })
        --
        -- -- Text object
        -- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
      end,
    },
  },

  {
    -- [mario] Themes
    "catppuccin/nvim",
    name = "catppuccin-mocha",
    priority = 100,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, lazy = false },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  -- { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- TODO [mario] Is this actually working?
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [mario] Add line numbers in every window
vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- [mario] Autoclose brackets
require("autoclose").setup()

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == '' then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ':h')
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
  if vim.v.shell_error ~= 0 then
    print 'Not a git repository. Searching on current working directory'
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

local function telescope_live_grep_open_files()
  require('telescope.builtin').live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end
vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },

    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = false,

    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  }
end, 0)

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
require('which-key').register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
      -- diagnostics = { disable = { 'missing-fields' } },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
}

-- [mario] Packer to install some stuff that was not possible using lazy-lua (or I didn't care to check how to do it)
require('packer').startup(function(use)
  --packer
  use 'wbthomason/packer.nvim'

  --lsp
  use 'neovim/nvim-lspconfig'
  use { 'neoclide/coc.nvim', branch = 'release' }

  --auto complete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  --
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  vim.opt.completeopt = { "menu", "menuone", "noselect" }
end)

-- local has_words_before = function()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
--
-- local feedkey = function(key, mode)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
-- end


-- local cmp = require('cmp')

-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--     end,
--   },
--   mapping = {
--     -- ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif vim.fn["vsnip#available"](1) == 1 then
--         feedkey("<Plug>(vsnip-expand-or-jump)", "")
--       elseif has_words_before() then
--         cmp.complete()
--       else
--         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
--       end
--     end, { "i", "s" }),
--     ["<S-Tab>"] = cmp.mapping(function()
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif vim.fn["vsnip#jumpable"](-1) == 1 then
--         feedkey("<Plug>(vsnip-jump-prev)", "")
--       end
--     end, { "i", "s" }),
--   },
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'vsnip' }, -- For vsnip users.
--   }, {
--     { name = 'buffer' },
--   })
-- })


-- local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- end

-- [mario] Setup lspconfig.
local nvim_lsp = require('lspconfig')

-- [mario] GoLang
nvim_lsp['gopls'].setup {
  cmd = { 'gopls' },
  on_attach = on_attach,
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
  init_options = {
    usePlaceholders = true,
  }
}

-- [mario] Sidebar
local sidebar = require("sidebar-nvim")
local opts = {
  open = true,
  sections = { "datetime", "diagnostics", "todos", "buffers" },
  ["datetime"] = {
    icon = "-",
    format = "%H:%M, %a %b %d",
    clocks = {
      { name = "Aix-Les-Bains" }
    }
  },
  ["diagnostics"] = {
    icon = "-"
  },
  ["todos"] = {
    icon = "-",
    ignored_paths = { "~" },
    initially_closed = false,
  },
  ["buffers"] = {
    icon = "-",
    ignored_buffers = {},      -- ignore buffers by regex
    sorting = "id",            -- alternatively set it to "name" to sort by buffer name instead of buf id
    show_numbers = true,       -- whether to also show the buffer numbers
    ignore_not_loaded = false, -- whether to ignore not loaded buffers
    ignore_terminal = true,    -- whether to show terminal buffers in the list
  },
}
sidebar.setup(opts)

-- [mario] Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

-- [mario] More Go stuff
require('go').setup({
  disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
  -- settings with {}
  go = 'go', -- go command, can be go[default] or go1.18beta1
  goimport = 'gopls', -- goimport command, can be gopls[default] or either goimport or golines if need to split long lines
  fillstruct = 'gopls', -- default, can also use fillstruct
  gofmt = 'gofumpt', --gofmt cmd,
  max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
  tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
  tag_options = 'json=omitempty', -- sets options sent to gomodifytags, i.e., json=omitempty
  gotests_template = "", -- sets gotests -template parameter (check gotests for details)
  gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
  comment_placeholder = '', -- comment_placeholder your cool placeholder e.g. 󰟓       
  icons = { breakpoint = '🧘', currentpos = '🏃' }, -- setup to `false` to disable icons setup
  verbose = false, -- output loginf in messages
  lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
  -- false: do nothing
  -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
  --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
  --      when lsp_cfg is true
  -- if lsp_on_attach is a function: use this function as on_attach function for gopls
  lsp_keymaps = true,  -- set to false to disable gopls/lsp keymap
  lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
  -- function(bufnr)
  --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
  -- end
  -- to setup a table of codelens
  diagnostic = {  -- set diagnostic to false to disable vim.diagnostic setup
    hdlr = false, -- hook lsp diag handler and send diag to quickfix
    underline = true,
    -- virtual text setup
    virtual_text = { spacing = 0, prefix = '■' },
    signs = true,
    update_in_insert = false,
  },
  lsp_document_formatting = true,
  -- set to true: use gopls to format
  -- false if you want to use other formatter tool(e.g. efm, nulls)
  lsp_inlay_hints = {
    enable = true,
    -- hint style, set to 'eol' for end-of-line hints, 'inlay' for inline hints
    -- inlay only avalible for 0.10.x
    style = 'inlay',
    -- Note: following setup only works for style = 'eol', you do not need to set it for 'inlay'
    -- Only show inlay hints for the current line
    only_current_line = false,
    -- Event which triggers a refersh of the inlay hints.
    -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
    -- not that this may cause higher CPU usage.
    -- This option is only respected when only_current_line and
    -- autoSetHints both are true.
    only_current_line_autocmd = "CursorHold",
    -- whether to show variable name before type hints with the inlay hints or not
    -- default: false
    show_variable_name = true,
    -- prefix for parameter hints
    parameter_hints_prefix = "󰊕 ",
    show_parameter_hints = true,
    -- prefix for all the other hints (type, chaining)
    other_hints_prefix = "=> ",
    -- whether to align to the lenght of the longest line in the file
    max_len_align = false,
    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,
    -- whether to align to the extreme right or not
    right_align = false,
    -- padding from the right if right_align is true
    right_align_padding = 6,
    -- The color of the hints
    highlight = "Comment",
  },
  gopls_cmd = nil,          -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
  gopls_remote_auto = true, -- add -remote=auto to gopls
  gocoverage_sign = "█",
  sign_priority = 5,        -- change to a higher number to override other signs
  dap_debug = true,         -- set to false to disable dap
  dap_debug_keymap = true,  -- true: use keymap for debugger defined in go/dap.lua
  -- false: do not use keymap in go/dap.lua.  you must define your own.
  -- Windows: Use Visual Studio keymap
  dap_debug_gui = {},                                            -- bool|table put your dap-ui setup here set to false to disable
  dap_debug_vt = { enabled_commands = true, all_frames = true }, -- bool|table put your dap-virtual-text setup here set to false to disable

  dap_port = 38697,                                              -- can be set to a number, if set to -1 go.nvim will pick up a random port
  dap_timeout = 15,                                              --  see dap option initialize_timeout_sec = 15,
  dap_retries = 20,                                              -- see dap option max_retries
  build_tags = "tag1,tag2",                                      -- set default build tags
  textobjects = true,                                            -- enable default text jobects through treesittter-text-objects
  test_runner = 'go',                                            -- one of {`go`, `richgo`, `dlv`, `ginkgo`, `gotestsum`}
  verbose_tests = true,                                          -- set to add verbose flag to tests deprecated, see '-v' option
  run_in_floaterm = false,                                       -- set to true to run in a float window. :GoTermClose closes the floatterm
  -- float term recommend if you use richgo/ginkgo with terminal color

  floaterm = {             -- position
    posititon = 'auto',    -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
    width = 0.45,          -- width of float window if not auto
    height = 0.98,         -- height of float window if not auto
    title_colors = 'nord', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
    -- can also set to a list of colors to define colors to choose from
    -- e.g {'#D8DEE9', '#5E81AC', '#88C0D0', '#EBCB8B', '#A3BE8C', '#B48EAD'}
  },
  trouble = false,                                                             -- true: use trouble to open quickfix
  test_efm = false,                                                            -- errorfomat for quickfix, default mix mode, set to true will be efm only
  luasnip = false,                                                             -- enable included luasnip snippets. you can also disable while add lua/snips folder to luasnip load
  --  Do not enable this if you already added the path, that will duplicate the entries
  on_jobstart = function(cmd) _ = cmd end,                                     -- callback for stdout
  on_stdout = function(err, data) _, _ = err, data end,                        -- callback when job started
  on_stderr = function(err, data) _, _ = err, data end,                        -- callback for stderr
  on_exit = function(code, signal, output) _, _, _ = code, signal, output end, -- callback for jobexit, output : string
  iferr_vertical_shift = 4                                                     -- defines where the cursor will end up vertically from the begining of if err statement
})

-- [mario] acejump
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<C-;>', function()
  hop.hint_char2({current_line_only=false})
end, {remap=true})
vim.keymap.set('', 'f', function()
  hop.hint_char1({current_line_only=true})
end, {remap=true})
vim.keymap.set('', '<S-l>', function()
  hop.hint_lines_skip_whitespace({})
end, {remap=true})
vim.keymap.set('', '<C-/>', function()
  hop.hint_patterns({})
end, {remap=true})
