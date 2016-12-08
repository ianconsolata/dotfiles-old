#view using vim
alias view="vim -R"

source ~/bin/bashrc-private.sh
export TERM="xterm-256color"

alias ls='ls -pG'
alias ll='ls -pGl'
alias la='ls -pGla'

export LEIN_ROOT=1

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:/Users/idavis/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR=vim
set -o vi
alias macvim=gvim

alias ':e'='vim'
alias ':q'='exit'

alias git=hub
alias g=git
alias gst="git st"

alias aj="ag -G '\.(clj|cljs)$' -Q"
alias agcss="ag -G '\.(css|less)$' -Q"
alias ag="ag -Q"
alias ogag="/usr/local/bin/ag"

alias highlight_clipboard="pbpaste | highlight --font-size 24 --font Inconsolata --style zenburn --syntax=js -O rtf | pbcopy"

. `brew --prefix`/etc/profile.d/z.sh

# bash utility functions
cw() {
  watch -d -n1 "curl $@ 2>/dev/null"
}

# execute a command with no output
n() {
  "$@" >/dev/null 2>/dev/null
}

stderr() {
  echo "$@" >&2
}

putd() {
  stderr "$1=[${!1}]"
}

if [[ -d $HOME/.bashrc.d ]]; then
  for f in $HOME/.bashrc.d/*.sh; do
    [[ -s "$f" ]] && . "$f"
  done
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# do ". acd_func.sh"
# acd_func 1.0.5, 10-nov-2004
# petar marinov, http:/geocities.com/h2428, this is public domain

cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null && ls
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}

alias cd=cd_func

if [[ $BASH_VERSION > "2.05a" ]]; then
  # ctrl+w shows the menu
  bind -
fi

source ~/.prompt.sh

# added by travis gem
[ -f /Users/ian/.travis/travis.sh ] && source /Users/ian/.travis/travis.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
