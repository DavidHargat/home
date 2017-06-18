
all: dotfiles brews autocomplete

default: all

dotfiles: .profile .vimrc .tmux.conf
	cat ./$^ >> ~/$^ # append these config file to the existing

autocomplete: 
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
	cp ./git-autocomplete.bash ~/.git-autocomplete.bash

brews:
	brew install tmux
	brew install ack

.PHONY: dotfiles brews all default autocomplete
