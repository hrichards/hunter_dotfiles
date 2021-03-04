all:
	echo "There is no default build: you must choose which system to build for."

linux: common
	ln -sf `pwd`/linux.bash_profile.sh ~/.bash_profile
	ln -sf `pwd`/linux.bashrc.sh ~/.bashrc
	ln -sf `pwd`/linux.tmux.conf ~/.tmux.conf

mac: common
	ln -sf `pwd`/mac.bash_profile.sh ~/.bash_profile
	ln -sf `pwd`/mac.bashrc.sh ~/.bashrc
	ln -sf `pwd`/mac.tmux.conf ~/.tmux.conf

common: clean
	ln -sf `pwd`/oh-my-zsh-custom ~/.oh-my-zsh-custom
	ln -sf `pwd`/vimrc ~/.vimrc
	ln -sf `pwd`/gitconfig ~/.gitconfig
	ln -sf `pwd`/git_template ~/.git_template
	ln -sf `pwd`/ctags.d ~/.ctags.d
	ln -sf `pwd`/vim ~/.vim
	ln -sf `pwd`/zshrc ~/.zshrc
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
	rm -rf ~/.oh-my-zsh-custom
