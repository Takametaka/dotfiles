#
# ~/.bash_profile
#
export TERMINAL="xfce4-terminal"
#export LS_COLORS='di=1;34:fi=0:ln=36:so=35:bd=35:cd=35:or=90:mi=90:ex=4;32:*.c=33:*.cpp=33'

PATH=${PATH}:~/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

#
#if [[ "$(tty)" == '/dev/tty1' ]]; then
#	exec startx; 
#   exit;
#fi
