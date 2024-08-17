syntax on
set number
set mouse=a  " enable mouse
set encoding=utf-8 " кодировка
set noswapfile " указание на то, чтобы не генерить swapfile
set scrolloff=7

set tabstop=4 " 1 tab = 4 space
set autoindent " копмирование текущих отступов при переходе на новую строку
set fileformat=unix
filetype indent on      " load filetype-specific indent files


call plug#begin()

" Тема для NVIM
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'projekt0n/github-nvim-theme'

" файловый мененджер.
Plug 'preservim/nerdtree'

" плагин для отображения статуса работы
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'tamton-aquib/staline.nvim'
"Plug 'https://github.com/adelarsq/neoline.vim'

" поддержка языков
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

call plug#end()

" let g:pymode_python = 'python'
" let g:material_theme_style = 'ocean'
colorscheme github_dark_default

" Start NERDTree and leave the cursor in it.
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree
