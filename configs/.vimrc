execute pathogen#infect()

"Basic
set nu
set ai
set backspace=indent,eol,start
syntax on
filetype on
filetype indent on
set nobackup
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround

"View unprinted whitespaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

"Plugins
"Colors
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"Syntasticset statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_no_default_include_dirs = 1
