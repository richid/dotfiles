# vi is the default editor
set -o vi
export EDITOR=vim

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Debian packaging
export DEBFULLNAME="Rich Schumacher"

SSH_ENV="$HOME/.ssh/environment"
