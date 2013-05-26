

#----- PATH ------

#Standard Path Shiz
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

#Custom stuff -- put ~/bin at front of path so we can override things manually
PATH=$HOME/bin:$PATH

#Python
PATH=$PATH:/usr/local/share/python

#Node
PATH=$PATH:/usr/local/share/npm/bin

#Heroku
PATH=$PATH:/usr/local/heroku/bin

PATH=$PATH:/Users/edd/Programs/basex/bin

export PATH

#----- NODE ------
export NODE_PATH="/usr/local/lib/node"

#----- JAVA ------
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home"

#----- PYTHON ------
#Disabled because pythonpath still exists within a virtalenv enviro ... we can do without it
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
#

#----- TERMINFO ------
export TERM=xterm-256color-italic

#----- EDITOR ------
export EDITOR=vim

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Aliases
. ~/.aliases
. ~/.functions

# Auto completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Use vi style movement on command line
bindkey -v
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git, zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

