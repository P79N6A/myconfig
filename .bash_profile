export HOMEBREW_NO_AUTO_UPDATE=true
alias dev='ssh -q -l ubuntu -p 22 212.64.79.136'

# for color
export CLICOLOR=1
# \h:\W \u\$
export PS1='\[\033[01;33m\]\u@\h\[\033[01;31m\] \W\$\[\033[00m\] '
# grep
alias grep='grep --color=always'
