. /Users/edd/.zprezto/runcoms/zprofile

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

export LANG='en_GB.UTF-8'

# Set the default Less options.
export LESS='-g -i -M -R -S -w -z-4'

#----- NODE ------
export NODE_PATH="/usr/local/lib/node"

#----- JAVA ------
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home"

#----- PYTHON ------

#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH


#----- GO ------
export GOPATH=$HOME/.go:$HOME/workspaces/go


#----- TERMINFO ------
export TERM=xterm-256color-italic
#export TERM=xterm-256color

#----- DOCKER ------
export DOCKER_HOST=tcp://127.0.0.1:4243

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/bin
  /usr/local/{bin,sbin}
  /usr/local/opt/ruby/bin
  /usr/local/share/npm/bin
  /usr/local/heroku/bin
  $GOPATH/bin
  $path
)

. $HOME/.aws/details.sh
