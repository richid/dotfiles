# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at one of the $FILES below.

FILES=( /usr/local/etc/bash_completion.d/git-completion.bash /etc/bash_completion.d/git )

for i in "${FILES[@]}"
do
    if test -f $i
    then
        source $i
    fi
done
