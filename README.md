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
