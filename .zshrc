# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="colin"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/configs/

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.x20/bin:$PATH

export PATH=/usr/local/go/bin:$PATH

export TERM=xterm-256color

alias tmux='tmux -u'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=vim

TZ='America/New_York'; export TZ

g2 () {
  G2=`whence -p g2`
  $G2 $@

  if [ $? -eq 3 ]
  then
    cd `cat /tmp/g2-destination`
  fi
}
g2 auto

