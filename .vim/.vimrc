set nocompatible        " Must be first line

filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()

" -------------------------------------
" Bundles
" -------------------------------------
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'altercation/vim-colors-solarized'
Bundle 'spf13/vim-colors'
Bundle 'tpope/vim-surround'
Bundle 'spf13/vim-autoclose'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mbbill/undotree'
Bundle 'myusuf3/numbers.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/restore_view.vim'
Bundle 'mhinz/vim-signify'
Bundle 'tpope/vim-abolish.git'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
Bundle 'matchit.zip'
Bundle 'mileszs/ack.vim'
Bundle 'SirVer/ultisnips'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'Valloric/YouCompleteMe'

Bundle 'eddking/eclim-vundle'

" --- Python bundles
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

" --- Javascript bundles
Bundle 'elzr/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'
Bundle 'kchmck/vim-coffee-script'

" --- Haskell bundles
Bundle 'travitch/hasksyn'
Bundle 'dag/vim2hs'
Bundle 'Twinside/vim-haskellConceal'
Bundle 'lukerandall/haskellmode-vim'
Bundle 'ujihisa/neco-ghc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc' " Requires compiling: cd ~/.vim/bundle/vimproc && make
Bundle 'adinapoli/cumino'
Bundle 'bitc/vim-hdevtools'

" --- HTML bundles
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-haml'

" --- Ruby bundles
Bundle 'tpope/vim-rails'

" --- Go bundles
Bundle 'jnwhiteh/vim-golang'
Bundle 'spf13/vim-gocode'

" --- Misc lang bundles
Bundle 'tpope/vim-markdown'
Bundle 'spf13/vim-preview'
Bundle 'tpope/vim-cucumber'
Bundle 'Puppet-Syntax-Highlighting'


" --- Bundles with external dependencies
if (has("python") || has("python3")) 
    Bundle 'Lokaltog/powerline', {'rtp':'/powerline/bindings/vim'}
endif

if executable('ctags')
    Bundle 'majutsushi/tagbar'
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
set foldenable                  " Auto fold code
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
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>           " pastetoggle

"Strip trailing whitespace when writing files
autocmd FileType c,cpp,java,go,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer>  call StripTrailingWhitespace()

"Auto format go files before writing
autocmd FileType go autocmd BufWritePre <buffer> Fmt

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


let g:Powerline_symbols = 'fancy'

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

" ------------------------------------    -
" Eclim
" -------------------------------------
let g:EclimJavaSearchSingleResult = 'tabnew'
let g:EclimValidateSortResults = 'severity'
let g:EclimLogLevel = 2
let g:EclimSignLevel = 3
let g:EclimLocateFileFuzzy = 0
let g:EclimCompletionMethod = 'omnifunc'
" caps lock key is mapped to § using PCKeyboardHack
nmap §1 :JavaCorrect<CR>
nmap §f :JavaFormat<CR>
nmap §g :JavaSearchContext<CR>
nmap §i :JavaImport<CR>
nmap §o :JavaImportOrganize<CR>
nmap §d :JavaDocPreview<CR>
nmap §c :JavaRename
nmap §t :JavaSearch
nmap §r :LocateFile<CR>
nmap §n :lnext<CR>
nmap §p :lprev<CR>
nmap §q :lclose<CR>

" -------------------------------------
" NerdTree
" -------------------------------------
let g:NERDTreeWinSize = 50
let g:NERDShutUp=1

map \a :NERDTreeToggle<CR>:NERDTreeMirror<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>

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
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
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
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

" -------------------------------------
" Session List
" -------------------------------------

set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
nmap <leader>sl :SessionList<CR>
nmap <leader>ss :SessionSave<CR>

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

let g:pymode_lint_checker = "pyflakes"
let g:pymode_utils_whitespaces = 0
let g:pymode_options = 0

" Disable if python support not present
if !has('python')
    let g:pymode = 1
endif

" -------------------------------------
" UndoTree
" -------------------------------------

nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

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
" YankRing 
" -------------------------------------
nnoremap <silent> §y :YRShow<CR>
let g:yankring_replace_n_pkey = '§['
let g:yankring_replace_n_nkey = '§]'

" -------------------------------------
" Haskell Mode
" -------------------------------------

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

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
