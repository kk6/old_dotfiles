filetype plugin indent off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'kana/vim-fakeclip'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set encoding=utf-8
set fileencoding=utf-8

"----------------------------------------------------
" Files
"----------------------------------------------------
set noswapfile
set nobackup
set noundofile

set ruler

"----------------------------------------------------
" Window
"----------------------------------------------------

" To change the key-mapping of the split window.
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

"----------------------------------------------------
" Search
"----------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch

" Press ESC twice to turn off the highlight.
nmap <ESC><ESC> :nohlsearch<CR><ESC>

" The search word in the center of the screen.
noremap n nzz
noremap N Nzz

"----------------------------------------------------
" Edit
"----------------------------------------------------
set clipboard=autoselect,unnamed
set autoread
"----------------------------------------------------
" Key-mappings
"----------------------------------------------------

" Edit (g)vimrc
nnoremap <silent> <Space>ev :<C-u>vsplit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :<C-u>vsplit $MYGVIMRC<CR>
" Reload (g)vimrc
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

"-----------------------------------
" unite.vim
"-----------------------------------
let g:unite_enable_start_insert=1
" Buffers
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" Files
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
" Register list
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" Recent files
nnoremap <silent> ,ua :<C-u>Unite buffer file_mru<CR>

"-----------------------------------
" vimfiler
"-----------------------------------
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" Press `,e`, open the directory of the current buffer.
nnoremap <silent> ,e :<C-u>VimFilerBufferDir<CR>
