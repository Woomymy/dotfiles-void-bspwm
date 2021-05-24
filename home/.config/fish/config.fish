if test (tty) = "/dev/tty1"
	clear
	exec startx &> /dev/null
end
set fish_greeting ""
set -U SXHKD_SHELL sh
set PATH $PATH ~/.cargo/bin
