#!/bin/zsh
#!/bin/sh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/hlissner/zsh-autopair.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autopair
git clone https://github.com/wintermi/zsh-lsd.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-lsd
