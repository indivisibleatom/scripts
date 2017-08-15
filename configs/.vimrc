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
" Match angle braces
set matchpairs+=<:>
set clipboard=unnamedplus

"Clang format
:function FormatFile()
:  let l:lines="all"
:  pyf ${DEV}/scripts/configs/clang-format.py<cr>
:endfunction
map <C-I>:pyf ${DEV}/scripts/configs/clang-format.py<cr>
imap <C-I> <c-o>:pyf ${DEV}/scripts/configs/clang-format.py<cr>

"View unprinted whitespaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

filetype off
filetype plugin indent off
execute pathogen#infect()
filetype plugin indent on
syntax on

"Autos
" Spelling for tex files
autocmd BufNewFile,BufRead *.tex set spell
" Error highlighting for cerr files (credits: Mani Zandifar -
" http://stackoverflow.com/questions/6914434/how-to-save-the-error
" -output-of-gcc-to-file)"
au BufRead,BufNewFile *.cerr set filetype=cerr

"Plugins
"Colors
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"Syntastic
set statusline=%f
set statusline+=\ col:%c
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-std=c++14 -Wno-deprecated-declarations'
let g:syntastic_cpp_no_default_include_dirs = 0

"------------------------------------Mappings---------------------
"Clear spaces with F3
let mapleader=","
inoremap jj <esc>
nnoremap <space> za

noremap <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

-"Play nice with Cmake C++ projects
let types = ['c', 'cpp', 'cxx']
if index(types, &filetype) == -1
  command! -nargs=* Mk make <args> | cwindow 3
else
  command! -nargs=* Mk make! -C build/%:h:h <args> | cwindow 3
endif

map <Leader>r :w<CR>:silent Mk\|redraw!\cw<CR>

noremap <F5> :Autoformat<CR>
nmap <leader><F2> :NERDTreeToggle<CR>
nmap <leader>b :CtrlPBuffer

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Quickfix new split
autocmd! FileType qf noremap <buffer> <Leader><Enter> <C-w><Enter><C-w>L
" Run in background and launch evince for latex
autocmd! FileType tex noremap <Leader>r :w<CR>:Make!<CR>
"----------------------------------End mappings-------------------

