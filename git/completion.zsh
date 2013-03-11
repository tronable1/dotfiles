# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion_git=/usr/local/share/zsh/site-functions/_git
completion_hub=/usr/local/share/zsh/site-functions/_hub

if [ -f $completion_hub ]
then
  export FPATH="$completion_hub:$FPATH"
elif [ -f $completion_git ]
then
  export FPATH="$completion_git:$FPATH"
fi
