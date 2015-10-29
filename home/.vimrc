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

" 分割ウインドウの移動のマッピングを変更
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

"-----------------------------------
" unite.vim
"-----------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=1
"バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
"ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=file file<CR>
"register list"
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
"最近使ったファイルの一覧
nnoremap <silent> ,ua :<C-u>Unite buffer file_mru<CR>
"Unite-outeline
nnoremap <silent> ,uo :<C-u>Unite outline<CR>

"-----------------------------------
" vimfiler
"-----------------------------------
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
",e で現在開いているバッファのディレクトリを開く
nnoremap <silent> ,e :<C-u>VimFilerBufferDir<CR>
