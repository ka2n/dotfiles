#!/bin/bash

BASEDIR=$( cd $(dirname $0) ; pwd -P )

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

ln -snf $BASEDIR/_config $HOME/.config
ln -snf $BASEDIR/_tmux.conf $HOME/.tmux.conf

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export GOPATH=$HOME

# Language Version
curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

brew doctor
brew update
brew upgrade

brew tap phinze/cask
brew tap homebrew/binary
brew tap sonots/homebrew-mycask
brew tap mopidy/mopidy
brew tap neovim/homebrew-neovim

brwe install fish
curl -L http://get.oh-my.fish | fish

brew install vim
brew install tmux
brew install git
brew install tig
brew install go
brew install python
brew install node
brew install elixir
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
brew install gh
brew install ghq
brew install jq
brew install ngrep
brew install autojump
brew install tree
brew install heroku-toolbelt
brew install gnu-sed
brew install wget
brew install reattach-to-user-namespace
brew install brew-cask
brew install ngrok
brew install git-now
brew install git-secrets
brew install pwgen
brew install envchain

brew cask install visual-studio-code
brew cask install xquartz
brew cask install iterm2
brew cask install appcode
brew cask install google-japanese-ime
brew cask install coteditor
brew cask install firefox
brew cask install google-chrome
brew cask install karabiner-elements
brew cask install hammerspoon
brew cask install screenhero
brew cask install dropbox
brew cask install spotify
brew cask install alfred
brew cask install evernote
brew cask install yorufukurou
brew cask install onyx
brew cask install selfcontrol
brew cask install onepassword
brew cask install launchcontrol
brew cask install imagealpha
brew cask install wireshark
brew cask install fabric
brew cask install duet
brew cleanup

defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

# Install from App Store
# alternote


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
brew cask install google-cloud-sdk

# NodeJS
npm install -g eslint_d
npm install -g babel-eslint
npm install -g eslint-plugin-react
