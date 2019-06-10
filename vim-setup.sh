#!/usr/bin/env bash

SCRIPTS_DIR=$(pwd)
VIMCONFIG=~/.vim
MINPAC_PATH=$VIMCONFIG/pack/minpac/opt/minpac
FZF_PATH=$VIMCONFIG/pack/bundle/start/fzf

if [ ! -d $MINPAC_PATH ]; then
  git clone https://github.com/k-takata/minpac.git $MINPAC_PATH
fi

if [ ! -d $FZF_PATH ]; then
  git clone https://github.com/junegunn/fzf $FZF_PATH
  $FZF_PATH/install --bin
  ln -sf $FZF_PATH/bin/fzf ~/.local/bin/fzf
fi

# ensure ripgrep is installed
if  [[ ! -z $(rg -V) ]]; then
  echo "$(rg -V) is installed."
else
  echo "installing ripgrep..."
  if [[ -z $(cargo -V) ]]; then 
    $SCRIPTS_DIR/rust.sh
  fi
 
  ~/.cargo/bin/cargo install ripgrep
fi

if [ $(cat ~/.bashrc | grep -c "export FZF_DEFAULT_COMMAND") -lt 1 ] ; then
  echo "export FZF_DEFAULT_COMMAND=\"rg --files\"" >> ~/.bashrc
fi

cp -f $SCRIPTS_DIR/.vimrc ~/.vimrc

echo "Vim-setup done!"

