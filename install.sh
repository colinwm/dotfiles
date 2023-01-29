#!/bin/bash

sudo chsh -s "$(which zsh)" "$(whoami)"
cp -rf $(pwd)/.zshrc $HOME/.zshrc
cp -rf $(pwd)/.tmux.conf $HOME/.tmux.conf
cp -rf $(pwd)/.configs $HOME
cp -rf $(pwd)/.oh-my-zsh $HOME

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ -d "/workspaces/github/bin/" ]; then
    sudo ln -s /workspaces/github/bin/npm /usr/local/bin/npm
    sudo ln -s /workspaces/github/bin/tsc /usr/local/bin/tsc
    sudo ln -s /workspaces/github/bin/prettier /usr/local/bin/prettier
    sudo ln -s /workspaces/github/bin/eslint /usr/local/bin/eslint
    sudo ln -s /workspaces/github/bin/rubocop /usr/local/bin/rubocop
    sudo ln -s /workspaces/github/bin/srb /usr/local/bin/srb
    sudo ln -s /workspaces/github/bin/bundle /usr/local/bin/bundle
    sudo ln -s /workspaces/github/bin/solargraph /usr/local/bin/solargraph
fi

nvim --headless +PlugInstall +qall
