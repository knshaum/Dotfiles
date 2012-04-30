# MacPorts Installer addition on 2011-10-28_at_23:37:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# The above lines included to humor MacPorts; now let's set PATH for reals.

[ -x ~/bin/mkpath ] && export PATH=`~/bin/mkpath`
[ -r ~/.bashrc    ] && source ~/.bashrc

export PS1='[\u@\h \w]\$ '
export EDITOR='/usr/bin/vim'
