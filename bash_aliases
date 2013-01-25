
# Repeat a command N times
# From: http://www.stefanoforenza.com/how-to-repeat-a-shell-command-n-times/
repeat() {
    n=$1
    shift
    while [ $(( n -= 1 )) -ge 0 ]
    do
        "$@"
    done
}

# Goes to N directories upwards.
# ${1-1} means the first argument or the default value "1" if it is not set.
# ${parameter-default} as from: http://tldp.org/LDP/abs/html/parameter-substitution.html
up() {
    repeat ${1-1} cd ..
}

## basic command aliases
alias vi='vim'

## git aliases
alias gcm='git commit -m'
alias gits='git status'

## python webserver
alias pyserve='python -m SimpleHTTPServer'

## sage aliases
alias mysage='~/sage/latest/sage'

## google-chrome
alias chrome='google-chrome &> /dev/null &'

## misc

alias reload='source ~/.bash_profile'
alias reload_prompt='source ~/.bashrc'

alias dev="cd ~/git"
alias gits="git status"
alias gcm="git commit -m"

alias lsc='ls --color=auto'
alias l.='ls -la .'
alias ll='ls -l'
alias la='ls -la'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias fn='find . -name $@'

alias showall='defaults write com.apple.Finder AppleShowAllFiles true'
alias showallnot='defaults write com.apple.Finder AppleShowAllFiles false'
