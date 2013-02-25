execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd vimenter * NERDTree

" color scheme
set background=dark
colorscheme solarized

" make vim move into wrapped lines, not around them
:nmap j gj
:nmap k gk

" search hilighting
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \q :nohlsearch<CR>
