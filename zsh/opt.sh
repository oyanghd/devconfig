#!/bin/bash

if in_path exa; then
  alias ls='exa -aF --icons'
  alias ll='ls -l --git --time-style iso'
  alias lt='command ls -lAhtrF --color=auto'
else
  alias ls='ls --color=auto -AF'
  alias ll='ls -hl'
  alias lt='ls -lAhtr'
fi

in_path trash && alias rm='trash-put -v'
in_path proxychains4 && alias pc=proxychains4
# in_path bat && alias cat=bat

if in_path nvim; then
  export VISUAL=nvim EDITOR=nvim
  alias vim='nvim'
  alias vi='nvim'
elif in_path vim; then
  export VISUAL=vim EDITOR=vim
  alias vi='vim'
elif in_path vi; then
  export VISUAL=vi EDITOR=vi
fi

if in_path pacman; then
  _pacman_autoremove() {
    local s
    if s="$(pacman -Qdtq)" && [ -n "$s" ]; then
      echo "$s" | $OYY_SUDO pacman -Rs -
    fi
  }
  OYY_PKG=pacman
  if in_path paru; then
    OYY_SYU='px paru -Syu --skipreview && _pacman_autoremove'
    alias paclean='yes | px paru -Scc'
  else
    OYY_SYU="$OYY_SUDO pacman -Syu && _pacman_autoremove"
    alias paclean="yes | $OYY_SUDO pacman -Scc"
  fi
  alias add="$OYY_SUDO pacman -S --needed"
  alias autoremove="$OYY_SUDO pacman -Rs \$(pacman -Qdtq)"
elif in_path apt; then
  OYY_PKG=apt
  OYY_SYU="$OYY_SUDO apt update && $OYY_SUDO apt upgrade && $OYY_SUDO apt autoremove --purge"
  alias add="$OYY_SUDO apt install"
  alias autoremove="$OYY_SUDO apt autoremove --purge"
  alias paclean="$OYY_SUDO apt clean"
elif in_path apk; then
  OYY_PKG=apk
  OYY_SYU="$OYY_SUDO apk -U upgrade"
  alias add="$OYY_SUDO apk add"
else
  OYY_PKG=
fi

if [ "$OSTYPE" = linux-gnu ]; then
  if in_path systemctl; then
    alias sutl='systemctl --user'
    alias jutl='journalctl --user'
    alias sctl="$OYY_SUDO systemctl"
    alias jctl="$OYY_SUDO journalctl"
  fi

  # _nohup_entry() {
  #   nohup "$@" >/dev/null 2>&1 & disown
  # }

  # in_path clion && alias clion='_nohup_entry clion'
  # in_path pycharm && alias pycharm='_nohup_entry pycharm'

  # _chrome_entry() {
  #   _nohup_entry "$@" --proxy-server=socks5://127.0.0.1:7890
  # }

  # in_path cider && alias cider='_chrome_entry cider'
  # in_path todoist && alias todoist='_chrome_entry todoist'
fi

pac() {
  if [ -z "$1" ]; then
    eval "$OYY_SYU"
  else
    $OYY_SUDO "$OYY_PKG" "$@"
  fi
}
