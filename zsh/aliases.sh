#!/bin/bash

alias cp='cp -iv'
alias mv='mv -iv'
alias ip='ip -c'

# export OYY_PROXY=http://127.0.0.1:7890
px_vars="$(eval echo {HTTP,HTTPS,ALL}_PROXY='\$OYY_PROXY' {http,https,all}_proxy='\$OYY_PROXY' {NO_PROXY,no_proxy}=\''localhost,127.0.0.1,10.0.0.*'\')"
alias px="$px_vars"
alias epx='[ -n "$OYY_PROXY" ] && export '"$px_vars"
alias unepx='unset {HTTP,HTTPS,ALL,NO}_PROXY {http,https,all,no}_proxy'
unset px_vars

pwd() {
	if [ -n "$1" ] && [[ "$1" != -* ]]; then
		realpath "$@"
	else
		command pwd "$@"
	fi
}

mkcd() {
  mkdir -p -- "$1" && \
  cd -P -- "$1"
}

reload() {
  OYY_RELOAD=1 exec ${1:-zsh}
}

alias reload='reload "${0#-}"'
