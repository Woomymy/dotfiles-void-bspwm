#!/bin/bash
copydir(){
if [ -d "./OLD" ]; then
    rm -r ./OLD 
fi 
if [ -d "./backup" ]; then 
    mv -f ./backup ./OLD
elif [ -f "./backup" ]; then 
    rm ./backup
fi
mkdir backup
}

makedirs() {
    cd ./backup 
    dirs=(portage calculate nu bash xfce zsh kernel)
    for direc in "${dirs[*]}" 
    do 
        mkdir ${direc}
    done
    cd ..
}
copyportage() {
    echo "Copying portage configuration";
    cd backup/portage
    packagesdot=(accept_keywords mask use unmask license keywords) #All package.${name} directories 
    for direc in ${packagesdot[*]}
    do 
        if [ -d "/etc/portage/package.${direc}" ]; then 
            cp -r /etc/portage/package.${direc} .
        elif [ -r "/etc/portage/package.${direc}" ]; then 
           cp /etc/portage/package.${direc} .  
        elif [ -f "/etc/portage/package.${direc}" ]; then 
            echo "Unable to read file /etc/portage/package.${direc}"
        fi
    done
    makedot=(conf profile)
    for direc in ${makedot[*]}
    do 
        if [ -d "/etc/portage/make.${direc}" ]; then 
            cp -r /etc/portage/make.${direc} .
        elif [ -r "/etc/portage/make.${direc}" ]; then 
           cp /etc/portage/make.${direc} .  
        elif [ -f "/etc/portage/make.${direc}" ]; then 
            echo "Unable to read file /etc/portage/make.${direc}"
        fi
    done 
    other=(profile repos.conf)
    for direc in ${other[*]}
    do 
        if [ -d "/etc/portage/${direc}" ]; then 
            cp -r /etc/portage/${direc} .
        elif [ -r "/etc/portage/${direc}" ]; then 
           cp /etc/portage/${direc} .  
        elif [ -f "/etc/portage/${direc}" ]; then 
            echo "Unable to read file /etc/portage/${direc}"
        fi
    done 
    cp /var/lib/portage/world .
    cd ../..
    echo "Portage config saved!"
}
cpcalculateconf () {
    echo "Saving Calculate Config..."
    if [ -f "${HOME}/.calculate/ini.env" ]; then 
        cp "${HOME}/.calculate/ini.env" ./backup/calculate
    fi
    echo "Calculate config saved!"
}
copynuconf () {
    echo "Copying Nushell configuration..."
    if [ -f "${HOME}/.config/nu/config.toml" ]; then 
        cp "${HOME}/.config/nu/config.toml" backup/nu
    fi
    echo "Nushell config saved"
}
copybashconf() {
    echo "Copying bash config..."
    if [ -f "${HOME}/.bashrc" ]; then
	cp "${HOME}/.bashrc" backup/bash
    fi
    echo "Bash config saved!"
}
copyzshconf () {
    echo "Copying ZSH config..."
    if [ -f "${HOME}/.zshrc" ]; then 
        cp "${HOME}/.zshrc" backup/zsh 
    fi
    if [ -d "${HOME}/.oh-my-zsh/themes" ]; then 
        cp -r "${HOME}/.oh-my-zsh/themes" backup/zsh/
    fi
    echo "ZSH config saved!"
}
copyxfconf () {
    echo "Copying XFCE config"
    if [ -d "${HOME}/.config/xfce4" ]; then 
        cp -r "${HOME}/.config/xfce4" backup/xfce
    fi
    echo "XFCE config saved"
}
copykernelconf() {
    zcat /proc/config.gz > backup/kernel/.config
}
pushgit() {
    git add *
    git commit -m "Backup $(date +"%A %d %B %R  %Y")"
    git push origin master
}
main() {
    copydir
    makedirs
    copyportage
    cpcalculateconf
    copynuconf
    copybashconf
    copyzshconf
    copyxfconf
    copykernelconf
    pushgit
}
main
