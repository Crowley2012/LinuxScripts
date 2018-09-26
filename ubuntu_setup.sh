#!/bin/bash
#configures a fresh Ubuntu install

#get windows username
echo "What is your windows username?"
read username

#apt-get aliases
echo "" >> ~/.bashrc
echo "alias update='sudo apt-get update'" >> ~/.bashrc
echo "alias upgrade='sudo apt-get upgrade'" >> ~/.bashrc
echo "alias install='sudo apt-get install'" >> ~/.bashrc
echo "alias search='sudo apt-cache search'" >> ~/.bashrc
echo "alias remove='sudo apt-get remove'" >> ~/.bashrc
echo "alias purge='sudo apt-get purge'" >> ~/.bashrc
echo "alias aremove='sudo apt-get autoremove'" >> ~/.bashrc
echo "alias clean='sudo apt-get clean'" >> ~/.bashrc
echo "" >> ~/.bashrc

#terminal aliases
echo "alias reload='. ~/.bashrc'" >> ~/.bashrc
echo "alias c='clear'" >> ~/.bashrc
echo "alias cl='clear;ls'" >> ~/.bashrc
echo "alias sl='sl;clear'" >> ~/.bashrc
echo "alias edit='nano ~/.bashrc'" >> ~/.bashrc
echo "alias setup-display='export DISPLAY=:0'" >> ~/.bashrc
echo "" >> ~/.bashrc

#code aliases
echo "alias dev='cd /mnt/c/dev'" >> ~/.bashrc
echo "alias code='\"/mnt/c/Users/"$username"/AppData/Local/Programs/Microsoft VS Code/Code.exe\"'" >> ~/.bashrc
echo "alias run='dotnet build;dotnet run'" >> ~/.bashrc

#power aliases
echo "alias reboot='sudo reboot'" >> ~/.bashrc
echo "alias poweroff='sudo poweroff'" >> ~/.bashrc
echo "" >> ~/.bashrc

#functions
echo -e "function uninstall { 
\tsudo apt-get remove \$1;
\tsudo apt-get purge \$1;
\tsudo apt-get autoremove;
\tsudo apt-get clean;
}" >> ~/.bashrc

#reload bashrc
. ~/.bashrc

#update system
sudo apt-get -y update
sudo apt-get -y upgrade

#install programs
sudo apt-get -y install git
sudo apt-get -y install gedit
sudo apt-get -y install sl

#install dotnet
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get -y install apt-transport-https
sudo apt-get -y update
sudo apt-get -y install dotnet-sdk-2.1

#cleanup
rm -r packages-microsoft-prod.deb
sudo apt-get -y autoremove
sudo apt-get -y clean

#done
clear
echo 'Setup Complete'