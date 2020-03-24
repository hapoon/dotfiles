let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
call plug#end()

