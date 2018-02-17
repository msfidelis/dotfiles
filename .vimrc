execute pathogen#infect()
call pathogen#helptags()

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMouseMode=3

set omnifunc=phpcomplete#CompletePH
set runtimepath^=~/.vim/bundle/ctrlp.vim 

set mouse=a
set showcmd
set showmode
set wildmenu
set ruler
set title
syntax on
filetype plugin on  
set nu
set ai
