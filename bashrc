#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Var to update on every shell
# LS_COLORS, 1st line, by file type, 2nd line, by extentions
export LS_COLORS='di=1;34:fi=0:ln=36:so=35:bd=35:cd=35:or=90:mi=90:ex=1;4;32'
export LS_COLORS=$LS_COLORS:'*.c=33:*.cpp=33:*.h=31:*.hpp=31:*.o=94'

# Aliases
alias ls='ls --color=auto'
alias lsa='ls -a'
alias ll='ls -la'
alias batstat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "percentage|capacity|time\ to" '
# alias wifiunlock='rfkill unlock wlan'

# Old PS1
#PS1='[\u@\h \W]\$ '

# New PS1 with [pseudo::$(pwd) battery_left%] 
# Remember to put every non printable characters between \[ \] to avoid the history weirb behaviour
battery()
{
	COLOR="\[\e[m\]"
	BATTERY="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
	PERCENT=`$BATTERY | grep "percentage" | sed -e "s/[\ ]*[^\ ]*[\ ]*\([^\ ]*\)\%/\1/"`
	CHR=`$BATTERY | grep "state" | cut -c 26-`
	
	if [ $CHR == charging ]
	then
        if [ $PERCENT -eq 100 ]
        then
            COLOR="\[\e[1;32m\]"
        else
            COLOR="\[\e[1;33m\]"
        fi
	fi
	
    RETVAL="${COLOR}${PERCENT}%\[\e[m\]"
	echo -e $RETVAL
}
# $ escaped to update battery everytime 
PS1="[\[\e[1;31m\]\u\[\e[m\]::\[\e[1;33m\]\W \[\e[m\]$(battery)]$"

