#!/usr/bin/env bash

if which brew >/dev/null; then
    echo Homebrew Exists moving on
    brew install caskroom/cask/brew-cask

else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask
fi

if which vboxmanage >/dev/null; then
	echo Virtual Box exists
else
	echo Virtual box does not exist Installing via brew Cask
	brew cask install virtualbox
fi

if which vagrant >/dev/null; then
	echo installing vagrant plugins
	vagrant plugin install vagrant-share
	vagrant plugin install vagrant-hostsupdater
	vagrant plugin install vagrant-host-shell
	vagrant plugin install vagrant-triggers
else
	brew cask install vagrant
	vagrant plugin install vagrant-share
	vagrant plugin install vagrant-hostsupdater
	vagrant plugin install vagrant-host-shell
	vagrant plugin install vagrant-triggers
fi


if which ansible >/dev/null; then
	echo -e Ansible exists moving on
else
	echo installing ansible
	brew install ansible
fi

if which npm >/dev/null; then
	echo installing gulp
	npm install -g gulp
else
	echo installing node and npm and gulp
	brew install node npm
	npm install -g gulp
fi

if which dnsmasq >/dev/null; then
	sudo mkdir /usr/local/etc
	sudo touch /usr/local/etc/dnsmasq.conf
	sudo echo 'address=/.dev.usterix.tech/10.100.20.38' > /usr/local/etc/dnsmasq.conf
	sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
	sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
	sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
	sudo mkdir /etc/resolver
	sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
	sudo dscacheutil -flushcache;
	sudo killall -HUP mDNSResponder;
else
	brew install dnsmasq
	sudo mkdir /usr/local/etc
	sudo touch /usr/local/etc/dnsmasq.conf
	sudo echo 'address=/.dev.usterix.tech/10.100.20.38' > /usr/local/etc/dnsmasq.conf
	sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
	sudo chown root /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
	sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
	sudo mkdir /etc/resolver
	sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'
	sudo dscacheutil -flushcache;
	sudo killall -HUP mDNSResponder;
fi