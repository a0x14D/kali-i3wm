#!/bin/bash


 
echo "                     __                              ________ ________ ________  "
echo " _____   __ __  ____ |  | __ ____   ______  _  ______ \_____  \\_____  \\_____  \ "
echo " \__  \ |  |  \/    \|  |/ //    \ /  _ \ \/ \/ /    \  _(__  <  _(__  <  _(__  < "
echo " / __ \|  |  /   |  \    <|   |  (  <_> )     /   |  \/       \/       \/       \ "
echo "(____  /____/|___|  /__|_ \___|  /\____/ \/\_/|___|  /______  /______  /______  / "
echo "     \/           \/     \/    \/                  \/       \/       \/       \/  ";

sudo sh touchpad
echo -e "fixing touchpad\n"

sudo cp kali_miss/* /lib/firmware/i915/
echo -e "fixing missing modules\n"

xdg-user-dirs-update
echo -e "printing directores\n"

sudo cp ramclean /usr/bin/ 

sudo sh fonts.sh

echo -e "\n\e[1;7;49;35mchanging sources\e[0m"
echo -e "\nchanging repositories list [\e[1;31mhttp.kali.org\e[0m] => [\e[1;33mkali.downloaded.org\e[0m]"

read -p "Do you want to change repositories list? [y/n]:" repo 


case $repo in
  [yY])
    echo -e "\n\e[1;32mchanging repositories list\e[0m"
   sudo sed -i 's/http.kali.org/kali.download/g' /etc/apt/sources.list
     ;;
   [Nn])
     echo -e "\n\e[1;37mok continue next step\e[0m "
     ;;
    *)
     echo -e "\n\e[1;5;31mChoose (y/n)\e[0m"
     break
     ;; 


   esac

   echo -e "\n\e[1;7;49;96mDo You Want To Change [APT to NALA]\e[0m\n"
   read -p "Do you want to change apt => nala [y/n] ?:" nala 
   case $nala in
      [Yy])
        sudo apt update && sudo apt install nala 
        cat nala.txt >> $HOME/.zshrc 
        echo -e "\n\e[1;49;32mcomplete sucessfully " ;;
      [Nn])
        echo -e "As Your Wish\n "
    
      esac        

echo -e "\n\e[1;34mNEovim\n\e[0m"

read -p "Do you want my neovim [y/n]:" neovim


case $neovim in 
  [yY])
    echo -e "\e[1;33getting neovim\n"
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb && sudo dpkg -i nvim-linux64.deb 
    git clone https://github.com/aunknownwhoami/nvim.git ~/.config/nvim
    ;;
  [Nn])
    echo -e "\n\e[1;7;31mok Download later Manually\n\e[0m"
    ;;
   *)
     echo -e "\n\e[1;5;31mChoose (y/n)\e[0m";; 
  
esac

echo -e "\n\e[4;49;01mOH-MY-ZSH\n\e[0m"

read -p "Do you want to install oh-my-zsh framework [y/n]:" ohmyzsh


case $ohmyzsh in 
  [yY])
    echo -e "\e[1;33minstalling ohmyzsh\n"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" $HOME
    sh zsh.sh && sudo sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-autocomplete)'#
    
    ;;
  [Nn])
    echo -e "\n\e[1;7;31mDownload it manually\n\e[0m"
    ;;
   *)
     echo -e "\n\e[1;5;31mChoose (y/n)\e[0m";; 
  
esac
