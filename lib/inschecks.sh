run_syschecks(){
	check_is_calculate
}
check_is_calculate() {
	if [[ ! "$(command -v "cl-install")" ]]
	then
		redprint "This system isn't a calculate Linux System!"
		exit 1
	fi
}
