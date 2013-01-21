wrapper=/usr/local/share/python/virtualenvwrapper.sh

# Unless the file exists, don't continue.
if [ -f $wrapper ]
then
    # Override the default search locations if we have python and virtualenv installed from brew.
    #
    # This is to get around the fact that we set our path AFTER we source this script.
    # -
    # We could also delay loading this script until the same point we do our completions in ~/.zshrc
    # but then we would have crappy automation.
    if [ -f /usr/local/bin/python ]; then
        export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python"
    fi

    if [ -f /usr/local/share/python/virtualenv ]; then
        export VIRTUALENVWRAPPER_VIRTUALENV="/usr/local/share/python/virtualenv"
    fi

    # Your virtualenv home storage folder.
    export WORKON_HOME=$HOME/.virtualenv

    # The project home so we can use mkproject to make new projects at the same time we
    # create new virtual environments.
    #
    # We are setting this in ~/.zshrc now so we can overload the same environment variable
    # to get us at the same folder.
    #
    # export PROJECT_HOME=$HOME/code

    source $wrapper
fi
