# MacPorts Installer addition on 2011-10-28_at_23:37:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# We keep the bit above to humor MacPorts, and completely rewrite PATH below.

[ -x ~/bin/mkpath ] && export PATH=`~/bin/mkpath`
[ -e ~/.bashrc    ] && source ~/.bashrc
