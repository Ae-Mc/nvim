"
" ============================================
" =             Functions section            =
" ============================================
"

function! s:CreateNecessaryDirectories(paths_to_dirs)
    for l:path_short_name in keys(a:paths_to_dirs)
        call mkdir(a:paths_to_dirs[l:path_short_name], "p")
    endfor
endfunction

function! s:CheckVimPlugInstalled()
    if filereadable(stdpath('config').'/autoload/plug.vim')
        return 1
    endif
    return 0
endfunction

function! s:InstallVimPlug()
    if has('python')
        let l:py_exe = 'python'
    elseif has('python3')
        let l:py_exe = 'python3'
    else
        echo 'Error! Python not found!'
	return
    endif
    call mkdir(stdpath('config') . '/autoload', 'p')
    execute py_exe "<< EOF"
try:
    import urllib.request as request
except ImportError:
    import urllib as request
import sys
from os import path
vim_plug_file_contents = request.urlopen(
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    ).read()
linux_platforms = ["linux", "darwin", "cygwin", "freebsd"]
windows_platforms = ["win32"]
for linux_platform in linux_platforms:
    if sys.platform.startswith(linux_platform):
        vim_plug_file_path = path.expanduser("~/.config/nvim/autoload")
        break
else:
    for windows_platform in windows_platforms:
        if sys.platform.startswith(windows_platform):
            vim_plug_file_path = path.expanduser(
                "~\\Appdata\\Local\\nvim\\autoload")
            break
    else:
        print("Unsupported os!")
        raise(Exception)

with open(path.join(vim_plug_file_path, 'plug.vim'), 'wb') as autoloadFile:
    autoloadFile.write(
        bytearray(vim_plug_file_contents))
EOF
endfunction

"
" ============================================
" =               Main section               =
" ============================================
"
"
let s:paths_to_dirs = {
    \ 'backup': expand(stdpath('data') . '/backups'),
    \ 'undo': expand(stdpath('data') . '/undofiles'),
    \ 'ctrlp_cache': expand(stdpath('data') . '/cache'),
    \ 'vim-plug': expand(stdpath('data') . '/plugged')
  \ }

call s:CreateNecessaryDirectories(s:paths_to_dirs)
let s:vim_plug_just_installed = 0
if !s:CheckVimPlugInstalled()
    call s:InstallVimPlug()
    let s:vim_plug_just_installed = 1
endif

call plug#begin(s:paths_to_dirs['vim-plug'])

    Plug 'scrooloose/nerdtree'
    " Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP,
    " unite, Denite, lightline, vim-startify and many more
    Plug 'ryanoasis/vim-devicons'

    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Auto comment
    Plug 'tpope/vim-commentary'

    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " CtrlP fuzzy search
    Plug 'ctrlpvim/ctrlp.vim'
    " Indent text object
    Plug 'michaeljsmith/vim-indent-object'

    " Better language packs
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/jsonc.vim' " Support for cjson syntax

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
    if has("win32") || has("win64")
        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    else
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
    endif

	" ReStructuredText preview
	Plug 'gu-fan/InstantRst'

    " Autoclose html tags
    Plug 'alvan/vim-closetag'

	Plug 'tmhedberg/SimpylFold'

call plug#end()

if s:vim_plug_just_installed
    :PlugInstall
endif
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
set wrap
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
set cmdheight=2
set encoding=utf-8
" Save undo history after file closing
set undofile
set noruler
let &undodir = s:paths_to_dirs['undo']
set backup
let &backupdir = s:paths_to_dirs['backup']
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

" Wrap help files
autocmd FileType help set wrap


" —————————————————coc config—————————————————

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> <C-A-S-f> <Plug>(coc-format)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc extensions
let g:coc_global_extensions = [
            \ 'coc-go',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-cmake',
            \ 'coc-emmet',
            \ 'coc-pairs',
            \ 'coc-clangd',
            \ 'coc-pyright',
            \ 'coc-snippets',
            \ 'coc-dictionary', ]

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ————————————NERDTree settings———————————————
let NERDTreeQuitOnOpen=0 " Don't close NERDTree on file open
" Autoclose NERDTree, if NERDTree window is the latest window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" —————————————Other settings—————————————————
" Overlay feature
let g:choosewin_overlay_enable = 1
let g:ctrlp_cache_dir = s:paths_to_dirs['ctrlp_cache']
" —————————————————Mappings———————————————————
map <F4> :NERDTreeToggle<CR>
" Vista tagbar toggle
map <F3> :Vista!!<CR>

nmap - <Plug>(choosewin)
xmap <C-/> gc
nmap <C-/> <Plug>CommentaryLine

" Additional diff commands
command! Diffthis windo diffthis
command! Difft windo diffthis
command! Dt windo diffthis
command! Diffoff windo diffoff
command! Diffo windo diffoff
command! Do windo diffoff
