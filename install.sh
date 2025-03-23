#!/bin/bash

green_color='\033[0;32m'
no_color='\033[0m'

config_dir="$HOME/.config"

confirm() {
    read -p "$1 [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]
    then
        return 1
    else
        return 0
    fi
}

system_update() {
       echo -e "${green_color}[*] Updating system...${no_color}"
       sudo pacman -Sy --noconfirm archlinux-keyring
       sudo pacman -Syu --noconfirm
       
       echo -e "${green_color}[*] Installing packages...${no_color}"
       sudo pacman -S --noconfirm - < pkglist.txt
}

init_dotfiles() {
       echo -e "${green_color}[*] Preparing configuration folder...${no_color}"
       mkdir ~/.config
       rm -f ~/.bashrc
       rm -f ~/.bash_profile
       rm -f ~/.config/i3/config
       rm -f ~/.config/starship.toml
       
       mkdir ~/.config/alacritty
       mkdir ~/.config/nvim
       mkdir ~/.config/picom
       mkdir ~/.config/polybar
       mkdir ~/.config/rofi
       mkdir ~/.config/betterlockscreen
       mkdir ~/.config/i3
       
       echo -e "${green_color}[*] Generating symlinks for configuration files...${no_color}"
       ln -s $PWD/.bashrc ~/.bashrc                               # .bashrc
       ln -s $PWD/.bash_profile ~/.bash_profile                   # .bash_profile
       ln -s $PWD/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml # alacritty
       ln -s $PWD/i3/config ~/.config/i3/config                   # i3
       ln -s $PWD/nvim/init.vim ~/.config/nvim/init.vim           # neovim
       ln -s $PWD/picom/picom.conf ~/.config/picom/picom.conf     # picom
       ln -s $PWD/polybar/config.ini ~/.config/polybar/config.ini # polybar
       ln -s $PWD/rofi/config.rasi ~/.config/rofi/config.rasi     # rofi
       ln -s $PWD/starship.toml ~/.config/starship.toml           # starship
      # ln -s $PWD/betterlockscreen/betterlockscreenrc	~/.config/betterlockscreen/betterlockscreenrc  # betterlockscreen
       ln -s $PWD/.xinitrc ~/.xinitrc				   # .xinitrc
}

init_wallpaper() {
    echo -e "${green_color}[*] Copying wallpaper files...${no_color}"
    mkdir ~/Pictures
    mkdir ~/Pictures/Wallpaper
    cp -r $PWD/walls/. ~/Pictures/Wallpaper/
    
    
    echo -e "${green_color}[*] Generating rofi theme...${no_color}"
    wal -i ~/Pictures/Wallpaper/cabin.png
}

init_vim() {
    echo -e "${green_color}[*] Installing Vim-Plug...${no_color}"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    
    echo -e "${green_color}[*] Installing plugins for neovim...${no_color}"
    nvim --headless +PlugInstall +qall >/dev/null 2>&1
}

if confirm "Do you want to execute a system update and install all needed packages? This needs to be run with sudo."; then
    system_update
fi

init_dotfiles
init_wallpaper
init_vim
