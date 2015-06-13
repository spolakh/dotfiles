# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, archlinux, dirhistory, python, rand-quote, vagrant, virtualenvwrapper, wd, fasd, last-working-dir)

# User configuration

autoload -U colors && colors
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
precmd() { eval "$PROMPT_COMMAND" }
[[ -a $(whence -p pacman-color) ]] && compdef _pacman pacman-color=pacman

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# For a full list of active aliases, run `alias`.

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
