" dein plugin dir
let s:dein_dir = expand('~/.vim/dein')
" dein.vim itself
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/manboubird/dein.vim'

" cloning dein.vim
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/manboubird/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"=================================================

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML file for plugin list
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein-lazy.toml'

  " cash TOML
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " load non github plugins from local
  call dein#local("~/.vim/bundle", {},
		\ ['vim-drake-syntax'])

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
