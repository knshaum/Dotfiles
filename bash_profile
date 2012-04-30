# MacPorts Installer addition on 2011-10-28_at_23:37:09: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# The above lines included to humor MacPorts; now let's set PATH for reals.

if [ -x ~/bin/mkpath ] ; then
    mypath=`~/bin/mkpath`
    if [ -n "$mypath" ] ; then
        export PATH="$mypath"
    fi
fi

export EDITOR=/usr/bin/vim
export SVN_EDITOR=vi

if [ -d /usr/local/cpanel ] ; then
    export DS=svn+ssh://kevinshaum@deathstar.dev.cpanel.net/home/svn
    export FX=svn+ssh://kevinshaum@flux.cpanel.net/home/repos
    export ASF=http://svn.apache.org/repos/asf
fi

shopt -s histappend
PROMPT_COMMAND='history -a'
HISTCONTROL=erasedups

[ -r ~/.bashrc ] && source ~/.bashrc
