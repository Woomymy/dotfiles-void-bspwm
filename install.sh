#!/usr/bin/env bash
if [[ ! -f "./backup.sh" ]]
then
	echo -e "\e[91mMissing files!"
	exit 1
fi
require_file() {
	if [[ ! -f "lib/${1}" ]]
	then
		echo -e "\e[91m Missing file lib/${1}"
		exit 1
	fi
	source "lib/${1}"
	if [[ $? != "0" ]]
	then
		echo -e "\e[91mError while sourcing file ${1}"
	fi
}

REQUIRED=(inschecks insfuncs colors libins)

for FILE in ${REQUIRED[*]}
do
	require_file "${FILE}.sh"
done

EXECUTABLES=(inspack)
for FILE in ${EXECUTABLES[*]}
do
	if [[ ! -x "lib/${FILE}.sh" ]]
	then
		echo -e "\e[91mError: File ${FILE} isn't executable"
	exit 1
	fi
done

main
