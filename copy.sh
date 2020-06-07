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

}

main() {
    copydir
}



main