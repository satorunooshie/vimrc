if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif
set nocompatible

" basic -------------------------------------------------------------

" status line
set laststatus=2  " 常にステータスラインを表示
set cmdheight=2  " コマンドラインで利用する行数
set statusline=[%L]\ %t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L

" edit
set autoread                    " 他で書き換えられたら自動で再読み込み
set hidden                      " 編集中でもほかのファイルを開けるようにする
set backspace=indent,eol,start  " バックスペースでインデントや改行を削除

" display
syntax on
set title                       " ウィンドウのタイトルを変更する
set scrolloff=5                 " スクロール時の余白確保
set vb t_vb=                    " ビープを鳴らさない
set showcmd                     " コマンドをステータス行に表示
set showmatch                   " 括弧の対応をハイライト
set number                      " 行番号表示
set display=uhex                " 印字不可能文字を16進数で表示
set nolist                      " タブや改行文字を表示しない
set noruler                     " ルーラーを表示しない
set formatoptions+=mM           " テキスト挿入中の自動折り返しを日本語に対応
set shellslash                  " ディレクトリの区切り文字に/指定

"if &term =~ "xterm-256color"
"  " 256 colorの時のカラースキーマ
"  set t_Co=256
"  colorscheme xoria256
"  set background=light
"  hi Pmenu ctermbg=lightgray
"  hi PmenuSel ctermbg=6
"else
"  " デフォルトのカラースキーマ
  colorscheme molokai
"  hi Pmenu ctermbg=4
"  hi PmenuSel ctermbg=1
"endif

" Explore
let g:netrw_hide=1                " 非表示
let g:netrw_list_hide='^.*.swp'   " swpを非表示
let g:netrw_liststyle=1           " 詳細表示
let g:netrw_browse_split=0        " 0:same 1:split 2:vsplit 3:new

" indent
set autoindent                    " 自動的にインデントする
set smartindent                   " 新規行に対して自動でインデントする
set tabstop=2                     " タブの画面上での幅
set shiftwidth=2
set expandtab                     " タブをスペースに展開する
set smarttab                      " 行頭の余白でタブを押すとshiftwidthだけインデントする

" encoding
set termencoding=utf-8            " ターミナルで使われるエンコーディング
set encoding=utf-8                " デフォルトエンコーディング
set fileencoding=utf-8            " デフォルトのファイルエンコーディング
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932 " vimが表示できるエンコードのリスト

if has('win32') && has('kaoriya')
  set ambiwidth=auto
else
  set ambiwidth=double              " 全角記号文字を半角扱いしない
endif

" search
set wrapscan                        " 検索で最終行まで行ったら先頭に戻る
set ignorecase                      " 大文字小文字無視
set smartcase                       " 大文字ではじめたら大文字小文字無視しない
set incsearch                       " インクリメンタルサーチ
set hlsearch                        " 検索文字をハイライト
set grepprg=git\ grep\ -n\ $*       " grepにgit grepを使用する

" backup
set nobackup                        " バックアップ無効
"set backupdir=d:/vim/runtime-backup     " バックアップディレクトリ指定

" menu / complation
set wildmenu            " コマンド補完メニューを表示
set wildmode=full       " 複数のマッチがあるときは全てのマッチを表示し、共通する最長の文字列まで補完
set history=1000        " コマンドの履歴数
set complete+=k         " 補完に辞書ファイル追加

" help
"helptags d:/vim/runtime/doc
"set helplang=ja,en      " ヘルプの検索順序

" keymap ------------------------------------------------------------
imap <C-j> <esc>

" ESC押したときに自動的に IME OFF
inoremap <ESC> <ESC>:set iminsert=0 imsearch=0<CR>

" 行単位で移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 選択文字で検索
vnoremap * y/<C-r>0<CR>

" visual mode word move
vnoremap v w

" help
nnoremap <C-h> :help<Space>

" grep
nnoremap <C-g> :vimgrep<Space>

" 検索語を画面中央に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" 検索文字のハイライト/アンハイライト
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" window操作
nnoremap + 3<C-w>+
nnoremap - 3<C-w>-
nnoremap { 3<C-w><
nnoremap } 3<C-w>>

" バッファ移動
nnoremap <Space> :bn<CR>
nnoremap <S-Space> :bp<CR>
nnoremap <Left> :bp<CR>
nnoremap <Right> :bn<CR>
nnoremap <Down> :ls<CR>

" emacs like key
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <Esc><C-b> <S-Left>
cnoremap <Esc><C-f> <S-Right>
inoremap <C-k> <C-o>D
inoremap <C-u> <C-o>dd

inoremap <F5> <ESC>
inoremap <F6> <ESC>
inoremap <F7> <ESC>
inoremap <F8> <ESC>

" 日付入力
inoremap <expr> ,df strftime("%Y-%m-%dT%H:%M:%S")
inoremap <expr> ,dd strftime("%Y-%m-%d")

" 最後に変更したテキストの選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" command -----------------------------------------------------------

" changelog grep
command! -nargs=1 ChangeLogGrep vimgrep /<args>/j ~/changelog | cw

" バッファ内grep
function! BufGrep(word)
  cexpr '' " quickfixを空に
  silent exec ':bufdo | try | vimgrepadd ' . a:word . ' % | catch | endtry'
endfunction
command! -nargs=1 BufGrep :call BufGrep(<f-args>)

" ファイルエンコーディング指定再読み込み
command! Cp932 edit ++enc=cp932
command! Utf8 edit ++enc=utf-8
command! Euc edit ++enc=euc-jp

" cdpathを考慮した引数補完
command! -complete=customlist, CompleteCD -nargs=? CD cd <args>
function! CompleteCD(arglead, cmdline, cursorpos)
  let pat = join(split(a:cmdline, '\s', !0)[1:], ' '), '*/'
  return split(globpath(&cdpath, pat), "\n")
endfunction


" filetype ----------------------------------------------------------
filetype on
filetype indent on  " ファイルタイプによるインデント設定
filetype plugin on  " ファイルタイプごとのプラグイン読み込み

" ruby
autocmd FileType ruby,eruby setlocal tabstop=2 shiftwidth=2
autocmd FileType ruby,eruby setlocal makeprg=ruby\ -c\ %
autocmd FileType ruby,eruby setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType ruby,eruby setlocal formatoptions-=r " 挿入モードで改行したときにコメントを自動挿入しない
autocmd FileType ruby,eruby setlocal formatoptions-=o " ノーマルモードでoしたときにコメントを自動挿入しない

" changelog
autocmd BufNew,BufRead *.changelog set filetype=changelog
let g:changelog_timeformat="%Y-%m-%d"
let g:changelog_username="mostlyfine@gmail.com"

" action script
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd FileType actionscript setlocal dictionary=d:/vim/runtime/dict/actionscript3.dict

" java
autocmd FileType java setlocal dictionary=d:/vim/runtime/dict/j2se14.dict

" git
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=git

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags=1
let php_folding=0
autocmd BufNewFile,BufRead *.thml set filetype=html
autocmd BufNewFile,BufRead *.ctp set filetype=html
autocmd BufNewFile,BufRead *.tpl set filetype=html
autocmd FileType php setlocal makeprg=php\ -l\ %
autocmd FileType php setlocal errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php setlocal dictionary=d:/vim/runtime/dict/php.dict
autocmd FileType php setlocal noexpandtab list listchars=tab:^\  shiftwidth=4 tabstop=4

function PHPLint()
  let result = system( &ft . ' -l ' . bufname(""))
  echo result
endfunction

autocmd FileType php  :nmap ,l :call PHPLint()<CR>

" smarty
autocmd FileType smarty setlocal noexpandtab list listchars=tab:^\  shiftwidth=4 tabstop=4

" cucumber
autocmd BufNewFile,BufRead *.feature set filetype=ruby

" yaml
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" other -------------------------------------------------------------

" 挿入モード時ステータスラインの色を変える
autocmd InsertEnter * highlight StatusLine ctermbg=red guibg=red
autocmd InsertLeave * highlight StatusLine ctermbg=darkgray guibg=darkgray

" 自動的にQuickFixリストを表示する
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd cwin

" 全角/行末スペースを表示
scriptencoding utf-8
highlight IgnoreSpace ctermbg=red guibg=red
autocmd Colorscheme * highlight IgnoreSpace ctermbg=red guibg=red
autocmd VimEnter,WinEnter * match IgnoreSpace /\s\+$\|　/
autocmd BufWritePre,FileWritePre * :%s/\s\+$\|^　\|　$//ge

" plugin ------------------------------------------------------------

" vim-ruby.vim
let g:rubycomplete_buffer_loading=1     " rubyのomni補完を設定
let g:rubycomplete_classes_in_global=1  " global classもomni補完
let g:rubycomplete_rails=1              " railsのメソッド名もomni補完

" fuzzyfinder.vim
nmap fb :FuzzyFinderBuffer<CR>
nmap ff :FuzzyFinderFile<CR>
nmap fm :FuzzyFinderMruFile<CR>

" buftabs.vim
let g:buftabs_only_basename=1           " バッファタブにファイル名のみ表示
let g:buftabs_in_statusline=1           " バッファタブをステータスライン内に表示
let g:buftabs_active_highlight_group="Visual"

" rails.vim
let g:rails_level=4
let g:rails_default_file="app/controllers/application.rb"
let g:rails_default_database="mysql"

" git-commit.vim
let git_diff_spawn_mode=1               " windowを横に分割

" windows mount
"autocmd BufNewFile,BufRead /mnt/* set nofsync
"autocmd BufNewFile,Bu



" 起動時にruntimepathにNeoBundleのパスを追加する
"if has('vim_starting')
"  if &compatible
"    set nocompatible
"  endif
"  set runtimepath+=/home/taka/.vim/bundle/neobundle.vim/
"endif
"
"" NeoBundle設定の開始
"call neobundle#begin(expand('/home/taka/.vim/bundle'))
"
"" NeoBundleのバージョンをNeoBundle自身で管理する
"NeoBundleFetch 'Shougo/neobundle.vim'
"
"" インストールしたいプラグインを記述
"" 下記は unite.vimというプラグインをインストールする例
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'editorconfig/editorconfig-vim'
"
"" NeoBundle設定の終了
"call neobundle#end()
"
"filetype plugin indent on
"
"" vim起動時に未インストールのプラグインをインストールする
"NeoBundleCheck
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install NeoBundle..."
    :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
endif

if neobundle#is_installed('molokai')
  colorscheme molokai
endif
set t_Co=256
syntax enable
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set laststatus=2
set showmode
set showcmd
set ruler
set wildmenu
set history=5000
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト
set mouse=a " マウスでタブを切り替える
set ttymouse=xterm2 " screenやtmux上でvimがマウスを使えるかどうか検証する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set backspace=indent,eol,start
set showmatch " 括弧の対応関係を一瞬表示する
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する

if has('mouse')
  set mouse-=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> ,dd strftime("%Y-%m-%d") <Esc>[200~ XTermPasteBegin("")
endif

if neobundle#is_installed('neocomplete.vim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#min_keyword_length = 3
  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#auto_completion_start_length = 1
  inoremap ,dd strftime("%Y-%m-%d")<BS> neocomplete#smart_close_popup()."<C-h>"
  imap ,dd strftime("%Y-%m-%d")<CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
  imap ,dd strftime("%Y-%m-%d")<TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_mode_map = { 'mode': 'passive',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': [] }
set clipboard+=unnamedplus
set relativenumber
set noswapfile
set cursorline

function! s:RestoreCursorPostion()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
" ファイルを開いた時に、以前のカーソル位置を復元する
augroup vimrc_restore_cursor_position
    autocmd!
    autocmd BufWinEnter * call s:RestoreCursorPostion()
augroup END
if has('persistent_undo')
    let undo_path = expand('~/.vim/undo')
    exe 'set undodir=' .. undo_path
    set undofile
endif

"" ここからneovim用
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('~/.cache/dein')
"  call dein#begin('~/.cache/dein')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here:
"  call dein#add('Shougo/neosnippet.vim')
"  call dein#add('Shougo/neosnippet-snippets')
"  let s:toml = '~/.config/nvim/dein.toml'
"  call dein#load_toml(s:toml, {'lazy': 0})
"
"  " You can specify revision/branch/tag.
"  " call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
"  call dein#add('Shougo/deol.nvim')
"  " NERDTree
"  call dein#add('preservim/nerdtree')
"
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"syntax enable
"
"" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"" NERDTreeToggleのショートカット
"nnoremap <silent><C-e> :NERDTreeToggle<CR>
