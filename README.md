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
