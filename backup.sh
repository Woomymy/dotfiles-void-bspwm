#!/bin/bash
CHOME="home/$USER"
clear
rm -r ./home
rm -r ./etc
echo "==============="
echo "Copie de la configuration..."
echo "==============="

echo "Copie de la configuration de I3..."
CH="$CHOME/.config/i3"
F="config"
if [[ -f "/${CH}/${F}" ]]; then
	mkdir -p "${CH}"
	cp "/${CH}/${F}" "${CH}/${F}"
fi





git add .
git commit -m "Backup $(date +"%A %d %B %R  %Y") ${HOST}"
if [[ "$(ping -c 1 github.com)" ]]; then
	git push origin master
fi
