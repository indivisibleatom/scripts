" Basic
set nu
set ai
set backspace=indent,eol,start
set nobackup
set tabstop=2
set softtabstop=2
set cursorline
set lazyredraw
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
let g:syntastic_loc_list_height = 5
let g:syntastic_cpp_compiler_options = '-std=c++14 -Wno-deprecated-declarations -fvisibility -Wattributes'
let g:syntastic_cpp_no_default_include_dirs = 0
let g:ycm_show_diagnostics_ui = 0

"Vim pymode
let g:pymode_python = 'python3'
let g:pymode_lint_on_write = 0

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

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Quickfix new split
autocmd! FileType qf noremap <buffer> <Leader><Enter> <C-w><Enter><C-w>L
" Quickfix close if last
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Latex files
let g:tex_flavor = 'latex'
let g:tex_fold_enabled = 0
let g:tex_fast = "cmMprs"
let g:tex_conceal = ""
let g:tex_fold_enabled = 0
let g:tex_comment_nospell = 1
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'continuous' : 0,
\}
let g:vimtex_indent_enabled = 0
let g:vimtex_view_method = 'zathura'
" autocmd! FileType tex noremap <Leader>r <localleader>ll
" autocmd! FileType tex nnoremap <leader>lf :VimtexForwardSearch<CR>

" BlenderPy files
autocmd! FileType blenderpy set syntax=python
" Enable spell-check for markdown
autocmd BufNewFile,BufRead *.md set ft=markdown spell
"----------------------------------End mappings-------------------

