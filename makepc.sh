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


#Instala algumas aplicações bobas do dia a dia
echo ''
echo -e "${BRed}[*] INSTALANDO ALGUMAS APLICAÇÕES BOBINHAS"
sudo apt-get install python python-devel sendmail sendmail-bin nmap ping build-essential cmake libgtkmm-3.0-dev libssl-dev gettext libarchive-dev g++ python-pip libyaml-dev python-dev pip install ecryptfs-utils rsync thunderbird-mozilla-build ruby-dev libpcap-dev nslookup filezilla ettercap wireshark libreoffice nautilus-dropbox gimp

#Cria a pasta tmp
mkdir /tmp/dotfile/
cd /tmp/dotfile

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
wget https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n/firefox-45.0a2.pt-BR.linux-x86_64.tar.bz2
tar xvf firefox-45.0a2.pt-BR.linux-x86_64.tar.bz2
sudo apt-get -f install


echo ''
echo -e "${Byel}[*] INSTALANDO O TOR BROWSER"
wget https://www.torproject.org/dist/torbrowser/5.0.7/tor-browser-linux64-5.0.7_pt-PT.tar.xz
tar xvf tor-browser-linux64-5.0.7_pt-PT.tar.xz

echo ''
echo -e "${Bgre}[*] CRIANDO O USUÁRIO"
adduser matheus
adduser matheus sudo

