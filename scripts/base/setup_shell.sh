#!/bin/sh

OH_MY_ZSH_DIR="$HOME/.tmp/oh-my-zsh"
INSTALL_SH="$OH_MY_ZSH_DIR/install.sh"

mkdir -p "$OH_MY_ZSH_DIR"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh --quiet -O "$INSTALL_SH"
chmod +x "$INSTALL_SH"

if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  zsh "$INSTALL_SH"
  cp "$HOME/.oh-my-zsh/templates/zshrc.zsh-template" ~/.zshrc
  sudo chsh -s /usr/bin/zsh vagrant
fi