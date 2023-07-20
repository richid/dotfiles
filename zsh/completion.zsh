# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Output all possible results for make targets
zstyle ':completion:*:make:*:targets' call-command true

zstyle ':completion:*:*:make:*' tag-order 'targets'
