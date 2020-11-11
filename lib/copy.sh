source "./lib/colors.sh"
# Expected usage: 
# copy_to_dir DIR FILE (without /) 
copy_to_dir() {
    if [[ ! -f "/$1/$2" || -z $1 || -z $2 ]]; then
        redprint "File $1/$2 does not exist!"
        return;
    fi
    DIR=$1
    FILE=$2
    greenprint "Copying file $1/$2..."
    mkdir -p ./$1
    cp "/${1}/${2}" "./${1}/${2}"
}