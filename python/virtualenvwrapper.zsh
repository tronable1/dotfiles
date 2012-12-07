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



# Do the actual virtualenvwrapper setup.

# Your virtualenv home storage folder.
export WORKON_HOME=$HOME/.virtualenv

# Source the script file.
wrapper=/usr/local/share/python/virtualenvwrapper.sh

if [ -f $wrapper ]
then
    source $wrapper
fi
