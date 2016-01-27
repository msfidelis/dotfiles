#!/bin/bash

# Regular           Bold                Underline           High Intensity      BoldHigh Intens     Background          High Intensity Backgrounds
Bla='\e[0;30m';     BBla='\e[1;30m';    UBla='\e[4;30m';    IBla='\e[0;90m';    BIBla='\e[1;90m';   On_Bla='\e[40m';    On_IBla='\e[0;100m';
Red='\e[0;31m';     BRed='\e[1;31m';    URed='\e[4;31m';    IRed='\e[0;91m';    BIRed='\e[1;91m';   On_Red='\e[41m';    On_IRed='\e[0;101m';
Gre='\e[0;32m';     BGre='\e[1;32m';    UGre='\e[4;32m';    IGre='\e[0;92m';    BIGre='\e[1;92m';   On_Gre='\e[42m';    On_IGre='\e[0;102m';
Yel='\e[0;33m';     BYel='\e[1;33m';    UYel='\e[4;33m';    IYel='\e[0;93m';    BIYel='\e[1;93m';   On_Yel='\e[43m';    On_IYel='\e[0;103m';
Blu='\e[0;34m';     BBlu='\e[1;34m';    UBlu='\e[4;34m';    IBlu='\e[0;94m';    BIBlu='\e[1;94m';   On_Blu='\e[44m';    On_IBlu='\e[0;104m';
Pur='\e[0;35m';     BPur='\e[1;35m';    UPur='\e[4;35m';    IPur='\e[0;95m';    BIPur='\e[1;95m';   On_Pur='\e[45m';    On_IPur='\e[0;105m';
Cya='\e[0;36m';     BCya='\e[1;36m';    UCya='\e[4;36m';    ICya='\e[0;96m';    BICya='\e[1;96m';   On_Cya='\e[46m';    On_ICya='\e[0;106m';
Whi='\e[0;37m';     BWhi='\e[1;37m';    UWhi='\e[4;37m';    IWhi='\e[0;97m';    BIWhi='\e[1;97m';   On_Whi='\e[47m';    On_IWhi='\e[0;107m';


echo -e "${BBlu}[*] SCRIPT DE CONFIGURAÇÃO AUTOMÁTICA DO COMPUTADOR PESSOAL - Totalmente mimimi tenho preguiça"

#Instala os repositórios e faz o upgrade

echo -e "${BRed}[*] INSTALANDO OS REPOSITÓRIOS PADRÕES"
echo ''

mv /etc/apt/sources.list /etc/apt/sources.list.backup
echo -e "${BRed}[*] CRIANDO OS REPOSS"
echo '''

#KALI -ROLLING RELEASE
deb http://http.kali.org/kali kali-rolling main non-free contrib
# deb-src http://http.kali.org/kali kali-rolling main non-free contrib

#KALI - REGULAR
deb http://http.kali.org/kali sana main non-free contrib
deb http://security.kali.org/kali-security sana/updates main contrib non-free

#KALI - SOURCES
deb-src http://http.kali.org/kali sana main non-free contrib
deb-src http://security.kali.org/kali-security sana/updates main contrib non-free

### Repositórios padrão.
deb http://http.debian.net/debian/ jessie main non-free contrib
#deb-src http://http.debian.net/debian/ jessie main non-free contrib

### Atualizações de Segurança.
deb http://security.debian.org/ jessie/updates main contrib non-free
#deb-src http://security.debian.org/ jessie/updates main contrib non-free

### Volatile (softwares atualizados com frequência, Clamav, etc)
deb http://http.debian.net/debian/ jessie-updates main contrib non-free
#deb-src http://http.debian.net/debian/ jessie-updates main contrib non-free

### Backports (no momento)
deb http://http.debian.net/debian/ jessie-backports main contrib non-free
#deb-src http://http.debian.net/debian/ jessie-backports main contrib non-free


### Mozilla Backports
deb http://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main

## SPOTIFY
deb http://repository.spotify.com stable non-free
deb http://download.virtualbox.org/virtualbox/debian vivid contrib


## ETC
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A8AA1FAA3F055C03
deb http://ppa.launchpad.net/danielrichter2007/grub-customizer/ubuntu trusty main



''' >> /etc/apt/sources.list

echo -e "${BRed}[*] INSTALANDO CHAVES"
echo ''
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A8AA1FAA3F055C03
sudo wget -q -O - https://www.kali.org/archive-key.asc | gpg --import
sudo gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6
sudo gpg --list-keys --with-fingerprint  7D8D0BF6
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C1289A29
sudo apt-get update ; sudo apt-get upgrade -y
sudo apt-get dist-upgrade

#Instala algumas aplicações bobas do dia a dia
echo ''
echo -e "${BRed}[*] INSTALANDO ALGUMAS APLICAÇÕES BOBINHAS"
sudo apt-get install python sendmail sendmail-bin nmap build-essential tor cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev g++ python-pip libyaml-dev python-dev ecryptfs-utils rsync thunderbird-mozilla-build firefox-mozilla-build ruby-dev libpcap-dev filezilla wireshark libreoffice nautilus-dropbox gimp git -y

#Cria a pasta tmp
mkdir /tmp/dotfile/
cd /tmp/dotfile
mkdir numix; cd numix
git clone https://github.com/cldx/numix-gtk-theme
git clone https://github.com/numixproject/numix-icon-theme
git clone https://github.com/numixproject/numix-icon-theme-circle
mv numix-gtk-theme /usr/share/themes
mv numix-icon-theme/Numix/ /usr/share/icons
mv numix-icon-theme-circle/Numix-Circle/ /usr/share/icons; cd -


#Instala o Google Chrome e configura o Mozilla Firefox Devel
echo ''
echo -e "${Byel}[*] INSTALANDO O GOOGLE CHROME STABLE"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get -f install

echo ''
echo -e "${Byel}[*] INSTALANDO O SKYPE"
wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo dpkg -i skype-ubuntu-precise_4.3.0.37-1_i386.deb
sudo apt-get -f install

echo ''
echo -e "${Byel}[*] INSTALANDO O MOZILLA FIREFOX DEVEL"
cd /opt
cp firefox/ firefoxold/
wget https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n/firefox-45.0a2.pt-BR.linux-x86_64.tar.bz2
tar xvf firefox-45.0a2.pt-BR.linux-x86_64.tar.bz2


echo '''
[Desktop Entry]
Encoding=UTF-8
Name=Mozilla Firefox
GenericName=Browser
Comment=Web Browser
Exec=firefox %u
Icon=firefox
Terminal=false
X-MultipleArgs=false
StartupWMClass=Firefox
Type=Application
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;

''' >> /usr/share/applications/firefox.desktop


echo ''
echo -e "${Byel}[*] INSTALANDO O TOR BROWSER"
wget https://www.torproject.org/dist/torbrowser/5.0.7/tor-browser-linux64-5.0.7_pt-PT.tar.xz
tar xvf tor-browser-linux64-5.0.7_pt-PT.tar.xz

echo ''
echo -e "${Bgre}[*] CRIANDO O USUÁRIO"
adduser matheus
adduser matheus sudo

echo ''
echo -e "${Bgre}[*] INSTALANDO O SPOTIFY"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client


echo ''
echo -e "${Bgre}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO WEB - LAMP"
sudo apt-get install apache2 apache2-dev php5 php5-pecl-http php5-dev php5-mysql mysql-server apache2-threaded-dev libxml2-dev php5-curl php5-cli php5-cgi libcurl4-gnutls-dev liblua5.1-0 liblua5.1-0-dev build-essential php5-cli libghc-pcre-light-dev zip libapache2-mod-security2 libxml2 libxml2-dev libxml2-utils php5-odbc libaprutil1 libaprutil1-dev php5-gd php5-odbc vim

echo ''
echo -e "${Bgre}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO WEB - NETBEANS"
wget http://download.netbeans.org/netbeans/8.1/final/bundles/netbeans-8.1-php-linux-x64.sh
chmod +x netbeans-8.1-php-linux-x64.sh
./netbeans-8.1-php-linux-x64.sh

echo ''
echo -e "${Bgre}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO WEB - MYSQL WORKBENCH"
sudo apt-get install mysql-workbench

echo ''
echo -e "${Bgre}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO WEB - XDEBUG"
sudo apt-get install pecl php-pear dh-php5 php5-pecl-http dh-make-php
sudo pecl install xdebug
echo 'zend_extension="/usr/local/php/modules/xdebug.so"' >> /etc/php5/apache2/php.ini

echo ''
echo -e "${BWhi}[*] PENTESTS AND TOOLS"
cd /home/matheus/
git clone https://github.com/msfidelis/MyHackingTools.git
git clone https://github.com/msfidelis/VHostCreator.git
git clone https://github.com/msfidelis/Sherlock
git clone https://github.com/msfidelis/Kill-Router-.git
git clone https://github.com/msfidelis/Firewalls-Labs.git

cd VHostCreator
chmod 777 install-vhostcreator.sh ; ./install-vhostcreator.sh

echo ''
echo -e "${BWhi}[*] BETTERCAP"
sudo apt-get install ruby-dev libpcap-dev
sudo gem install bettercap

echo ''
echo -e "${BWhi}[*] PYTHON LIBS"
pip install prettytable Mako pyaml dateutils readline --upgrade
cd /tmp/dotfile
wget https://pypi.python.org/packages/source/P/PySocks/PySocks-1.5.6.tar.gz#md5=c825c7c52b2c79dde73cac8d04bd25cb
tar xvf PySocks-1.5.6.tar.gz
chmod 777 PySocks-1.5.6 -R
cd PySocks-1.5.6/
./setup.py build
./setup.py install

echo ''
echo -e "${BWhi}[*] VIRTUALBOX 5.0"
wget http://download.virtualbox.org/virtualbox/5.0.14/VirtualBox-5.0.14-105127-Linux_amd64.run]
sudo apt-get install dkms linux-source linux-headers-amd64
chmod +x VirtualBox-5.0.14-105127-Linux_amd64.run
./VirtualBox-5.0.14-105127-Linux_amd64.run

echo ''
echo -e "${BWhi}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO PYTHON - ATOM"
wget https://atom-installer.github.com/v1.4.1/atom-amd64.deb?s=1453749982
dpkg -i atom-amd64.deb

echo ''
echo -e "${BWhi}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO PYTHON - PYCHARM"
cd /opt/
wget https://download.jetbrains.com/python/pycharm-community-5.0.3.tar.gz
tar xvf pycharm-community-5.0.3.tar.gz

echo ''
echo -e "${BWhi}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO PYTHON - DEPENDENCIAS"
sudo apt-get install python3 python2.7

echo ''
echo -e "${BWhi}[*] CONFIGURANDO O AMBIENTE DE DESENVOLVIMENTO PYTHON - AUXILIARES"
pip install mycli

echo ''
echo -e "${BGre}[*] CONFIGURANDO O AMBIENTE DE TRABALHO - XFCE"
sudo apt-get install xfce4 conky
