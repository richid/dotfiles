completion='$(brew --prefix)/share/zsh/site-functions/_docker'

if test -f $completion
then
  source $completion
fi
