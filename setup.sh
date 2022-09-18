# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages
brew install tmux git fish vim neovim asdf fisher ghq fzf

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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

# Install tools
fisher install fisherman/fzf
fisher install decors/fish-ghq

# Install tools written by Rust
cargo install ripgrep exa fd-find sd topgrade procs grex xsv csview broot hexyl tokei monolith
