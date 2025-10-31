"==================================================== Editor behavior ====================
"
" ==================== Insert Mode Cursor Movement ==========================
tnoremap <Esc> <C-\><C-n>

" Avoid overriding content when pasting in visual mode
xnoremap p P

set colorcolumn=100
set indentexpr='' " Indent expression
set autoindent
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4" set clipboard+=unnamedplus
set cursorline " Highlight the current line"
set autochdir " Change directory to the file being edited"
set secure " Disable shell commands in vim"
set number " Show line numbers"
set relativenumber " Show relative line numbers"
set noexpandtab " Use spaces instead of tabs"
set shiftwidth=2
" set softtabstop=2
set autoindent
set list " Show invisible characters?
set listchars=tab:\|\ ,trail:▫ " Show tabs and trailing spaces?
set scrolloff=10 " Keep 15 lines above and below the cursor
set ttimeoutlen=0 " Disable timeout
set notimeout
set viewoptions=cursor,folds,slash,unix " Save view options
set wrap " Wrap lines
set tw=0 " Text width"
set foldmethod=manual
set foldlevel=99 " open all folds by default"
set foldenable
set formatoptions-=tc
set splitright " Open new windows to the right"
set splitbelow
set noshowmode
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
set updatetime=100
set virtualedit=block

" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.lua<CR>
nnoremap <LEADER>km :e $HOME/.config/nvim/keymap.vim<CR>
nnoremap <LEADER>no :e $HOME/.config/nvim/notes.md<CR>
nnoremap <LEADER>km :e $HOME/.config/nvim/keymap.vim<CR>

" Disable the default s key
" noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap Zu :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap Ze :set splitbelow<CR>:split<CR>
noremap Zn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap Zi :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

exec "nohlsearch"

" Custom cursor movement
source $HOME/.config/nvim/cursor.vim

