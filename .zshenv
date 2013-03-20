#----- PATH ------

#Standard Path Shiz
PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

#Custom stuff
PATH=$PATH:$HOME/bin

#Python
PATH=$PATH:/usr/local/share/python

#Node
PATH=$PATH:/usr/local/share/npm/bin

#RVM (Ruby version manager)
PATH=$PATH:$HOME/.rvm/bin

#Heroku
PATH=$PATH:/usr/local/heroku/bin

export PATH

#----- NODE ------

export NODE_PATH="/usr/local/lib/node"

#----- JAVA ------

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home"

#----- PYTHON ------
#Disabled because pythonpath still exists within a virtalenv enviro ... we can do without it
#export PYTHONPATH="/usr/local/lib/python2.7/site-packages"
