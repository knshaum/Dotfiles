# .bashrc

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

[ -r /etc/bashrc                 ] && source /etc/bashrc
[ -r ~/.bashrc.local             ] && source ~/.bashrc.local
[ -r ~/bin/git-completion.bash   ] && source ~/bin/git-completion.bash
[ -r ~/bin/prompt-for-git.sh     ] && source ~/bin/prompt-for-git.sh
[ -r ~/.alias                    ] && source ~/.alias
[ -r ~/perl5/perlbrew/etc/bashrc ] && source ~/perl5/perlbrew/etc/bashrc
[ -r ~/.rvm/scripts/rvm          ] && source ~/.rvm/scripts/rvm
[ -r ~/.pythonbrew/etc/bashrc    ] && source ~/.pythonbrew/etc/bashrc

export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

if [ -n "$PS1" ] ; then
    set -o vi
    if [ -r ~/Dotfiles/git-completion.sh ] ; then
        source ~/Dotfiles/git-completion.sh
        export PS1='[\u@\h:\w$(__git_ps1)]\$ '
    else
        export PS1='[\u@\h:\w]\$ '
    fi
fi
