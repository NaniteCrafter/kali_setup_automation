#!/bin/bash

#To do:
# Install tmux
# Install postman
# Add https://github.com/fuzzdb-project/fuzzdb
# https://github.com/swisskyrepo/PayloadsAllTheThings

download_script_pwd=`pwd`

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install terminator -y
sudo apt-get install cherrytree -y
sudo apt-get install gobuster -y
sudo apt-get install seclists -y
sudo apt-get install python-pip -y

#Uncomment the following line if you need to fix stuff like proken installs/uninstalls/ or other errors
#sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove
sudo apt-get update --fix-missing
sudo apt-get upgrade --fix-missing
sudo apt-get update
sudo apt-get upgrade -y

#While watching https://www.youtube.com/watch?v=VCoNI3SvePM it was mentioned that pip for Python2 does not come installed with kali
#https://pip.pypa.io/en/stable/installation/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py

cd ~
mkdir -p scripts/{privesc,test}

cd ~/scripts
git clone https://github.com/kozmer/log4j-shell-poc.git
git clone https://github.com/int0x33/nc.exe.git
git clone https://github.com/SecureAuthCorp/impacket.git
cd ~/scripts/impacket
pip install -r requirements.txt
pip2 install -r requirements.txt
sudo python2 setup.py install
sudo python3 setup.py install

cd ~/scripts/privesc
git clone https://github.com/carlospolop/PEASS-ng.git
git clone https://github.com/rebootuser/LinEnum.git

cd $download_script_pwd

cd ./files
cat files.tar.gz.zip.* > files.tar.gz.zip
echo "current directory is"
pwd
echo ""
ls -lah
unzip -y -P "secure_password!233" files.tar.gz.zip
gunzip files.tar.gz
tar -xf files.tar
cp -r jdk1.8.0_20 ~/scripts/log4j-shell-poc

cd $download_script_pwd

echo ""
echo ""
echo ""
echo "Install/update completed"
echo ""
echo "The following programs were installed/git repos cloned"
echo "Kali and program updates via sudo apt-get update and sudo apt-get upgrade"
echo "terminator"
echo "cherrytree"
echo "gobuster"
echo "seclists"
echo "python-pip for python2"
echo "nc.exe.git"
echo "impacket.git"
echo "PEASS-ng.git"
echo "LinEnum.git"
echo ""
echo ""
echo ""
echo "Stuff you need to install manually:"
echo "For Firefox:"
echo "  Foxyproxy: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/" 
echo "  Wappalyzer: https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/"
echo "  Cookie-editor: https://addons.mozilla.org/en-US/firefox/addon/cookie-editor/"
echo ""
echo "Stuff you need to configure manually:"
echo "  Configure Foxyproxy"
echo "  Pin Terminator to panel"
echo "  Pin Cherrytree to panel"
echo ""