CHOME="home/$USER"
CONFHOME="$CHOME/.config"
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
    # Portage
    greenprint "Copying portage conf..."
    MAKEDOT=(conf)
    for DOTDIR in ${MAKEDOT[*]} 
    do
        copy_dir "etc/portage/make.${DOTDIR}"
    done
    PACKAGEDOT=(use accept_keywords mask unmask use)
    for DOTDIR in ${PACKAGEDOT[*]}
    do
        copy_dir "etc/portage/package.${DOTDIR}"
    done
    copy_dir "etc/portage/repos.conf"
    copy_file "var/lib/portage" "world"

    greenprint "Copying services and openrc configuration..."
    copy_file "etc/init.d" "lightdm-wallpaper"
    copy_file  "etc/conf.d" "lightdm-wallpaper"
    copy_file "etc" "rc.conf"
    copy_file "etc/lightdm" "lightdm-gtk-greeter.conf.clt"
    
    greenprint "Copying home configuration..."
    copy_file "$CHOME/.calculate" "ini.env"
    copy_dir "$CHOME/bin"
    copy_dir "$CONFHOME/rofi"
    copy_dir "$CONFHOME/polybar"
    copy_file "$CONFHOME/i3" "config"
    copy_file  "$CONFHOME/Code/User" "settings.json"
    copy_file "$CONFHOME/Kvantum" "kvantum.kvconfig"
    copy_file "$CHOME" ".zshrc"
    copy_file "$CHOME" ".p10k.zsh"
    copy_file "$CONFHOME/alacritty" "alacritty.yml"
    copy_file "$CHOME" ".vuerc"
    copy_file "$CHOME" ".gitconfig"
    copy_file "$CONFHOME" "urxvtrc"
}
commit_and_push() {
    greenprint "Commiting to git"
    echo -e "\e[39m" # Reset colors
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