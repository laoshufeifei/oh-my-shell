#!/bin/bash

read -p "install fish? 1/0 > "
installFish=$REPLY
if [[ $installFish == 1 ]];then
    echo "will install fish"
else
    echo "will not install fish"
fi

if [[ ! -f ~/.gitconfig ]];then
    read -p "input your name for git config > "
    name=$REPLY

    read -p "input your mail for git config > "
    mail=$REPLY
    echo "name is $name"
    echo "mail is $mail"
fi

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

if [[ $installFish == 1 ]];then
    sudo apt-add-repository ppa:fish-shell/release-3 
fi
sudo apt update

sudo apt install -y git cmake make gcc g++ gdb vim htop
sudo apt install -y lrzsz tig screen ccache dos2unix unzip zlib1g-dev 
sudo apt install -y openssl openssh-client openssh-server libssl-dev
sudo apt install -y curl libcurl4-openssl-dev python-dev
sudo apt install -y automake libmad0-dev libmad0 p7zip-full libgles2-mesa-dev

# python and pip
wget https://bootstrap.pypa.io/get-pip.py -O get-pip.py && sudo python get-pip.py
sudo pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
sudo pip install -U colorama pip lxml requests beautifulsoup4 pymongo psutil

# fish
if [[ $installFish == 1 ]];then
    sudo apt-get install -y fish
fi

if [[ ! -f ~/.gitconfig ]];then
    git config --global user.name $name
    git config --global user.email $mail
fi
if [[ ! -f ~/.ssh/id_rsa.pub ]];then
    ssh-keygen -t rsa -C $mail -b 4096 && cat ~/.ssh/id_rsa.pub 
fi
