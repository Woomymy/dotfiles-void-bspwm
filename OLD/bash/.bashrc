alias cls="clear"
alias edituse="sudo nano /etc/portage/package.use/custom"
alias optimake="make -j5"
alias makei="make install"
alias yesupdate="yes | sudo cl-update -o"
if [[ ${EUID} == 0 ]] ; then
      PS1="\# \[\e[0;36m\][\t]\[\e[0;m\] \[\e[0;31m\]\u@\h\[\e[0;m\]: \[\e[1;35m\]\w\[\e[0;m\] \[\e[1;31m\] \\$\[\e[0;m\] "
else
      PS1="\# \[\e[0;36m\][\t]\[\e[0;m\] \[\e[0;32m\]\u@\h\[\e[0;m\]: \[\e[1;35m\]\w\[\e[0;m\] \[\e[1;32m\] \\$\[\e[0;m\] "
fi
