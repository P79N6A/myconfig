# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-vt220) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# -- Proxy Variables Start -- #
export all_proxy="child-prc.intel.com:913"
export http_proxy="http://child-prc.intel.com:913"
export https_proxy="https://child-prc.intel.com:913"
# -- Proxy Variables End -- #

# -- Maven Environment Variables Start -- #
export MVN_HOME=/opt/apache-maven
export PATH=$PATH:$MVN_HOME/bin
# -- Maven Environment Variables End -- #

# -- Java Environment Variables Start -- #
export JAVA_HOME=/opt/jdk
export PATH=$PATH:$JAVA_HOME/bin
# -- Java Environment Variables End -- #

# -- Hadoop Environment Variables Start -- #
export HADOOP_HOME=/usr/local/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export SPARK_HOME=/usr/local/spark
export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$SPARK_HOME/sbin
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
# -- Hadoop Environment Variables End -- #

alias sr701="screen -t sr701 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' test@10.0.5.1"
alias sr702="screen -t sr702 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' test@10.0.5.2"
alias sr703="screen -t sr703 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' test@10.0.5.3"
alias sr704="screen -t sr704 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' yihengw@10.0.5.4"
alias sr705="screen -t sr705 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' yihengw@10.0.5.5"
alias sr706="screen -t sr706 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' yihengw@10.0.5.6"
alias sr707="screen -t sr706 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' yihengw@10.0.5.7"
alias sr708="screen -t sr708 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' yihengw@10.0.5.8"
alias sr709="screen -t sr709 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' test@10.0.5.9"
alias sr710="screen -t sr710 ssh -o ProxyCommand='/bin/nc -X 5 -x 10.239.44.190:1080 %h %p' test@10.0.5.10"
alias dev="screen -t dev ssh ian@yihengw-dev.sh.intel.com"

alias gondolin="screen -t gondolin ssh yihengw@10.239.47.211"
alias gondolin-016="screen -t gondolin-016 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.116"
alias gondolin-018="screen -t gondolin-018 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.118"
alias gondolin-020="screen -t gondolin-020 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' yihengw@172.168.2.120"
alias gondolin-025="screen -t gondolin-025 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' yihengw@172.168.2.125"
alias gondolin-026="screen -t gondolin-026 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' yihengw@172.168.2.126"
alias gondolin-027="screen -t gondolin-027 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' yihengw@172.168.2.127"
alias gondolin-029="screen -t gondolin-029 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.129"
alias gondolin-046="screen -t gondolin-046 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.146"
alias gondolin-047="screen -t gondolin-047 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.147"
alias gondolin-061="screen -t gondolin-061 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' yihengw@172.168.2.161"
alias gondolin-062="screen -t gondolin-062 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.162"
alias gondolin-066="screen -t gondolin-066 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.166"
alias gondolin-067="screen -t gondolin-067 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' arda@172.168.2.167"
alias gondolin-071="screen -t gondolin-071 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8888 %h %p' yihengw@172.168.2.171"
alias gondolin-proxy="ssh -D 8888 -f -q -N yihengw@10.239.47.211"

alias bwcluster="screen -t bwcluster ssh dltest@10.239.47.135"
alias bwcluster-proxy="ssh -D 8889 -f -q -N dltest@10.239.47.135"
alias bw-node1="screen -t bw-node1 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8889 %h %p' dltest@bw-node1"
alias bw-node2="screen -t bw-node2 ssh -o ProxyCommand='/bin/nc -X 5 -x 127.0.0.1:8889 %h %p' dltest@bw-node2"


alias valinor="screen -t valinor ssh yihengw@10.239.47.210"


#. /home/ian/torch/install/bin/torch-activate
set -o vi
export EDITOR=vim

export PERFJ=/home/ian/perfj-1.0
export PATH=$PATH:$PERFJ/bin
export PATH=$PATH:/home/ian/workspace/FlameGraph

export LC_ALL=C
export PATH=$PATH:/opt/intel/bin
