#!/bin/bash

#Desabilita o Spotlight
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

#Instala o Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew update;
brew upgrade;

# Instala alguns utilitários
brew install htop wget terraform gitflow jq;
sudo easy_install python_pip;
sudo easy_install Pygments;
sudo pip install mdv;

# Instala fontes
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
bash install.sh
cd ..
rm -rf fonts

# Instala os Bootstraps
bash fish-boostrap.sh;
bash git-bootstrap.sh;
bash vim-bootstrap.sh;
