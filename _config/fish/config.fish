# Shell language
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8

# PATH
set -gx PATH $PATH $HOME/bin /usr/local/bin /usr/local/sbin

# Oh My Fish
set -gx OMF_PATH "$HOME/.local/share/omf"

set -g fish_escape_delay_ms 600

# Package manager
switch (uname)
  case Darwin
    set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"
end

# git
set -gx GIT_EDITOR vim

# Go
set -gx GOPATH $HOME
set -gx GOROOT (go env GOROOT)
set -gx PATH $PATH $GOPATH/bin $GOROOT/bin

# NodeJS
if test -d $HOME/.node/bin
    set -gx PATH $PATH $HOME/.node/bin
end

# Ruby
set -gx BUNDLE_JOBS 7
if test -d $HOME/.rbenv/bin
  set -gx PATH $PATH $HOME/.rbenv/bin
end

# Lolcommits
set -gx LOLCOMMITS_FONT "/Library/Fonts/ヒラギノ角ゴ Std W8.otf"
set -gx LOLCOMMITS_FORK 1

# gcloud
switch (uname)
  case Darwin
      bass source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
      set -x MANPATH /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/help/man /usr/local/share/man /usr/share/man /opt/x11/share/man
end

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
      cd $recent
      commandline -r ''
      commandline -f repaint
  end
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
  bind \x1b peco_z
  bind \ett peco_todoist_item
  bind \etp peco_todoist_project
  bind \etl peco_todoist_labels
  bind \etc peco_todoist_close
  bind \etd peco_todoist_delete
end

function peco
  command peco --layout=top-down $argv
end

function todoist
  command todoist --color $argv
end

function grt
  cd (git rev-parse --show-toplevel; or echo "." )
end

function ssh
  exec-in-tab exec-and-close-tab term-color command ssh $argv
end

function mosh
  exec-in-tab exec-and-close-tab term-color command mosh $argv
end

function gh
  hub $argv
end

source $HOME/.config/fish/local.fish
