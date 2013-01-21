# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if [ $(uname -s) = "Linux" ]; then
  alias ls="ls -A --color"
elif [ $(uname -s) = "Darwin" ]; then
  if [ -x "/usr/local/bin/gls" ]; then
    alias ls="gls -FA --color"
  fi
fi

alias ll="ls -lh"
alias l="ll"
