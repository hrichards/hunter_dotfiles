if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

source ~/.common.bash_profile.sh
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
