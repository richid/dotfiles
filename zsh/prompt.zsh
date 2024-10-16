autoload colors && colors

if (( $+commands[git] )); then
    git="$commands[git]"
else
    git="/usr/bin/git"
fi

git_branch() {
    "$git" rev-parse --abbrev-ref HEAD
}

is_dirty() {
    if [ -n "$($git status --porcelain)" ]; then
        return 0
    else
        return 1
    fi
}

is_git_installed() {
    if command -v git > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

is_git_repo() {
    if "$git" rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

configure_prompt() {
    color="reset_color"

    if [[ $(id -u) -eq 0 ]]; then
        color="red"
    fi

    echo "%b%F{blue}%~%F{$color} # "
}

configure_rprompt() {
    color="reset_color"

    is_git_installed || return
    is_git_repo      || return
    is_dirty         && color="red"

    echo "%b%F{$color}$(git_branch)%F{reset_color}"
}

set_prompt () {
    PROMPT="$(configure_prompt)"
    RPROMPT="$(configure_rprompt)"

    export PROMPT
    export RPROMPT
}

precmd() {
    title "zsh" "%m" "%55<...<%~"
    set_prompt
}
