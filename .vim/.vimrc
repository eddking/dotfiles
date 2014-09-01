set nocompatible        " Must be first line

filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()

" -------------------------------------
" Plugins
" -------------------------------------
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'spf13/vim-colors'
Plugin 'tpope/vim-surround'
Plugin 'spf13/vim-autoclose'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'mbbill/undotree' " I've never needed this
Plugin 'myusuf3/numbers.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-abolish.git'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'matchit.zip'
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/unite.vim'

Plugin 'eddking/eclim-vundle'

" --- Python bundles
""Plugin 'klen/python-mode'
""Plugin 'python_match.vim'
""Plugin 'pythoncomplete'

" --- Javascript bundles
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'

" --- Haskell bundles
Plugin 'travitch/hasksyn'
Plugin 'dag/vim2hs'
Plugin 'Twinside/vim-haskellConceal'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'ujihisa/neco-ghc'
" ghcmod requires: cabal install ghc-mod
Plugin 'eagletmt/ghcmod-vim'
" vimproc requires compiling: cd ~/.vim/bundle/vimproc && make
Plugin 'Shougo/vimproc'
" cumino requires tmux>1.5 :  brew install tmux
Plugin 'adinapoli/cumino'
" hdevtools requires: cabal install hdevtools
Plugin 'bitc/vim-hdevtools'

" --- HTML bundles
Plugin 'amirh/HTML-AutoCloseTag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-haml'

" --- Ruby bundles
Plugin 'tpope/vim-rails'

" --- Go bundles
Plugin 'fatih/vim-go'

" --- Misc lang bundles
Plugin 'tpope/vim-markdown'
Plugin 'spf13/vim-preview'
Plugin 'tpope/vim-cucumber'
Plugin 'Puppet-Syntax-Highlighting'

Plugin 'bling/vim-airline'

if executable('ctags')
    Plugin 'majutsushi/tagbar'
endif

" -------------------------------------
" General Config
" -------------------------------------

set shortmess+=filmnrxoOtT  " Abbrev. of messages (avoids 'hit enter')
filetype plugin indent on   " Automatically detect file types.
syntax on                   " Syntax highlighting
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set enc=utf-8
set fileencoding=utf-8

let g:UltiSnipsRemoveSelectModeMappings = 1

" switch to the current file directory
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" set what to save in vimviews, (unix & slash are compatability options)
set viewoptions=folds,options,cursor,unix,slash 

set virtualedit=onemore     " Allow for cursor beyond last character
set history=1000            " Store a ton of history (default is 20)
set nospell                 " Spell checking off :)
set hidden                  " Allow buffer switching without saving

" Set cursor to the first line when editing commit messages
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" --- Restore cursor position from previous edit session
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
autocmd!
autocmd BufWinEnter * call ResCur()
augroup END

set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload


" -------------------------------------
" UI
" -------------------------------------

if &term == 'xterm' || &term == 'screen'
    set t_Co=256       " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
endif

"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
" let g:solarized_visibility="high"
set background=dark
color solarized
colorscheme solarized



set tabpagemax=15            " Only show 15 tabs
set showmode                 " Display the current mode
set cursorline               " Highlight current line

set ruler                   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd                 " Show partial commands in status line

" status line
set laststatus=2

set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set nu                          " Line numbers on

set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set nofoldenable  " turned off code folding for now
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" -------------------------------------
" Formatting
" -------------------------------------

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join
set splitright                  " Puts new vsplit windows to the right of the current
"set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " pastetoggle

"Strip trailing whitespace when writing files
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer>  call StripTrailingWhitespace()

" specific formatting for haskell - this may go in a plugin in future
autocmd FileType haskell setlocal expandtab shiftwidth=2 softtabstop=2

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell setlocal nospell



autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" -------------------------------------
" Make Pretty
" -------------------------------------

" Italics are dependent on getting an in depelopment version of iTerm and changing
" terminfo. Im using iTerm sha: b3242cc and terminfo from this gist:
" https://gist.github.com/sos4nt/3187620     ... works like a charm
highlight Comment cterm=italic ctermbg=8 ctermfg=10

" Highlight trailing whitespace in a less glaring fashion
""highlight ExtraWhitespace ctermbg=8 ctermfg=13
""autocmd VimEnter,ColorScheme * :hi ExtraWhitespace 
" Show trailing whitespace:
":match ExtraWhitespace /\s\+$/
"set listchars=tab:›\ ,trail:.,extends:#,nbsp:. " :Highlight problematic whitespace

"make the gitgutter background match"
highlight SignColumn ctermbg=0

"make the tildas on empty lines invisible
hi NonText cterm=NONE ctermbg=8 ctermfg=8

let g:airline_powerline_fonts = 1

autocmd FileType java call Java_Config()

function Java_Config()
    setlocal foldmethod=expr
    setlocal foldexpr=Java_Folding(v:lnum)
endfunction

function! Java_Folding(lnum)
    let line = getline(a:lnum)
    if line =~ '\v^\s*$'
        return '-1'
    elseif line =~ '\v^import\s+.*'
        if line =~ '\v^import\s+static\s+.*' "dont fold static imports
            return '0'
        endif
        return 1
    endif
    return '0'
endfunction

" -------------------------------------
" (Re)Mapping
" -------------------------------------

let mapleader = ','

" disable the nav keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" map esc to kj
inoremap kj <Esc>

" easy moving between windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" Easier switching between tabs
map <S-H> gT
map <S-L> gt

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Same for 0, home, end, etc
noremap $ g$
noremap <End> g<End>
noremap 0 g0
noremap <Home> g<Home>
noremap ^ g^

" Stupid shift key fixes
if has("user_commands")
    command! -bang -nargs=* -complete=file E e<bang> <args>
    command! -bang -nargs=* -complete=file W w<bang> <args>
    command! -bang -nargs=* -complete=file Wq wq<bang> <args>
    command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

cmap Tabe tabe

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Toggle search highlight
nmap <silent> <leader>/ :set invhlsearch<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>


" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
vnoremap . :normal .<CR>

" Fix home and end keybindings for screen, particularly on mac
map [F $
imap [F $
map [H g0
imap [H g0

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Easier horizontal scrolling
map zl zL
map zh zH

" fullscreen mode for GVIM and Terminal, need 'wmctrl' in you PATH
map <silent> <F11> :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" this causes vim to leave trailing whitespace on autoindented empty lines,
" dont worry, it gets deleted when you save. works by making an edit and then
" undoing it"
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

" Text Bubbling
nmap <C-Down> ]e
nmap <C-Up> [e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" reduce the keypresses!
nmap <leader>w :w<CR>
nmap <leader>q :bd<CR>
nmap <leader>x :x<CR>

" -------------------------------------
" Autocomplete
" -------------------------------------

if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

" Some convenient mappings
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,preview,longest


" -------------------------------------
" YouCompleteMe
" -------------------------------------
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" dont want any random buffers popping up
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" prevent interference with eclim locate buffer"
let g:ycm_filetype_blacklist = {
    \ 'locate_prompt' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'text' : 1,
\}

" -------------------------------------
" Eclim
" -------------------------------------
let g:EclimJavaSearchSingleResult = 'tabnew'
let g:EclimValidateSortResults = 'severity'
let g:EclimLogLevel = 2
let g:EclimSignLevel = 3
let g:EclimLocateFileFuzzy = 0
let g:EclimCompletionMethod = 'omnifunc'
" caps lock key is mapped to § using PCKeyboardHack
"nmap §1 :JavaCorrect<CR>
"nmap §f :JavaFormat<CR>
"nmap §g :JavaSearchContext<CR>
"nmap §i :JavaImport<CR>
"nmap §o :JavaImportOrganize<CR>
"nmap §d :JavaDocPreview<CR>
"nmap §c :JavaRename
"nmap §t :JavaSearch
"nmap §r :LocateFile<CR>
"nmap §n :lnext<CR>
"nmap §p :lprev<CR>
"nmap §q :lclose<CR>

" -------------------------------------
" NerdTree
" -------------------------------------
let g:NERDTreeWinSize = 50
let g:NERDShutUp=1

map \a :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>

let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0


" -------------------------------------
" Ctrl-P
" -------------------------------------

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f'
    \ }

" -------------------------------------
" UltiSnips
" -------------------------------------
let g:snips_author = 'Edd King <eddrollerking@gmail.com>'

let g:UltiSnipsExpandTrigger="§"
let g:UltiSnipsListSnippets="<c-§>"
let g:UltiSnipsJumpForwardTrigger="§"
let g:UltiSnipsJumpBackwardTrigger="±"

" -------------------------------------
" Unite
" -------------------------------------
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Start in insert mode
" Shorten the default update speed of 500ms
let g:unite_update_time = 200

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.commands = {
    \ 'description' : 'Commands',
    \}
" a list of interesting commands
" ⇒ denotes a non default keybinding
" ▷ denotes a default keybinding unchanged
" ▶ denotes a default keybinding that has been re-mapped to do somthing different
let g:unite_source_menu_menus.commands.command_candidates = [
    \['⇒ commands list            (Unite)                                                        ,<Space>', 'exe "normal ,\<Space>"'],
    \['⇒ buffer list              (Unite)                                                              ,b', 'exe "normal ,b"'],
    \['⇒ yank history list        (Unite)                                                              ,y', 'exe "normal ,y"'],
    \['⇒ bubble up                (Custom)                                                         <C-Up>', 'exe "normal \<C-Up>"'],
    \['⇒ bubble down              (Custom)                                                       <C-Down>', 'exe "normal \<C-Down>"'],
    \['⇒ find conflict markers    (Custom)                                                            ,fc', 'normal ,fc'],
    \['⇒ toggle highlight search  (Custom)                                                             ,/', 'normal ,/'],
    \['⇒ resize split to be equal (Custom)                                                             ,=', 'normal ,='],
    \['⇒ TagBar toggle            (TagBar)                                                            ,tt', 'normal ,tt'],
    \['⇒ format json file         (JsonTool)                                                          ,jt', 'normal ,jt'],
    \['⇒ git status               (Fugitive)                                                          ,gs', 'Gstatus'],
    \['⇒ git diff                 (Fugitive)                                                          ,gd', 'Gdiff'],
    \['⇒ git commit               (Fugitive)                                                          ,gc', 'Gcommit'],
    \['⇒ git blame                (Fugitive)                                                          ,gb', 'Gblame'],
    \['⇒ git log                  (Fugitive)                                                          ,gl', 'Glog'],
    \['⇒ git push                 (Fugitive)                                                          ,gp', 'Git push'],
    \['⇒ git pull                 (Fugitive)                                                          ,gP', 'Git pull'],
    \['⇒ git read                 (Fugitive)                                                          ,gr', 'Gread'],
    \['⇒ git write                (Fugitive)                                                          ,gw', 'Gwrite'],
    \['⇒ git edit                 (Fugitive)                                                          ,ge', 'Gedit'],
    \['⇒ git prompt               (Fugitive)                                                             ', 'exe "Git! " input("git command: ")'],
    \['⇒ diff get                 (Fugitive)                                                          ,dg', 'normal ,dg'],
    \['⇒ diff put                 (Fugitive)                                                          ,dp', 'normal ,dp'],
    \['⇒ nerd tree toggle         (NERDTree)                                                           \a', 'normal \a'],
    \['⇒ nerd tree find           (NERDTree)                                                           ,e', 'normal ,e'],
    \['⇒ add line above           (vim-unimpaired)                                               [<Space>', 'exe "normal [\<Space>"'],
    \['⇒ add line below           (vim-unimpaired)                                               ]<Space>', 'exe "normal ]\<Space>"'],
    \['⇒ quickfix next            (vim-unimpaired)                                                     ]q', 'normal ]q'],
    \['⇒ quickfix previous        (vim-unimpaired)                                                     [q', 'normal [q'],
    \['⇒ buffer next              (vim-unimpaired)                                                     ]b', 'normal ]b'],
    \['⇒ buffer previous          (vim-unimpaired)                                                     [b', 'normal [b'],
    \['⇒ coerce snake case        (vim-abolish)                                                       crs', 'normal crs'],
    \['⇒ coerce mixed case        (vim-abolish)                                                       crm', 'normal crm'],
    \['⇒ coerce camel case        (vim-abolish)                                                       crc', 'normal crc'],
    \['⇒ coerce upper case        (vim-abolish)                                                       cru', 'normal cru'],
    \['⇒ signify toggle           (Signify)                                                           ,gg', 'normal ,fc'],
    \['⇒ previous hunk            (Signify)                                                            [c', 'normal [c'],
    \['⇒ next hunk                (Signify)                                                            ]c', 'normal ]c'],
    \['▷ vertical split                                                                           :vsplit', 'vsplit'],
    \['▷ horizontal split                                                                          :split', 'split'],
    \['▷ new tab                                                                                  :tabnew', 'tabnew'],
    \['▷ record a macro                                                                                 q', 'normal q' ],
    \['▷ move forward one word                                                                          w', 'normal w' ],
    \['▷ move to the end of the next word                                                               e', 'normal e' ],
    \['▷ replace the character underneath the cursor                                                    r', 'normal r' ],
    \['▷ move forward till the next character typed                                                     t', 'normal t' ],
    \['▷ yank/copy                                                                                      y', 'normal y' ],
    \['▷ undo                                                                                           u', 'normal u' ],
    \['▷ enter insert mode                                                                              i', 'normal i' ],
    \['▷ open a new line underneath the current line                                                    o', 'normal o' ],
    \['▷ paste below or after                                                                           p', 'normal p' ],
    \['▷ append text                                                                                    a', 'normal a' ],
    \['▷ substitute the current character with text                                                     s', 'normal s' ],
    \['▷ delete                                                                                         d', 'normal d' ],
    \['▷ find the next character typed                                                                  f', 'normal f' ],
    \['▷ leader key for many motions                                                                    g', 'normal g' ],
    \['▷ move left                                                                                      h', 'normal h' ],
    \['▷ move down                                                                                      j', 'normal j' ],
    \['▷ move up                                                                                        k', 'normal k' ],
    \['▷ move right                                                                                     l', 'normal l' ],
    \['▷ lots of things                                                                                 z', 'normal z' ],
    \['▷ delete the character underneath the cursor                                                     x', 'normal x' ],
    \['▷ change                                                                                         c', 'normal c' ],
    \['▷ enter visual mode                                                                              v', 'normal v' ],
    \['▷ move back one word                                                                             b', 'normal b' ],
    \['▷ move forwards to the next matched search pattern                                               n', 'normal n' ],
    \['▷ set mark at cursor position                                                                    m', 'normal m' ],
    \['▷ enter ex mode                                                                                  Q', 'normal Q' ],
    \['▷ move forward one word by whitespace                                                            W', 'normal W' ],
    \['▷ move to the end of the next word by whitespace                                                 E', 'normal E' ],
    \['▷ enter replace mode                                                                             R', 'normal R' ],
    \['▷ backwards till                                                                                 T', 'normal T' ],
    \['▶ yank until the end of the line                                                                 Y', 'normal Y' ],
    \['▷ undo all the changes on the current line                                                       U', 'normal U' ],
    \['▷ enter insert mode at the first non whitespace character of the line                            I', 'normal I' ],
    \['▷ open a new line above current line                                                             O', 'normal O' ],
    \['▷ paste above or before                                                                          P', 'normal P' ],
    \['▷ enter insert mode at the end of the line                                                       A', 'normal A' ],
    \['▷ change the whole current line                                                                  S', 'normal S' ],
    \['▷ delete until the end of the line                                                               D', 'normal D' ],
    \['▷ backwards find                                                                                 F', 'normal F' ],
    \['▷ move the end of current file                                                                   G', 'normal G' ],
    \['▶ switch to previous tab                                                                         H', 'normal H' ],
    \['▷ join with the line below                                                                       J', 'normal J' ],
    \['▷ get the manual for the name of the shell command underneath the cursor                         K', 'normal K' ],
    \['▶ switch to next tab                                                                             L', 'normal L' ],
    \['▷ enter restricted mode                                                                          Z', 'normal Z' ],
    \['▷ delete the character before the cursor                                                         X', 'normal X' ],
    \['▷ change until the end of the line                                                               C', 'normal C' ],
    \['▷ enter visual line mode                                                                         V', 'normal V' ],
    \['▷ move backwards one word by whitespace                                                          B', 'normal B' ],
    \['▷ move forwards to the next matched search pattern                                               N', 'normal N' ],
    \['▷ move to the middle of the current window                                                       M', 'normal M' ],
    \['▷ jump to mark                                                                                   `', 'normal `' ],
    \['▷ switch the case of the character underneath the cursor and move to the right                   ~', 'normal ~' ],
    \['▷ execute a command with the shell                                                               !', 'normal !' ],
    \['▷ execute a macro                                                                                @', 'normal @' ],
    \['▷ search backwards for the word underneath the cursor                                            #', 'normal #' ],
    \['▷ move the end of the line                                                                       $', 'normal $' ],
    \['▷ move the matching bracket                                                                      %', 'normal %' ],
    \['▷ move the first non blank character of the line                                                 ^', 'normal ^' ],
    \['▷ repeat the last substitution                                                                   &', 'normal &' ],
    \['▷ search forwards for the word underneath the cursor                                             *', 'normal *' ],
    \['▷ move backwards one sentence                                                                    (', 'normal (' ],
    \['▷ move forwards one sentence                                                                     )', 'normal )' ],
    \['▷ move to the first non blank character of the line above                                        -', 'normal -' ],
    \['▷ fix indentation                                                                                =', 'normal =' ],
    \['▷ move to the first non blank character of the current line                                      _', 'normal _' ],
    \['▷ move to the first non black character of the line below                                        +', 'normal +' ],
    \['▷ lots of stuff                                                                                  [', 'normal [' ],
    \['▷ lots of stuff                                                                                  ]', 'normal ]' ],
    \['▷ move backwards one paragraph                                                                   {', 'normal {' ],
    \['▷ move forwards one paragraph                                                                    }', 'normal }' ],
    \['▷ move to the first column of the current line                                                   |', 'normal |' ],
    \['▷ move to the next match from f, t, or uppercase versions                                        ;', 'normal ;' ],
    \['▷ jump to mark                                                                                   ''', 'normal ''' ],
    \['▷ enter command mode                                                                             :', 'normal :' ],
    \['▷ set register from which to yank, delete, or paste next                                         "', 'normal "' ],
    \['▶ leader key for other commands                                                                  ,', 'normal ,' ],
    \['▷ redo the last edit                                                                             .', 'normal .' ],
    \['▷ search forwards                                                                                /', 'normal /' ],
    \['▷ shift line to the left                                                                         <', 'normal <' ],
    \['▷ shift line to the right                                                                        >', 'normal >' ],
    \['▷ search backwards                                                                               ?', 'normal ?' ],
    \['▷ move the beginning of the line                                                                 0', 'normal 0' ],
    \['▷ jump to the previous place text was inserted                                                  g;', 'normal g;' ],
    \['▷ re-select the last visual selection                                                           gv', 'normal gv' ],
    \['▷ jump to the last place jumped from                                                            ''''', 'normal ''''' ],
    \['▷ enter visual block mode without conflicting with windows paste                            ctrl-q', 'exe "normal \<ctrl-q>" '],
    \['▷ window commands                                                                           ctrl-w', 'exe "normal \<ctrl-w>" '],
    \['▷ scroll down without moving the cursor unless nessacary                                    ctrl-e', 'exe "normal \<ctrl-e>" '],
    \['▷ redo                                                                                      ctrl-r', 'exe "normal \<ctrl-r>" '],
    \['▷ jump to an older entry in the tag stack                                                   ctrl-t', 'exe "normal \<ctrl-t>" '],
    \['▷ scroll up without moving the cursor unless nessacary                                      ctrl-y', 'exe "normal \<ctrl-y>" '],
    \['▷ scroll up half a screen                                                                   ctrl-u', 'exe "normal \<ctrl-u>" '],
    \['▷ move forward in the jump list                                                             ctrl-i', 'exe "normal \<ctrl-i>" '],
    \['▷ move backwards in the jump list                                                           ctrl-o', 'exe "normal \<ctrl-o>" '],
    \['▶ Open CtrlP fuzzy search  (Ctrl-P)                                                         ctrl-p', 'exe "normal \<ctrl-p>" '],
    \['▷ increment the number underneath the cursor                                                ctrl-a', 'exe "normal \<ctrl-a>" '],
    \['▷ split the current window in two (type ctrl-w first)                                       ctrl-s', 'exe "normal \<ctrl-s>" '],
    \['▷ scroll down half a screen                                                                 ctrl-d', 'exe "normal \<ctrl-d>" '],
    \['▷ scroll forwards one page                                                                  ctrl-f', 'exe "normal \<ctrl-f>" '],
    \['▷ show the current file name                                                                ctrl-g', 'exe "normal \<ctrl-g>" '],
    \['▶ move focus to pane on the left                                                            ctrl-h', 'exe "normal \<ctrl-h>" '],
    \['▶ move focus to pane beneath                                                                ctrl-j', 'exe "normal \<ctrl-j>" '],
    \['▶ move focus to pane above                                                                  ctrl-k', 'exe "normal \<ctrl-k>" '],
    \['▶ move focus to pane on the right                                                           ctrl-l', 'exe "normal \<ctrl-l>" '],
    \['▷ suspend vim                                                                               ctrl-z', 'exe "normal \<ctrl-z>" '],
    \['▷ decrement the number underneath the cursor                                                ctrl-x', 'exe "normal \<ctrl-x>" '],
    \['▷ abort current command                                                                     ctrl-c', 'exe "normal \<ctrl-c>" '],
    \['▷ enter visual block mode                                                                   ctrl-v', 'exe "normal \<ctrl-v>" '],
    \['▷ scroll backwards one page                                                                 ctrl-b', 'exe "normal \<ctrl-b>" '],
    \['▶ select next matching with multiple cursors                                                ctrl-n', 'exe "normal \<ctrl-n>" '],
    \['▷ move to the first non blank character of the line below                                   ctrl-m', 'exe "normal \<ctrl-m>" '],
    \['▷ to back to the previously edited file                                                     ctrl-^', 'exe "normal \<ctrl-^>" '],
    \['▷ jump to tag definition                                                                    ctrl-]', 'exe "normal \<ctrl-]>" '],
    \]

nmap <silent> ,<Space> :Unite -start-insert menu:commands<CR>
nmap <silent> ,b :Unite -no-split buffer<CR>
nmap <silent> ,y :Unite history/yank<CR>

" Custom Unite settings
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()

  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
endfunction

" -------------------------------------
" TagBar
" -------------------------------------

nnoremap <silent> <leader>tt :TagbarToggle<CR>

" If using go please install the gotags program using the following
" go install github.com/jstemmer/gotags
" And make sure gotags is in your path
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" -------------------------------------
" Fugitive
" -------------------------------------

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gP :Git pull<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>

"for working with diffs
nnoremap <silent> <leader>dg :diffget<CR>
nnoremap <silent> <leader>dp :diffput<CR>
vnoremap <silent> <leader>dg :diffget<CR>
vnoremap <silent> <leader>dp :diffput<CR>

" -------------------------------------
" Signify
" -------------------------------------

nnoremap <silent> <leader>gg :SignifyToggle<CR>

" -------------------------------------
" Session List
" -------------------------------------

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
"I dont appear to have this plugin anymore..."

" -------------------------------------
" Ctags
" -------------------------------------

set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" -------------------------------------
" Auto Close Tags
" -------------------------------------

" Make it so AutoCloseTag works for xml and xhtml files as well
au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings

" -------------------------------------
" Json
" -------------------------------------

nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" -------------------------------------
" PyMode
" -------------------------------------

"let g:pymode_lint_checker = "pyflakes"
"let g:pymode_lint_on_write = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_breakpoint = 0
"let g:pymode_utils_whitespaces = 0
"let g:pymode_options = 0
"" Don't autofold code
"let g:pymode_folding = 0
"" YCM uses jedi for autocompletion
"" turn off rope completion
"let g:pymode_rope_completion = 0

"" Disable if python support not present
"if !has('python')
    "let g:pymode = 1
"endif

" -------------------------------------
" UndoTree
" -------------------------------------

""nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
""let g:undotree_SetFocusWhenToggle=1

" -------------------------------------
" Indent Guides
" -------------------------------------

" less intrusive indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=blue ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=blue ctermbg=0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1


" -------------------------------------
" Haskell Mode
" -------------------------------------

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" -------------------------------------
" Vim-Go
" -------------------------------------
let g:go_bin_path = expand("~/.go/bin")

" -------------------------------------
" Functions
" -------------------------------------


" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories, add the following to
        " your .vimrc.before.local file:
        "   let g:spf13_consolidated_directory = <full path to desired directory>
        "   eg: let g:spf13_consolidated_directory = $HOME . '/.vim/'
        if exists('g:spf13_consolidated_directory')
            let common_dir = g:spf13_consolidated_directory . prefix
        else
            let common_dir = parent . '/.' . prefix
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }

" }
