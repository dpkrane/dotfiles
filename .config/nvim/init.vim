" безобразный конфиг, франкенштейн из множества кусков.
" Когда-нибудь все будет \"причесано\" и задокументировано должным образом
syntax on
syntax enable
syntax sync minlines=256
set inccommand=split

filetype indent on
filetype plugin indent on    " required
let python_highlight_all=1
 
set nocompatible
set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h16 "Это light версия
set wrap
set linebreak
set number
set hlsearch
set incsearch 
set clipboard=unnamed
set mousehide
set showtabline=1
set ruler
set formatoptions+=j


set mousemodel=popup
set backspace=indent,eol,start whichwrap+=<,>,[,]
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set fileformat=unix
set textwidth=79
set colorcolumn=80

autocmd BufWrite *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set nobackup
set noswapfile
set encoding=utf-8
set termencoding=utf-8
set mouse=a
set scrolloff=7
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set wildmenu
set wildmode=list:full

set showmatch           " show matching brackets/parenthesis
set matchtime=0         " don't blink when matching

" Hide some panels
set guioptions-=m  " remove menu bar
set guioptions-=T   " remove toolbar
set guioptions-=r  " remove right-hand scroll bar

tab sball
set switchbuf=useopen

" Use system clipboard
set clipboard=unnamedplus

call plug#begin('~/.config/nvim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'klen/python-mode'                       " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plug 'hynek/vim-python-pep8-indent'           " PEP8 indent

"colorscheme
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'kaicataldo/material.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'challenger-deep-theme/vim'
" Initialize pgin system
call plug#end()

"colorscheme gruvbox
"colorscheme OceanicNext
"colorscheme material
"colorscheme ayu
"colorscheme sublimemonokai

colorscheme challenger_deep

set background=dark
if (has('termguicolors'))
        set termguicolors
endif

let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode
let g:airline#extensions#xkblayout#enabled = 0 "Про это позже расскажу

nmap <F1> <nop>                 " unmap <F1> with help
map <F1> :NERDTreeToggle<CR>    " browse the list of files in the current directory

set guioptions= "Отключаем панели прокрутки в GUI
set showtabline=0 "Отключаем панель табов (окошки FTW)

"Сам по себе number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
"set number relativenumber "А это гибридный вариант. Протестируйте все

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам

"Предыдущий способ известен как soft wrapping
"При желании вы можете заставить Вим насильно разделять...
"... строчки в самом тексте вот так:
"set textwidth=80 "Где 80 стоит заменить на нужную вам длину строки

set cursorline "А так мы можем подсвечивать строку с курсором

set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[1 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта
"
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
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = 'pylint,pep8,pyflakes'
let g:pymode_lint_cwindow = 1
let g:pymode_lint_ignore="E501,W601,C0110,C0111"
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<F7>'

" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Get possibility to run Python code
let g:pymode_run = 0

" Other options
let g:pymode_options_colorcolumn = 0

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
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>


" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
\ --max-line-length=80'
if has('gui_running') " Глобальные настройки на GUI Vim
    set guioptions-=m " убираем меню
    " set guioptions-=e " убираем вкладки GUI делаем их как в консоли
    set guioptions-=T " убираем тулбар
    set guioptions-=r " убираем полосы прокрутки справа
    set guioptions-=L " убираем полосы прокрутки слева
    set background=light " Цвет фона темный или светлый
    set guioptions-=R
    set guioptions-=l
endif

set fillchars=stl:\ ,stlnc:\ ,vert:│

if has('multi_byte')
    if version >= 700
        set listchars=tab:»\ ,trail:·,eol:¶,extends:→,precedes:←,nbsp:×
    else
        set listchars=tab:»\ ,trail:·,eol:¶,extends:>,precedes:<,nbsp:_
    endif
endif
nmap <F2> :set list!<CR>

" Performance fixes
set regexpengine=1
set ttimeout ttimeoutlen=0 notimeout " Disable timeout for Esc key
set ttyfast " Optimize for fast terminal connections
set lazyredraw
set noshowcmd
set foldmethod=marker
set display+=lastline " Display lastline instead of @
set noerrorbells visualbell t_vb= " No annoying sound on errors
set wildmenu " Turn on the Wild menu
