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
    "Statusline"
    Plug 'itchyny/lightline.vim'                            " Adding the Bottom Statusline to Vim
    "Vim Theme
    Plug 'dracula/vim', { 'as': 'dracula' }                 " Adding the Dracula Theme to Vim
    "Other Plugins"
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'ap/vim-css-color'
    call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors & Theming
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    highlight Normal           guifg=#dfdfdf ctermfg=15   guibg=#282c34 ctermbg=none  cterm=none
    highlight LineNr           guifg=#5b6268 ctermfg=8    guibg=#282c34 ctermbg=none  cterm=none
    highlight CursorLineNr     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
    highlight VertSplit        guifg=#1c1f24 ctermfg=0    guifg=#5b6268 ctermbg=8     cterm=none
    highlight Statement        guifg=#98be65 ctermfg=2    guibg=none    ctermbg=none  cterm=none
    highlight Directory        guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
    highlight StatusLine       guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
    highlight StatusLineNC     guifg=#202328 ctermfg=7    guifg=#5b6268 ctermbg=8     cterm=none
    highlight NERDTreeClosable guifg=#98be65 ctermfg=2
    highlight NERDTreeOpenable guifg=#5b6268 ctermfg=8
    highlight Comment          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=italic
    highlight Constant         guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
    highlight Special          guifg=#51afef ctermfg=4    guibg=none    ctermbg=none  cterm=none
    highlight Identifier       guifg=#5699af ctermfg=6    guibg=none    ctermbg=none  cterm=none
    highlight PreProc          guifg=#c678dd ctermfg=5    guibg=none    ctermbg=none  cterm=none
    highlight String           guifg=#3071db ctermfg=12   guibg=none    ctermbg=none  cterm=none
    highlight Number           guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
    highlight Function         guifg=#ff6c6b ctermfg=1    guibg=none    ctermbg=none  cterm=none
    highlight Visual           guifg=#dfdfdf ctermfg=1    guibg=#1c1f24 ctermbg=none  cterm=none
    

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set path+=**		                " Searches current directory recursively
    set noswapfile                      " No swap
    set t_Co=256			            " Use 256 colours (Use this setting only if your terminal supports 256 colours)
    set number		                    " Display line numbers
    set wildmenu                        " Enable the Tab Auto-Xompletation
    set nobackup
    set wildmode=longest,list,full      " Setting the Wildmenu Mode
    set clipboard=unnamedplus           " Copy/Paste between vim and and other programs
    syntax enable			            " Enable the Syntax
    let g:rehash256 = 1		            " Set if term supports 256 colors

    let g:python_host_prog = '/usr/bin/python2.7'
    let g:python3_host_prog = '/usr/bin/python3.8'

    let g:loaded_python_provider = 0
    let g:loaded_python3_provider = 0 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings For VIFM Keys Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    map <Leader>vv :Vifm<CR>
    map <Leader>vs :VsplitVifm<CR>
    map <Leader>sp :SplitVifm<CR>
    map <Leader>dv :DiffVifm<CR>
    map <Leader>tv :TabVifm<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings For Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    let g:instant_markdown_autostart = 0         " Turns off auto preview
    let g:instant_markdown_browser = "surf"      " Uses surf for preview
    map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
    map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings For Opening A Terminal Inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    map <Leader>tt :vnew term://fish<CR>

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
" Mouse & Cursor Line Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set mouse=a             " Enable the mouse support
    set mouse=nicr          " Enable the mouse scrolling
    set cursorline          " Enable the cursor line"

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Settings Less Important
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
    let g:python_highlight_all = 1

    au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
    au BufEnter *.org            call org#SetOrgFileType()

    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=SauceCodePro\ Nerd\ Font:h15
    "set guifont=Mononoki\ Nerd\ Font:h15
    "set guifont=JetBrains\ Mono:h15

    "let g:neovide_transparency=0.95

