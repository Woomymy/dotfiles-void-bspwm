source "./lib/colors.sh"
source "./lib/copy.sh"
banner() {
    cyanprint "==================="
    cyanprint "Copying dotfiles..."
    cyanprint "==================="
}
clean_dirs() {
    DIRS=(home etc) 
    for DIR in ${DIRS[*]}; do 
        if [ -d "./${DIR}" ]
        then
            rm -rf "./${DIR}"
        fi
    done
}
copy_files() {
    
}
main() {
    banner # Execute the banner
    clean_dirs # Cleans old directories
    copy_files # Copy the files
}