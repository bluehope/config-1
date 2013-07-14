#!/bin/bash
DIR="$( cd "$( dirname "$0" )" && pwd )"
mv ~/.screenrc ~/.screenrc.old
ln -s $DIR/screenrc ~/.screenrc
mv ~/.vim ~/.vim.old
ln -s $DIR/vimfiles ~/.vim
mv ~/.vimrc ~/.vimrc.old
ln -s $DIR/vimrc ~/.vimrc
mv ~/.tmux.conf ~/.tmux.conf.old
ln -s $DIR/tmux.conf ~/.tmux.conf
cp bashrc ~/.bashrc
#mv ~/.emacs.d ~/.emacs.d.old
#ln -s $DIR/emacs.d ~/.emacs.d
#mv ~/.emacs ~/.emacs.old
#ln -s $DIR/emacs ~/.emacs
mv ~/.zshrc ~/.zshrc.old
ln -s $DIR/oh-my-zsh ~/.oh-my-zsh
ln -s $DIR/zshrc ~/.zshrc
chsh -s `which zsh`
