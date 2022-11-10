#!/bin/bash

echo "                     __                              ________ ________ ________  "
echo " _____   __ __  ____ |  | __ ____   ______  _  ______ \_____  \\_____  \\_____  \ "
echo " \__  \ |  |  \/    \|  |/ //    \ /  _ \ \/ \/ /    \  _(__  <  _(__  <  _(__  < "
echo " / __ \|  |  /   |  \    <|   |  (  <_> )     /   |  \/       \/       \/       \ "
echo "(____  /____/|___|  /__|_ \___|  /\____/ \/\_/|___|  /______  /______  /______  / "
echo "     \/           \/     \/    \/                  \/       \/       \/       \/  "
echo "                                                              alive:youtube;      "
echo "                                                              alive:telegram;     "
echo "                                                              alive:discode;      "



echo -e "\n\e[1;49;32mconfiguration ohmyzsh\e[0m\n"
sh zsh.sh && sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-autocomplete)/g' $HOME/.zshrc

echo -e "\n\e[1;49;32mconfiguring nala[HOME/.zshrc(end of file)]\e[0m\n" 
cat nala.txt >> $HOME/.zshrc

echo -e "\e[1;49;32minstalling autotiling\e[0m\n"
sudo cp -r autotiling /usr/bin/ 
pip install i3ipc || pip install i3ipc

#echo -e "\e[1;49;3echo -e "\e[1;49;32mimporting wallpaper[HOME/picture]\e[0m\n"
#echo -e "\e[1;49;3cp -r wallpaper/* $HOME/Pictures/

echo -e "\e[1;49;32msetting up i3[HOME/.config/i3]\e[0m\n"
cp -r $HOME/.config/i3 $HOME/.config/i3.backup && cp -r i3 $HOME/.config/

# echo -e "\e[1;49;32msetup i3blocks[HOME/.config/i3blocks]\e[0m\n"
# cp -r i3blocks $HOME/.config/

# echo -e "\e[1;49;32mdownloading i3blocks\e[0m\n"
# sudo apt install i3blocks

# echo -e "\e[1;49;32mchanging login wallpaer[/etc/lightdm/]\e[0m\n"
# sudo cp -r slick-greeter.conf /etc/lightdm/ 

echo -e "\e[1;49;32msetting up picom[HOME/.config/picom]\e[0m\n"
cp $HOME/.config/picom/picom.conf $HOME/.config/picom/picom.conf.backup && cp picom.conf $HOME/.config/picom/ 

echo -e "\e[1;49;32mconfig kitty\e[0m\n"
cp -r kitty $HOME/.config/

echo -e "\e[1;49;32minstalling spaceship\e[0m\n"
read -p "Do you want to install spaceship theame ohmyzsh:[y/n]" spaceship 
case $spaceship in 
  [Yy])
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git $HOME/.oh-my-zsh/custom/themes/spaceship-prompt && ln -s $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' $HOME/.zshrc
    ;;
  [Nn])
    echo -e "\nskipping next thing"
esac

# echo -e "\e[1;49;32minstall depencies\e[0m\n"
# sudo apt install nodejs npm 

echo -e "\e[1;49;32mUpdating fully system\e[0m\n"
sudo apt update && sudo apt upgrade -y 

echo -e "\e[1;49;32mREBOOT\n"
reboot



