# exit
alias x "exit"

# Git
alias gst "git status --short --branch"
alias glog "git log --oneline --decorate=short --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
alias ggra "git log --graph --oneline --decorate=short --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
alias gdifff "git diff --name-only"
alias gdiffw "git diff --word-diff"

# node (JavaScript)
#nodenv init - | source
status --is-interactive; and source (nodenv init -|psub)
