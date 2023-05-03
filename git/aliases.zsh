# The rest of my fun git aliases
alias gci="git ci --amend --no-edit"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias gitsha="git rev-parse --short HEAD"
alias grup="git ru && git up"
alias gconflicts='vim -p $(git status -sb | grep UU | cut -d" " -f2)'

gp() {
    git push $@
}

gpf() {
    git push --force-with-lease $@
}

grp() {
    git remote prune $@
}

clone() {
    cd ~/Work
    git clone git@github.com:$1
    cd $1
}
