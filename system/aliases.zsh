# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if [ $(uname -s) = "Darwin" ]
then
  if $(gls &>/dev/null)
  then
    alias ls="gls -FA --color"
    alias l="gls -lh --color"
    alias ll="gls -lh --color"
  fi
elif [ $(uname -s) = "Linux" ]
then
  alias ls="ls -A --color"
  alias ll="ls -lh"
  alias l="ll"
fi
