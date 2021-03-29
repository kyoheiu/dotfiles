#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PATH="$PATH":~/.local/bin
PATH="$PATH":~/.nimble/bin
PATH="$PATH":~/.cargo/bin/

export STARSHIP_CONFIG=~/.config/starship/starship.toml

eval "$(starship init bash)"
