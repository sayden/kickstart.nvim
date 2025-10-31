" ==================== Basic Mappings ====================
let mapleader=" "

noremap ; :
noremap m ;
" noremap ? /

nnoremap Q :q<CR>
nnoremap S :w<CR>

noremap l u

" " Insert Key
noremap k i
" noremap K I

" " Copy to system clipboard
vnoremap Y "+y

" " Ctrl + U or E will move up/down the view port without moving the cursor
"unmap <C-U>
" noremap <C-u> 20<C-y>
"remap <C-e> <C-e>

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
noremap <silent> + N

vnoremap <silent> n <c-i>
vnoremap <silent> N <c-n>

noremap <silent> u k
noremap <silent> n h
noremap <silent> e j
noremap <silent> i l

" " " U/E keys for 5 times u/e (faster navigation)
noremap <silent> U 7k
noremap <silent> E 7j

" " " N key: go to the start/end of the line
noremap <silent> N ^
noremap <silent> I g_

" Remap <C-d> to <C-e>
noremap <C-e> 20j
noremap <C-u> 20k

" " set h (same as n, cursor left) to 'end of word'
noremap h e

" Insert Mode, Cursor Movement
inoremap <C-a> <ESC>A

" ==================== Window management ===================================
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>v
noremap <LEADER>u <C-w>k
noremap <LEADER>e <C-w>j
noremap <LEADER>n <C-w>h
noremap <LEADER>i <C-w>l
