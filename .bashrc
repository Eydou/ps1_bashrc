# .bashrc

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"
    PS1="\[\033[1;32m\]\342\224\214\342\224\200\[\033[1;32m\](\[\033"

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}\u${RCol}"
    else
        PS1+="${Gre}\u${RCol}"
    fi

	PS1+="\033[1;30m\]@\[\033[0;36m\]\H\[\033[1;32m\])\[\033[0;37m\]-\[\033[1;32m\](\[\033[0;36m\]$(parse_git_branch)\[\033[1;32m\])\n\[\033[1;32m\]\342\224\224\342\224\200\342\224\200\342\225\274\[\033[1;32m\](\[\033[0;36m\]\W\[\033[1;32m\])\[\033[0;32m\]-> \[\033[0;38m\]"
}
