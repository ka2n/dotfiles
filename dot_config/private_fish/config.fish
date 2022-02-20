set fish_greeting

# EDITOR
set -gx EDITOR vim

set -g fish_escape_delay_ms 600

function fish_title
    set -q argv[1]; or set argv fish
    echo (fish_prompt_pwd_dir_length=2 prompt_pwd): $argv;
end

# Package manager
switch (uname)
  case Darwin
    set -gx HOMEBREW_CASK_OPTS "--appdir=/Applications"
end

# git
set -gx GIT_EDITOR vim

# PHP
alias sail=vendor/bin/sail

# Envs
source /opt/asdf-vm/asdf.fish
## Anyenv
#status --is-interactive; and source (anyenv init - fish|psub)


#set -gx VOLTA_HOME "$HOME/.volta"
#set -gx PATH "$VOLTA_HOME/bin" $PATH

set -gx PATH $HOME/go/bin $PATH 
set -gx PATH $HOME/.bun/bin $PATH 

# Lolcommits
set -gx LOLCOMMITS_FONT "/Library/Fonts/ヒラギノ角ゴ Std W8.otf"
set -gx LOLCOMMITS_FORK 1
set -gx LOLCOMMITS_DELAY 1
set -gx LOLCOMMITS_STEALTH 1
set -gx LOLCOMMITS_DEVICE "/dev/video0"

# fzf
set -U FZF_FIND_FILE_COMMAND "fd --hidden --type f . \$dir --color=always"
set -U FZF_CD_COMMAND "fd --hidden --type d . \$dir --color=always"
set -U FZF_DEFAULT_OPTS "--ansi --height=40% --layout=reverse"

if type -q fzf
    function fzf_ghq_select_repository
        set -l query (commandline)
        set -l fzf_flags

        set -a fzf_flags (echo $FZF_DEFAULT_OPTS | string split ' ')

        if test -n $query
            set fzf_flags --query "$query"
        end

        set -a fzf_flags --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*"

        ghq list | fzf $fzf_flags | read line

        if [ $line ]
            cd (ghq list --full-path --exact $line)
            commandline -f repaint
        end
    end
end

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end

function fish_user_key_bindings
  #bind \cr 'peco_select_history (commandline -b)'
  bind \c] 'fzf_ghq_select_repository (commandline -b)'
  #bind \co urxvtc_window
  #bind \ett peco_todoist_item
  #bind \etp peco_todoist_project
  #bind \etl peco_todoist_labels
  #bind \etc peco_todoist_close
  #bind \etd peco_todoist_delete
end


if type -q bitly
    function bitly
      command bitly -l $BITLY_LOGIN -k $BITLY_APIKEY $argv
    end

    function bitlyit
      command bitly -l $BITLY_LOGIN -k $BITLY_APIKEY $argv | xclip -i -sel clipboard > /dev/null
    end
end

if type -q peco
    function peco
      command peco --layout=top-down $argv
    end
end

if type -q toggl
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
end

if type -q lsd
    abbr --add ls "lsd"
    abbr --add ll "lsd -lh"
    abbr --add la "lsd -la"
end

if type -q bat
    abbr --add cat "bat"
end

if type -q colordiff
    abbr --add diff "colordiff"
end

if type -q neovide
    abbr --add gvim "neovide"
end

if type -q nvim
    abbr --add vim "nvim"
end

if type -q ag
    alias ag='ag --hidden'
end

if type -q hgrep
    alias hgrep='hgrep --hidden --theme ayu-mirage'

    function hgrep
        command hgrep --term-width $COLUMNS $argv| less -R
    end
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

bind \cx\ce edit_command_buffer

if type -q git-switch-trainer
    alias git="git-switch-trainer"
end

if test -e $HOME/.local/share/fish/local.fish
    source $HOME/.local/share/fish/local.fish
end

if type -q direnv
    direnv hook fish | .
end

# Bun
set -Ux BUN_INSTALL "/home/k2/.bun"
set -px --path PATH "/home/k2/.bun/bin"

if type -q starship
    starship init fish | source
end
