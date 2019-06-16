#!/bin/bash

#usage
#pwd="passwd"
#cmd="scp fifi@127.0.0.1:/home/fifi/.vimrc ./"
#cmd="ssh fifi@127.0.0.1 \"cd ~; date > auto.log\""
#cmd="rsync -avP --delete-after fifi@127.0.0.1:/home/fifi/1 ./"
#func_expect "$cmd" "$pwd"
function func_expect()
{
		ExpetEnv=`which expect`
		if [ -z $ExpetEnv ];then
			echo "[WARNING]:I can't find expect! You can install it by typing:"
			echo "sudo apt install expect"
			exit 1
		fi
		$ExpetEnv -c "
		set timeout -1;
		spawn $1;
		expect {
				\"(yes/no)?\" {send \"yes\n\";expect \"assword:\";send \"$2\n\"}
				\"assword:\" {send $2\n}
				eof {exit 0;}}
		expect eof"
}

pwd="123"
cmd="scp fifi@127.0.0.1:/home/fifi/.vimrc ./"
func_expect "$cmd" "$pwd"