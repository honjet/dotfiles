# exit
alias x "exit"

# ls
alias l "exa"
alias la "exa -a"
alias ll "exa -lh"
alias lla "exa -lha"

# Git
alias gst "git status --short --branch"
alias glog "git log --oneline --decorate=short --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
alias ggra "git log --graph --oneline --decorate=short --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
alias gdifff "git diff --name-only"
alias gdiffw "git diff --word-diff"

alias untar "tar -zxvf"
alias getpass "openssl rand -base64 20"
alias sha "shasum -a 256"
