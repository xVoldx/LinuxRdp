#! /bin/bash
printf "  ____        _   _            ____   _____ \n / __ \      | | (_)          / __ \ / ____|\n| |  | |_ __ | |_ _ _ __ ___ | |  | | (___  \n| |  | | '_ \| __| | '_ ` _ \| |  | |\___ \ \n| |__| | |_) | |_| | | | | | | |__| |____) |\n \____/| .__/ \__|_|_| |_| |_|\____/|_____/ \n       | |                                  \n       |_|                                  \n" >&2
{
sudo useradd -m OPTIMOS
sudo adduser OPTIMOS sudo
echo 'OPTIMOS:235711' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser OPTIMOS chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - OPTIMOS -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi