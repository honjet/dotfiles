# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install packages
brew install tmux git fish vim neovim asdf ghq fzf fisher
brwe install ripgrep ripgrep-all exa bat fd sd procs grex topgrade

# Install tools
fisher install fisherman/fzf
fisher install decors/fish-ghq

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# source "$HOME/.cargo/env"

# Install tools written by Rust
# cargo install ripgrep exa fd-find sd topgrade procs grex
# cargo install xsv csview tv-cli broot hexyl tokei monolith

# Rust for programming
# rustup toolchain add stable nightly 1.42.0
# rustup +nightly component add rust-analyzer-preview rust-src
# fish_add_path ~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin

# Install Python
# asdf plugin add python
# asdf install python latest
# asdf global python latest

# Install Ruby
# asdf plugin add ruby
# asdf install ruby latest
# asdf global ruby latest

# Install Javascript
# asdf plugin add nodejs
# asdf install nodejs latest
# asdf global nodejs latest

