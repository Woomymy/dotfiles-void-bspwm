source "./lib/colors.sh"
source "./lib/insfuncs.sh"
source "./lib/inschecks.sh"
main() {
	cyanprint "Installing dotfiles..."
	cyanprint "Running checks..."
	run_syschecks
	greenprint "All checks OK!"
}
