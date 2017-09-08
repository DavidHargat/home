all: dotfiles brews autocomplete ~/.vim/bundle/Vundle.vim bin

default: all

bin:
	cp bin/* /usr/local/bin/

dotfiles:
	cp ~/.profile ~/.profile.old
	cp .profile ~/.profile
	cp ~/.tmux.conf ~/.tmux.conf.old
	cp .tmux.conf ~/.tmux.conf
	cp ~/.vimrc ~/.vimrc.old
	cp .vimrc ~/.vimrc

autocomplete: brews
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	cp ./git-completion.bash ~/.git-completion.bash

~/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

brews:
	brew install tmux
	brew install ack
	brew install wget

.PHONY: dotfiles brews all default autocomplete bin
