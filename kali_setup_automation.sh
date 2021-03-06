#!/bin/bash

#To do:
# Install tmux
# Install postman
# Add https://github.com/fuzzdb-project/fuzzdb
# https://github.com/swisskyrepo/PayloadsAllTheThings
# Do this via tmux for the tmux logging
#   Create an exported bookmarks file with folders that can be imported into Firefox
# Install https://github.com/calebstewart/pwncat
#
#Do the following from
#git clone https://github.com/saghul/lxd-alpine-builder.git
#cd lxd-alpine-builder
#sudo ./build-alpine
#
#Get the pentestmonkey github including the php reverse shell
#
#Create a file for getting a better shell such as pty.pty spawn via python..... 
# stty raw -echo
#
#
#   Take a look at https://github.com/bcoles for more useful repos
#
#

download_script_pwd=`pwd`

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install terminator -y
sudo apt-get install cherrytree -y
sudo apt-get install gobuster -y
sudo apt-get install seclists -y
sudo apt-get install python-pip -y
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install maven -y
sudo apt-get install feroxbuster -y

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
mkdir -p ~/scripts/{privesc,tools}

cd ~/scripts
git clone https://github.com/kozmer/log4j-shell-poc.git
cd ~/scripts/log4j-shell-poc
git stash && git pull && git stash drop
pip install -r requirements.txt

cd ~/scripts
git clone https://github.com/int0x33/nc.exe.git
cd ~/scripts/nc.exe
git stash && git pull && git stash drop

cd ~/scripts
git clone https://github.com/SecureAuthCorp/impacket.git
cd ~/scripts/impacket
git stash && git pull && git stash drop
pip install -r requirements.txt
pip2 install -r requirements.txt
sudo python2 setup.py install
sudo python3 setup.py install

cd ~/scripts
git clone https://github.com/puzzlepeaches/Log4jUnifi.git
cd ~/scripts/Log4jUnifi
git stash && git pull && git stash drop
pip install -r requirements.txt
pip2 install -r requirements.txt
sudo python2 setup.py install
sudo python3 setup.py install

cd ~/scripts
git clone https://github.com/veracode-research/rogue-jndi.git
cd ~/scripts/rogue-jndi
git stash && git pull && git stash drop
mvn package

cd ~/scripts
git clone https://github.com/java-decompiler/jd-gui.git
cd ~/scripts/jd-gui
git stash && git pull && git stash drop
./gradlew build
echo "To run this java decompiler use the following command, replaxing the version number with your version number." > ~/scripts/jd-gui/How_to_use_this_java_decompiler.txt
echo "java -jar ~/scripts/jd-gui/build/libs/jd-gui-1.6.6.jar" >> ~/scripts/jd-gui/How_to_use_this_java_decompiler.txt

cd ~/scripts
git clone https://github.com/mzet-/linux-exploit-suggester.git
cd ~/scripts/linux-exploit-suggester
git stash && git pull && git stash drop

cd ~/scripts/tools
mkdir ~/tmux_logs
git clone https://github.com/tmux-plugins/tmux-logging.git
cd ~/scripts/tmux-logging
git stash && git pull && git stash drop
echo "set -g history-limit 50000" > ~/.tmux.conf
echo "set -g @plugin 'tmux-plugins/tmux-logging'" >> ~/.tmux.conf
echo "run-shell ~/scripts/tools/tmux-logging/logging.tmux" >> ~/.tmux.conf
echo "set -g @logging-path ~/tmux_logs" >> ~/.tmux.conf
tmux source-file ~/.tmux.conf

cd ~/scripts/privesc
git clone https://github.com/carlospolop/PEASS-ng.git
cd ~/scripts/privesc/PEASS-ng
git stash && git pull && git stash drop

cd ~/scripts/privesc
git clone https://github.com/rebootuser/LinEnum.git
cd ~/scripts/privesc/LinEnum
git stash && git pull && git stash drop

cd $download_script_pwd

cd ./files
cat files.tar.gz.zip.* > files.tar.gz.zip
echo "current directory is"
pwd
echo ""
ls -lah
unzip -P "secure_password!233" files.tar.gz.zip
gunzip files.tar.gz
tar -xf files.tar
sudo cp -r jdk1.8.0_20 ~/scripts/log4j-shell-poc
rm -Rdf files.tar.gz.zip files.tar.gz files.tar jdk1.8.0_20

cd $download_script_pwd

cp ./my_custom_script.sh ~/scripts/rogue-jndi/my_custom_script.sh
chmod +x ~/scripts/rogue-jndi/my_custom_script.sh

mkdir ~/scripts/tomcat
chmod +x make-war.sh
cp make-war.sh ~/scripts/tomcat

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
echo "maven (for java compiling/building)"
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
echo "  Disable JavaScript: https://addons.mozilla.org/en-US/firefox/addon/disable-javascript/"
echo ""
echo "Stuff you need to configure manually:"
echo "  Import the bookmarks file. Warning: This will overwrite all current bookmarks."
echo "  Configure Foxyproxy"
echo "  Pin Terminator to panel"
echo "  Pin Cherrytree to panel"
echo ""
echo "How to use tmux https://gist.github.com/MohamedAlaa/2961058"
echo "Note: The default prefix key is ctrl+b"
echo "  Detach session: prefix + d"
echo "  List tmux sessions: tmux ls"
echo "  Attach session: tmux attach-session -t SESSION_NUMBER"
echo "  List commands: prefix + ?"
echo ""
echo "How to use tmux-logging, sourced from: https://github.com/tmux-plugins/tmux-logging.git"
echo "  Toggle (start/stop) logging in the current pane."
echo "  Key binding: prefix + shift + p"
echo ""
echo "  Save complete pane history to a file. Convenient if you retroactively remember you need to log/save all the work."
echo "  Key binding: prefix + alt + shift + p"