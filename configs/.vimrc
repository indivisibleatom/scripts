" Basic
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
set modeline
" Match angle braces
"
set matchpairs+=<:>
set clipboard=unnamedplus

"Clang format
function FormatFile()
:  let l:lines="all"
:  pyf ${DEV}/scripts/configs/clang-format.py<cr>
:endfunction
map <C-I>:pyf ${DEV}/scripts/configs/clang-format.py<cr>
imap <C-I> <c-o>:pyf ${DEV}/scripts/configs/clang-format.py<cr>

"View unprinted whitespaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.
" Incremental search and highlight
set incsearch
set hlsearch
" Code folding
set foldmethod=indent
set nofoldenable
set foldlevel=1

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

let g:vim_markdown_folding_disabled = 1

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

let g:ycm_show_diagnostics_ui = 0

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

" Save file and then run make upon Ctrl-R -- we have setup things to map the
" run to different commands for certain filetypes. This is fallback
if mapcheck("<Leader>r") == ""
  nnoremap <buffer> <Leader>r :w<CR>:silent Mk\|redraw!<CR>
endif

noremap <F5> :Autoformat<CR>
nmap <leader><F2> :NERDTreeToggle<CR>
nmap <leader>b :CtrlPBuffer

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Quickfix new split
autocmd! FileType qf noremap <buffer> <Leader><Enter> <C-w><Enter><C-w>L

" Latex files
" autocmd! FileType tex noremap <Leader>r <localleader>ll
" autocmd! FileType tex nnoremap <leader>lf :VimtexForwardSearch<CR>

" BlenderPy files
autocmd! FileType blenderpy set syntax=python
"----------------------------------End mappings-------------------

