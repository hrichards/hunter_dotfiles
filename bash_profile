if [ $OSTYPE == "darwin10.0" ]; then
    export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
    export PATH=/usr/local/Cellar/ruby/1.9.3-p125/bin:$PATH
    if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi
fi

source ~/.bashrc
