" VUNDLE SETUP
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()  
filetype plugin indent on

" VUNDLE PLUGINS
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" AIRLINE SETUP
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=0

" PATHOGEN SETUP
execute pathogen#infect()
call pathogen#helptags()

" CTRLP SETUP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERDTREE SETUP
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMouseMode=3

" TAB SETUP
set tabstop=4
set shiftwidth=4
set softtabstop=4

" THEME SETUP
set background=dark
set termguicolors
colorscheme material-monokai
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1

" NAVIGATION SETUP
set mouse=a
set showcmd
set showmode
set wildmenu
set ruler
set title
set nu
set ai

" DEVELOPMENT SETUP
syntax on
filetype plugin on  

