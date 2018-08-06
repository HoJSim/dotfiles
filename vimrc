set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'

"html
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
""python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'itspriddle/vim-jquery'
Plugin 'vim-scripts/TagHighlight'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/YankRing.vim'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'

Plugin 'ecomba/vim-ruby-refactoring'
"Plugin 'tpope/vim-repeat'
"Plugin 'matchit.zip'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-endwise'
"Plugin 'craigemery/vim-autotag'
"Plugin 'berdandy/AnsiEsc.vim'
Plugin 'bling/vim-airline'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'dbext.vim'
Plugin 'git://github.com/nono/vim-handlebars.git'

"Plugin 'git://github.com/python-rope/ropevim.git'
" Color schemes
"Plugin 'flazz/vim-colorschemes'
"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-erlang/vim-erlang-runtime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set number
set ignorecase
set smartcase
set laststatus=2
syntax on
let mapleader = ','
"highlight Pmenu ctermbg=238 gui=bold

let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap <Leader><Leader>s <Plug>(easymotion-s)
" Word find motion
nmap <Leader><Leader>w <Plug>(easymotion-w)

" tagbar
nmap <F8> :TagbarToggle<CR>
" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap <Leader><Leader>s <Plug>(easymotion-s)
" Word find motion
nmap <Leader><Leader>w <Plug>(easymotion-w)

" NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
nmap <Leader>q :CtrlP<CR>

" Paste mode
set pastetoggle=<F2>

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$']

py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" dbext
let g:dbext_default_profile_clickavia = 'type=MYSQL:user=root:passwd=root:dbname=clickavia_development'


"------------Start Python PEP 8 stuff----------------
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
set foldlevelstart=20

let g:pydiction_location = '/Users/homer/.vim/bundle/Pydiction/complete-dict'
au FileType python setl cc=80
"----------Stop python PEP 8 stuff--------------

"----------Start ruby---------------------------
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"----------Stop ruby----------------------------
au FileType javascript setl sw=2 ts=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType ruby setl cc=120
au FileType coffee setl sw=2 sts=2 et

autocmd FileType html setlocal ts=4 sts=4 sw=4 et
autocmd FileType css setlocal ts=2 sts=2 sw=2 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

set backspace=indent,eol,start
cmap w!! w !sudo tee % >/dev/null
