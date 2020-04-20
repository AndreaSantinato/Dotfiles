"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kovetskiy/sxhkd-vim'
Plug 'vim-python/python-syntax'
Plug 'ap/vim-css-color'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable   
set number 
let g:rehash256 = 1

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Control
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a
