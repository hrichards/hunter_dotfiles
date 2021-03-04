export GEM_HOME=$(brew --prefix)

export PATH=/usr/local/opt/postgresql@9.6/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH

export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

alias vim='vim -w ~/.vimlog "$@"'

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

eval "$(pyenv init -)"

source ~/.common.bashrc.sh
