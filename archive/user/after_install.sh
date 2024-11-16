#!/bin/bash

DIR="$(dirname "$(readlink -f "$0")")"
USER_DIR="$HOME"
if [ -d "$USER_DIR/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then rm -Rf $USER_DIR/.oh-my-zsh/custom/plugins/zsh-autosuggestions; fi
if [ -d "$USER_DIR/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then rm -Rf $USER_DIR/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting; fi

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp -fr $DIR/.zshrc $USER_DIR/.zshrc
cp -fr $DIR/.zprofile $USER_DIR/.zprofile
echo "COPY $DIR/.tmux.conf $USER_DIR/.tmux.conf;"
cp -fr $DIR/.tmux.conf $USER_DIR/.tmux.conf

echo "Remove .bak files? [Y,n]:  "
read input
if [[ $input == "Y" || $input == "y" ]]; then
    rm -Rf $USER_DIR/.zshrc.bak
    rm -Rf $USER_DIR/.zprofile.bak
    rm -Rf $USER_DIR/.tmux.bak
    rm -Rf $USER_DIR/.tmux-themepack.bak

else
    echo "Finished. Press Ctrl+A Shift+I to install tmux plugins. Then go to nvim and Shift+: PlugInstall to install nvim plugins.";
fi
