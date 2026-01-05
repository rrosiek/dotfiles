#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# aliases
#
alias cd='z'
alias ls='eza -l --icons'
alias lt='eza -TL 2'
alias lta='eza -la --icons'
alias grep='grep --color=auto'
alias hx='/usr/bin/helix'
PS1='[\u@\h \W]\$ '

#
# functions
#
# For files or dirs (cd to selected dir, or parent if file)
cdf() {
  local target
  target=$(fzf --height 40% --preview 'bat --color=always {}' --reverse)
  if [ -n "$target" ]; then
    if [ -d "$target" ]; then
      cd "$target"
    else
      cd "$(dirname "$target")"
    fi
  fi
}

export PATH=$PATH:~/.mix/escripts:~/.cargo/bin
export HISTSIZE=10000
export HISTFILESIZE=25000
export HYPRSHOT_DIR=~/Pictures
export FZF_DEFAULT_COMMAND='fd .'

source ~/.env

eval "$(fzf --bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(mise activate bash)"
