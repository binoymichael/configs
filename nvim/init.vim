set shell=/bin/bash
let mapleader = ","


" With :set hidden, opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set hidden
syntax on
set re=1

set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off
call plug#begin()
Plug 'sjbach/lusty'
Plug 'christoomey/vim-tmux-navigator'
Plug 'icymind/NeoSolarized'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
call plug#end()

set background=dark
colorscheme NeoSolarized

" Lusty leaders
map <leader>f :LustyFilesystemExplorerFromHere<CR>
map <leader>b :Buffers<CR>
map <leader>h :LustyFilesystemExplorer<CR>
map <leader>j :LustyJuggler<CR>

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set cursorline
set ruler

set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch
set relativenumber  " show relative line numbers
set number  " show relative line numbers
set ignorecase      " ignore case when searching 

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

set wildignore+=*/.git/*,*/vendor/*,*/sdk/*,*node_modules/*
set wildmode=longest,list,full
set wildmenu

map <leader>g :Files<CR>
map <leader>a :Ag 

:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i
noremap <C-1> 1gt
noremap <C-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt
noremap <D-9> 10gt
noremap <D-S-right> gt
noremap <D-S-left> gT

" font
set gfn=Monaco:h14
set guifont=Monaco:h14

nmap Y vg_"*y
nnoremap / /\v
vnoremap / /\v

set showmatch
set wrap
set textwidth=79
set formatoptions=qrn1
set cmdheight=2
set wildcharm=<Tab>

nnoremap <leader><space> :noh<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>y vi""+y
map <leader>m /\(<CR>cib
map <leader>n :e <C-r>%

" Vertical split 
map <leader>v :vs<CR><C-w>w

" quickly open files
map <leader>x :e /Users/bprakash/notes/<CR>

nmap <c-s> :lcd %:p:h<CR> " set home directory as the currently opened file

" hashrocket in insert mode
imap <d-j> =>
set guioptions-=e

let g:taboo_tab_format = " %N %a"
set tags=./.tags,.tags

let g:ale_completion_enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\    'typescript': ['prettier'],
\}

let g:ale_javascript_prettier_options = '--single-quote --jsx-single-quote --trailing-comma es5'

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
endif

" Move between split panes
nmap <silent> <C-l> <C-w>w

map <leader>t :BTags<CR>

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
map <Leader>r :call RunNearestSpec()<CR>


set mouse=a

:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

map <leader>z :e /Users/bprakash/.config/nvim/init.vim<CR>
map <leader>e :Gblame<CR>

map  <Leader><Leader>w <Plug>(easymotion-bd-w)


function! Meow()
  execute 'normal! gv'
  execute 'normal! "bd'
  call inputsave()
  let key = input('>')
  let @a = "_.t('".key."')"
  call inputrestore()
  let o = key.": ".getreg('b')
  new
  setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
  put=o
  execute 'w >>' '~/hello.txt'
  q
  execute 'normal! "aP'
endfunction

function! MeowHtml()
  execute 'normal! gv'
  execute 'normal! "bd'
  call inputsave()
  let key = input('>')
  let @a = "<%= _.t('".key."') %>"
  call inputrestore()
  let o = key.": '".getreg('b')."'"
  new
  setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
  put=o
  execute 'w >>' '~/hello.txt'
  q
  execute 'normal! "aP'
endfunction

function! MeowClass()
  execute 'normal! gv'
  execute 'normal! "bd'
  call inputsave()
  let key = input('>')
  let @a = key
  call inputrestore()
  let o = key.": '".getreg('b')."'"
  new
  setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
  put=o
  execute 'w >>' '~/hello.txt'
  q
  execute 'normal! "aP'
endfunction

function! MeowReact()
  execute 'normal! gv'
  execute 'normal! "bd'
  call inputsave()
  let key = input('>')
  let @a = "{_.t('".key."')}"
  call inputrestore()
  let o = key.": '".getreg('b')."'"
  new
  setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted
  put=o
  execute 'w >>' '~/hello.txt'
  q
  execute 'normal! "aP'
endfunction

"map <leader>s :call Meow()<CR>
"map <leader>d :call MeowHtml()<CR>
"map <Leader>r :call MeowReact()<CR>
"map <Leader>k :call MeowClass()<CR>
"highlight String ctermfg=Red cterm=underline
"function Rubyfmt()
  "echo "Calling rubyfmt"
  "silent exec("!ruby --disable=gems ~/bin/rubyfmt.rb -i " . expand("%"))
  "silent exec("edit " . expand("%"))
"endfunction


let g:prettier#config#config_precedence = 'file-override'
map <leader>s :ALEFix<CR>
map <leader>d :ALEHover<CR>
"map <Leader>r :call Rubyfmt()<CR>
