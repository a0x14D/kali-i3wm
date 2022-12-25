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
cat ./scripts/nala.txt >>$HOME/.zshrc

echo -e "\e[1;49;32minstalling autotiling\e[0m\n"
sudo cp -r ./scripts/autotiling /usr/bin/
pip install i3ipc || pip install i3ipc

echo -e "\e[1;49;32minstalling bumblebee-status\e[0m\n"
git clone https://github.com/tobi-wan-kenobi/bumblebee-status.git ~/.config/bumblebee-status
pip install netifaces psutil

echo -e "\e[1;49;32msetting up i3[HOME/.config/i3]\e[0m\n"
cp -r $HOME/.config/i3 $HOME/.config/i3.backup && cp -r ./scripts/i3 $HOME/.config/

echo -e "\e[1;49;32msetting up picom[HOME/.config/picom]\e[0m\n"
cp $HOME/.config/picom/picom.conf $HOME/.config/picom/picom.conf.backup && cp ./scripts/picom.conf $HOME/.config/picom/

echo -e "\e[1;49;32mconfig kitty\e[0m\n"
cp -r ./config/kitty $HOME/.config/

echo -e "\e[1;49;32mneofetch\e[0m\n"
cp -r ./config/neofetch $HOME/.config/

echo -e "\e[1;49;32mranger\e[0m\n"
if [ -d $HOME/.config/ranger ]; then
    cp -r $HOME/.config/ranger $HOME/.config/ranger.backup
    cp -r ./config/ranger $HOME/.config/
fi

echo -e "\e[1;49;32mstarship\e[0m\n"
cp -r ./config/starship.toml $HOME/.config/

echo -e "\e[1;49;32mnodejs\e[0m\n"
sudo dpkg -i ./scripts/node-v16.16.deb

echo -e "\e[1;49;32minstalling spaceship\e[0m\n"
read -p "Do you want to install spaceship theame ohmyzsh:[y/n]" spaceship
case $spaceship in
[Yy])
	git clone https://github.com/spaceship-prompt/spaceship-prompt.git $HOME/.oh-my-zsh/custom/themes/spaceship-prompt && ln -s $HOME/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme $HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme
	sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' $HOME/.zshrc
	;;
[Nn])
	echo -e "\nskipping next thing"
	;;
esac

echo -e "\e[1;49;32mUpdating fully system\e[0m\n"
sudo apt update && sudo apt upgrade -y

echo -e "\e[1;49;32mREBOOT\n"
reboot
