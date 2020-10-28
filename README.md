# vimrc
# .gitignore
*
!/.vimrc
# ここまで
$ git clone https://github.com/satorunooshie/vimrc.git
$ mv ~/.vimrc ~/.vimrc.old
$ mv /vimrc/.vimrc ~/.vimrc
#molokaiやundofileのところでエラーが出るかもしれない
#好みじゃなければ消してください
$ mkdir ~/.vim
$ cd ~/.vim
$ mkdir colors

$ git clone https://github.com/tomasr/molokai
$ mv molokai/colors/molokai.vim ~/.vim/colors/
#------------------------------------------
$ mkdir ~/.vim/undo
