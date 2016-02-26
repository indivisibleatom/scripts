"Basic
set nu
set ai
set backspace=indent,eol,start
set nobackup
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set textwidth=79
set formatoptions+=t

"View unprinted whitespaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

"Mappings
let mapleader=","
command -nargs=* Make make <args> | cwindow 3
map <Leader>r :w<CR>:silent Make\|redraw!\|cw<CR>
inoremap jj <esc>

filetype off
filetype plugin indent off
execute pathogen#infect()
filetype plugin indent on
syntax on

"Plugins
"Colors
set t_Co=256
set background=dark
colorscheme solarized

"Syntasticset statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_no_default_include_dirs = 1

"NerdTree
nmap <leader><F2> :NERDTreeToggle<CR>
