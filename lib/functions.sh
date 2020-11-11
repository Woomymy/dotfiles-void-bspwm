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
    echo "Hello"
}
commit_and_push() {
    greenprint "Commiting to git"
    git add .
    git commit -m "$(date +"%A %d %B %R  %Y")" # Format like this: DAY date HOUR:MINUTE YEAR
    git push origin main
}
main() {
    banner # Execute the banner
    clean_dirs # Cleans old directories
    copy_files # Copy the files
    commit_and_push # Commit and push to github
}