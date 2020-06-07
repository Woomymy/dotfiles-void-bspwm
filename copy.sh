copydir(){
if [ -d "./OLD" ]; then
    rm -r ./OLD 
fi 
if [ -d "./backup" ]; then 
    mv  ./backup ./OLD
elif [ -f "./backup" ]; then 
    rm ./backup
fi
mkdir backup
}

makedirs() {
    cd ./backup 
    dirs=(portage calculate  config)
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
main() {
    copydir
    makedirs
    copyportage
    cpcalculateconf
}
main