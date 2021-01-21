export TERM=xterm-256color

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

export PYTHONPATH=$HOME/git/website/counsyl/product:$PYTHONPATH

export NODE_PATH=/usr/local/lib/node_modules:$NODE_PATH

# Git status color from:
# http://amatsukawa.com/git-branch-command-line.html
parse_git_branch ()
{
    if git rev-parse --git-dir >/dev/null 2>&1
    then
        echo -e ""[$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')]
    else
        echo ""
    fi
}

function git_color {
local STATUS=`git status 2>&1`
if [[ "$STATUS" == *'Not a git repository'* ]]
then
    echo ""
else
    if [[ "$STATUS" != *'working tree clean'* ]]
    then
        # red if need to commit
        echo -e '\033[0;31m'
    else
        if [[ "$STATUS" == *'Your branch is up to date'* ]]
        then
            # cyan if status is up-to-date
            echo -e '\033[0;36m'
        else
            # yellow if need to push
            echo -e '\033[0;33m'
        fi
    fi
fi
}

function parse_git_stash {
    if git stash list >/dev/null 2>&1
    then
        local STASH=`git stash list`
        if [[ "$STASH" != "" ]]
        then
            echo -e "[Δ]"
        fi
    else
        echo ""
    fi
}

#See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
PS1='\[\033[00;34m\][\u@\h:\w]\[$(git_color)\]$(parse_git_branch)$(parse_git_stash)\[\033[00m\]'

# Bash Eternal History.  See https://gist.github.com/rebeccacremona/88fc768fb487e80335febbfa31d6251a
# No dupes
export HISTCONTROL=ignoreboth:erasedups

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="%F %T "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

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
alias grep='grep --color=auto'
alias tree='tree -C'
alias lessrs='less -R -S'
alias stringgrep='grep -srFI --exclude-dir=*watched_assets*'

# Git abbreviations
alias gts="git status"

# grep functions
function gbeh() { grep "$@" ~/.bash_eternal_history ;}

export PIP_INDEX_URL=https://pypi.counsyl.com/counsyl/prod

# To allow version of Ruby installed using `rbenv` to be available in new
# terminals.  Required for non-Docker Website install.
eval "$(rbenv init -)"
