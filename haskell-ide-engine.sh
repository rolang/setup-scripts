!#/usr/bin/env bash

sudo apt install libicu-dev libtinfo-dev libgmp-dev zlib1g-dev -y

if [ ! -z $(hie --numeric-version) ]; then
  echo "hie $(hie --numeric-version) already installed"
  echo "latest release version on github: $(curl -s https://api.github.com/repos/haskell/haskell-ide-engine/releases/latest | jq .tag_name)"

  if [ "$1" != "-f" ]; then
    echo "run with -f flag to force rebuild"
    exit 0
  fi
fi

mkdir -p ~/projects
cd ~/projects

HIE_PROJECT_NAME="haskell-ide-engine"

if [ -d $HIE_PROJECT_NAME ]; then
  echo "hie is already checked out, trying to update..."
  cd $HIE_PROJECT_NAME && git pull && ./install.hs build-all
else
  echo "checking out hie..."
  git clone https://github.com/haskell/$HIE_PROJECT_NAME --recursive
  cd $HIE_PROJECT_NAME && ./install.hs build-all
fi

