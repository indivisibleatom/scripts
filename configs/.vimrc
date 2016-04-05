"Basic
set nu
set ai
set backspace=indent,eol,start
set nobackup
set tabstop=2
set softtabstop=2
set cursorline
set expandtab
set shiftwidth=2
set shiftround
set textwidth=79
set formatoptions+=t
set showmatch
"View column numbers

"View unprinted whitespaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

"Clear spaces with F5
nnoremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Mappings
let mapleader=","
"Play nice with Cmake C++ projects
let types = ['c', 'cpp', 'cxx']
if index(types, &filetype) == -1
  command! -nargs=* Make make -C build/%:h:h <args> | cwindow 3
else
  command! -nargs=* Make make <args> | cwindow 3
endif
map <Leader>r :w<CR>:silent Make\|redraw!\|cw<CR>
inoremap jj <esc>
nnoremap <space> za

filetype off
filetype plugin indent off
execute pathogen#infect()
filetype plugin indent on
syntax on

"Autos
autocmd BufNewFile,BufRead *.tex set spell

"Plugins
"Colors
set t_Co=256
set background=dark
colorscheme solarized

"Syntastic
set statusline=%f
set statusline+=\ col:%c
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_no_default_include_dirs = 1

"NerdTree
nmap <leader><F2> :NERDTreeToggle<CR>
