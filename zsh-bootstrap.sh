#!/bin/bash
OFF='\033[0m'
BIBlack='\033[1;90m'        # Black
BIRed='\033[1;91m'          # Red
BIGreen='\033[1;92m'        # Green
BIYellow='\033[1;93m'       # Yellow
BIBlue='\033[1;94m'         # Blue
BIPurple='\033[1;95m'       # Purple
BICyan='\033[1;96m'         # Cyan
BIWhite='\033[1;97m'        # White


curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh; zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

#Tema
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


#Zshmarks
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/jocelynmallon/zshmarks.git

cp .zshrc  ~/.zshrc
