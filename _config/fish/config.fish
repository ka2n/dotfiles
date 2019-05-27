# LANG
set -gx LANG en_US.UTF-8
set -gx LC_TYPE en_US.UTF-8

# EDITOR
set -gx EDITOR vim

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

# PHP
#if type -q phpenv
#    status --is-interactive; and source (phpenv init -|psub)
#end

set -gx GOENV_ROOT $HOME/.goenv
set -gx PATH $GOENV_ROOT/bin $PATH 
if type -q goenv
    status --is-interactive; and source (goenv init -|psub)
    #set -gx PATH $GOROOT/bin $PATH
    #set -gx PATH $GOPATH/bin $PATH
end

# Lolcommits
set -gx LOLCOMMITS_FONT "/Library/Fonts/ヒラギノ角ゴ Std W8.otf"
set -gx LOLCOMMITS_FORK 1
set -gx LOLCOMMITS_DELAY 1
set -gx LOLCOMMITS_STEALTH 1
set -gx LOLCOMMITS_DEVICE "/dev/video0"

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

function urxvtc_window
  set -l query (commandline)
  if test -n $query
      urxvtc -e $query
  else
      return
  end
  commandline -r ''
  commandline -f repaint
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
  bind \c] peco_select_ghq_repository
  bind \co urxvtc_window
  #bind \x1b peco_z
  #bind \ett peco_todoist_item
  #bind \etp peco_todoist_project
  #bind \etl peco_todoist_labels
  #bind \etc peco_todoist_close
  #bind \etd peco_todoist_delete
end

function bitly
  command bitly -l $BITLY_LOGIN -k $BITLY_APIKEY $argv
end

function bitlyit
  command bitly -l $BITLY_LOGIN -k $BITLY_APIKEY $argv | xclip -i -sel clipboard > /dev/null
end

function peco
  command peco --layout=top-down $argv
end

function toggl
    command toggl $argv
    pkill -SIGRTMIN+1 i3blocks
end

function toggl-start
    toggl start -P (command toggl projects -show-client | peco | sed 's/  /\t/g' | cut -f2) $argv; pkill -SIGRTMIN+1 i3blocks
end

function ts
    set -l query $argv

    if test -n $query
      set peco_flags --query "$query"
    end

    set -l task (rtm export --format tab 'status:incomplete AND list:actions AND isLocated:false AND (NOT tag:waiting) AND (startBefore:now+8hours OR start:never)' | tail -n+2 | cut -f6 | peco $peco_flags | sed 's/ : /\t/g')
    if not test -n "$task"
        echo "empty task"
        return
    end
    set -l task_proj (echo $task | cut -f1)
    set -l task_name (echo $task | cut -f2-)

    set -l task_proj (if [ "$task_proj" = "$task_name" ]; echo "daily"; else; echo $task_proj; end)

    set -l toggl_proj (command toggl projects -show-client | peco --query $task_proj | sed 's/  /\t/g' | cut -f2)
    if not test -n "$toggl_proj"
        echo "empty project"
        return
    end

    toggl start -P $toggl_proj $task_name
end

function tn --wraps toggl-rtm --description 'alias tn toggl-rtm'
    toggl-rtm  $argv;
end

#    command toggl start -P (toggl projects | peco --query (rtm-now | peco | sed 's/ : /\t/g' | cut  -f2) | cut -d' ' ) $argv

#function todoist
#  command todoist --color $argv
#end

function grt
  cd (git rev-parse --show-toplevel; or echo "." )
end

#function ssh
#  exec-in-tab exec-and-close-tab term-color command ssh $argv
#end
#
#function mosh
#  exec-in-tab exec-and-close-tab term-color command mosh $argv
#end

function gh
  hub $argv
end

source $HOME/.config/fish/local.fish
