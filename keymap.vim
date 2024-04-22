"==================== Editor behavior ====================
set clipboard+=unnamedplus
set autochdir " Change directory to the file being edited"
set secure " Disable shell commands in vim"
set number " Show line numbers"
set relativenumber " Show relative line numbers"
set cursorline " Highlight the current line"
set noexpandtab " Use spaces instead of tabs"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list " Show invisible characters?
set listchars=tab:\|\ ,trail:▫ " Show tabs and trailing spaces?
set scrolloff=15 " Keep 15 lines above and below the cursor
" set ttimeoutlen=0 " Disable timeout
" set notimeout
set viewoptions=cursor,folds,slash,unix " Save view options
set wrap " Wrap lines
set tw=0 " Text width"
set indentexpr= " Indent expression
set foldmethod=indent
set foldlevel=99 " Open all folds by default"
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
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
set undofile
set undodir=$HOME/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block

" ==================== Basic Mappings ====================
let mapleader=" "
noremap ; :
nnoremap Q :q<CR>
nnoremap S :w<CR>
" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.lua<CR>
" nnoremap <LEADER>km :e $HOME/.config/nvim/keymap.vim<CR>
nnoremap <LEADER>no :e $HOME/.config/nvim/notes.md<CR>
noremap l u
" " Insert Key
noremap k i
noremap K I
" " Copy to system clipboard
vnoremap Y "+y

" ==================== Cursor Movement ====================
" insert a pair of {} and go to the next line
inoremap <c-y> <ESC>A {}<ESC>i<CR><ESC>ko
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> = n
noremap <silent> - N

noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" N key: go to the start of the line
noremap <silent> N 0
" I key: go to the end of the line
noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 10<C-y>
noremap <C-E> 10<C-e>

" Custom cursor movement
source $HOME/.config/nvim_colemak/cursor.vim

" ==================== Insert Mode Cursor Movement ==========================
inoremap <C-a> <ESC>A

" ==================== Tab management =======================================
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>

" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>

" joshuto
noremap <silent> R :Joshuto<CR>
let g:joshuto_floating_window_winblend = 0
let g:joshuto_floating_window_scaling_factor = 1.0
let g:joshuto_use_neovim_remote = 1 " for neovim-remote support

" FZF
noremap <c-d> :FZF<CR>

exec "nohlsearch"

" ==================== Window management ===================================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

" Disable the default s key
noremap s <nop>
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
" noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>
" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" Open Ranger in the directory passed by argument
function! OpenRangerOnVimLoadDir(argv_path)
  " Open Ranger
	let path = expand(a:argv_path)
  call OpenRangerIn(path, "edit")

  " Delete the empty buffer created by vim
  exec "bp"
  exec "bd!"
endfunction

" To open ranger when vim load a directory
if exists('g:ranger_replace_netrw') && g:ranger_replace_netrw
  augroup ReplaceNetrwByRangerVim
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | call OpenRangerOnVimLoadDir(argv()[0]) | endif
  augroup END
endif

" Open Ranger in the directory passed by argument
function! OpenRangerOnVimLoadDir(argv_path)
  " Open Ranger
	let path = expand(a:argv_path)
  call OpenRangerIn(path, "edit")

  " Delete the empty buffer created by vim
  exec "bp"
  exec "bd!"
endfunction

" To open ranger when vim load a directory
if exists('g:ranger_replace_netrw') && g:ranger_replace_netrw
  augroup ReplaceNetrwByRangerVim
    autocmd VimEnter * silent! autocmd! FileExplorer
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | call OpenRangerOnVimLoadDir(argv()[0]) | endif
  augroup END
endif

" =========================== Copilot
let g:copilot_enabled = 1
" nnoremap <silent> <leader>co :Copilot<CR> 
" nnoremap <silent> <leader>ce :Copilot enable<CR> 
" nnoremap <silent> <leader>cd :Copilot disable<CR> 

inoremap <c-p> <Plug>(copilot-suggest)

imap <silent><script><expr> <C-C> copilot#Accept("")

let g:copilot_no_tab_map = v:true

inoremap <c-n> <Plug>(copilot-next)
inoremap <c-l> <Plug>(copilot-previous)
