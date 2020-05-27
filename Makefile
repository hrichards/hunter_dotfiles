all:
	echo "There is no default build: you must choose which system to build for."

linux: common
	ln -sf ~/hunter_dotfiles/linux.bash_profile.sh ~/.bash_profile
	ln -sf ~/hunter_dotfiles/linux.bashrc.sh ~/.bashrc
	ln -sf ~/hunter_dotfiles/linux.tmux.conf ~/.tmux.conf

mac: common
	ln -sf ~/hunter_dotfiles/mac.bash_profile.sh ~/.bash_profile
	ln -sf ~/hunter_dotfiles/mac.bashrc.sh ~/.bashrc
	ln -sf ~/hunter_dotfiles/mac.tmux.conf ~/.tmux.conf

common: clean
	ln -sf ~/hunter_dotfiles/vimrc ~/.vimrc
	ln -sf ~/hunter_dotfiles/gitconfig ~/.gitconfig
	ln -sf ~/hunter_dotfiles/git_template ~/.git_template
	ln -sf ~/hunter_dotfiles/ctags.d ~/.ctags.d
	ln -sf ~/hunter_dotfiles/vim ~/.vim
	ln -sf ~/hunter_dotfiles/zshrc ~/.zshrc
	git submodule init && git submodule update

clean:
	rm -rf ~/.vimrc
	rm -rf ~/.bash_profile
	rm -rf ~/.bashrc
	rm -rf ~/.tmux.conf
	rm -rf ~/.gitconfig
	rm -rf ~/.git_template
	rm -rf ~/.ctags.d
	rm -rf ~/.vim
	rm -rf ~/.zshrc
