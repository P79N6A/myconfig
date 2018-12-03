export HOMEBREW_NO_AUTO_UPDATE=true

# for color
export CLICOLOR=1
# \h:\W \u\$
export PS1='\[\033[01;33m\]\u@\h\[\033[01;31m\] \W\$\[\033[00m\] '
# grep
alias grep='grep --color=always'
alias sshh='ssh -o ProxyCommand="corkscrew web-proxy.tencent.com 8080 %h %p"'
alias proxy='ssh -i /Users/yihengwang/personal.dms -Nf -D 127.0.0.1:8000 ubuntu@119.28.238.254'
