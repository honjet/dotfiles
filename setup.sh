# Install essential packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y fish tmux vim neovim
sudo apt install -y openssl build-essential libssl-dev libffi-dev libncurses5-dev zlib1g zlib1g-dev bzip2

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Rust for programming
rustup toolchain add stable nightly 1.42.0
rustup +nightly component add rust-analyzer-preview rust-src
fish_add_path ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin

# Install anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
~/.anyenv/bin/anyenv init
anyenv install goenv
anyenv install rbenv
anyenv install pyenv
anyenv install nodenv

# Install Go
goenv install x.xx.x
go install github.com/x-motemen/ghq@latest
go install github.com/junegunn/fzf@latest
goenv rehash

# Install Python
pyenv install x.xx.x
pyenv global x.xx.x
pip install pynvim

# Install Ruby
rbenv install x.xx.x
rbenv global x.xx.x
gem install neovim

# Install Javascript
nodenv install x.xx.x
nodenv global x.xx.x
npm install neovim

# Install tools
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install fisherman/fzf
fisher install decors/fish-ghq
cargo install ripgrep exa fd-find sd topgrade procs grex xsv csview broot hexyl tokei monolith
