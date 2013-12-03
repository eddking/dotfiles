

#----- PATH ------

#Standard Path Shiz
PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

#Custom stuff -- put ~/bin at front of path so we can override things manually
PATH=$HOME/bin:$PATH

#Python
#PATH=$PATH:/usr/local/share/python

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

#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

#----- TERMINFO ------
export TERM=xterm-256color-italic

#----- EDITOR ------
export EDITOR=vim

# Aliases
. ~/.aliases
. ~/.functions

# Auto completions
fpath=(/usr/local/share/zsh-completions $fpath)

if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
 
unsetopt correct_all

