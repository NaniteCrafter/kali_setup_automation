#!/bin/bash
if [ `cat script_updated` != true ]
then
    git stash
    git pull
    echo "true" > script_updated
    chmod +x kali_setup_automation.sh
    ./kali_setup_automation.sh
fi

download_script_pwd=`pwd`

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install terminator -y
sudo apt-get install cherrytree -y
sudo apt-get install gobuster -y
sudo apt-get install seclists -y


sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove
sudo apt-get update --fix-missing
sudo apt-get upgrade --fix-missing
sudo apt-get update
sudo apt-get upgrade -y

cd ~
git clone https://github.com/carlospolop/PEASS-ng.git


cd $download_script_pwd

rm script_updated
echo "All done!"
echo "Test123"
echo "3000"