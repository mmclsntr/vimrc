"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin(expand('~/.vim/plugged'))

" NerdTree
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Grep
Plug 'vim-scripts/grep.vim'
" Remove whitespace
Plug 'bronson/vim-trailing-whitespace'
" Indent line
Plug 'Yggdroot/indentLine'

" Polyglot
Plug 'sheerun/vim-polyglot'

"Color Scheme
Plug 'tomasr/molokai'

" Buffer kill
Plug 'qpkorr/vim-bufkill'
" Alter command
Plug 'tyru/vim-altercmd'
" Tmux Moving
Plug 'christoomey/vim-tmux-navigator'

" ISP
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Outline view
Plug 'liuchengxu/vista.vim'

" Icon
Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin indent on

"*****************************************************************************
"" Plugin configuration
"*****************************************************************************
" fugitive
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '¦'
let g:indentLine_faster = 1

" Coc.nvim
let g:coc_global_extensions = [
            \'coc-highlight',
            \'coc-lists',
            \'coc-json',
            \'coc-git',
            \'coc-pyright',
            \'coc-go',
            \'coc-vetur',
            \'coc-tsserver',
            \'coc-sh',
            \'coc-markdownlint',
            \'coc-vimlsp',
            \'coc-explorer',
            \'coc-css',
            \'coc-html',
            \'coc-yaml'
            \]

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>fmt <Plug>(coc-format)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" coc-explorer
nnoremap <space>e :CocCommand explorer --no-toggle<CR>

" LSP
" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     "if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> gd <plug>(lsp-definition)
"     nmap <buffer> gr <plug>(lsp-references)
"     nmap <buffer> gi <plug>(lsp-implementation)
"     nmap <buffer> gt <plug>(lsp-type-definition)
"     nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
" 
"     let g:lsp_format_sync_timeout = 1000
" endfunction
" 
" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END
" 
" let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_signature_help_enabled = 1
" let g:lsp_signs_enabled = 1
" let g:lsp_diagnostics_enabled = 1
" let g:lsp_signs_error = {'text': '✗'}
" let g:lsp_signs_warning = {'text': '‼'}
" let g:lsp_signs_hint = {'text': '?'}
" let g:lsp_signs_information = {'text': 'i'}
" let g:lsp_settings = {
" \   'pyls-all': {
" \     'workspace_config': {
" \       'pyls': {
" \         'configurationSources': ['pycodestyle'],
" \      }
" \    }
" \  }
" \}

" Vista
let g:vista_default_executive = 'coc'
let g:vista_update_on_text_changed = 1
let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0


" Polyglot
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0


" Asyncomplete
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 1
"set completeopt=menuone,noinsert,noselect,preview
"let g:asyncomplete_popup_delay = 200

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
let g:nerdtree_tabs_focus_on_files=1
"let g:nerdtree_tabs_open_on_console_startup=1

" grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules __pycache__'

" bufkill
" Mappings
autocmd VimEnter * AlterCommand bun BUN
autocmd VimEnter * AlterCommand bd BD
autocmd VimEnter * AlterCommand bw BW
autocmd VimEnter * AlterCommand BD bd
autocmd VimEnter * AlterCommand BW bw
autocmd VimEnter * AlterCommand BUN bun

" Tmux Navigator
" Mappings
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <C-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <C-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <C-w>l :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>\\ :TmuxNavigatePrevious<cr>

" vim-airline
let g:airline_theme = 'papercolor'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8
set bomb
set binary
set ttyfast
set mouse-=a
set ttymouse=xterm2

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set indentexpr=

"" Map leader to ,
let mapleader=','

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" Copy/Paste/Cut
set clipboard+=unnamed

"" Buffers
set hidden
set nobackup
set noswapfile
set noundofile
set autoread

set fileformats=unix,dos,mac
set wildmenu wildmode=full

"" Set no wrap
" set nowrap

" Disable visualbell
set belloff=all
set noerrorbells

" Cursor
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set synmaxcol=320
set ruler
set number
set re=0

"" Color 256
set t_Co=256
if !exists('g:not_finish_vimplug')
    colorscheme murphy
endif

"" Scroll offset.
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

"" VirtualEdit
set virtualedit=onemore

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=1000
augroup END

augroup vimrc-highlight
  autocmd!
  autocmd Syntax * syntax sync minlines=1000
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
