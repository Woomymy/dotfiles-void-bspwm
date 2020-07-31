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
echo "Copie de la configuration de Calculate..."
CH="$CHOME/.calculate"
F="ini.env"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi

echo "Copie des scripts de $HOME/bin..."
CH="$CHOME/bin"
if [[ -d "/${CH}" ]]; then
        mkdir -p "${CH}"
        cp /${CH}/* "${CH}/"
fi
echo "Copie de la configuration de Kvantum..."
CH="$CHOME/.config/Kvantum/"
F="kvantum.kvconfig"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
echo "Copie de la configuration de Nushell..."
CH="$CHOME/.config/nu"
F="config.toml"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
echo "Copie de la configuration de VScode..."
CH="$CHOME/.config/Code/User/"
F="settings.json"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
#Juste pour vs
code --list-extensions >> "${CH}/extensions"

echo "Copie des services OpenRC  customisés"
CH="etc/init.d"
F="lightdm-wallpaper"
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
