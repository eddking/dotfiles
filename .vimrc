execute pathogen#infect()
syntax on
filetype plugin indent on

" -------------------------------------
" color scheme
" -------------------------------------
set background=dark
colorscheme solarized

" -------------------------------------
" Basic re-mapping
" -------------------------------------
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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" -------------------------------------
" Nerd Tree!
" -------------------------------------
:nmap \a :NERDTreeToggle<CR>

" -------------------------------------
" Supertab
" -------------------------------------
 let g:SuperTabDefaultCompletionType = 'context'

" -------------------------------------
" Auto Complete Pop Up -- Intergration with Eclim
" -------------------------------------
let g:acp_behaviorJavaEclimLength = 3
function MeetsForJavaEclim(context)
    return g:acp_behaviorJavaEclimLength >= 0 &&
            \ a:context =~ '\k\.\k\{' . g:acp_behaviorJavaEclimLength . ',}$'
  endfunction
  let g:acp_behavior = {
      \ 'java': [{
        \ 'command': "\<c-x>\<c-u>",
        \ 'completefunc' : 'eclim#java#complete#CodeComplete',
        \ 'meets'        : 'MeetsForJavaEclim',
      \ }]
    \ }

" -------------------------------------
" Eclim
" -------------------------------------
"let g:EclimJavaSearchSingleResult = 'tabnew'
":nmap <C-1> :JavaCorrect<CR>
":nmap <C-S-F> :JavaFormat<CR>
":nmap <C-I> :JavaSearchContext<CR>
":nmap <C-S-T> :JavaSearch 

