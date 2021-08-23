# If you come from bash you might have to change your $PATH.
PATH="$PATH"
export PATH=~/personal/projects/bin:/opt/android-studio/bin/:/opt/android-sdk/platform-tools:/opt/flutter/bin:$PATH
export KUBECONFIG=~/.kube/config:~/.kube/config-athena

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
alias sudo="sudo "
alias notes="$EDITOR ~/Documents/notes/index.md"
alias dot="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias vpn="/home/sradu/Documents/vpn-sso/vpn-sso connect --ca ~/Documents/cert/ca_cert.crt --cert ~/Documents/cert/user_cert.crt --key ~/Documents/cert/user_cert.key --gateway ra.bitdefender.com"
alias vpn_debug="/home/sradu/Documents/vpn-sso/vpn-sso --log-level debug connect --ca ~/Documents/cert/ca_cert.crt --cert ~/Documents/cert/user_cert.crt --key ~/Documents/cert/user_cert.key --gateway ra.bitdefender.com"

# taskwarrior completion & alias
zstyle ':completion:*:*:task:*' verbose yes
alias t=task
compdef _task t=task

setopt rm_star_silent
unalias rm

# Other plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

# kubectl completion
source <(kubectl completion zsh)

