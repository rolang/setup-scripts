#!/usr/bin/env bash

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

curl 'http://vim-bootstrap.com/generate.vim' --data $query > ~/.vimrc
vim +PlugInstall +qall
