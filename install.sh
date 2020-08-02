#! /bin/bash
INSTALLXMIND=1
if [ ! -f "/usr/bin/cl-update" ]; then
	echo "Ce système n'est pas une Calculate Linux!"
	exit 1 
fi
if [ $UID != 0  ]; then
	echo "Ce script à besoin d'être exécuter en tant que root!"
fi
if [ "$(command -v git)" ]; then
	git pull
else 
	echo "Ce script à besoin de git!"
	exit 1
fi
# Install portage repos and perform update with new world
repos=(etc/portage/repos.conf/*.conf)
for repo in "${repos[*]}"
do
	cp "${repo}" /etc/portage/repos.conf
done
echo "Copie de la configuration de Portage..."
packagesdot=(accept_keywords mask use unmask license)
for direc in ${packagesdot[*]}
do
        CH="etc/portage/package.${direc}"
        F="custom"
        cp "${CH}/${F}" "/${CH}/${F}"
done
makedot=(conf)
for direc in ${makedot[*]}
do
	CH="etc/portage/make.${direc}"
        F="custom"
        cp "${CH}/${F}" "/${CH}/${F}"
done
CH="var/lib/portage"
F="world"
cp "${CH}/${F}" "/${CH}/${F}"
cl-core-variables --set update.cl_update_other_set=on
updatesys() {
	yes | cl-update -o --with-bdeps=yes
}
updatesys
echo "Applications installées ! "
echo "Configuration du système..."
if [ -d "/home/woomy" ]; then
	USERN="woomy"
else 
	echo "Quel est votre nom d'utilisteur?"
	read USERN
fi
if [ ! -d "/home/${USERN}" ]; then
	echo "Nom d'utilisateur invalide !"
	exit 1
fi
reconfmessages=("Le fichier /etc/conf.d/lightdm-wallpaper doit être configuré!") # Reconf messages printed at the of script
CH="etc/init.d"
F="lightdm-wallpaper"
cp "${CH}/${F}" "/${CH}/${F}"

CH="etc/conf.d"
cp "${CH}/${F}" "/${CH}/${F}"

echo "Copie de la configuration du Kernel..."
CH="usr/src/linux"
F=".config"
cp "${CH}/${F}" "/${CH}/${F}"
echo "Copie de la configuration de ZSH et PowerLevel10K..."
reconfmessages+=("PowerLevel10K et Oh-My-ZSH doivent être installés! ")
CH="home/woomy"
RCH="/home/${USERN}"
F=".zshrc"
cp "${CH}/${F}" "${RCH}/${F}"
F=".p10k.zsh"
cp "${CH}/${F}" "${RCH}/${F}"
echo "Copie des binaires utiles..."
mkdir -p "/home/${USERN}/bin"
cp home/woomy/* "/home/${USERN}/bin"

echo "Copie de la configuration utilisateur..."
justcopy=(i3 polybar Kvantum nu rofi)
for direc in "${justcopy[*]}"
do
CH="home/woomy/.config/${direc}"
RCH="/home/${USERN}/.config/${direc}/"
	if [ ! -d "${RCH}" ]; then
		mkdir -p "${RCH}"
	fi
	cp $CH/* "${RCH}"
done

echo "Installation des rpms..."
if [ "${INSTALLXMIND}" == 1 ]; then
	echo "Installation de Xmind..."
	
fi

