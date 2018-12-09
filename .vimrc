" --------------------------------------------------------------------------- "
" ------------------------------- General ----------------------------------- "
" --------------------------------------------------------------------------- "

" Turn off the compatibility mode. (Always use the latest Vim features.)
set nocp

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Automatically reload changed files.
set autoread

" Disable swap files
set nobackup
set noswapfile

" Make the backspace function properly
set backspace=indent,eol,start

" Yank/Paste in an out of Vim
set clipboard^=unnamed,unnamedplus

" Preserve clipboard contents when exiting Vim:
" OPTION 1: copy to xclip on exit
" autocmd VimLeave * call system("xclip -o | xclip -selection c") " WARNING: LINUX ONLY!!!
" OPTION 2: Install Parcellite or glipper for Gnome, or klipper for KDE:
" sudo apt-get install parcellite
" TODO: Find a clean, x-platform solution for this

" TAB/INDENTATION STUFF
filetype plugin indent on
" Turn on the auto-intentation feature.
set autoindent
" Display tabs as 2 whitespace characters.
set tabstop=2
" When indenting with '>' or '<', use 2 whitespaces.
set shiftwidth=2 " <------------------------------------- PROBLEMATIC WITH nginx AND OTHER CONFIGURATION FILES. When set to 4 works fine.
" On pressing tab, insert 2 spaces
set expandtab

" Highlight columns 80 and 100.
set colorcolumn=80,100

" Highlight all search results.
set hlsearch
" Enable incremental searching.
set incsearch

" Always show statusline
set laststatus=2
set showtabline=1
set noshowmode

" Use syntax coloring
syntax on
" Always show line numbers
set number
" Use relative line numbering
set relativenumber

" --------------------------------------------------------------------------- "
" ------------------------------ Filetypes ---------------------------------- "
" --------------------------------------------------------------------------- "

" nginx filetype configuration
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx

" --------------------------------------------------------------------------- "
" ------------------------------- Plugins ----------------------------------- "
" --------------------------------------------------------------------------- "

" Use the `codedark` theme (Visual Studio like)
colorscheme codedark

" Add Powerline Vim binding to the Runtime Path.
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Enable pathogen!
execute pathogen#infect()

" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntastic for C programming
" Include the SDL2 directory so that errors are not being shown
let g:syntastic_c_include_dirs = ['/usr/local/include/SDL2']

" Syntastic for C++ programming
" Include the SDL2 directory so that errors are not being shown
let g:syntastic_cpp_include_dirs = ['/usr/local/include/SDL2']

" Syntastic + ESLint
let g:syntastic_javascript_checkers=['eslint']

" Use the project-specific 'eslint' binary
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

" Syntastic + tsuquyomi (TypeScript)
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi']

" NERDTree - always show hidden files
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
set wildignore+=*.pyc                       " < ---------- Python
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " < ---------- Linux/MacOSX
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " < ---------- Windows

" indentLine
let g:indentLine_char = '⎸'
let g:indentLine_color_term = 0

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-gitgutter
set updatetime=500 " <- refresh vim buffers every 500ms

" --------------------------------------------------------------------------- "
" ------------------------------ Mappings ----------------------------------- "
" --------------------------------------------------------------------------- "

map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-m> :NERDTreeFind<CR>

" https://hashrocket.com/blog/posts/8-great-vim-mappings
nnoremap Q @q
vnoremap Q :norm @q<cr>
