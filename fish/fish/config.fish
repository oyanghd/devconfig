if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish | source

alias in_path='whence -p >/dev/null'

alias cp='cp -iv'
alias mv='mv -iv'
alias ip='ip -c'

if in_path exa; then
  alias ls='exa -aF --icons'
  alias ll='ls -l --git --time-style iso'
  alias lt='command ls -lAhtrF --color=auto'
else
  alias ls='ls --color=auto -AF'
  alias ll='ls -hl'
  alias lt='ls -lAhtr'
fi

alias cd='z'
in_path trash && alias rm='trash-put -v'
in_path proxychains4 && alias pc=proxychains4
in_path zellij && alias ze='zellij'

if in_path nvim
  export VISUAL=nvim EDITOR=nvim
  alias vim='nvim'
  alias vi='nvim'
elif in_path vim
  export VISUAL=vim EDITOR=vim
  alias vi='vim'
elif in_path vi
  export VISUAL=vi EDITOR=vi
fi

set -x FZF_DEFAULT_OPTS "--color=hl:#f391a9,fg:#afdfe4,hl+:#f391a9,fg+:#ffe600"
set fish_color_command green --bold
set fish_color_autosuggestion f47920

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/oyhd/anaconda3/bin/conda
    eval /home/oyhd/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
