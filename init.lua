
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
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration
  -- [mario] joshuto
  'theniceboy/joshuto.nvim',
  'nvim-tree/nvim-tree.lua',

  -- [mario] Center code
  'smithbm2316/centerpad.nvim',

  -- [mario] theniceboy
  '/itchyny/vim-cursorword',
  'liuchengxu/eleline.vim',
  'RRethy/vim-illuminate',
  -- File navigation
  -- 'ibhagwan/fzf-lua',
  -- 'junegunn/fzf',
  -- 'junegunn/fzf.vim',
  'theniceboy/joshuto.nvim',
  'airblade/vim-rooter',
  'pechorin/any-jump.vim',
  'mbbill/undotree',

  -- Editor Enhancement
  'petertriho/nvim-scrollbar',
  'kevinhwang91/nvim-hlslens',
  -- 'ggandor/leap.nvim', TODO May be better than acejump
  'tpope/vim-capslock',
  -- 'rhysd/clever-f.vim',
  'AndrewRadev/splitjoin.vim',
  'Yggdroot/indentLine',
  'ryanoasis/vim-devicons',

  -- Find & Replace
 'nvim-lua/plenary.nvim',
 'nvim-pack/nvim-spectre',

-- HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
  'elzr/vim-json',
  'neoclide/jsonc.vim',
  'othree/html5.vim',
  'alvan/vim-closetag',
-- Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
-- " Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
-- " Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
-- "Plug 'jaxbot/browserlink.vim'
-- Plug 'HerringtonDarkholme/yats.vim'
-- " Plug 'posva/vim-vue'
-- " Plug 'evanleck/vim-svelte', {'branch': 'main'}
-- " Plug 'leafOfTree/vim-svelte-plugin'
-- " Plug 'leafgarland/typescript-vim'
-- Plug 'MaxMEllon/vim-jsx-pretty'
-- Plug 'pangloss/vim-javascript'
-- Plug 'leafgarland/typescript-vim'
-- Plug 'peitalin/vim-jsx-typescript'
-- Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
-- Plug 'pantharshit00/vim-prisma'

  -- [mario] add packer which seems like the only way to install some stuff
  'wbthomason/packer.nvim',

  -- [mario] Auto close brackets
  'm4xshen/autoclose.nvim',
  -- 'jiangmiao/auto-pairs', Alternative from the nice guy

  -- [mario] something to achieve stuff like acejump
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- [mario] ChatGPT, yes, because I can
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  -- [mario] copilot
  'github/copilot.vim',

  -- [mario] floating windows
  'ray-x/guihua.lua',

  -- [mario] allows CTRL+D like selection
  'mg979/vim-visual-multi',

  -- [mario] Zig dude, zig
  'ziglang/zig.vim',
  'NTBBloodbath/zig-tools.nvim',

  -- [mario] I think I needed this to install zig
  {
    'neoclide/coc.nvim',
    branch = 'release'
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

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

  -- {
    -- Add indentation guides even on blank lines
    -- 'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
  --   main = 'ibl',
  --   opts = {},
  -- },

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

-- Netrw
vim.g.loaded_netrw = 1 -- Disable netrw
vim.g.loaded_netrwPlugin = 1 -- Disable netrw
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function on_attach_nvim_tree(bufnr)
-- custom mappings
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings DO NOT add default mappings or they'll override the ones from colemak
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 'l', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'k', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '-', 'N', opts('Nothing'))
  vim.keymap.set('n', '<C-y>', api.node.open.replace_tree_buffer, opts('Open in place'))
  vim.keymap.set('n', 'i', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'n', api.node.open.edit, opts('Close'))
  vim.keymap.set('n', 'u', 'k', opts('Move up'))
  vim.keymap.set('n', 'e', 'j', opts('Move down'))
  vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))

end
-- 
-- empty setup using defaults
require("nvim-tree").setup({
  on_attach = on_attach_nvim_tree,
})
-------------------------------------------------------

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
-- vim.g.netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

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
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    initial_mode = 'insert',
    -- mappings = {
    --   i = {
    --     ['<C-u>'] = false,
    --     ['<C-d>'] = false,
    --   },
    -- },
  },
}

-- [mario] Autoclose brackets
require("autoclose").setup()

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><bf>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
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
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'zig' },

    modules = {},
    ignore_install = {},
    sync_install = {},

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
  ['<leader>c'] = { name = '[C]opilot', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  ['<leader>z'] = { name = 'Center file on screen', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
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
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

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
    ['<C-e>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-i>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete {},
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
local go = require("go")
go.setup({
  disable_defaults = false, -- true|false when true set false to all boolean settings and replace all table
  -- settings with {}
  go = 'go', -- go command, can be go[default] or go1.18beta1
  goimports = 'gopls', -- goimport command, can be gopls[default] or either goimport or golines if need to split long lines
  fillstruct = 'gopls', -- default, can also use fillstruct
  -- gofmt = 'gofumpt', --gofmt cmd,
  gofmt = 'golines', --gofmt cmd,
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
  run_in_floaterm = true,                                        -- set to true to run in a float window. :GoTermClose closes the floatterm
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
  on_exit = function(code, signal, output) _, _, _ = code, signal, output end, -- callback for jobexit, output :tring
  iferr_vertical_shift = 4                                                     -- defines where the cursor will end up vertically from the begining of if err statement
})

-- [mario]
vim.api.nvim_set_keymap('n', '<C-t>', ':GoTestFile<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-D>', ':DlvTestCurrent<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-B>', ':DlvAddBreakpoint<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-B>', ':DlvRemoveBreakpoint<CR>', { silent = true })

-- [mario] acejump
local hop = require('hop')
vim.keymap.set('n', '<leader>f', function()
  hop.hint_char2({ current_line_only = false })
end, { remap = true })
vim.keymap.set('n', 'f', function()
  hop.hint_char1({ current_line_only = true })
end, { remap = true })

require 'lspconfig'.hdl_checker.setup {}

-- [mario] Colemak
vim.cmd('source $HOME/.config/nvim/keymap.vim')

-- theniceboy
require("scrollbar").setup()

-- fzf
-- require'fzf-lua'.setup {
-- 	global_resume = true,
-- 	global_resume_query = true,
-- 	winopts = {
-- 		height = 0.95,
-- 		width = 0.95,
-- 		preview = {
-- 			scrollbar = 'float',
-- 		},
-- 		fullscreen = false,
-- 		vertical       = 'down:45%',      -- up|down:size
-- 		horizontal     = 'right:60%',     -- right|left:size
-- 		hidden         = 'nohidden',
-- 	},
-- 	keymap = {
-- 		-- These override the default tables completely
-- 		-- no need to set to `false` to disable a bind
-- 		-- delete or modify is sufficient
-- 		builtin = {
-- 			["<c-f>"]      = "toggle-fullscreen",
-- 			["<c-r>"]      = "toggle-preview-wrap",
-- 			["<c-p>"]      = "toggle-preview",
-- 			["<c-y>"]      = "preview-page-down",
-- 			["<c-l>"]      = "preview-page-up",
-- 			["<S-left>"]   = "preview-page-reset",
-- 		},
-- 		fzf = {
-- 			["esc"]        = "abort",
-- 			["ctrl-h"]     = "unix-line-discard",
-- 			["ctrl-k"]     = "half-page-down",
-- 			["ctrl-b"]     = "half-page-up",
-- 			["ctrl-n"]     = "beginning-of-line",
-- 			["ctrl-a"]     = "end-of-line",
-- 			["alt-a"]      = "toggle-all",
-- 			["f3"]         = "toggle-preview-wrap",
-- 			["f4"]         = "toggle-preview",
-- 			["shift-down"] = "preview-page-down",
-- 			["shift-up"]   = "preview-page-up",
-- 			["ctrl-e"]     = "down",
-- 			["ctrl-u"]     = "up",
-- 		},
-- 	},
--   previewers = {
--     cat = {
--       cmd             = "cat",
--       args            = "--number",
--     },
--     bat = {
--       cmd             = "bat",
--       args            = "--style=numbers,changes --color always",
--       theme           = 'TwoDark', -- bat preview theme (bat --list-themes)
--       config          = nil,            -- nil uses $BAT_CONFIG_PATH
--     },
--     head = {
--       cmd             = "head",
--       args            = nil,
--     },
--     git_diff = {
--       cmd_deleted     = "git diff --color HEAD --",
--       cmd_modified    = "git diff --color HEAD",
--       cmd_untracked   = "git diff --color --no-index /dev/null",
--       -- pager        = "delta",      -- if you have `delta` installed
--     },
--     man = {
--       cmd             = "man -c %s | col -bx",
--     },
--     builtin = {
--       syntax          = true,         -- preview syntax highlight?
--       syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
--       syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
--     },
--   },
--   files = {
--     -- previewer      = "bat",          -- uncomment to override previewer
--                                         -- (name from 'previewers' table)
--                                         -- set to 'false' to disable
--     prompt            = 'Files❯ ',
--     multiprocess      = true,           -- run command in a separate process
--     git_icons         = true,           -- show git icons?
--     file_icons        = true,           -- show file icons?
--     color_icons       = true,           -- colorize file|git icons
--     -- executed command priority is 'cmd' (if exists)
--     -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
--     -- default options are controlled by 'fd|rg|find|_opts'
--     -- NOTE: 'find -printf' requires GNU find
--     -- cmd            = "find . -type f -printf '%P\n'",
--     find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
--     rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
--     fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
--   },
--   buffers = {
--     prompt            = 'Buffers❯ ',
--     file_icons        = true,         -- show file icons?
--     color_icons       = true,         -- colorize file|git icons
--     sort_lastused     = true,         -- sort buffers() by last used
--   },
-- }

-- hlslens
require('hlslens').setup()

-- [mario] spectre
vim.keymap.set('n', '<leader>F', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})

-- using the command
vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>Centerpad<cr>', { silent = true, noremap = true })

-- [mario] format on save zig
-- let g:zig_fmt_autosave = 0
require 'lspconfig'.zls.setup{}

-- Copilot
vim.keymap.set('n', '<leader>co', ':Copilot<CR>', { silent = true, desc = "Open Copilot" })
vim.keymap.set('n', '<leader>ce', ':Copilot enable<CR>', { silent = true, desc = "Enable Copilot" })
vim.keymap.set('n', '<leader>cd', ':Copilot disable<CR>', { silent = true, desc = "Disable Copilot" })
vim.keymap.set('n', '<c-i>', '<Plug>(copilot-next)', { silent = true, desc = "Next suggestion" })

