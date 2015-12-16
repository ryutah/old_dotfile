set nocompatible
filetype off
if has('vim_starting')
  set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle で管理するプラグインを追加します。

" Unite.vim プラグイン
NeoBundle 'Shougo/unite.vim.git'
" アウトライン表示
NeoBundle 'Shougo/unite-outline'
" ファイル履歴
NeoBundle 'Shougo/neomru.vim'
" ヤンク履歴
NeoBundle 'Shougo/neoyank.vim'
" テーマ
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'ujihisa/unite-colorscheme'

" スニペット
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'LeafCage/yankround.vim'
" vim 日本語ドキュメント
NeoBundle 'vim-jp/vimdoc-ja'
" フォルダのツリー表示
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows': 'tools\\update-dll-mingw',
      \     'cygwin':  'make -f make_cygwin.mak',
      \     'mac':     'make -f make_mac.mak',
      \     'linux':   'make',
      \     'unix':    'gmake',
      \    }
      \  }
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends':  'Shougo/vimproc.vim',
        \ 'autoload': { 'insert' : 1 }
        \ }
endif
" コメントアウト
NeoBundle "tyru/caw.vim"
NeoBundle "rhysd/wandbox-vim"
" クイックラン
NeoBundle "thinca/vim-quickrun"
" javascript シンタックスハイライト
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle "scrooloose/syntastic"
" EMMET(HTML)コーディングプラグイン
NeoBundle 'mattn/emmet-vim'
" Go言語プラグイン
NeoBundle 'fatih/vim-go'
" 括弧、クォーテーションの入力補助
NeoBundle 'kana/vim-smartinput'
NeoBundle 'cohama/vim-smartinput-endwise'
" Slimのハイライトなど
NeoBundle 'slim-template/vim-slim'
" agでのgrep検索（用av）
NeoBundle 'rking/ag.vim'
" 整形
NeoBundle 'junegunn/vim-easy-align'
" git差分表示
NeoBundle 'airblade/vim-gitgutter'
" ruby補完
NeoBundleLazy 'NigoroJr/rsense', {
      \ 'autoload' : { 'filetype' : ['ruby'] }
      \}
NeoBundle 'Shougo/neocomplcache-rsense.vim', {
      \ 'depends': ['Shougo/neocomplete.vim', 'marcus/rsense'],
      \ }
" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'
" rubocop
NeoBundle 'ngmy/vim-rubocop'
" Vimでシェルを使う
NeoBundle 'Shougo/vimshell.vim'
" VimのRubyプラグインが最新ではない可能性があるため
NeoBundle 'vim-ruby/vim-ruby'

call neobundle#end()

" vim-smartinput-endwiseの呼び出し
call smartinput_endwise#define_default_rules()

"" 履歴取得数
let g:yankround_max_history = 500

set encoding=utf-8

if has('kaoriya')
  " Windowsの場合はコメントアウト外す
  set fileencoding=cp932
  set termencoding=cp932
else
  " Linuxの場合はコメントアウトを外す
  set fileencoding=utf-8
  set termencoding=utf-8
  " Windowsの場合はオフにするといいかも
  set t_Co=256
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 共通設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamed,autoselect

set keywordprg=:help " Open Vim internal help by K command
"タブ文字の長さ
set tabstop=2
set shiftwidth=2

" 空白文字ではなくてタブ文字を使用する
set noexpandtab
filetype plugin on

" 検索結果ハイライト
set hlsearch
" バックアップ(ファイル名~)を作成しない
set nobackup
" クリップボードにヤンク
set clipboard=unnamed,autoselect
" 行番号の表示
set number
" 行末のスペースを削除
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にタブをスペースに変換
autocmd BufWritePre * :%s/\t/  /ge

set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set undodir=C:\Users\ryuta\.vim\undo
set tags+=.git/tags

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

set fileencodings+=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932

filetype plugin indent on  " restore filetype
syntax on
set background=dark
colorscheme hybrid
" colorscheme jellybeans
" colorscheme twilight
NeoBundleCheck
if has('win32') || has ('win64')
  set iminsert=0
  set imsearch=0
endif

if has('kaoriya')
  let g:no_vimrc_example    = 0
  let g:vimrc_local_finish  = 1
  let g:gvimrc_local_finish = 1

  "$VIM/plugins/kaoriya/autodate.vim
  let plugin_autodate_disable  = 1
  "$VIM/plugins/kaoriya/cmdex.vim
  let plugin_cmdex_disable     = 1
  "$VIM/plugins/kaoriya/dicwin.vim
  let plugin_dicwin_disable    = 1
  "$VIMRUNTIME/plugin/format.vim
  let plugin_format_disable    = 1
  "$VIM/plugins/kaoriya/hz_ja.vim
  let plugin_hz_ja_disable     = 1
  "$VIM/plugins/kaoriya/scrnmode.vim
  let plugin_scrnmode_disable  = 1
  "$VIM/plugins/kaoriya/verifyenc.vim
  let plugin_verifyenc_disable = 1
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" スニペットを展開するキーマッピング
"" <<Tab> で選曹ｳれているスニペットの展開を行う
" 選択されている候補がスニペットであれば展開し、
" それ以外であれば次の候補を選択する
"" また、既にスニペットが展開されている場合は次のマークへと移動する
imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" 現在の filetype のスニペットを編集する為のキーマッピング
" こうしてｂｭことでサッと編集や追加などを行うことができる
"" 蛻ﾈ下の設定では新しいタブでスニペットファイルを開く
nnoremap <Space>ns :execute "tabnew\|:NeoSnippetEdit ".&filetype<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers=['rubocop', 'mri']

highlight SyntasticError guibg=#F9B3F9
highlight SyntasticWarning guibg=#F9B3F9
highlight SyntasticStyleError guibg=#F9B3F9
highlight SyntasticStyleWarning guibg=#F9B3F9

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete.vim 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default':  '',
      \ 'vimshell': $HOME.'/.vimshell_hist',
      \ 'scheme':   $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#close_popup() . "\<CR>"
" endfunction
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" オムニ保管 遅いのでoff
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.go   = '\h\w\.\w*'

if !has('kaoriya')
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" quickrun.vim設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 出力先
" 成功した場合 : quickrun 専用の出力バッファ
" 失敗した場合 : quickfix を :copen で開く
" バッファの開き方 : botright 8sp
"
" cpp.type にて使用するコンパイラなどを設定する
" cpp.cmdopt にコマンドラインオプションを設定
let g:quickrun_config = {
      \   "_" : {
      \       "runner":                      "vimproc",
      \       "runner/vimproc/updatetime":   200,
      \       "outputter":                   "error",
      \       "outputter/error/success":     "buffer",
      \       "outputter/error/error":       "quickfix",
      \       "outputter/buffer/split":      ":botright 8sp",
      \       "outputter/quickfix/open_cmd": "copen",
      \   },
      \   "cpp" : {
      \       "runner/wandbox/compiler": "clang-head",
      \       "runner/wandbox/options":  "warning,c++1y,boost-1.55",
      \   },
      \}

" :QuickRun 時に quickfix の中身をクリアする
" こうしておかないと quickfix の中身が残ったままになる
let s:hook = {
      \   "name" : "clear_quickfix",
      \   "kind" : "hook",
      \}

function! s:hook.on_normalized(session, context)
  call setqflist([])
endfunction

call quickrun#module#register(s:hook, 1)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" caw.vim設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" コメントアウトで切り替えるマッピング
" \c でカーソル行をコメントアウト
" 再度 \c でコメントアウト解除
" 選択してから複数行の \c も可能
nmap \c <Plug>(caw:I:toggle)
vmap \c <Plug>(caw:I:toggle)

" \C でコメントアウトの解除
nmap \C <Plug>(caw:I:uncomment)
vmap \C <Plug>(caw:I:uncomment)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Ruby用設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby setl iskeyword+=?
autocmd FileType ruby setl iskeyword+=!



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" C++用設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype=cpp が設定された時に呼ばれる関数
" Vim で C++ の設定を行う場合はこの関数内で記述する
" ここで設定する項目は各自好きに行って下さい
function! s:cpp()
  " インクルードパスを設定する
  " gf などでヘッダーファイルを開きたい場合に影響する
  setlocal path+=C:\MinGW\lib\gcc\mingw32\4.8.1\include\c++

  "タブ文字の長さ
      setlocal tabstop=4
      setlocal shiftwidth=4

  " 空白文字ではなくてタブ文字を使用する
  "     setlocal noexpandtab

  " 括弧を構成する設定に <> を追加する
  " template<> を多用するのであれば
  setlocal matchpairs+=<:>

  " 最後に定義された include 箇所へ移動してを挿入モードへ
  nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

  " BOOST_PP_XXX 等のハイライトを行う
  syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
  highlight link boost_pp cppStatement
endfunction

augroup vimrc-cpp
  autocmd!
  " filetype=cpp が設定された場合に関数を呼ぶ
  autocmd FileType cpp call s:cpp()
augroup END

" 標準ライブラリへのパスを設定
let $CPP_STDLIB = "C:/MinGW/lib/gcc/mingw32/4.8.1/include/c++"

augroup vimrc-set_filetype__cpp
  autocmd!
  " $CPP_STDLIB よりも下の改装ファイルが開かれて
  " filetypeが設定されていない場合に filetype=cpp を設定する
  autocmd BufReadPost $CPP_STDLIB/* if empty($filetype) | set filetype = cpp | endif
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-go 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods   = 1
let g:go_highlight_structs   = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" smartinput 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ruby ダブルクオーテーション内での#{}自動保管
call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({
            \   'at'       : '\%#',
            \   'char'     : '#',
            \   'input'    : '#{}<Left>',
            \   'filetype' : ['ruby'],
            \   'syntax'   : ['Constant', 'Special'],
            \   })

" ruby do の後の || 自動保管
call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
call smartinput#define_rule({
            \   'at':       '\({\|\<do\>\)\s*\%#',
            \   'char':     '<Bar>',
            \   'input':    '<Bar><Bar><Left>',
            \   'filetype': ['ruby'],
            \    })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Unite.vim 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_history_yank_enable = 1

try
  let g:unite_source_rec_async_command = ['ag', '--follow',  '--nocolor',
        \ '--nogroup', '--hidden', '-g', '']
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" rsense
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:rsenseHome        = "C:\PG\rsense-0.3"
let g:rsenseUseOmniFunc = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" コマンド 設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基本マッピング
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
noremap <S-h> ^
noremap <S-l> $

" Unite系
nnoremap <Space><Space> :<C-u>Unite -start-insert file_rec/async<CR>
nnoremap [unite] <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]y :Unite history/yank<CR>
nnoremap <silent> [unite]b :Unite buffer<CR>
nnoremap <silent> [unite]t :Unite tab<CR>
nnoremap <silent> [unite]f :Unite file_mru<CR>
nnoremap <silent> [unite]g :Unite grep<CR>
nnoremap <silent> [unite]o :Unite outline<CR>
nnoremap <silent> [unite]r <Plug>(unite_restart)
nnoremap <silent> [unite]ri :Unite ref/ri<CR>
nnoremap <silent> [unite]cs :Unite colorscheme -auto-preview<CR>

" タブ系
nnoremap [tab] <Nop>
nmap     <Space>t [tab]
nnoremap <silent> [tab]n :tabnew<CR>
nnoremap <silent> [tab]l :tabNext<CR>
nnoremap <silent> [tab]h :tabprevious<CR>

" NERDTree
nnoremap [NERDTree] <Nop>
nmap     <Space>n [NERDTree]
nnoremap <silent> [NERDTree]t :NERDTree<CR>

" vimshell
nnoremap [Vimshell] <Nop>
nmap     <Space>v [Vimshell]
nnoremap <silent> [Vimshell]s :VimShell<CR>
nnoremap <silent> [Vimshell]p :VimShellInteractive pry<CR>

" Ag
" カーソルの下の文字をgrep検索
nmap     < :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

" Easy align interactive
vnoremap <silent> <Enter> :EasyAlign<cr>

" gitgutter
nnoremap [gitgutter] <Nop>
nmap     <Space>g [gitgutter]
nnoremap <silent> [gitgutter]g :<C-u>GitGutterToggle<CR>
nnoremap <silent> [gitgutter]h :<C-u>GitGutterLineHighlightsToggle<CR>

" オムニ補完
imap <C-f> <C-x><C-o>

" yankround
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" neocompleteとsmartinputの<CR>競合解決用
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if neobundle#tap('vim-smartinput')
  call neobundle#config({
        \   'autoload' : {
        \     'insert' : 1
        \   }
        \ })

  function! neobundle#tapped.hooks.on_post_source(bundle)
    call smartinput_endwise#define_default_rules()
  endfunction

  call neobundle#untap()
endif


if neobundle#tap('vim-smartinput-endwise')
  function! neobundle#tapped.hooks.on_post_source(bundle)
    " neosnippet and neocomplete compatible
    call smartinput#map_to_trigger('i', '<Plug>(vimrc_cr)', '<Enter>', '<Enter>')
    call smartinput#map_to_trigger('i', '<Plug>(vimrc_bs)', '<BS>', '<BS>')
    imap <expr><CR> !pumvisible() ? "\<Plug>(vimrc_cr)" :
          \ neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" :
          \ neocomplete#close_popup()
    imap <expr> <BS>
          \ neocomplete#smart_close_popup() . "\<Plug>(vimrc_bs)"
  endfunction
  call neobundle#untap()
endif
