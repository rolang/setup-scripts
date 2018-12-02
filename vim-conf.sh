#!/usr/bin/env bash
set -e

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

declare -a langs=(
"javascript"
"html"
"scala"
"haskell"
"rust"
)

query=""
for l in ${langs[@]}; do
    query+="langs=$l&"
done
query+="editor=vim"

curl 'http://vim-bootstrap.com/generate.vim' --data $query > ~/.vimrc
vim +PlugInstall +qall
