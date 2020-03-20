let path_to_undofiles = expand(stdpath('data') . '/undofiles')
let path_to_ctrlp_cache = expand(stdpath('data') . '/cache')
let path_to_plug_dir = expand(stdpath('data') . '/plugged')
let path_to_backup_dir = expand(stdpath('data') . '/backups')
call mkdir(path_to_undofiles, 'p')
call mkdir(path_to_ctrlp_cache, 'p')
call mkdir(path_to_plug_dir, 'p')
call mkdir(path_to_backup_dir, 'p')

call plug#begin(path_to_plug_dir)

    Plug 'scrooloose/nerdtree'
    " Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP,
    " unite, Denite, lightline, vim-startify and many more
    Plug 'ryanoasis/vim-devicons'

    " Autocomplete
    Plug 'Shougo/neoinclude.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " CtrlP fuzzy search
    Plug 'ctrlpvim/ctrlp.vim'
    " Indent text object
    Plug 'michaeljsmith/vim-indent-object'

    " Better language packs
    Plug 'sheerun/vim-polyglot'

    " Window chooser
    Plug 't9md/vim-choosewin'

    " Theme
    Plug 'morhetz/gruvbox'

    " Tagbar
    Plug 'liuchengxu/vista.vim'
    Plug 'mhinz/vim-startify'

    " Git integration
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    " A plugin of NERDTree showing git status
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

    " Autoclose html tags
    Plug 'alvan/vim-closetag'

call plug#end()

"
" ============================================
" =            Interface settings            =
" ============================================
"

" —————————————Pure vim settings——————————————
if has("gui_running")
	set guioptions=rb
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set relativenumber
set nowrap
set incsearch
set colorcolumn=80
set cursorline
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.
set laststatus=2
set splitright
set splitbelow
set scrolloff=2            " Minimal number of screen lines to keep above and below the cursor.
set termguicolors          " Important! Enable true color"

colorscheme gruvbox
syntax on

" ————————————Vim-Airline settings————————————
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Echo markdown server url
let g:mkdp_echo_preview_url = 1

"
" ============================================
" =             General settings             =
" ============================================
"

" —————————————Pure vim settings——————————————
set expandtab
set encoding=utf-8
" Save undo history after file closing
set undofile
let &undodir = path_to_undofiles
set backup
let &backupdir = path_to_backup_dir
" Разрешаем использовать <backspace> в insert mode
set backspace=indent,eol,start

" Restore cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


" Some coc servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" TextEdit might fail if hidden is not set.
set hidden
" —————————————————coc config—————————————————

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
            \ 'coc-go',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-pairs',
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-dictionary', ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Go to definition
map gd :call CocAction('jumpDefinition')<CR>

" ————————————NERDTree settings———————————————
let NERDTreeQuitOnOpen=0 " Don't close NERDTree on file open
" Autoclose NERDTree, if NERDTree window is the latest window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" —————————————Other settings—————————————————
" Overlay feature
let g:choosewin_overlay_enable = 1
let g:ctrlp_cache_dir = path_to_ctrlp_cache
" —————————————————Mappings———————————————————
map <F4> :NERDTreeToggle<CR>
" Vista tagbar toggle
map <F3> :Vista!!<CR>
nmap - <Plug>(choosewin)
