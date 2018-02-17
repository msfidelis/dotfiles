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

echo -e "\n${BICyan} FISH :: INSTALLING FISH SHELL ${OFF}\n"

brew install fish; 
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/fish;
fish;
fish_update_completions;
sudo chsh -s /usr/local/bin/fish root;

echo -e "\n${BIPurple} FISH :: INSTALLING OH MY FISH ${OFF}\n"

curl -L http://get.oh-my.fish | fish;
omf install lambda;

echo -e "\n${BIPurple} FISH :: INSTALLING FISHMARKS ${OFF}\n"

curl -L https://github.com/techwizrd/fishmarks/raw/master/install.fish | fish;
gish;