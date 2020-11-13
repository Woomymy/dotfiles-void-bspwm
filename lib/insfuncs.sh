install_dotfiles() {
	cyanprint "Installing files and configuring system..."
	cat "var/lib/portage/world" | xargs -n 1 lib/inspack.sh 
	# Use a dedicated script because xargs doesn't support bash functions
}
