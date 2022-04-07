# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/.go
PATH="$PATH"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:~/Documents/bin:/opt/android-studio/bin/:/opt/android-sdk/platform-tools:/opt/flutter/bin

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
export QUOTES_PATH="/home/stef/Documents/notes/quotes.md"

alias vim=nvim
alias quotes="$EDITOR $QUOTES_PATH"
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias chrome=chromium

setopt rm_star_silent
unalias rm
unalias cp

# taskwarrior completion & alias
zstyle ':completion:*:*:task:*' verbose yes
alias t=task
compdef _task t=task

# At startup
random_quote $QUOTES_PATH | cowsay -f tux | lolcat -F 0.2 -t

# Other plugins

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
