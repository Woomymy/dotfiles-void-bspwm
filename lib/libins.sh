source "./lib/colors.sh"
main() {
	cyanprint "Installing dotfiles..."
	if [[ ! "$(command -v "cl-install")" ]]
	then
		redprint "This system isn't a calculate Linux System!"
		exit 1
	fi
}
