set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-sensible'
Plugin 'drmingdrmer/xptemplate'
Plugin 'derekwyatt/vim-scala'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'jakwings/vim-pony'

call vundle#end()
filetype plugin indent on

colorscheme jellybeans
set t_Co=256

" set window pos, size and font
if has("gui_running")
  if !exists("g:vimrcloaded")
    winpos 0 0
    if !&diff
      winsize 130 120
    else
      winsize 227 120
    endif
    let g:vimrcloaded = 1
  endif
endif

set shiftwidth=2
set softtabstop=2

" ignore case if search with lower case, case sensitive if searched with upper
" case
set ignorecase
set smartcase

" NerdTree
" open
map ä :NERDTreeToggle<CR>

" Close if only one file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Change working directory to file being loaded
set autochdir

" XPT
set runtimepath+=~/.vim/xpt-personal

" line numbers
set number

" tell vim to always display a status line
set laststatus=2

" Make command line two lines high
set ch=2

" don't display welcome
set shortmess+=I

" Sets how many lines of history VIM has to remember
set history=10

" Set to auto read when a file is changed from the outside
set autoread

" Types of files to ignore when autocompleting things
set wildignore+=*.o,*.class,*.git,*.svn

" No error bell
set vb

" No backup
set nobackup
set nowb
set noswapfile

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Don't update the display while executing macros
set lazyredraw

" Don't show the current command in the lower right corner.  In OSX, if this is
" set and lazyredraw is set then it's slow as molasses, so we unset this
set showcmd

" Various characters are "wider" than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into "normal" width,
" which sucks. Setting it to double makes it awesome.
set ambiwidth=double

" disable textwidth
set textwidth=0

" xptemplate settings
let g:xptemplate_brace_complete = ''
let g:xptemplate_key = '<Tab>'

" EasyTags
let g:home_code_dir = '/Users/bk/Development'
let g:easytags_async = 1
let g:easytags_auto_highlight = 0

let mapleader = ","

" I don't want to have the default keymappings for scala plugin evaluated
let g:scala_use_default_keymappings = 0

nnoremap ü <C-]>
nnoremap Ü <C-O>
