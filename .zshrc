# If you come from bash you might have to change your $PATH.
PATH="$PATH"
export PATH=~/personal/projects/bin:/opt/android-studio/bin/:/opt/android-sdk/platform-tools:/opt/flutter/bin:$PATH

fpath+=$HOME/.zsh/pure

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME=""

# Plugin list
plugins=(
  git common-aliases thefuck command-not-found
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
alias notes="$EDITOR ~/Documents/notes/index.md"
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias chrome=chromium

setopt rm_star_silent
unalias rm

# At startup

quotes ~/Documents/quotes.md | cowsay -f tux

# Other plugins

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
