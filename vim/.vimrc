set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle.vim
" call vundle#begin()

" Plugin 'VundleVim/Vundle.vim'
" Plugin 'ctrlp.vim'
" Plugin 'supertab'
" Plugin 'syntastic'
" Plugin 'nerdtree'
" Plugin 'editorconfig-vim'
" Plugin 'wookiehangover/jshint.vim'

" call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Pathogen
" execute pathogen#infect()
" call pathogen#helptags() " generate helptags for everything in 'runtimepath'
syntax on
filetype plugin indent on

"indentation stuff
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"linting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

set complete+=k "dictionary autocomplete
set number "view line numbers
highlight LineNr ctermfg=grey
set listchars=tab:▸▸,trail:~ "nicer whitespace chars
set list "show whitespace
set mouse=nv "allow mouse

"skip backup & swap files
set nobackup
set nowritebackup
set noswapfile

"nerdtree
:nmap <F2> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"save readonly files with sudo using w/x!!
cmap w!! %!sudo tee > /dev/null %
cmap x!! %!sudo tee > /dev/null %

set exrc "allow per folder configs
set secure "disallow dangerous commands in per folder configs

"close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
