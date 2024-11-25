completion='$(brew --prefix)/share/zsh/site-functions/_aws'

if test -f $completion
then
  source $completion
fi

complete -C '$(which aws_completer)' aws

fpath=(~/.awsume/zsh-autocomplete/ $fpath)
