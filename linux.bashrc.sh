source ~/.common.bashrc.sh

if command -v "autojump" &> /dev/null
then
    source /usr/share/autojump/autojump.bash
fi

export NVM_DIR="/home/hunter/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
