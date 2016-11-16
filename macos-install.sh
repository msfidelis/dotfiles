#!/bin/bash

#Desabilita o Spotlight
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist

#Instala o Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
brew update;
brew upgrade;

#Instala alguns componentes de dev/essenciais de primeiro momento
brew install git nmap ;

#Instala o PHP7
brew tap homebrew/dupes;
brew tap homebrew/versions;
brew tap homebrew/homebrew-ph;p
brew install php70;

#Instala o Apache
brew tap homebrew/apache;
sudo apachectl stop;
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null
brew install httpd24 --with-privileged-ports --with-http2
sudo cp -v /usr/local/Cellar/httpd24/2.4.23_2/homebrew.mxcl.httpd24.plist /Library/LaunchDaemons
sudo chown -v root:wheel /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
sudo chmod -v 644 /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
sudo apachectl -k restart

mkdir ../Sites
mkdir ../Workspace

#Instala o Fish e o Oh My Fish 
brew install fish; 
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells;
chsh -s /usr/local/bin/fish;
fish;
fish_update_completions;
sudo chsh -s /usr/local/bin/fish root;
curl -L http://get.oh-my.fish | fish;
omf install flash;
omf install bobthefish;

#Instala as fontes adicionais 
git clone https://github.com/powerline/fonts.git;
cd fonts/
./install.sh;  
cd ..

#Instala o Composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === 'aa96f26c2b67226a324c27919f1eb05f21c248b987e6195cad9690d5c1ff713d53020a02ac8c217dbf90a7eacc9d141d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;";
php composer-setup.php;
php -r "unlink('composer-setup.php');";

#Move minhas dotfiles para minha home
cp -r .vim* /Users/matheus/
