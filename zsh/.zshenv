# Basic env
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"   # Zsh env

# Zinit plugin manager
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# History
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# Dotfiles
export DOTFILES="$HOME/.dotfiles"

# ls colors
LS_COLORS=$LS_COLORS:'di=1;34:'
LS_COLORS=$LS_COLORS:'ln=0;33:'
export LS_COLORS

# Cargo
. "$HOME/.cargo/env"

# time
export TIMEFMT=$'\n----------------\ntotal %E\nusr   %U\nsys   %S'

# fzf
# export FZF_DEFAULT_OPTS="--height 75% \
# --border sharp \
# --layout reverse \
# --color '$FZF_COLORS' \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒"
# export FZF_DEFAULT_OPTS="
#     --height=99%
#     --layout=reverse
#     --pointer='█'
#     --scrollbar='▌'
#     --highlight-line
#     --color=hl:#f3be7c
#     --color=bg:-1
#     --color=gutter:-1
#     --color=bg+:#252530
#     --color=fg+:#aeaed1
#     --color=hl+:#f3be7c
#     --color=border:#606079
#     --color=prompt:#bb9dbd
#     --color=query:#aeaed1:bold
#     --color=pointer:#aeaed1
#     --color=scrollbar:#aeaed1
#     --color=info:#f3be7c
#     --color=spinner:#7fa563
#     "

export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix --exclude .git .node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

# ssh agent
export SSH_ENV="$HOME/.ssh/agent-environment"

# nvm
export NVM_DIR="$XDG_DATA_HOME/nvm"

# Man pages
export MANPAGER='nvim +Man!'

# fcitx5
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# jdk-24
export JAVA_HOME="$HOME/.local/share/java"

# maven
export MAVEN_HOME="$HOME/.local/share/maven"

# bake - Makefile formatter
export BAKE_HOME="$HOME/bake"

# PATH
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$HOME/go/bin
# PATH=$PATH:/opt/homebrew/bin
BUN_INSTALL="$HOME/.bun"
PATH="$BUN_INSTALL/bin:$PATH"
PATH=$JAVA_HOME/bin:$PATH
PATH=$MAVEN_HOME/bin:$PATH
PATH=$BAKE_HOME/bin:$PATH

# place this at bottom of PATH
export PATH=$(echo $PATH | tr ':' '\n' | awk '!x[$0]++' | paste -sd':' -)
