#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias vim='nvim'
alias ls='lsd -la'
alias cat='bat'

# git autocompletion
source /usr/share/git/completion/git-completion.bash

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
