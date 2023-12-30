if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH "$PATH:/home/oyhd/.cargo/bin/"

starship init fish | source
zoxide init fish | source

alias cp='cp -iv'
alias mv='mv -iv'
alias ip='ip -c'

if command -v exa > /dev/null
  alias ls='exa -aF --icons'
  alias ll='ls -l --git --time-style iso'
  alias lt='command ls -lAhtrF --color=auto'
else
  alias ls='ls --color=auto -AF'
  alias ll='ls -hl'
  alias lt='ls -lAhtr'
end

alias cd='z'
command -v trash > /dev/null && alias rm='trash-put -v'
command -v proxychains4 > /dev/null && alias pc=proxychains4
command -v zellij > /dev/null && alias ze='zellij'

# Check if nvim is in the path
if command -v nvim > /dev/null
    set -gx VISUAL nvim
    set -gx EDITOR nvim
    alias vim 'nvim'
    alias vi 'nvim'
# Check if vim is in the path
else if command -v vim > /dev/null
    set -gx VISUAL vim
    set -gx EDITOR vim
    alias vi 'vim'
# Check if vi is in the path
else if command -v vi > /dev/null
    set -gx VISUAL vi
    set -gx EDITOR vi
end

set -x FZF_DEFAULT_OPTS "--color=hl:#f391a9,fg:#afdfe4,hl+:#f391a9,fg+:#ffe600"
set fish_color_command green --bold
set fish_color_autosuggestion f47920

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/oyhd/anaconda3/bin/conda
    eval /home/oyhd/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
