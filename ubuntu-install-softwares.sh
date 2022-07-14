#!/bin/bash

# Different ways to install softwares "Ubuntu Software Center", ".deb" "Flatpak", "Snap", "AppImage", "Apt", "PPA", "Synaptic", "dpkg", "Source Code", "Web Browser", "Pip", umake

SelectedSoftwares=`zenity --list --title "VAYA SOFTWARES" \
--text "Select the SOFTWARE to install" \
--checklist --column "Select" --column "Name" \
1 "chrome" 2 "edge" 3 "brave" \
4 "java" 5 "maven" 6 "visual studio code" 7 "spring-tools-suite" 8 "netbeans" 9 "idea" 10 "eclipse" \
11 "Sublime Text" 12 "webstorm" 13 "Notepadqq" 14 "atom" 15 "dbeaver" 16 "aws cli" 17 "docker" 18 "helm" 19 "nodejs" 20 "Whatever" \
21 "Inkscape" 22 "WPS Office" 23 "datagrip" 24 "NitroShare" 25 "clion" 26 "KDE Connect" 27 "Shutter" 28 "SimpleScreenRecorder" 29 "vlc player" 30 "file zilla" \
--height=600 --width=600 --cancel-label="cancel" --ok-label="install" --extra-button="uninstall" `

echo "selected Option: " $?
echo "selected List: " $SelectedSoftwares
IN="bla@some.com;john@home.com"
IFS='|'
read -a IN_arr <<< "${SelectedSoftwares}"
for entry in "${IN_arr[@]}"

do
    if [[ $entry == 'chrome' ]]; then
    	sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    	sudo apt install ./google-chrome-stable_current_amd64.deb
     elif [[ $entry == 'edge' ]]; then
    	wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    	sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main"
    	sudo apt install microsoft-edge-stable
    	sudo apt update
    elif [[ $entry == 'brave' ]]; then
    	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    	sudo apt update
    	sudo yes yes | apt -y install brave-browser
     elif [[ $entry == 'java' ]]; then
    	sudo yes | apt -y --force-yes install openjdk-17-jdk
    	sudo apt update
    elif [[ $entry == 'maven' ]]; then
    	sudo apt update
    	sudo yes | apt -y --force-yes install maven
    elif [[ $entry == 'vlc player' ]]; then
    	sudo add-apt-repository ppa:videolan/master-daily
    	sudo apt update
    	sudo apt-get -y --force-yes install vlc qtwayland5
    elif [[ $entry == 'Inkscape' ]]; then
    	sudo add-apt-repository ppa:inkscape.dev/stable
    	sudo apt-get update
    	yes "" | apt-get -y install inkscape
    elif [[ $entry == 'SimpleScreenRecorder' ]]; then
    	sudo add-apt-repository ppa:marten-baert/simplescreenrecorder
    	sudo apt-get update
    	sudo apt-get install simplescreenrecorder
    elif [[ $entry == 'WPS Office' ]]; then
    	sudo apt install snap
    	sudo apt-get update
    	sudo snap install wps-office
    	sudo snap connect wps-office:removable-media
    	sudo snap install wps-office-multilang
    elif [[ $entry == 'Shutter' ]]; then
    	sudo add-apt-repository ppa:linuxuprising/shutter
    	sudo apt update
    	yes yes | sudo apt -y install shutter
    elif [[ $entry == 'Notepadqq' ]]; then
    	sudo add-apt-repository ppa:notepadqq-team/notepadqq
    	sudo apt-get update
    	yes yes | sudo apt-get -y install notepadqq  
    elif [[ $entry == 'Whatever' ]]; then
    	wget https://liquidtelecom.dl.sourceforge.net/project/whatever-evernote-client/v1.0.0/Whatever_1.0.0_amd64.deb
    	sudo dpkg -i Whatever_1.0.0_amd64.deb
    	sudo apt update && sudo apt upgrade
    elif [[ $entry == 'KDE Connect' ]]; then
    	sudo add-apt-repository ppa:webupd8team/indicator-kedeconnect
    	sudo apt-get update
    	sudo apt-get install kdeconnect indicator-kdeconnect
    elif [[ $entry == 'Sublime Text' ]]; then
    	sudo apt install apt-transport-https ca-certificates curl software-properties-common
    	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    	sudo apt-get update
    	sudo apt-get install sublime-text
    elif [[ $entry == 'NitroShare' ]]; then
    	sudo apt-add-repository ppa:george-edison55/nitroshare
    	sudo apt-get update
    	sudo apt-get install nitroshare
    elif [[ $entry == 'Shortwave' ]]; then
    	sudo apt-get install shortwave
    elif [[ $entry == 'visual studio code' ]]; then
    	sudo snap install code --classic
    elif [[ $entry == 'nano' ]]; then
    	sudo apt install nano
    elif [[ $entry == 'eclipse' ]]; then
    	sudo apt install snap
    	sudo snap install --classic eclipse
    elif [[ $entry == 'spring-tools-suite' ]]; then
    	cd ~/Downloads
    	wget https://download.springsource.com/release/STS/3.9.18.RELEASE/dist/e4.21/spring-tool-suite-3.9.18.RELEASE-e4.21.0-linux-gtk-x86_64.tar.gz
    	tar -xvf spring-tool-suite-3.9.18.RELEASE-e4.21.0-linux-gtk-x86_64.tar.gz
    	sudo mv sts-bundle /opt/
    	echo "sudo nano /usr/share/applications/sts-launch.desktop"
    elif [[ $entry == 'netbeans' ]]; then
    	sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu focal universe"
    	sudo apt update
    	yes yes | sudo apt -y install netbeans
    elif [[ $entry == 'idea' ]]; then
    	sudo apt install ubuntu-make
    	umake ide idea
    elif [[ $entry == 'webstorm' ]]; then
    	sudo apt install snapd
    	sudo snap install webstorm --classic
    elif [[ $entry == 'atom' ]]; then
     	wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
    	sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
    	sudo apt install atom
    elif [[ $entry == 'dbeaver' ]]; then
     	wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | apt-key add -
    	echo "deb https://dbeaver.io/debs/dbeaver-ce /" | tee /etc/apt/sources.list.d/dbeaver.list
    	apt-get update -y
    	apt-get install dbeaver-ce -y
    elif [[ $entry == 'aws cli' ]]; then
     	sudo apt update
    	sudo apt install -y awscli
    elif [[ $entry == 'docker' ]]; then
    	sudo apt-get install -y cloud-utils apt-transport-https ca-certificates curl software-properties-common
     	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    	sudo apt-get update
    	sudo apt-get install -y docker-ce
    	usermod -aG docker ubuntu
    	curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
    elif [[ $entry == 'helm' ]]; then
     	curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
    	helm version --short
    	helm repo add stable https://charts.helm.sh/stable/
	helm repo update
    elif [[ $entry == 'file zilla' ]]; then
    	sudo apt update
	sudo apt-get install filezilla
    elif [[ $entry == 'nodejs' ]]; then
    	echo "curl https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -"
    	echo sudo apt-add-repository "deb https://deb.nodesource.com/node_7.x $(lsb_release -sc) main"
    	echo "sudo apt-get update"
    	echo "sudo apt-get install nodejs"
    fi
    
done













