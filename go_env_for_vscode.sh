#!/bin/bash

export http_proxy=socks5://127.0.0.1:1080
export https_proxy=socks5://127.0.0.1:1080

projs="
github.com/uudashr/gopkgs/cmd/gopkgs
github.com/sqs/goreturns
github.com/mdempsky/gocode
github.com/ramya-rao-a/go-outline
github.com/acroca/go-symbols
golang.org/x/tools/cmd/guru
golang.org/x/tools/cmd/gorename
github.com/rogpeppe/godef
golang.org/x/lint/golint
github.com/stamblerre/gocode
github.com/go-delve/delve/cmd/dlv
"

# check GOPATH
if [[ -z $GOPATH ]];then
    echo "GOPATH is empty"
    exit
fi

echo $GOPATH | grep ":"
if [[ $? == 0 ]];then
    GOPATH=${GOPATH//\\//}
    GOPATH=${GOPATH//:/}
    export GOPATH="/$GOPATH"
    echo $GOPATH
fi



for p in $projs;do
    echo go get -u -v $p
    go get -u -v $p
    echo -e "\n\n\n"
done



# https://github.com/Microsoft/vscode-go/issues/2024
# cp godef godef-gomod
cd $GOPATH/bin
if [[ ! -f gocode-gomod && ! -f gocode-gomod.exe ]];then
    if [[ -f gocode.exe ]];then
        cp gocode.exe gocode-gomod.exe
    else
        cp gocode gocode-gomod
    fi
fi
