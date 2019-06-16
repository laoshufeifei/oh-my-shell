#!/bin/bash

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

for p in $projs;do
	goget -u $p
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
