all:
	# There is no default build: you must choose which system to build for.

linux: common
	ln -sf ~/hunter_dotfiles/vimrc.linux ~/.vimrc
	ln -sf ~/hunter_dotfiles/bash_profile.linux ~/.bash_profile
	ln -sf ~/hunter_dotfiles/bashrc.linux ~/.bashrc
	ln -sf ~/hunter_dotfiles/tmux.conf.linux ~/.tmux.conf

mac: common
	ln -sf ~/hunter_dotfiles/vimrc.mac ~/.vimrc
	ln -sf ~/hunter_dotfiles/bash_profile.mac ~/.bash_profile
	ln -sf ~/hunter_dotfiles/bashrc.mac ~/.bashrc
	ln -sf ~/hunter_dotfiles/tmux.conf.mac ~/.tmux.conf

common:
	ln -sf ~/hunter_dotfiles/ctags ~/.ctags
	ln -sf ~/hunter_dotfiles/gitconfig ~/.gitconfig
	rm -f ~/.vim
	ln -sf ~/hunter_dotfiles/vim ~/.vim
