" ---VUNDLE BEGIN---
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'       " Installs the things
Plugin 'scrooloose/NERDTree'        " NERDTree directory support
Plugin 'joshdick/onedark.vim'       " pretty as heck
Plugin 'sheerun/vim-polyglot'       " mega language support
Plugin 'vim-airline/vim-airline'    " neat little line on the bottom
Plugin 'ap/vim-css-color'           " show css colors on hexes
Plugin 'tomtom/tcomment_vim'        " comment lines
Plugin 'jceb/emmet.snippets'        " emmet snippies for html
Plugin 'honza/vim-snippets'         " extra snippies
Plugin 'hail2u/vim-css3-syntax'     " css3 syntax highlighting
Plugin 'othree/csscomplete.vim'     " some more css support
Plugin 'neoclide/coc.nvim'
Plugin 'tpope/vim-endwise'          " 'end's things in ruby
Plugin 'jiangmiao/auto-pairs'       " auto pair brackets n dat
Plugin 'w0ng/vim-hybrid'            " another color scheme
Plugin 'romainl/flattened'
Plugin 'neomake/neomake'            " linting 
Plugin 'tpope/vim-surround'         " this surround thing
Plugin 'tpope/vim-repeat'           " beauty, allows '.' to repeat plugin stuff
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-python/python-syntax'   " better python highlighting 
call vundle#end()
" ---VUNDLE END---

syntax enable
set termguicolors
colo onedark
set foldmethod=indent

source ~/configfiles/funcs.vimrc

au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile> | endif | endif

let mapleader=","

" Removing arrow keys
nnoremap <Down> ddp
nnoremap <Up> ddkP
nnoremap <Left> xhP
nnoremap <Right> xp

" soft tabs, 2 width
set expandtab tabstop=2 shiftwidth=2

" tab/tmux/window stuff
nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>S
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-left> :tabp<Enter>
noremap <C-right> :tabn<Enter>
noremap <C-up> :tabfirst<Enter>
noremap <C-down> :tablast<Enter>
nnoremap <Leader><Leader> :buffers<CR>:buffer<Space>
noremap <C-t> <Esc>:tabnew<CR>
noremap <C-w> <Esc>:tabclose<CR>
nnoremap <Leader>q <Esc>:bp<Enter>
nnoremap <Leader>w :call TryCloseBuffer()<Enter>
nnoremap <Leader>e <Esc>:bn<Enter>
nnoremap <Space> za

" Airline
let g:airline#extensions#tabline#enabled = 1


filetype plugin indent on
set ai
set backspace=eol,indent,start

" execute current file
inoremap <F4> <esc>:w<enter>:!%:p<enter>
nnoremap <F4> <esc>:w<enter>:!%:p<enter>

" line numbers
set number

" mysql highlighting
if has("autocmd")
  autocmd BufRead *.sql set filetype=mysql
  autocmd BufRead *.test set filetype=mysql
endif

" neomake
autocmd! BufWritePost,BufEnter * Neomake

" remove annoying search thing
nnoremap <Leader>\ :noh<Enter>

" reformat file
nnoremap <Leader>= mzgg=G`z

" copy file
nnoremap <Leader>y mzgg"+yG`z

" force neomake to use python3
let g:neomake_python_python_exe = 'python3'

" my own snippies
set rtp+=~/.vim/my-snippets
