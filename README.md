# vimrc
# .gitignoreに書くこと
*
!/.vimrc
# 使い方
$ git clone https://github.com/satorunooshie/vimrc.git
$ mv ~/.vimrc ~/.vimrc.old
$ mv /vimrc/.vimrc ~/.vimrc
" molokaiやundofileのところでエラーが出るかもしれない
" 好みじゃなければ消してください
# molokaiのカラースキームのエラー解消方法
$ mkdir ~/.vim
$ cd ~/.vim
$ mkdir colors
$ git clone https://github.com/tomasr/molokai
$ mv molokai/colors/molokai.vim ~/.vim/colors/
# undofileのエラー解消方法
$ mkdir ~/.vim/undo
# neovimへの移行
 " ただし、set:set ttymouse=xterm2を削除する
$ brew install neovim
$ nvim --version
$ mkdir ~/.config
$ mkdir ~/.config/nvim
$ ln ns ~/.vimrc ~/.config/nvim/init.vim
" これでいけなかった場合は$ cp ~/.vimrc ~/.vimrc.old ln -fns ~/.vimrc ~/.vimrc ln -fns ~/.vimrc ~/.config/nvim/init.vim rm ~/.vimrc mv ~/.vimrc.old ~/.vimrc
$ cp ~/.vim/colors ~/.config/nvim
# aliasの設定
$ echo alias vim='nvim' >> .bash_profile
# dein.vim導入
＄ curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
$ sh ./installer.sh ~/.cache/dein
" 以下のコードを設定ファイルに追加する
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
 
" Required:
set runtimepath+=/Users/adachin/.cache/dein/repos/github.com/Shougo/dein.vim
 
" Required:
if dein#load_state('/Users/adachin/.cache/dein')
  call dein#begin('/Users/adachin/.cache/dein')
 
  " Let dein manage dein
  " Required:
  call dein#add('/Users/adachin/.cache/dein/repos/github.com/Shougo/dein.vim')
 
  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
 
  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })
 
  " Required:
  call dein#end()
  call dein#save_state()
endif
 
" Required:
filetype plugin indent on
syntax enable
 
" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
 
"End dein Scripts-------------------------
" 次に~/.config/nvim/dein.tomlで以下を追加して終了
[[plugins]]
repo = 'colors/molokai'
# 詳しくは別ブランチで
