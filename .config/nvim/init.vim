call plug#begin(stdpath('data') . '/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status
"Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/neoinclude.vim'
" Plug 'jsfaint/coc-neoinclude'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Fuzzy search through the files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Theme
Plug 'morhetz/gruvbox'
" Tagbar
Plug 'liuchengxu/vista.vim'
call plug#end()
"
" ============================================
" =            Interface settings            =
" ============================================
"
if has("gui_running")
	set guioptions=rb
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set nowrap
set incsearch
set colorcolumn=80
colorscheme gruvbox

" Настройки Vim-Airline
set laststatus=2
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"
" ============================================
" =             General settings             =
" ============================================
"

" —————————————Pure vim settings——————————————
set expandtab
set encoding=utf-8
set splitright
set splitbelow
" Save undo history after file closing
set undofile
set undodir=~/.config/nvim/undofiles
" Разрешаем использовать <backspace> в insert mode
set backspace=indent,eol,start

" Restore cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" —————————————————coc config—————————————————

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" TextEdit might fail if hidden is not set.
set hidden

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Better work of enter key
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc extensions
let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-pairs',
            \ 'coc-python',
            \ 'coc-dictionary',
            \ 'coc-snippets', ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" ————————————NERDTree settings———————————————
let NERDTreeQuitOnOpen=0 " Don't close NERDTree on file open
" Autoclose NERDTree, if NERDTree window is the latest window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" —————————————————Mappings———————————————————
map <F4> :NERDTreeToggle<CR>
