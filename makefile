all:
	# There is no default build: you must choose which system to build for.

linux: common
	ln -sf ~/hunter_dotfiles/vimrc.linux ~/.vimrc
	ln -sf ~/hunter_dotfiles/bash_profile.linux ~/.bash_profile
	ln -sf ~/hunter_dotfiles/bashrc.linux ~/.bashrc
	ln -sf ~/hunter_dotfiles/tmux.conf.linux ~/.tmux.conf
	ln -sf ~/hunter_dotfiles/gitconfig.linux ~/.gitconfig

mac: common
	ln -sf ~/hunter_dotfiles/vimrc.mac ~/.vimrc
	ln -sf ~/hunter_dotfiles/bash_profile.mac ~/.bash_profile
	ln -sf ~/hunter_dotfiles/bashrc.mac ~/.bashrc
	ln -sf ~/hunter_dotfiles/tmux.conf.mac ~/.tmux.conf
	ln -sf ~/hunter_dotfiles/gitconfig.mac ~/.gitconfig

common:
	ln -sf ~/hunter_dotfiles/git_template ~/.git_template
	ln -sf ~/hunter_dotfiles/ctags ~/.ctags
	rm -f ~/.vim
	ln -sf ~/hunter_dotfiles/vim ~/.vim
	git submodule init && git submodule update
