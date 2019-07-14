#!/bin/bash

useHttpProxy=0
if [[ $useHttpProxy == 1 ]];then
    echo "use http proxy"
    export http_proxy=socks5://127.0.0.1:1080
    export https_proxy=socks5://127.0.0.1:1080
else
    echo "use GOPROXY"
    export GO111MODULE=on
    export GOPROXY=https://goproxy.io
fi

projs="
github.com/mdempsky/gocode
github.com/uudashr/gopkgs/cmd/gopkgs
github.com/ramya-rao-a/go-outline
github.com/acroca/go-symbols
golang.org/x/tools/cmd/guru
golang.org/x/tools/cmd/gorename
github.com/go-delve/delve/cmd/dlv
github.com/stamblerre/gocode
github.com/rogpeppe/godef
github.com/sqs/goreturns
golang.org/x/lint/golint
github.com/cweill/gotests/...
github.com/fatih/gomodifytags
github.com/josharian/impl
github.com/davidrjenni/reftools/cmd/fillstruct
github.com/haya14busa/goplay/cmd/goplay
github.com/godoctor/godoctor
golang.org/x/tools/cmd/gopls
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

cd $GOPATH/src > /dev/null
for p in $projs;do
    echo go get -u -v $p
    go get -u -v $p
    echo -e "\n\n\n"
done
cd - > /dev/null


# https://github.com/Microsoft/vscode-go/issues/2024
# cp godef godef-gomod
cd $GOPATH/bin > /dev/null
if [[ ! -f gocode-gomod && ! -f gocode-gomod.exe ]];then
    if [[ -f gocode.exe ]];then
        cp gocode.exe gocode-gomod.exe
    else
        cp gocode gocode-gomod
    fi
fi
cd - > /dev/null
