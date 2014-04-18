" turn of Vi compatibility mode
set nocompatible

" plugins will be stored relative to current file {{{1
" Eg:- ~/.vim/vimrc.vim => ~/.vim/bundle
let plugins_dir_name = 'bundle'
let vimrc_path         = resolve(expand('<sfile>'))
let vimrc_dir          = fnamemodify(vimrc_path, ':h')
let plugins_dir        = vimrc_dir . '/' . plugins_dir_name
let plugins_dir_exists = isdirectory(plugins_dir)
let vundle_dir         = plugins_dir . '/' . 'vundle'
let hybrid_dir         = plugins_dir . '/' . 'vim-hybrid'
let vundle_dir_exists  = isdirectory(vundle_dir)
" }}}1

" install vundle if not found {{{1
if !vundle_dir_exists
  call mkdir(vundle_dir, 'p')
  let install_cmds = []

  call add(install_cmds, 'echo "Installing Vundle ..."')
  call add(install_cmds, 'git clone https://github.com/gmarik/vundle.git ' . vundle_dir)

  " allows using hybrid color scheme during the plugin installs
  call add(install_cmds, 'echo "Installing Hybrid Color Scheme ..."')
  call add(install_cmds, 'git clone https://github.com/w0ng/vim-hybrid.git ' . hybrid_dir)
  execute ':set rtp+=' . hybrid_dir

  let install_cmd = ":silent !" . join(install_cmds, '  &&  ')
  execute install_cmd
endif
" }}}1

" vundle configuration {{{1
filetype off
execute ':set rtp+=' . vundle_dir
call vundle#rc(plugins_dir)
" }}}1

" vim defaults {{{1
set showcmd
set hidden
set number
set modelines=0
set nomodeline
set ruler
set wildmode=list:full
set undolevels=100
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam,*.pyc
set encoding=utf-8
set laststatus=2
set t_Co=256
set timeout
set timeoutlen=500
set ttimeoutlen=500
set synmaxcol=512
set ttyfast
set scrolloff=5
set backspace=indent,eol,start
set autoindent
" }}}1

" plugin configuration {{{1
" airline
let g:airline_theme='hybrid'

" Ultisnips
" switch triggers to maintain compatibility with SuperTab & YCM
let g:UltiSnipsExpandTrigger       = "<c-j>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Ctrlp
set wildignore+=vendor/*,docs/*,node_modules/*,components/*,build/*,dist/*

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" }}}1

" vundle managed plugins {{{1
" core
Plugin 'gmarik/vundle'

" colorschemes
Plugin 'w0ng/vim-hybrid'

" status bar
Plugin 'bling/vim-airline'

" code browsing
Plugin 'kien/ctrlp.vim'

" autocompletion
Plugin 'ervandew/supertab'

" snippets
Plugin 'SirVer/ultisnips'

" language common
Plugin 'scrooloose/syntastic'

" php
Plugin 'StanAngeloff/php.vim'
Plugin 'shawncplus/phpcomplete.vim'

" general web dev
Plugin 'tpope/vim-markdown'
Plugin 'tyru/open-browser.vim'

" wordpress
Plugin 'dsawardekar/wordpress.vim'
" }}}1

" vundle installation {{{1
" use hybrid if present
silent! colorscheme hybrid

if !vundle_dir_exists
  redraw!
  PluginInstall
end
" }}}1

" appearance {{{1
" omnicompletion config
set completeopt=menu,menuone,longest
set pumheight=15
" }}}1

" vundle complete, turn back filetypes
filetype plugin indent on
syntax on
