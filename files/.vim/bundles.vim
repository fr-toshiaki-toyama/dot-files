"================================================= 
" Vundle plugin for plugin management 
"=================================================
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" github repos
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'thinca/vim-quickrun'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'

filetype plugin indent on

