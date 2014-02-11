. /Users/edd/.zprezto/runcoms/zprofile

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

export LANG='en_GB.UTF-8'

# Set the default Less options.
export LESS='-g -i -M -R -S -w -z-4'

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  /usr/local/opt/ruby/bin
  /usr/local/share/npm/bin
  /usr/local/heroku/bin
  $path
)


#----- NODE ------
export NODE_PATH="/usr/local/lib/node"

#----- JAVA ------
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home"

#----- PYTHON ------

#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

#----- TERMINFO ------
export TERM=xterm-256color-italic


. $HOME/.chef/details.sh
