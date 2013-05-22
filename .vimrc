execute pathogen#infect()
syntax on
filetype plugin indent on

" color scheme
set background=dark
colorscheme solarized

" disable the nav keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" map esc to kj
inoremap kj <Esc>

" search hilighting
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>

" indent with spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Nerd Tree!
:nmap \a :NERDTreeToggle<CR>

" Supertab
 let g:SuperTabDefaultCompletionType = 'context'

" Eclim

