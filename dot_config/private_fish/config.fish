set fish_greeting

# EDITOR
set -gx EDITOR nvim

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
set -gx GIT_EDITOR nvim

# PHP
alias sail=vendor/bin/sail

alias j=just
alias jc='just --choose'
alias jl='just --list'

# Envs
if type -q mise
    mise activate fish | source
end

#set -gx VOLTA_HOME "$HOME/.volta"
#set -gx PATH "$VOLTA_HOME/bin" $PATH

set -gx PATH $HOME/go/bin $PATH 

# Lolcommits
set -gx LOLCOMMITS_FONT "/Library/Fonts/ヒラギノ角ゴ Std W8.otf"
set -gx LOLCOMMITS_FORK 1
set -gx LOLCOMMITS_DELAY 1
set -gx LOLCOMMITS_STEALTH 1
set -gx LOLCOMMITS_DEVICE "/dev/video0"

# miru
set -gx MIRU_PAGER_STYLE pink

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

        set -a fzf_flags --preview "bat --color=always --style=header,grid --line-range :80 (ghq root)/{}/README.*"

        ghq list | fzf $fzf_flags | read line

        if [ $line ]
            cd (ghq list --full-path --exact $line)
            commandline -f repaint
        end
    end
end

if type -q op
    function opr
        argparse -n oprr -x 'e,g,h' 'e/env=' 'g/global' 'h/help' -- $argv
        or return 1

        if test -n "$_flag_h"
            echo "Usage: opr [-e|--env ENV_FILE] [-g|--global] -- COMMAND"
            return 0
        end

        if not op whoami > /dev/null
            op signin
            op whoami
        end

        # if $_flag_g is set, use global env file
        # if $_flag_e is set, use the specified env file
        # if neither is set, use the default env file
        # default env file is "$PWD/.env" or "$HOME/.env.1password"
        if test -n "$_flag_g"
            set env_file "$HOME/.env.1password"
        else if test -n "$_flag_e"
            set env_file "$_flag_e"
        else
            # Start from current directory and search up to git root
            set current_dir $PWD
            set env_file ""

            # Try to get git root directory (will fail if not in a git repo)
            set git_root (git rev-parse --show-toplevel 2>/dev/null)

            # If we're in a git repository, search from current dir up to git root
            if test -n "$git_root"
                while test "$current_dir" != "$git_root"
                    if test -f "$current_dir/.env.1password"
                        set env_file "$current_dir/.env.1password"
                        break
                    end
                    
                    # Move up to parent directory
                    set current_dir (dirname $current_dir)
                end
                
                # Check at git root as well (final check)
                if test -z "$env_file" -a -f "$git_root/.env.1password"
                    set env_file "$git_root/.env.1password"
                end
            end

            # If no file found in path to git root, use home directory
            if test -z "$env_file"
                set env_file "$HOME/.env.1password"
            end
        end

        set_color blue; echo "Using env file: $env_file"; set_color normal

        op run --env-file="$env_file" --no-masking -- $argv
    end
end

if type -q yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end

abbr --add golatest 'set -x GOTOOLCHAIN (curl -s -L "https://go.dev/VERSION?m=text" | head -n 1)+auto'

# gcloud
# The next line updates PATH for the Google Cloud SDK.
if test -e "$HOME/google-cloud-sdk/path.fish.inc"
    source "$HOME/google-cloud-sdk/path.fish.inc"
end

function fish_user_key_bindings
  bind \c] 'fzf_ghq_select_repository (commandline -b)'
end


if type -q atuin
    atuin init --disable-up-arrow fish | source
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

if type -q claude
    abbr --add claudex "claude --dangerously-skip-permissions"
    abbr --add vclaude "vt claude --dangerously-skip-permissions"
end

if type -q codex
    abbr --add codexbest "codex --yolo --search"
end

if type -q rg
    alias rg='rg --smart-case'
end

alias ..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'

#    command toggl start -P (toggl projects | peco --query (rtm-now | peco | sed 's/ : /\t/g' | cut  -f2) | cut -d' ' ) $argv

#function todoist
#  command todoist --color $argv
#end

function grt
  cd (git rev-parse --show-toplevel; or echo "." )
end

function upp
  cd (find-parent-package-dir; or echo "." )
end

#function ssh
#  exec-in-tab exec-and-close-tab term-color command ssh $argv
#end
#
#function mosh
#  exec-in-tab exec-and-close-tab term-color command mosh $argv
#end

bind \cx\ce edit_command_buffer

# 1password
#source $HOME/.config/op/plugins.sh

if test -e $HOME/.local/share/fish/local.fish
    source $HOME/.local/share/fish/local.fish
end

if type -q direnv
    direnv hook fish | .
end

# Bun
set -Ux BUN_INSTALL "/home/k2/.bun"
set -px --path PATH "/home/k2/.bun/bin"

# Aqua
set -px --path PATH "$HOME/.local/share/aquaproj-aqua/bin"
set -gx AQUA_GLOBAL_CONFIG "$HOME/.config/aquaproj-aqua/aqua.yaml"

if type -q starship
    starship init fish | source
end
