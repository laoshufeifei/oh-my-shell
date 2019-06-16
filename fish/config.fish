set PATH $PATH ~/projs/bin
set PYTHONPATH $PYTHONPATH ~/projs/bin

alias l="ls -lh"
alias ll="ls -alh"
alias lll="git status"

alias up="bash ~/projs/0update.sh"
alias ng="python ~/projs/bin/ncgit"
alias gg="python ~/projs/bin/ncgit pull -p; bash ~/projs/0update.sh -d"
alias mbmake="python ~/projs/bin/mbmake"

alias apt="sudo apt"
alias docker="sudo docker"

if test -f ~/.autojump/share/autojump/autojump.fish; . ~/.autojump/share/autojump/autojump.fish; end
