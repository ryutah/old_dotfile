source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

if has('win32') || has ('win64')
  source $VIMRUNTIME/delmenu.vim
  set langmenu=ja_jp.utf-8
  source $VIMRUNTIME/menu.vim
  set guifont=Migu_1M:h14
  set guifontwide=Migu_1M:h14
endif

" colorscheme jellybeans
set background=dark
colorscheme hybrid
