# If you come from bash you might have to change your $PATH.
PATH="$PATH"
export PATH=~/Documents/projects/bin:/opt/android-studio/bin/:/opt/android-sdk/platform-tools:/opt/flutter/bin:$PATH

fpath+=$HOME/.zsh/pure

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME=""

# Plugin list
plugins=(
  git common-aliases thefuck command-not-found colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# Pure prompt
autoload -U promptinit; promptinit

zstyle :prompt:pure:path color '#FFBE63'
zstyle :prompt:pure:prompt:success color '#9F74DB' 

prompt pure

# vi mode
bindkey -v
export KEYTIMEOUT=1

# User configuration


# Preferred editor for local and remote sessions

export EDITOR='nvim'
export VISUAL='nvim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Custom

alias vim=nvim
alias notes=obsidian ~/Documents/notes/index.md
alias quotes="$EDITOR ~/Documents/notes/quotes.csv"
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias chrome=chromium

setopt rm_star_silent
unalias rm

# taskwarrior completion & alias
zstyle ':completion:*:*:task:*' verbose yes
alias t=task
compdef _task t=task

# At startup

random_quote ~/Documents/notes/quotes.csv | cowsay -f tux | lolcat

# Other plugins

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
