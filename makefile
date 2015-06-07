all:
	# There is no default build: you must choose which system to build for.

linux: common
	ln -sf ~/hunter_dotfiles/linux.vimrc ~/.vimrc
	ln -sf ~/hunter_dotfiles/linux.bash_profile.sh ~/.bash_profile
	ln -sf ~/hunter_dotfiles/linux.bashrc.sh ~/.bashrc
	ln -sf ~/hunter_dotfiles/linux.tmux.conf ~/.tmux.conf

mac: common
	ln -sf ~/hunter_dotfiles/mac.vimrc ~/.vimrc
	ln -sf ~/hunter_dotfiles/mac.bash_profile.sh ~/.bash_profile
	ln -sf ~/hunter_dotfiles/mac.bashrc.sh ~/.bashrc
	ln -sf ~/hunter_dotfiles/mac.tmux.conf ~/.tmux.conf

common:
	ln -sf ~/hunter_dotfiles/gitconfig ~/.gitconfig
	ln -sf ~/hunter_dotfiles/git_template ~/.git_template
	ln -sf ~/hunter_dotfiles/ctags ~/.ctags
	rm -rf ~/.vim
	ln -sf ~/hunter_dotfiles/vim ~/.vim
	git submodule init && git submodule update
