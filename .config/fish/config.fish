# exit
alias ee "exit"

# ls
alias l "exa"
alias la "exa -a"
alias ll "exa -lh"
alias lal "exa -lha"

# Git
alias gst "git status --short --branch"
alias glog "git log --oneline --date=short --decorate=short --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
alias ggra "git log --graph --oneline --date=short --decorate=short --pretty=format:'%Cgreen%h %C(yellow)%cd %Cred%d %Creset%s %Cblue<%cn>'"
alias gdifff "git diff --name-only"
alias gdiffw "git diff --word-diff"

# function gcob -d "Fuzzy-find and checkout a branch"
#   git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
# end

function gcoc -d "Fuzzy-find and checkout a commit"
  git log --pretty=oneline --abbrev-commit --reverse | fzf --tac +s -e | awk '{print $1;}' | read -l result; and git checkout "$result"
end
