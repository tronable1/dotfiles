#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  if [ -z $1 ]
  then
    echo "  x You should probably install Homebrew first:"
    echo "    https://github.com/mxcl/homebrew/wiki/installation"
    exit
  else
    info 'Checking for brew'
    if test ! $(which brew)
    then
      user 'brew installation'
      while true; do
        printf " - Would you like to install homebrew [y]es/[n]o? "
        read -n 1 action

        case "$action" in
          y )
            if test ! $(which ruby)
            then
              echo "You need ruby installed to install brew.\n" >> $1
              echo "See http://ruby-lang.org for more information.\n" >> $1
              fail 'Ruby not installed'
            fi

            if test ! $(which curl)
            then
              if test ! $(which wget)
              then
                echo "You need either curl or wget installed to install brew.\n" >> $1
                echo "Please install one or the other before continuing.\n" >> $1
                fail 'No curl or wget installed'
              else
                HOMEBREW="$(wget -qO - raw.github.com/mxcl/homebrew/go)"
              fi
            else
              HOMEBREW="$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
            fi

            ruby -e $HOMEBREW

            BREW_INSTALLED=true
            break
            ;;

          n )
            echo "Homebrew NOT installed." >> $1
            success 'Homebrew NOT installed.'
            BREW_INSTALLED=false
            break
            ;;

          * )
            echo "Please try again (y/n)"
            continue
            ;;
        esac
      done
    fi
  fi
fi

if [ -z $1 ]
then
  # Install homebrew packages
  brew install grc coreutils spark
else
  output=$1
  brew_installed () {
    brew list | grep -i $1 > /dev/null
    [ $? -eq 0 ]
  }

  brew_install () {
    if brew_installed $1
    then
      success $1
      return
    fi

    info "installing $1"
    if $2 >> $output
    then
      brew install $1 >> $output
      success $1
    else
      fail $1
    fi
  } 

  brew_install grc
  brew_install coreutils
  brew_install spark
fi
