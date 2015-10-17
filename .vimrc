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
Plugin 'derekwyatt/vim-sbt'
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

colorscheme jellybeans
set t_Co=256

" NerdTree
" open
map <C-n> :NERDTreeToggle<CR>

" Close if only one file is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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

" Set the textwidth to be 100 chars
set textwidth=100

" Various characters are "wider" than normal fixed width characters, but the
" default setting of ambiwidth (single) squeezes them into "normal" width,
" which sucks. Setting it to double makes it awesome.
set ambiwidth=double

" xptemplate settings
let g:xptemplate_brace_complete = ''
let g:xptemplate_key = '<Tab>'

let mapleader = ","

" Format scala code
let g:scala_sort_across_groups=1
au BufEnter *.scala setl formatprg=java\ -jar\ $HOME/.vim/scalariform.jar\ --stdin\ --stdout\ -f\ +alignParameters
nmap <leader>f mygggqG'y
nmap <leader>m :SortScalaImports<CR>gggqG<C-o><C-o><leader><w>

" I don't want to have the default keymappings for my scala plugin evaluated
let g:scala_use_default_keymappings = 0

nnoremap ü <C-]>
nnoremap Ü <C-O>
