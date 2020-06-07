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
    dirs=(portage node  config)
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

}

main() {
    copydir
    makedirs
    copyportage
}



main