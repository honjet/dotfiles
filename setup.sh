# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install packages
# TODO: add docker
brew install tmux git fish vim neovim asdf ghq fzf fisher
brew install ripgrep ripgrep-all exa bat fd sd procs grex topgrade

# Install fish tools
# fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fish -c "fisher install jorgebucaran/fisher"
fish -c "fisher install fisherman/fzf"
fish -c "fisher install decors/fish-ghq"

# configure asdf
echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.profile
. $(brew --prefix asdf)/libexec/asdf.sh

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
asdf plugin add python
asdf install python latest
asdf global python latest

# Install Ruby
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest

# Install Javascript
asdf plugin add nodejs
asdf install nodejs latest
asdf global nodejs latest

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install neovim package
pip3 install pynvim
gem install neovim
npm install -g neovim

# Place config files
mkdir -p ~/.config/fish/functions
mkdir -p ~/.config/nvim
curl https://raw.githubusercontent.com/honjet/dotfiles/master/.tmux.conf > ~/.tmux.conf
curl https://raw.githubusercontent.com/honjet/dotfiles/master/.vimrc > ~/.vimrc
curl https://raw.githubusercontent.com/honjet/dotfiles/master/.config/fish/config.fish > ~/.config/fish/config.fish
curl https://raw.githubusercontent.com/honjet/dotfiles/master/.config/fish/config.fish > ~/.config/fish/functions/fish_prompt.fish
curl https://raw.githubusercontent.com/honjet/dotfiles/master/.config/nvim/init.vim > ~/.config/nvim/init.vim

echo 'Please restart shell.'
