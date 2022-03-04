#!/bin/bash

#To do:
# Install tmux
# Install postman
download_script_pwd=`pwd`

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install terminator -y
sudo apt-get install cherrytree -y
sudo apt-get install gobuster -y
sudo apt-get install seclists -y
sudo apt-get install python-pip -y

sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove
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
git clone https://github.com/int0x33/nc.exe.git
git clone https://github.com/SecureAuthCorp/impacket.git
cd ~/scripts/impacket
pip install -r requirements.txt
python setup.py install

cd ~/scripts/privesc
git clone https://github.com/carlospolop/PEASS-ng.git
git clone https://github.com/rebootuser/LinEnum.git

cd $download_script_pwd

echo "Install completed"
echo ""
echo "Stuff you need to install manually:"
echo "For Firefox:"
echo "  Foxyproxy: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/" 
echo "  Wappalyzer: https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/"
echo ""
echo "Stuff you need to configure manually:"
echo "  Configure Foxyproxy"
echo "  Pin Terminator to panel"
echo "  Pin Cherrytree to panel"
echo ""