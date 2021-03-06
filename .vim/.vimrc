" Thanks:
"  Tim Pope
"  Gmarik
"  Mislav Marohnić
"  Other
"

"NeoBundle Scripts-----------------------------
if &compatible
 set nocompatible               " Be iMproved
endif
"
"  " Required:
set runtimepath^=/Users/aniket/.vim/bundle/neobundle.vim/
"
" Required:
call neobundle#begin(expand('/Users/aniket/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
"
" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'ddollar/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tomasr/molokai'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-git'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-surround'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'szw/vim-maximizer'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'godlygeek/tabular'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'mmozuras/vim-whitespace'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'vim-scripts/SyntaxRange'
NeoBundle 'tpope/vim-tbone'
NeoBundle 'ap/vim-css-color'
NeoBundle 'groenewege/vim-less'
NeoBundle 'matze/vim-move'
NeoBundle 'craigemery/vim-autotag'
NeoBundle 'ngmy/vim-rubocop'


" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"

" Colorscheme
set background=dark
colorscheme hybrid

" Basic setup ---------------------------------------------
syntax enable                     " syntax highlighting
set number                        " show line numbers
set numberwidth=5
set ruler                         " show the cursor position all the time
"set cursorline                    " highlight current line
set title                         " show file in titlebar
filetype plugin indent on         " enable loading indent file for filetype
set encoding=utf-8                " set default encoding to UTF-8
set history=200                   " keep 1000 lines of command line history
let mapleader = ","
set mouse=a                       " automatically enable mouse usage
set mousehide                     " hide the mouse cursor while typing
set textwidth=80
set showcmd                       " show partial commands below the status line
set wildmenu                      " visual autocomplete for command menu
set lazyredraw                    " don't redraw while executing macros (good performance config)
set showmatch                     " show matching brackets
set autoindent                    " always set auto indenting on
set display=lastline
set scrolljump=5                  " lines to scroll when cursor leaves screen
set scrolloff=3                   " minimum lines to keep above and below cursor
set hidden
set foldenable                    " auto fold code

" Whitespace -----------------------------------------------
set nowrap                        " don't wrap text
set tabstop=2                     " tab spacing
set softtabstop=2                 " unify
set shiftwidth=2                  " indent/outdent by 2 columns
set expandtab                     " use spaces instead of tabs
set smarttab                      " use tabs at the start of a line, spaces elsewhere
set backspace=indent,eol,start    " backspace through everything in insert mode
set list                          " show invisible characters
set nojoinspaces                  " Use only 1 space after "." when joining lines, not 2

" Movement
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" Auto-reload buffers when file changed on disk
set autoread

" Disable swap files; systems don't crash that often these days
set updatecount=0

" Indicator chars
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮
set showbreak=↪\

" Searching -----------------------------------------------
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " unless they contain at least one capital letter
set gdefault                      " have :s///g flag by default on

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=100

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*,*/solr/*,*/coverage/*,*/features/*,*/public/uploads/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

" Backup and swap files ------------------------------------
set nobackup                      " turn backup off, since most stuff is in SVN, Git etc anyway...
set nowb
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow

" Easy edit/open commands ----------------------------------
command EditVim  :edit   ~/.vimrc
command EditBash :edit   ~/.bashrc

if has("statusline") && !&cp
  set laststatus=2              " always show the status bar
  set statusline=%f\ %m\ %r     " filename, modified, readonly
  set statusline+=%{fugitive#head()}
  set statusline+=\ %l/%L[%p%%] " current line/total lines
  set statusline+=\ %v[0x%B]    " current column [hex char]
endif

" The silver searcher (Faster than the ack)
" Invoke ag using ack.vim
if executable("ag")
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --nogroup --nocolor --column'
  let g:agprg="ag --column"

  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" CtrlP settings
let g:ctrlp_use_caching       = 0
let g:ctrlp_switch_buffer     = 0
let g:ctrlp_working_path_mode = 0

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tmux settings
if $TMUX == ''
  set clipboard+=unnamed
endif

" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

nnoremap \ :Ack<SPACE>

" NERDTree settings
let g:NERDTreeHijackNetrw=0
let g:nerdtree_tabs_open_on_console_startup=1
map <Leader>n :NERDTreeToggle<CR>

" Disable 'Entering Ex mode'
map Q <Nop>
map gs <Nop>

" yank to system clipboard
map <leader>y "*y

" paste lines from unnamed register and fix indentation
nmap <leader>p pV`]=
nmap <leader>P PV`]=

" expand %% to current directory in command-line mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=80
endfunction

if has("autocmd")
  " Avoid showing trailing whitespace when in insert mode
  au InsertEnter * :set listchars-=trail:·
  au InsertLeave * :set listchars+=trail:·

  " In Makefiles, use real tabs, not tabs expanded to spaces
  au FileType {make,gitconfig} set noexpandtab

  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript

  " Better commit message
  au Filetype gitcommit setlocal spell textwidth=72

  " For all text files set 'textwidth' to 80 characters.
  au Filetype text setlocal textwidth=80

  " Enable spellchecking for Markdown
  "au FileType markdown setlocal spell

  au FileType javascript,css,ruby,rake,erb nmap <silent> ,; :call cosco#commaOrSemiColon()<CR>
  au FileType javascript,css,ruby,rake,erb inoremap <silent> ,; <ESC>:call cosco#commaOrSemiColon()"<CR>a
endif

" Mappings
map <Leader>rrt :!ctags --extra=+f -R *<CR><CR>

map <c-a> ggVG

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" find Git merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Toggle hlsearch with <leader>hs
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" vim-maximizer (Zoom)
noremap <Leader>zw :MaximizerToggle<CR>
vnoremap <Leader>zw :MaximizerToggle<CR>gv
inoremap <Leader>zw <C-o>:MaximizerToggle<CR>

" TagbarToggle
map <Leader>rt :TagbarToggle<cr>

" disable cursor keys in normal mode
map <Left>  :echoe "Use h"<cr>
map <Right> :echoe "Use l"<cr>
map <Up>    :echoe "Use k"<cr>
map <Down>  :echoe "Use j"<cr>

"Bubble single lines
"nmap <C-k> [e
"nmap <C-j> ]e

"Bubble multiple lines
"vmap <C-k> [egv
"vmap <C-j> ]egv

"Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"Map Control-# to switch tabs
map  <C-0> 0gt
imap <C-0> <Esc>0gt
map  <C-1> 1gt
imap <C-1> <Esc>1gt
map  <C-2> 2gt
imap <C-2> <Esc>2gt
map  <C-3> 3gt
imap <C-3> <Esc>3gt
map  <C-4> 4gt
imap <C-4> <Esc>4gt
map  <C-5> 5gt
imap <C-5> <Esc>5gt
map  <C-6> 6gt
imap <C-6> <Esc>6gt
map  <C-7> 7gt
imap <C-7> <Esc>7gt
map  <C-8> 8gt
imap <C-8> <Esc>8gt
map  <C-9> 9gt
imap <C-9> <Esc>9gt

noremap <F5> :UndotreeToggle<cr>

" In command-line mode, C-a jumps to beginning (to match C-e)
cnoremap <C-a> <Home>

" Fix constant spelling mistakes
iab Acheive    Achieve
iab acheive    achieve
iab Alos       Also
iab alos       also
iab Aslo       Also
iab aslo       also
iab Becuase    Because
iab becuase    because
iab Bianries   Binaries
iab Charcter   Character
iab charcter   character
iab Charcters  Characters
iab charcters  characters
iab Seperate   Separate
iab seperate   separate

"insert and remove comments in visual and normal mode
vmap ,ic :s/^/#/g<CR>:let @/ = ""<CR>
map  ,ic :s/^/#/g<CR>:let @/ = ""<CR>
vmap ,rc :s/^#//g<CR>:let @/ = ""<CR>
map  ,rc :s/^#//g<CR>:let @/ = ""<CR>

" Local config
"if filereadable($HOME . "/.vimrc.local")
  "source ~/.vimrc.local
"endif
