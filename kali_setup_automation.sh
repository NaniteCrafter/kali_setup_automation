#!/bin/bash

#To do:
# Install tmux
# Install postman
# Add https://github.com/fuzzdb-project/fuzzdb
# https://github.com/swisskyrepo/PayloadsAllTheThings

download_script_pwd=`pwd` | tee > update.log

sudo apt-get update | tee -a update.log
sudo apt-get upgrade -y | tee -a update.log
sudo apt-get install terminator -y | tee -a update.log
sudo apt-get install cherrytree -y | tee -a update.log
sudo apt-get install gobuster -y | tee -a update.log
sudo apt-get install seclists -y | tee -a update.log
sudo apt-get install python-pip -y | tee -a update.log

#Uncomment the following line if you need to fix stuff like proken installs/uninstalls/ or other errors
#sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove
sudo apt-get update --fix-missing | tee -a update.log
sudo apt-get upgrade --fix-missing | tee -a update.log
sudo apt-get update | tee -a update.log
sudo apt-get upgrade -y | tee -a update.log

#While watching https://www.youtube.com/watch?v=VCoNI3SvePM it was mentioned that pip for Python2 does not come installed with kali
#https://pip.pypa.io/en/stable/installation/
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py | tee -a update.log
python3 get-pip.py | tee -a update.log

cd ~ | tee -a update.log
mkdir -p scripts/{privesc,test} | tee -a update.log

cd ~/scripts | tee -a update.log
git clone https://github.com/kozmer/log4j-shell-poc.git | tee -a update.log
git clone https://github.com/int0x33/nc.exe.git | tee -a update.log
git clone https://github.com/SecureAuthCorp/impacket.git | tee -a update.log
cd ~/scripts/impacket | tee -a update.log
pip install -r requirements.txt | tee -a update.log
pip2 install -r requirements.txt | tee -a update.log
sudo python2 setup.py install | tee -a update.log
sudo python3 setup.py install | tee -a update.log

cd ~/scripts/privesc | tee -a update.log
git clone https://github.com/carlospolop/PEASS-ng.git | tee -a update.log
git clone https://github.com/rebootuser/LinEnum.git | tee -a update.log

cd $download_script_pwd | tee -a update.log

cd ./files | tee -a update.log
cat files.tar.gz.zip.* > files.tar.gz.zip | tee -a update.log
echo "current directory is" | tee -a update.log
pwd | tee -a update.log
echo "" | tee -a update.log
ls -lah | tee -a update.log
unzip -P "secure_password!233" files.tar.gz.zip | tee -a update.log
gunzip files.tar.gz | tee -a update.log
tar -xf files.tar | tee -a update.log
sudo cp -r jdk1.8.0_20 ~/scripts/log4j-shell-poc | tee -a update.log
rm -Rdf files.tar.gz.zip files.tar.gz files.tar jdk1.8.0_20 | tee -a update.log

cd $download_script_pwd | tee -a update.log

echo "" | tee -a update.log
echo "" | tee -a update.log
echo "" | tee -a update.log
echo "Install/update completed" | tee -a update.log
echo "" | tee -a update.log
echo "The following programs were installed/git repos cloned" | tee -a update.log
echo "Kali and program updates via sudo apt-get update and sudo apt-get upgrade" | tee -a update.log
echo "terminator" | tee -a update.log
echo "cherrytree" | tee -a update.log
echo "gobuster" | tee -a update.log
echo "seclists" | tee -a update.log
echo "python-pip for python2" | tee -a update.log
echo "nc.exe.git" | tee -a update.log
echo "impacket.git" | tee -a update.log
echo "PEASS-ng.git" | tee -a update.log
echo "LinEnum.git" | tee -a update.log
echo "" | tee -a update.log
echo "" | tee -a update.log
echo "" | tee -a update.log
echo "Stuff you need to install manually:" | tee -a update.log
echo "For Firefox:" | tee -a update.log
echo "  Foxyproxy: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/"  | tee -a update.log
echo "  Wappalyzer: https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/" | tee -a update.log
echo "  Cookie-editor: https://addons.mozilla.org/en-US/firefox/addon/cookie-editor/" | tee -a update.log
echo "" | tee -a update.log
echo "Stuff you need to configure manually:" | tee -a update.log
echo "  Configure Foxyproxy" | tee -a update.log
echo "  Pin Terminator to panel" | tee -a update.log
echo "  Pin Cherrytree to panel" | tee -a update.log
echo "" | tee -a update.log