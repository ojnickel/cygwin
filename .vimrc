set magic
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

set modifiable
set cursorline
set cursorcolumn
"hi CursorLine   cterm=underline
"hi CursorLine    cterm=none ctermbg=grey
hi CursorColumn   ctermbg=white ctermfg=black

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" set mapleader
let mapleader = "-"

" exit
nmap <leader>q :qa!<CR>
" save
nmap <leader>w :w<CR>
" save and quit all?
nmap <leader>x :xa<CR>


set nocompatible
filetype off
set number
syntax enable
set laststatus=2

" indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=2   " in insert mode, tabs are 4 spaces

" Plugs will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
 
Plug 'wsdjeg/vim-fetch'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/syntastic'
Plug 'yggdroot/indentline'
" git
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'enricobacis/vim-airline-clock'
"Plug 'valloric/youcompleteme'
" -- Web Development
Plug 'sheerun/vim-polyglot'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shutnik/jshint2.vim'
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'php', 'html'] }
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'digitaltoad/vim-jade'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-haml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" List ends here. Plugs become visible to Vim after this call.
call plug#end()
" Now we can turn our filetype functionality back on
filetype plugin indent on

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme atom
"set background=light
"colorscheme one
set background=dark
"colorscheme solarized8
colorscheme gruvbox
"colorscheme molokai
"set background=light
"colorscheme scheakur

"Airline Theme
let g:airline_theme='sol'

let g:cssColorVimDoNotMessMyUpdatetime = 1

" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set guifont=DroidSansMonoPLNerd:h12
set encoding=utf-8
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts=1
" fugitive shortcuts
 " nnoremap <leader>gs :Gstatus<CR>
 nnoremap fg :Gstatus<CR>
  nnoremap <leader>gc :Gcommit -v -q<CR>
  nnoremap <leader>ga :Gcommit --amend<CR>
  nnoremap <leader>gt :Gcommit -v -q %<CR>
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>ge :Gedit<CR>
  nnoremap <leader>gr :Gread<CR>
  nnoremap <leader>gw :Gwrite<CR><CR>
  nnoremap <leader>gl :silent! Glog<CR>
  nnoremap <leader>gp :Ggrep<Space>
  nnoremap <leader>gm :Gmove<Space>
    nnoremap <leader>gb :Git branch<Space>
  nnoremap <leader>go :Git checkout<Space>
  nnoremap <leader>gps :Dispatch! git push<CR>
  nnoremap <leader>gpl :Dispatch! git pull<CR>



" wait for mapkeys
set notimeout
set nottimeout

" expander for emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"tabs
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

nmap <leader>d :bdelete<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

let g:user_emmet_settings = {
  \  'css' : {
  \    'extends' : 'css',
  \    'filters' : 'fc',
  \    'snippets' : {
  \             'mqm': "@media screen and (min-width:${1}) {\n\t|\n}",
  \    		'mqx': "@media screen and (max-width:${1}) {\n\t|\n}",
  \    		'mqmx': "@media screen and (min-width:${1}) and (max-width:${1}) {\n\t|\n}",
  \    		'by': "body {\n\t${1} |\n}",
  \	},
  \
  \  },
  \}

if &diff
    nnoremap <leader>p [c
    nnoremap <leader>n ]c
endif

set mouse=a
"mouse for NERDTree
let g:NERDTreeMouseMode=3 

"auto start NEDTree
"autocmd vimenter * NERDTree
"" Jump to the main window.
"autocmd VimEnter * wincmd p
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"switching panels in NERDtree
"cycle
noremap <F9> <C-w><C-w> 
"right
noremap <leader>k <C-w><C-l>
"left
noremap <leader>j <C-w><C-h>

nnoremap <leader><Up>    <C-w>+
nnoremap <leader><Down>  <C-w>-
nnoremap <leader><Left>  <C-w><
nnoremap <leader><Right> <C-w>>

"autoccompletion
set omnifunc=htmlcomplete#CompleteTags
"|-> for html css w/o pressing c-x  or c-o
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"default window size
let g:NERDTreeWinSize=20
let NERDTreeMinimalUI=1
