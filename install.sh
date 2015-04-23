#!/bin/bash

BASEDIR=$( cd $(dirname $0) ; pwd -P )

curl -L http://install.ohmyz.sh | sh

ln -snf $BASEDIR/_zshrc.custom $HOME/.zshrc.custom
ln -snf $BASEDIR/_zsh $HOME/.zsh
ln -snf ./_tmux.conf $HOME/.tmux.conf
ln -snf ./_tmux.osx.conf $HOME/.tmux.osx.conf

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

export PATH=/usr/local/sbin:/usr/local/bin$PATH
export GOPATH=$HOME

brew doctor
brew update
brew upgrade

brew tap phinze/cask
brew tap homebrew/binary
brew tap sonots/homebrew-mycask
brew tap mopidy/mopidy
brew tap neovim/homebrew-neovim

brew install zsh --disable-etcdir
brew install vim
brew install --HEAD neovim
brew install tmux
brew install git
brew install hg
brew install hub
brew install tig
brew install icdiff
brew install go
brew install python
brew install python3
brew install node
brew install rbenv
brew install ruby-build
brew install nodenv
brew install sl
brew install watch
brew install readline
brew install libxml2
brew install libxslt
brew install imagemagick
brew install ag
brew install jq
brew install ngrep
brew install autojump
brew install tree
brew install heroku-toolbelt
brew install gnu-sed
brew install wget
brew install wrk
brew install reattach-to-user-namespace
brew install packer
brew install brew-cask
brew install ngrok
brew install git-now
brew install xcproj
brew install pwgen
brew cask install xquartz
brew cask install iterm2
brew cask install appcode
brew cask install boot2docker
brew cask install google-japanese-ime
brew cask install macvim-kaoriya
brew cask install coteditor
brew cask install firefox
brew cask install google-chrome
brew cask install sourcetree
brew cask install virtualbox
brew cask install vagrant
brew cask install keyremap4macbook
brew cask install screenhero
brew cask install sqwiggle
brew cask install dropbox
brew cask install spotify
brew cask install alfred
brew cask install evernote
brew cask install yorufukurou
brew cask install onyx
brew cask install bittorrent-sync
brew cask install arq
brew cask install selfcontrol
brew cask install onepassword
brew cask install github
brew cask install omnifocus
brew cask install launchcontrol
brew cask install imagealpha
brew cask install wireshark
brew cask install near-lock
brew cleanup


# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv install -s 2.1.2
rbenv global 2.1.2
gem install bundler
bundle install

# Go
go get -u code.google.com/p/go.tools/cmd/goimports
go get -u code.google.com/p/go.tools/cmd/godoc
go get -u code.google.com/p/rog-go/exp/cmd/godef
go get -u github.com/nsf/gocode
go get -u github.com/tools/godep
go get -u github.com/peco/peco/cmd/peco
go get -u github.com/gophertown/looper

# Python
pip2 install --upgrade -r ./requirement.txt
