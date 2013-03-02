export TERM=xterm-256color

export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH

export GEM_HOME=$(brew --prefix)

export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

export TESSDATA_PREFIX=$HOME/tesseract-ocr-read-only/

#See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
PS1="\[\033[0;34m\][\u@\h:\w]$\[\033[0m\]"

#
# ---------> VERY IMPORTANT: Bash eternal history <---------
#
# This incredibly important snippet allows infinite recording of
# every command you've ever entered on the machine. It works
# without using lots of memory w/ a large HISTFILESIZE *and* keeps
# track if you have multiple screens and ssh sessions into the
# same machine.
#
# The way it works is that after each command is executed and
# before a prompt is displayed, a line with the last command (and
# some metadata) is written to ~/.bash_eternal_history.
#
# This file ia tab-delimited, timestamped file, w/ the following columns:
#
# 1) user
# 2) hostname
# 3) screen window (in case you are using GNU screen, which you should!)
# 4) date
# 5) current working directory (very useful to see *where* a command was run)
# 6) the last command you executed
#
# The only minor bug: if you include a literal tab (e.g. with awk
# -F"\t"), then that messes up the formatting a bit. If you have a
# fix for that which doesn't slow the command down, please tell
# balajis@counsyl.com
#
# It is adapted from: http://www.debian-administration.org/articles/543.
# PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'
export HISTTIMEFORMAT="%s "
PROMPT_COMMAND='echo $$ $USER "$(history 1)" >> ~/.bash_eternal_history'

# Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# Listing and searching: mostly turning on colors
alias ll="ls -alrtF --color=auto"
alias la="ls -A"
alias l="ls -CF"
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias du='du -ch --max-depth=1'
alias less='less -R'
alias grep='grep --color=always'
alias tree='tree -C'
alias lessrs='less -R -S'

# Git abbreviations
alias gts="git status"

# grep functions
function gbeh() { grep "$@" ~/.bash_eternal_history ;}
alias python_summary='grep -E "class.*\(.*\):|def.*\(.*\):"'

source $HOME/hunter_dotfiles/for_virtualenv.sh
