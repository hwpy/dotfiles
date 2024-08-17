#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"
USER_DIR="$HOME"

echo $DIR
if [ -d "$USER_DIR/.oh-my-zsh" ]; then rm -Rf $USER_DIR/.oh-my-zsh; fi
if [ -e "$USER_DIR/.zshrc" ] ; then mv $USER_DIR/.zshrc $USER_DIR/.zshrc.bak; fi
if [ -e "$USER_DIR/.zprofile" ] ; then mv $USER_DIR/.zprofile $USER_DIR/.zprofile.bak; fi

if [ -d "$USER_DIR/.tmux.bak" ]; then rm -Rf $USER_DIR/.tmux.bak; fi
if [ -d "$USER_DIR/.tmux" ] ; then mv $USER_DIR/.tmux $USER_DIR/.tmux.bak; fi

if [ -d "$USER_DIR/.tmux-themepack.bak" ]; then rm -Rf $USER_DIR/.tmux-themepack.bak; fi
if [ -d "$USER_DIR/.tmux-themepack" ] ; then mv $USER_DIR/.tmux-themepack $USER_DIR/.tmux-themepack.bak; fi


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tpm
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack # themes

sh -c "$(curl -k -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
