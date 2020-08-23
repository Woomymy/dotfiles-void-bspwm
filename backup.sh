#!/bin/bash
CHOME="home/$USER"
clear
if [ -d "./home" ]; then
	rm -r "./home"
fi
if [ -d "./etc" ]; then
	rm -r "./etc"
fi
if [ -d "./var" ]; then
	rm -r "./var"
fi
if [ -d "./usr" ]; then
	rm -r "./usr"
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
        cp -r /${CH}/* "${CH}/"
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
code --list-extensions >> "${CH}extensions"

echo "Copie des services OpenRC  customisés et de leur configuration..."
CH="etc/init.d"
F="lightdm-wallpaper"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
CH="etc/conf.d"
F="lightdm-wallpaper"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi


echo "Copie de la configuration de Portage..."
packagesdot=(accept_keywords mask use unmask license) 
for direc in ${packagesdot[*]}
do
	CH="etc/portage/package.${direc}"
	F="custom"
	if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
done
makedot=(conf) 
for direc in ${packagedot[*]}
do
CH="etc/portage/make.${direc}"
        F="custom"
        if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi
done
CH="etc/portage/repos.conf"
if [[ -d "/${CH}" ]]; then
        mkdir -p "${CH}"
        cp /${CH}/* "${CH}/"
fi

echo "Copie du fichier \"World\""
CH="var/lib/portage"
F="world"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi

echo "Copie de la configuration de LightDM"
CH="etc/lightdm"
F="lightdm-gtk-greeter.conf.clt"

if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi


echo "Copie de la configuration d'OpenRC"
CH="etc"
F="rc.conf"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi

echo "Copie du CLT de Grub"
CH="etc/default"
F="grub.clt"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi


echo "Copie de la configuration du Kernel"
CH="usr/src/linux"
F=".config"
if [[ -f "/${CH}/${F}" ]]; then
        mkdir -p "${CH}"
        cp "/${CH}/${F}" "${CH}/${F}"
fi



echo ""
echo ""
echo ""
git pull
git add .
git commit -m "Backup $(date +"%A %d %B %R  %Y")"
if [[ "$(ping -c 1 github.com  )" ]]; then
	git push origin master
fi
