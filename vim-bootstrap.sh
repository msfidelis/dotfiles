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

#Reset VIM
rm -rf ~/.vim;
rm -rf ~/.vimrc;

mkdir -p ~/.vim/{autoload,bundle,plugin,autoload} && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp vim/.vimrc ~/.vimrc

echo -e "\n${BIGreen} VIM :: INSTALLING NERDTREE ${OFF}\n"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

echo -e "\n${BIPurple} VIM :: INSTALLING AUTOCLOSE TAGS PLUGIN ${OFF}\n"
wget https://raw.githubusercontent.com/Townk/vim-autoclose/master/plugin/AutoClose.vim -O ~/.vim/plugin/AutoClose.vim

echo -e "${BIWhite}
DON'T FORGET!!!

* Autoclose
    :AutoCloseOn
    :AutoCloseOff

"