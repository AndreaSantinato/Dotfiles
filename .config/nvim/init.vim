"    ________   ________
"   |        | |
"   |________| |________        Andrea Santinato
"   |        |          |       https://github.com/AndreaSantinato
"   |        |  ________|
"
" My Customized Version of init.vim for neovim (https://neovim.io/)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kovetskiy/sxhkd-vim'
Plug 'vim-python/python-syntax'
Plug 'ap/vim-css-color'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set path+=**		        " Searches current directory recursively
set noswapfile                  " No swap
set t_Co=256			" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set number		        " Display line numbers
syntax enable			" Enable the Syntax
let g:rehash256 = 1		" Set if term supports 256 colors.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors & Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
highlight Statement        ctermfg=2    ctermbg=none    cterm=none
highlight Directory        ctermfg=4    ctermbg=none    cterm=none
highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
highlight NERDTreeClosable ctermfg=2
highlight NERDTreeOpenable ctermfg=8
highlight Comment          ctermfg=4    ctermbg=none    cterm=none
highlight Constant         ctermfg=12   ctermbg=none    cterm=none
highlight Special          ctermfg=4    ctermbg=none    cterm=none
highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
highlight String           ctermfg=12   ctermbg=none    cterm=none
highlight Number           ctermfg=1    ctermbg=none    cterm=none
highlight Function         ctermfg=1    ctermbg=none    cterm=none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The lightline.vim theme
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ }

" Always show statusline
set laststatus=2

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tab and Indent Related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings For Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:instant_markdown_autostart = 0                  " Turns off auto preview
let g:instant_markdown_browser = "Google-chrome"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>            " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>               " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse=a             " Enable the mouse support
set mouse=nicr          " Enable the mouse scrolling

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow splitright

" Remap the Splits Navigation to just use CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make Adjusing Split Sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change Two Split Windows from Vertical to Horizontal or Horizontal to
" Vertical
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes the Pipes | that act as Seperators on Splits
set fillchars+=vert:\
