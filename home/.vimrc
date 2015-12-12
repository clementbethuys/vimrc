" necessary setting for vundle
set nocompatible

" necessary for not disturbing vundle, will be set again after vundle init
filetype off

" load Vundle, and vundle manage vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'

" use editorconfig settings
Bundle 'editorconfig/editorconfig-vim'

" librairy used by many plugins
Bundle 'L9'

" git wrapper plugin
Bundle 'tpope/vim-fugitive'
" check syntax error for various languages
" Bundle 'Syntastic'

" good setup for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" allow quick comments using _
Bundle 'tComment'

" show all leader keys
Bundle 'ktonga/vim-follow-my-lead'

" better json handling and highlight
Bundle 'elzr/vim-json'

" multiple cursor like sublime using ^n
Bundle 'terryma/vim-multiple-cursors.git'

" syntax highligh for dockerfile
Bundle 'ekalinin/Dockerfile.vim'

" colorize trailing white spaces
Bundle 'bronson/vim-trailing-whitespace.git'

" colorize brackets with differents colors
Bundle 'rainbow_parentheses.vim'
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" nerdtree settings
Bundle 'scrooloose/nerdtree.git'
" set nerdtree to the current directory
set autochdir

" allow to toggle nerdtree with F7
map <F7> :NERDTreeToggle<CR>

" render nerdtree independant to tabs, like a true panel
Bundle 'jistr/vim-nerdtree-tabs'

" active nerdtree at startup, I prefer to disable
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" show git diff in the gutter
Bundle 'airblade/vim-gitgutter'
" enable gitgutter at start

autocmd VimEnter * GitGutterEnable
let g:gitgutter_enabled = 1

" less aggressive git gutter, no lags
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" try to update gutter every 750ms
set updatetime=750

" vim status bar at the bottom
Bundle 'Lokaltog/vim-powerline'
" fixing unicode symbol on mac for status bar
let g:Powerline_symbols = 'unicode'

" display a panel with functions and variables, usefull for programming
Bundle 'majutsushi/tagbar'
" needs to install ctags, 'brew install ctags'

" toggle tagbar using F8
nmap <F8> :TagbarToggle<CR>
let g:SuperTabDefaultCompletionType = "context"

" uncomment to enable tagbar at startup
" autocmd VimEnter * nested :TagbarOpen

" allow to easily align using <>=
Bundle 'Align'

" allow to easily change surrending quotes or anything
Bundle 'surround.vim'

" fuzzy path searching, like sublime text
Bundle 'ctrlp.vim'

" snipet integration with vim TODO
Bundle 'snipMate'

" complete all C based languages
Bundle 'Valloric/YouCompleteMe'

" this need the following intalling './install.sh --clang-completer'
let g:acp_behaviorSnipmateLength=1

" among the best themes
Bundle 'molokai'
Bundle 'Railscasts-Theme-GUIand256color'
Bundle 'altercation/vim-colors-solarized'

" automatically close quotes, I prefer to disable it
Bundle 'delimitMate.vim'

" set the <leader> key
:let mapleader = ","

" run rspec related to the file, below the shortcuts
Bundle 'thoughtbot/vim-rspec'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" navigate between split windows with letters
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" window split a little better
set winheight=30
set winminheight=5

" resizing split window using -/+
nnoremap <silent> + :exe "resize " . (winheight(0) + 10)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) - 10)<CR>

" force .json file to be read as json
au! BufRead,BufNewFile *.json set filetype=json

" force .go file to be read as go
au BufRead,BufNewFile *.go set filetype=go

" far better go integration
Bundle 'fatih/vim-go'
Bundle 'vim-jp/vim-go-extra.git'
set rtp+=$GOROOT/misc/vim

" better highlighting for golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" add build/run shortcut for golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" add/remove unused golang import
let g:go_fmt_command = "goimports"

" sudo save
cmap w!! w !sudo tee > /dev/null %

" all the plugins must be before
call vundle#end()

" enable by filetype plugin and indent
filetype plugin indent on

" allow sharing clipboard via yy with the os
set clipboard=unnamed

" assume ruby files are chef files
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

" terminal settings
set encoding=utf-8

" search as you type
set incsearch
set showcmd
set showmatch

" display relative line numbers and cursor
set number
set relativenumber
set cursorline

" when not in copy paste auto indent by 2 spaces
set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" I mostly copy/paste quickly
set paste

" use syntax hightligh with molokai theme
syntax on

" force to use 256 color (terminal) when loading coloscheme
set t_Co=256
colorscheme mustang

" tells vim our setup so it can adapt
set background=dark
let g:solarized_termcolors=256
