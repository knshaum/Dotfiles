_update_prompt () {
	## Save $? early, we'll need it later
	local exit="$?"

	## define some colors
	local red="31";
	local green="32";
	local yellow="33";
	local blue="34";
	local purple="35";
	local cyan="36";
	local white="37";

	local pre="\[\e[";
	local suf="\]";

	local e_blue="${pre}0;${blue}m$suf";
	local e_green="${pre}0;${green}m$suf";
	local e_purple="${pre}0;${purple}m$suf";
	local e_cyan="${pre}0;${cyan}m$suf";
	local e_white="${pre}0;${white}m$suf";
	local e_bred="$pre$red;1m$suf";
	local e_byellow="$pre$yellow;1m$suf";

	local e_normal="\[\e[0;0m\]"

    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"

	## Initial prompt
 	#_prompt="[$e_purple\h$e_normal:$e_cyan\W$e_normal]";
	_prompt="[\u@\h:\w]";

	## Color based on exit code
	local bul="\342\200\242" # bullet character
	case "$exit" in
		"0" ) ex="$e_green$bul$e_normal " ;;
		* ) ex="$e_bred$bul$e_normal " ;;
	esac

	## Color current user
	local u;
	local p;
	if [ "$UID" = "0" ]; then
		u="$e_bred\u$e_normal";
		p="#";
	else
		u="$e_purple\u$e_normal";
		p="\$";
	fi

	## Color git status if any
	branch=`__git_ps1 "(%s)"`
	if [ -n "$branch" ] ; then
		if [ -z "$_dumb_prompt" ]; then
			## Assumes that untracked files are always listed after modified ones
			## True for all git versions I could find
			git status --porcelain | perl -ne 'exit(1) if /^ /; exit(2) if /^[?]/'
				case "$?" in
					"0" ) branch=" $e_green$branch$e_normal" ;;
					"1" ) branch=" $e_bred$branch$e_normal" ;;
					"2" ) branch=" $e_byellow$branch$e_normal" ;;
					"130" ) branch=" $e_white$branch$e_normal" ; _dumb_prompt=1 ;;
				esac
		else
			branch=" $e_white$branch$e_normal"
		fi
	fi

	# color cover stats if any
#	if [ -e .last_cover_stats ]; then
#		last=$(cat .last_cover_stats)
#		diff="-"
#		if [ -e .current_cover_stats ]; then
#			current=$(cat .current_cover_stats)
#			score_is_ok=$(perl -le "print (($current >= $last) ? 1 : 0)")
#			diff=$(perl -le "print ($current - $last)")
#		else
#			score_is_ok='1'
#		fi
#
#		if [ "x$score_is_ok" == "x1" ]; then
#			score="$e_green$current ($diff)$e_normal "
#		else
#			score="$e_bred$current ($diff)$e_normal "
#		fi
#		if [ "$current" == "$last" ]; then
#			score="$e_blue$current$e_normal "
#		fi
#	else
#		if [[ -e .current_cover_stats ]]; then
#			current=$(cat .current_cover_stats)
#			score="$e_white$current$e_normal "
#		else 
#			score=""
#		fi
#	fi

	# title
# 	e_title=$(echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007")
#	export PS1="$ex$_prompt$branch $score$p ";
	export PS1="$ex$_prompt$branch$p ";
}

dumb_prompt () {
  _dumb_prompt=1
}

smart_prompt () {
  unset _dumb_prompt
}

# load git bash utilities
if [ -f /etc/bash_completion.d/git ]; then
	. /etc/bash_completion.d/git
fi

if [ -n "$PS1" ] ; then
  PROMPT_COMMAND='_update_prompt'
  export PROMPT_COMMAND
fi
