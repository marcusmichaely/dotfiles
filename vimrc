" auto install plugs in .vimrc
" https://github.com/junegunn/vim-plug/wiki/faq
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" create backupdirs
if empty(glob('~/.vim/backup_files'))
silent !mkdir ~/.vim/backup_files > /dev/null 2>&1
endif

if empty(glob('~/.vim/swap_files'))
silent !mkdir ~/.vim/swap_files > /dev/null 2>&1
endif

if empty(glob('~/.vim/undo_files'))
silent !mkdir ~/.vim/undo_files > /dev/null 2>&1
endif

" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker tabstop=4 shiftwidth=4:

" Environment {{{
set nocompatible    " must be first line
set ttyfast         " we have a fast tty
" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')
" General {{{
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/a.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'chriskempson/base16-vim'
Plug 'Rip-Rip/clang_complete'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ngmy/vim-rubocop'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'Townk/vim-autoclose'
Plug 'thaerkh/vim-workspace'
Plug 'mhinz/vim-startify'
Plug 'vim-syntastic/syntastic'
" Plugins inspired by yavide
"Plug 'vim-scripts/a.vim'
"Rip-Rip/clang_complete
"scrooloose/nerdcommenter
"vim-airline/vim-airline
"Townk/vim-autoclose
"ervandew/supertab
"tpope/vim-fugitive
"airblade/vim-gitgutter
"terryma/vim-multiple-cursors

" }}}

call plug#end()
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set colorcolumn=80
set wrap
set list listchars=tab:►\ ,trail:◆,eol:¬
syntax enable
syntax on
"let base16colorspace=256
"colorscheme base16-bright
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000
set mousehide
set cursorline
set ttyfast
filetype on
filetype plugin on
filetype indent on

"reload if file changed from outside
set autoread
"highlight search results
"set hlsearch

"show matching brackets
"set showmatch

"set blinktime for matching brackets
set mat=2

"spaces instead tabs
set expandtab

set shiftwidth=4
set tabstop=4

"undo
set undofile
set undolevels=1000
set undoreload=10000
set hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" directories
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set directory=~/.vim/swap_files//
set backupdir=~/.vim/backup_files//
set undodir=~/.vim/undo_files//

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for specific file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType ruby,yaml set expandtab shiftwidth=2 softtabstop=2 tabstop=2
" auto save and reload .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"vim-autoformat
let b:formatdef_custom_c='"astyle --mode=c --style=1tbs"'
let b:formatters_c = ['custom_c']
"ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsEditSplit = "vertical"
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols
set guifont=Liberation\ Mono\ for\ Powerline\ 12
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
"vim-workspace
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_session_name = 'Session.vim'
let g:workspace_persist_undo_history = 1  " enabled = 1 (default), disabled = 0
let g:workspace_undodir='.undodir'
let g:workspace_autosave_always = 1
let g:workspace_autosave = 1
set updatetime=4000  " Default Vim setting (specifies CursorHold wait time).
let g:workspace_autosave_ignore = ['gitcommit']
"ctrl-p
let g:ctrlp_map = '<c-p>'
"nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>
"startify
let g:startify_skiplist_server = [ 'GVIM' ]
"syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_c_checkers=['make','clang-check','splint']
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
let g:syntastic_error_symbol = '✗✗'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <F3> :CtrlPMixed<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>
map <F5> :ls<CR>:b<Space>
noremap <F6> :Autoformat<CR>
"let mapleader = ","
" Copy and paste stuff
vmap <c-c> "+y
imap <c-p> <ESC>"+pa
" open .vimrc in split tab
nmap <leader>v :tabedit $MYVIMRC<CR>
"buffer behavior
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
"make
nmap <leader>m :make

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filebin
function! Filebin(start, end)
    let range = a:start . "," . a:end
    let name = expand("%:t")
    if (name == "")
        let name = "scratch"
    endif
    let extension = expand(&ft)
    if (extension == "")
        let extension = "text"
    endif
    let command = "w !fb -n '" . name . "' -e '" . extension . "'"
    silent exe expand(range) . command
    redraw!
endfunction
com! -nargs=0 -range=% Fb :call Filebin(<line1>, <line2>)


"latex ide made by jreinert.com
function! SynctexMake()
    if v:servername == ""
        throw "vim must be started with --servername"
    endif
    let position = line(".").':'.col(".").':'.expand("%:p")
    let editor = 'vim --servername '.v:servername.' --remote +\%{line} \%{input}'
    exe 'make view "SYNCTEX_FORWARD='.position.'" "SYNCTEX_EDITOR='.editor.'"'
endfunction

com! -nargs=0 SyncMake :call SynctexMake()
set wrap

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
