# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

ENABLE_CORRECTION="true"

typeset -aU path
function add_to_path_once()
{
  path=($1 $path)
}

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
  add_to_path_once "/usr/local/bin"
  export LSCOLORS=ExFxCxDxBxegedabagacad
  export LS_COLORS="di=1;34:ln=1;35:so=1;32:pi=1;33:ex=1;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
  if [[ -e /usr/local/opt/coreutils/libexec/gnubin ]]; then
    add_to_path_once "/usr/local/opt/coreutils/libexec/gnubin"
    alias ls='ls --color=auto'
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  fi
fi

if [[ "$OSTYPE" == linux* ]]; then
  alias ls='ls --color=auto'
  if [[ -e $HOME/.linuxbrew/bin ]]; then
    add_to_path_once "$HOME/.linuxbrew/bin"
  fi
fi

#export CLICOLOR=1

#TERM="screen-256color"

if [[ -e $HOME/.rvm ]]; then
  # Add RVM to PATH for scripting
  add_to_path_once "$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

# Set PATH to include user's bin if it exists
if [ -d "$HOME/bin" ]; then
  add_to_path_once "$HOME/bin"
fi

if [[ -e $HOME/.rbenv ]]; then
  add_to_path_once "$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export WORKON_HOME=~/.virtualenvs
if [[ -e /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi
function gi() { curl https://www.gitignore.io/api/$@ ;}

if [[ -e $HOME/.zshrc_local ]]; then
  source $HOME/.zshrc_local
fi

# configure thefuck
if [[ -e /usr/local/bin/fuck ]]; then
  eval $(thefuck --alias)
fi

# orders for finding in manpages
MANSECT="2:3:3p:1:1p:8:4:5:6:7:9:0p:tcl:n:l:p:o"
export MANSECT

# Unset local functions
unset -f add_to_path_once

# Load zplug
source $HOME/.zplug/init.zsh
# Let zplug manage zplug
zplug "zplug/zplug"
# A cd command that learns - easily navigate directories from the command line.
zplug "plugins/autojump", from:oh-my-zsh
# Homebrew aliases and completion.
zplug "plugins/brew", from:oh-my-zsh
# Run commands with bundle and bundle aliases
zplug "plugins/bundler", from:oh-my-zsh
# Guess what to install when running an unknown command.
zplug "plugins/command-not-found", from:oh-my-zsh
# Extracts different types of archives
zplug "plugins/extract", from:oh-my-zsh
# Autocompletion for gem command.
zplug "plugins/gem", from:oh-my-zsh
# load oh-my-zsh/lib/*.zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"
# Load the theme.
LIME_SHOW_HOSTNAME=1
LIME_USER_COLOR=118
LIME_DIR_COLOR=12
LIME_DIR_DISPLAY_COMPONENTS=3
LIME_USER_DIR_SEPARATOR=:
zplug "khwon/lime", defer:2

zplug 'rimraf/k'

# encode64 / decode64 for base64
zplug "plugins/encode64", from:oh-my-zsh
# nyan - nyan cat goodness in your shell
zplug "plugins/nyan", from:oh-my-zsh
# urlencode / urldecode for url manipulation
zplug "plugins/urltools", from:oh-my-zsh

# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# Git aliases and completion.
zplug "plugins/git", from:oh-my-zsh, defer:2

# Install plugins if there are plugins that have not been installed
# disable since it's slow
#if ! zplug check --verbose; then
#  zplug install
#fi
# Then, source plugins and add commands to $PATH
#zplug load --verbose
zplug load


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^P' fzf-history-widget

