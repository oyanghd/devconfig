#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

alias in_path='whence -p >/dev/null'

if [ -v TERMUX_VERSION ] && in_path gpg-connect-agent; then
  export GPG_TTY=$(tty)
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  OYY_PROXY=
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# Allow overridden by environment
if [ ! -v OYY_PROXY ]; then
  export OYY_PROXY=http://127.0.0.1:7890
fi

if [ "$USER" != root ] && ! [ -v TERMUX_VERSION ] && in_path sudo; then
  OYY_SUDO='sudo'
fi

HERE="$HOME"/devconfig/zsh
. "$HERE"/aliases.sh
. "$HERE"/opt.sh

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && px git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=9'
YSU_MESSAGE_POSITION=after
YSU_MODE=ALL
ZINIT[COMPINIT_OPTS]=-C

#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

rationalise-dot() {
  local MATCH # keep the regex match from leaking to the environment
  if [[ $LBUFFER =~ '(^|/| |      |'$'\n''|\||;|&)\.\.$' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
  else
    zle self-insert
  fi
}

_post_plugin() {
  # bindkey '^[[1;2C' forward-word
  # bindkey '^[[1;2D' backward-word

  # bindkey '^[[1;3C' forward-word
  # bindkey '^[[1;3D' backward-word

  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word

  # bindkey '^F' forward-word
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down

  zle -N rationalise-dot
  bindkey . rationalise-dot
  # bindkey -M isearch . self-insert
}

zinit light-mode depth=1 for \
  romkatv/powerlevel10k \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-history-substring-search \
  MichaelAquilina/zsh-you-should-use \
  jeffreytse/zsh-vi-mode \
  has'make' as"program" pick"$ZPFX/bin/git-*" src"etc/git-extras-completion.zsh" make"PREFIX=$ZPFX" \
  tj/git-extras \
  if'[[ -v TERMUX_VERSION || "$(</proc/$PPID/cmdline)" =~ "terminal|login" ]] 2>/dev/null' \
    chriskempson/base16-shell


zicompinit; zicdreplay
[ -n $OYY_PKG ] && compdef pac=$OYY_PKG
in_path kubectl && source <(kubectl completion zsh)
in_path zoxide && eval "$(zoxide init zsh)"
_zsh_autosuggest_start

zinit ice lucid depth=1 has='fzf'
zinit light Aloxaf/fzf-tab

zinit ice svn depth=1 has='svn'
zinit snippet OMZP::extract

zinit ice depth=1 wait='0' atinit='_post_plugin'
zinit snippet OMZ::lib/history.zsh

HERE="${XDG_CONFIG_HOME:=$HOME/.config}/devconfig/zsh.d"
if [ -d "$HERE" ]; then
  for i in "$HERE"/*; do
    . "$i"
  done
fi
unset HERE
