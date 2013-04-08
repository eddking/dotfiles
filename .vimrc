execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd vimenter * NERDTree

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
