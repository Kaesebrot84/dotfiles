set number
set termguicolors
set relativenumber
set guicursor=n:ver100

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :Files<CR>

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'feline-nvim/feline.nvim'
Plug 'tpope/vim-commentary'

call plug#end()

lua require('feline').setup()
colorscheme gruvbox
