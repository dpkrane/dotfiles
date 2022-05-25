"безобразный конфиг, франкенштейн из множества кусков.
" Когда-нибудь все будет \"причесано\" и задокументировано должным образом
syntax enable
syntax sync minlines=256
filetype on
filetype plugin indent on    " required
set t_Co=256
set encoding=utf-8
set nocompatible
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16 "Это light версия
set hlsearch
set incsearch
"set inccommand=split
set mousehide
set mousemodel=popup
set mouse=a
set scrolloff=7
set showtabline=1
set number
set ruler
set formatoptions+=j
set backspace=indent,eol,start whichwrap+=<,>,[,]
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set colorcolumn=80
set nobackup
set noswapfile
set fileformat=unix
set encoding=utf-8
set termencoding=utf-8
set foldmethod=indent
set foldlevel=99
set clipboard=unnamedplus,unnamed
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set wildmode=list:full
set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching
set guioptions-=m  " remove menu bar
set guioptions-=T   " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L " убираем полосы прокрутки слева
set guioptions-=R
set guioptions-=l
set switchbuf=useopen
set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)
set wrap linebreak nolist "Данная вариация работает как wrap...
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
set fillchars=stl:\ ,stlnc:\ ,vert:│
set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
set regexpengine=1
set ttimeout ttimeoutlen=0 notimeout " Disable timeout for Esc key
set ttyfast " Optimize for fast terminal connections
set lazyredraw
set noshowcmd
set foldmethod=marker
set wildmenu " Turn on the Wild menu
set display+=lastline " Display lastline instead of @
set noerrorbells visualbell t_vb= " No annoying sound on errors
autocmd BufWrite *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"if empty(glob('~/.vim/autoload/plug.vim')) "Если vim-plug не стоит
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs "Создать директорию
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  "И скачать его оттуда
"  "А после прогнать команду PlugInstall, о которой мы сейчас поговорим
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"
"call plug#begin('~/.vim/bundle') "Начать искать плагины в этой директории
"Plug 'lyokha/vim-xkbswitch'
"call plug#end() "Перестатьэто делать
"
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0
"
"let g:XkbSwitchEnabled = 1 "только для ГУЙев
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'dense-analysis/ale'
Plug 'jpalardy/vim-slime'
Plug 'tpope/vim-fugitive'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'kaicataldo/material.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'challenger-deep-theme/vim'
Plug 'Yggdroot/indentLine'
Plug 'hashivim/vim-terraform'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

"colorscheme gruvbox
"colorscheme OceanicNext
"colorscheme material
"colorscheme ayu
"colorscheme sublimemonokai
set termguicolors
set background=dark
colorscheme challenger_deep

let g:airline_theme= 'base16'
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:indentLine_char = '┊'
let g:slime_python_ipython = 1
let g:slime_dont_ask_default = 1
let g:slime_paste_file = '~/.slime_paste'
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
" --- Python ---
let python_highlight_all=1
let python_slow_sync=1
"=====================================================
" Python-mode settings
"=====================================================
" Python-mode
" Activate rope
" Keys:
" K Show python docs:ew
" <Ctrl-Space> Rope autocomplete
" <Ctrl-c>g Rope goto definition
" <Ctrl-c>d Rope show documentation
" <Ctrl-c>f Rope find occurrences
" <Leader>b Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[ Jump on previous class or function (normal, visual, operator modes)
" ]] Jump on next class or function (normal, visual, operator modes)
" [M Jump on previous class or method (normal, visual, operator modes)
" ]M Jump on next class or method (normal, visual, operator modes)
let g:ale_linters = {'python':['flake8']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python':['black','isort']}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay=0
let g:ale_python_flake8_args="--ignore=E501,C901,E121"
let g:ale_python_flake8_options="--ignore=E501,E228,E226,E261,E266,E128,E402,W503,E722 --max-line-length=248"
"Для tmux
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
"Для обычного Вима
"let g:slime_target = "vimterminal"
"#let g:pymode_rope = 0
"#" Documentation
"#let g:pymode_doc = 0
"#let g:pymode_doc_key = 'K'
"#" Linting
"#let g:pymode_lint = 0
"#let g:pymode_lint_checkers = 'pylint,pep8,pyflakes'
"#let g:pymode_lint_cwindow = 1
"#let g:pymode_lint_ignore="E501,W601,C0110,C0111"
"#let g:pymode_lint_write = 0
"#" Support virtualenv
"#let g:pymode_virtualenv = 1
"#" Enable breakpoints plugin
"#let g:pymode_breakpoint = 1
"#let g:pymode_breakpoint_key = '<F7>'
"#" Syntax highlighting
"#let g:pymode_syntax = 1
"#let g:pymode_syntax_all = 1
"#let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"#let g:pymode_syntax_space_errors = g:pymode_syntax_all
"#" Don't autofold code
"#let g:pymode_folding = 0
"#" Get possibility to run Python code
"#let g:pymode_run = 1
"#" Other options
"#let g:pymode_options_colorcolumn = 0
" CTRL-Z is Undo
noremap <C-z> u
inoremap <C-z> <C-O>u
" CTRL-Y is Redo
noremap <C-y> <C-R>
inoremap <C-y> <C-O><C-R>
" CTRL-A is Select all
noremap <C-a> gggH<C-O>G
inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-a> <C-C>gggH<C-O>G
onoremap <C-a> <C-C>gggH<C-O>G
snoremap <C-a> <C-C>gggH<C-O>G
xnoremap <C-a> <C-C>ggVG
" CTRL-S is Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>
nmap <F1> <nop>                 " unmap <F1> with help
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory
nmap <F2> :set list!<CR>
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
map <F4> <Plug>MarkdownPreviewToggle
