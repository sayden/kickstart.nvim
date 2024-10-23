" ==================== Basic Mappings ====================
" let mapleader=" "
noremap ; :
noremap m ;
" noremap ? /

" Avoid overriding content when pasting in visual mode
nnoremap Q :q<CR>
nnoremap S :w<CR>

" Open the vimrc file anytime
nnoremap <LEADER>rc :e $HOME/.config/nvim/init.lua<CR>
nnoremap <LEADER>ka :e $HOME/.config/nvim/keymap_advanced.vim<CR>
nnoremap <LEADER>no :e $HOME/.config/nvim/notes.md<CR>
nnoremap <LEADER>km :e $HOME/.config/nvim/keymap.vim<CR>

noremap l u

" " Insert Key
noremap k i
noremap K I

" " Copy to system clipboard
vnoremap Y "+y

" ==================== Cursor Movement ====================
" insert a pair of {} and go to the next line
" inoremap <c-y> <ESC>A {}<ESC>i<CR><ESC>ko
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> = n
noremap <silent> - N

vnoremap <silent> n <c-i>
vnoremap <silent> N <c-n>
"
noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l
" "
" " " U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 5k
noremap <silent> E 5j

" " " N key: go to the start of the line
noremap <silent> N ^
" " " I key: go to the end of the line
noremap <silent> I $
" "
" " set h (same as n, cursor left) to 'end of word'
noremap h e
"
" " Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 15<C-y>
noremap <C-E> 15<C-e>

" ==================== Insert Mode Cursor Movement ==========================
inoremap <C-a> <ESC>A

" ==================== Window management ===================================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>v
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l

