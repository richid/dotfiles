alias k="kubectl "
alias kx="kube-exec "
alias kl="kube-logs "

if command -v kubectl &> /dev/null; then
    source <(kubectl completion zsh)
fi
