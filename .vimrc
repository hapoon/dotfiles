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
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'golang/vscode-go'
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'
Plug 'hashivim/vim-terraform'
Plug 'tpope/vim-vinegar'
Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
call plug#end()

" nerdtree settings
let mapleader=','
let NERDTreeShowBookmarks=1 " 起動時にブックマークを表示
let NERDTreeShowHidden=1 " 隠しファイルを表示"
autocmd VimEnter * NERDTree " vim起動時にNERDTreeを開く
" NERDTreeのウィンドウしか開かれてない時は自動的に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Use all the defaults (recommended):
let g:lsc_auto_map = v:true

" hashivim/vim-terraform
let g:terraform_fmt_on_save = 1

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
inoremap <C-f> <C-x><C-o>
inoremap <expr> <Tab> 	pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab>	pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>	pumvisible() ? asyncomplete#close_popup() : "\<cr>"

set foldmethod=indent
set wildmenu
set hlsearch
set number
set completeopt=menuone,noinsert

if executable('terraform-ls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform-ls',
        \ 'cmd': {server_info->['terraform-ls', 'serve']},
        \ 'whitelist': ['terraform'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc:lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd		<plug>(lsp-definition)
    nmap <buffer> gr		<plug>(lsp-references)
    nmap <buffer> gi		<plug>(lsp-implementation)
    nmap <buffer> gt		<plug>(lsp-type-definition)
    nmap <buffer> <leader>rn	<plug>(lsp-rename)
    nmap <buffer> [g		<plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g		<plug>(lsp-next-diagnostic)
    nmap <buffer> K		<plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'allowlist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor'),
    \ 'config': {
    \    'gocode_path': expand('~/go/bin/gocode')
    \  },
    \ }))
