#!/bin/bash

BASEDIR=`dirname $0`

curl -L http://install.ohmyz.sh | sh

ln -snf $BASEDIR/_zshrc.custom $HOME/.zshrc.custom
ln -snf $BASEDIR/_zsh $HOME/.zsh

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew doctor
brew bundle

rbenv install -s 2.1.2
rbenv global 2.1.2

go get code.google.com/p/go.tools/cmd/goimports
go get code.google.com/p/go.tools/cmd/godoc
go get code.google.com/p/rog-go/exp/cmd/godef
go get github.com/nsf/gocode
go get github.com/mattn/gom
go get github.com/tools/godep
go get github.com/peco/peco/cmd/peco

pip2 install -r ./requirement.txt
gem install bundler
