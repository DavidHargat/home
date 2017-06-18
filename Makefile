
all: dotfiles brews autocomplete ~/.vim/bundle/Vundle.vim

default: all

dotfiles:

	echo >> ~/.profile
	cp ~/.profile ~/.profile.old
	cat ./.profile > ~/.profile

	echo >> ~/.tmux.conf
	cp ~/.tmux.conf ~/.tmux.conf.old
	cat ./.tmux.conf > ~/.tmux.conf

	echo >> ~/.vimrc
	cp ~/.vimrc ~/.vimrc.old
	cat ./.vimrc > ~/.vimrc

autocomplete: brews
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	cp ./git-completion.bash ~/.git-completion.bash

~/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

brews:
	brew install tmux
	brew install ack
	brew install wget

.PHONY: dotfiles brews all default autocomplete
