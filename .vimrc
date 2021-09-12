if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" https://github.com/preservim/nerdtree"
Plug 'preservim/nerdtree'
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
" https://github.com/vim-syntastic/syntastic 
Plug 'vim-syntastic/syntastic'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
call plug#end()

" nerdtree settings
let mapleader=','
let NERDTreeShowBookmarks=1 " 起動時にブックマークを表示
autocmd VimEnter * NERDTree " vim起動時にNERDTreeを開く
" NERDTreeのウィンドウしか開かれてない時は自動的に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use all the defaults (recommended):
let g:lsc_auto_map = v:true

packloadall
silent! helptags ALL

" general remapping
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
" insert mode remapping
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap { {}<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i

set foldmethod=indent
set wildmenu
set hlsearch
