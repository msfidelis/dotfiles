#!/bin/bash

#Desabilita o Spotlight
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

#Instala o Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew update;
brew upgrade;

#Instala alguns componentes de dev/essenciais de primeiro momento
brew install nmap ;
git config --global user.name "Matheus Fidelis"
git config --global user.email "msfidelis@outlook.com"

#Instala o Fish e o Oh My Fish 
brew install fish; 
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/fish;
fish;
fish_update_completions;
sudo chsh -s /usr/local/bin/fish root;
curl -L http://get.oh-my.fish | fish;
omf install lambda;

#Move minhas dotfiles para minha home
cp -r .vim* /Users/matheus/
