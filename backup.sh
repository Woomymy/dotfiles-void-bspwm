#!/bin/bash
CHOME="home/$USER"
clear
if [ -d "./home" ]; then
	rm -r "./home"
fi
if [ -d "./etc" ]; then
	rm -r "./etc"
fi

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

echo "Copie de la configuration de Rofi..."
CH="$CHOME/.config/rofi"
F="theme.rasi"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
F="config"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
echo "Copie de la configuration de polybar..."
CH="$CHOME/.config/polybar"
F="config.ini"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi

echo "Copie de la configuration de ZSH..."
CH="$CHOME"
F=".zshrc"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi

echo "Copie de la configuration de P10K..."
CH="$CHOME"
F=".p10k.zsh"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi


echo ""
echo ""
echo ""
git add .
git commit -m "Backup $(date +"%A %d %B %R  %Y") ${HOST}"
if [[ "$(ping -c 1 github.com  )" ]]; then
	git push origin master
fi
