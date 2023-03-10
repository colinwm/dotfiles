#!/bin/bash

sudo chsh -s "$(which zsh)" "$(whoami)"
mkdir -p $HOME/bin
cp -rf $(pwd)/.zshrc $HOME/.zshrc
cp -rf $(pwd)/.tmux.conf $HOME/.tmux.conf
cp -rf $(pwd)/.config $HOME
cp -rf $(pwd)/gitconfig $HOME/.gitconfig
cp -rf $(pwd)/.oh-my-zsh $HOME
cp $(pwd)/tmux-url-select $HOME/bin
cp $(pwd)/files $HOME/bin/files
cp -f $(pwd)/g2 $HOME/bin/g2

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/colin353/g2 /workspaces/g2

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

# Install lemonade
go install github.com/lemonade-command/lemonade@latest

# Install plugins in neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
/home/linuxbrew/.linuxbrew/bin/nvim --headless +PlugInstall +qall

# Setup CoC further
cd ~/.local/share/nvim/plugged/coc.nvim
npm install yarn
./node_modules/yarn/bin/yarn install

# Install a second time to recognize CoC updates
/home/linuxbrew/.linuxbrew/bin/nvim --headless +PlugInstall +qall
