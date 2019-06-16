#!/bin/bash

installFish=1
mail="laoshufeifei@qq.com"

function installDependents()
{
    for b in $@; do
        if [[ -z `which $b` ]];then
            sudo apt install -y $b
            if [[ $? != 0 ]];then
                sudo apt update
                sudo apt install -y $b
            fi
        fi

        if [[ -z `which $b` ]];then
            echo $b had not install
            exit
        fi
    done
}

# first should install wget and python
installDependents wget python

wget https://tuna.moe/oh-my-tuna/oh-my-tuna.py -O oh-my-tuna.py
sudo python oh-my-tuna.py --global

if [[ $installFish ]];then
    sudo apt-add-repository ppa:fish-shell/release-3 
fi
sudo apt update

sudo apt install -y git cmake make gcc g++ gdb vim htop
sudo apt install -y lrzsz tig screen ccache dos2unix unzip
sudo apt install -y openssl openssh-client openssh-server libssl-dev
sudo apt install -y curl libcurl4-openssl-dev python-dev  
# sudo apt install -y automake libmad0-dev libmad0  p7zip-full libgles2-mesa-dev

# python and pip
wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py && sudo python get-pip.py
sudo python oh-my-tuna.py --global
sudo pip install -U colorama pip lxml requests beautifulsoup4 pymongo psutil

# fish
if [[ $installFish ]];then
    sudo apt-get install -y fish
fi

ssh-keygen -t rsa -C $mail -b 4096 && cat ~/.ssh/id_rsa.pub 
