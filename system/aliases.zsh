convertbytes() {
    IN="$(echo $1 | tr -d ,)"
    if [ $IN -lt 1024 ]; then
        echo -e "$IN bytes -> $IN bytes"
    elif [ $IN -lt 1048576 ]; then
        echo -e "$IN bytes -> $(echo -e "scale=3 \n$IN/1024 \nquit" | bc) KiB"
    elif [ $IN -lt 1073741824 ]; then
        echo -e "$IN bytes -> $(echo -e "scale=3 \n$IN/1048576 \nquit" | bc) MiB"
    elif [ $IN -lt 1099511627776 ]; then
        echo -e "$IN bytes -> $(echo -e "scale=3 \n$IN/1073741824 \nquit" | bc) GiB"
    else
        echo -e "$IN bytes -> $(echo -e "scale=3 \n$IN/1099511627776 \nquit" | bc) TiB"
    fi
}

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

alias cb="convertbytes $1"
alias rsc='reset && clear'

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi
