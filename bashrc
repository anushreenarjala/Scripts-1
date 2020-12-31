#.bashrc
export EDITOR=vim
#export LC_ALL=en_IN.UTF-8
#export LANG=en_IN.UTF-8
#export LANGUAGE=en_IN.UTF-8
#export PYTHONIOENCODING="utf_8"

# History support
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=1000000
#shopt -s histappend 
#export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
export SCRIPTHOME=$HOME/Scripts
if [ "$(uname)" == "Darwin" ]; then
    alias ls="gls --color=auto -ltr"
else
    alias ls='ls --color=auto'
    alias ll='ls -alF -ltr'
    alias la='ls -A -ltr'
    alias l='ls -CF -ltr'
fi
alias rm='rm -i'
alias sh='bash'
alias copy='rsync -azv --progress -C'
alias cpptags='ctags --exclude=node_modules/* --exclude=vendor/*'
alias lynx='lynx --cfg=$HOME/Scripts/lynx.cfg'
alias t='$SCRIPTHOME/todo.sh -d $SCRIPTHOME/todo.cfg'
alias pylint='pylint -E'
alias pdflatex="pdflatex -shell-escape"
alias lualatex="lualatex -shell-escape"

# Alias for tmux.
alias tmux="tmux -f $SCRIPTHOME/tmux/tmux.conf"

# mypy
alias mypy="mypy --config $SCRIPTHOME/mypy.ini"

# alias ghci='stack ghci'
# alias ghc='stack ghc'
# alias runghc='stack runghc'

# Create alias for vim to launch it in profile mode.
alias vv="vim --startuptime $HOME/.cache/vim_startup.log "

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f $HOME/.termcap ]; then
    TERMCAP=~/.termcap
    export TERMCAP
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# mutt
export PATH=$SCRIPTHOME:$HOME/.mutt:$PATH

PROXYFILE=$HOME/Scripts/proxy
if [ -f $PROXYFILE ]; then
    source $PROXYFILE;
fi

# read history for each terminal
#export PROMPT_COMMAND="history -n; history -a"
export LYNX_CFG=~/Scripts/lynx.cfg

if [ -f ~/Scripts/c ]; then 
    source ~/Scripts/c
fi


# vim mode in bash
set -o vi

# some more ls aliases
alias rm='rm -i'
alias sh='bash'
alias src='source ~/.bashrc'
alias gist='gist -c'
alias rsync='rsync --progress'
alias i='sudo emerge -avu --autounmask-write'
alias netcat='nc.openbsd'
alias ii='sudo apt-get -c ~/.aptconf install'
alias s='apt-cache search'
alias u='sudo apt-get upgrade'
alias cpptags='ctags --c++-kinds=+p --fields=+iaS --extra=+q'
alias lynx='lynx --cfg=$HOME/Scripts/lynx.cfg'
alias antlr4='java -jar /opt/antlr/antlr-4.0-complete.jar'
alias antrlworks='/opt/antlr/antlrworks2/bin/antlrworks2'
alias gcal='gcalcli --calendar="dilawar"'
alias move='mv -v -u -n'
# Notify when done.
alias lwd='$HOME/Scripts/notify_when_done.sh'

# NNN
export NNN_USE_EDITOR=1
export NNN_DE_FILE_MANAGER=thunar

export GOPATH=$HOME/go
if [ -f /etc/profile.d/bash-completion.sh ]; then
    source /etc/profile.d/bash-completion.sh 
fi
export SSHPASS=jH7qMYpF

export HOMEBREW_GITHUB_API_TOCKEN=8e08eccfe2ad9a8526ccf8992b4c68252fe390eb
#export PATH=/opt/texlive/2016/bin/x86_64-linux/:$PATH
#export TEXMF=/usr/share/texmf

#export JAVA_FLAGS="-Dhttp.proxyHost=proxy.ncbs.res.in -Dhttp.proxyPort=3128"
alias java="java ${JAVA_FLAGS}"

# To make sure that java launches with awesome windowmanager
export AWT_TOOLKIT=MToolkit

# User scripts
# source bash-preexec.sh 
# Now for very command prefix is with alert command so that I can get notified.
# source alert.sh
#xrdb ~/Scripts/Xresources || echo "X"
#unset SSH_ASKPASS

#if type pandoc > /dev/null; then
#    eval $(`which pandoc` --bash-completion)
#fi

#if [ -f ~/PYPY2/bin/activate ]; then
#    source ~/PYPY2/bin/activate 
#fi

# If directory exists, add to the path.
TEXDIR=/usr/local/texlive/2017/bin/x86_64-linux/
if [ -d $TEXDIR ]; then
    export PATH=$TEXDIR:$PATH
fi

## Source PYPY activate.
#if [ -f $HOME/Scripts/pypy_activate_func ]; then
#    source $HOME/Scripts/pypy_activate_func
#fi

if [ -f $HOME/Scripts/git_prompt.sh ]; then
    source $HOME/Scripts/git_prompt.sh
    export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

#if [ -f /etc/profile.d/undistract-me.sh ]; then 
#    source /etc/profile.d/undistract-me.sh
#fi
#
if [ -f /etc/profile.d/autojump.bash ]; then
    source /etc/profile.d/autojump.bash
fi

#if [ -d /home/linuxbrew ]; then
#    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH 
#fi


fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
alias c='fasd_cd -d'
alias v='f -e vim' # quick opening files with vim
alias mp='f -e mplayer' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open
_fasd_bash_hook_cmd_complete v m j o

export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# HOME/.local/bin
export PATH=$HOME/.local/bin:$PATH
export TERM=xterm

# pyenv
if [ -d $SCRIPTHOME/pyenv ]; then
    export PYENV_ROOT=$SCRIPTHOME/pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
fi

if command -v pyenv 1>/dev/null 2>&1 ; then 
    eval "$(pyenv init -)"
fi

# brew settings.
if type brew &>/dev/null; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
        source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
        for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
            [[ -r "$COMPLETION" ]] && source "$COMPLETION"
        done
    fi
fi

# mypy cache directory. By default, mypy create cache in the source directory.
# ctags creates tags from this file and move to cache file on tag jump which is
# so annoying.
export MYPY_CACHE_DIR=$HOME/.cache/mypy
mkdir -p $MYPY_CACHE_DIR
