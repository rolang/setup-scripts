#!/usr/bin/env bash

not_in_bashrc() {
  if [ $(cat ~/.bashrc | grep -c "$1") -lt 1 ]; then
    true
  else 
    false
  fi
}

add_to_bashrc() {
  if not_in_bashrc $1; then
    echo "$1" >> ~/.bashrc
  fi
}
