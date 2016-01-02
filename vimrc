set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'

Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'itspriddle/vim-jquery'
Plugin 'vim-scripts/TagHighlight'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tpope/vim-repeat'
Plugin 'matchit.zip'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'craigemery/vim-autotag'
Plugin 'berdandy/AnsiEsc.vim'
Plugin 'bling/vim-airline'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'dbext.vim'

Plugin 'git://github.com/python-rope/ropevim.git'
" Color schemes
Plugin 'flazz/vim-colorschemes'
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
set laststatus=2
syntax on
let mapleader = ','
highlight Pmenu ctermbg=238 gui=bold

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

" NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
nmap <Leader>q :CtrlP<CR>

" neocomplcache
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" syntastic
let g:syntastic_enable_ruby_checker = 1
let g:syntastic_enable_python_checker = 1
let g:syntastic_python_checkers = ['flake8']

" dbext
let g:dbext_default_profile_clickavia = 'type=MYSQL:user=root:passwd=root:dbname=clickavia_development'

au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et

set backspace=indent,eol,start
colorscheme molokai
