# dotfiles

## Neovim Configuration
Install vim-plug from command line.

### Linux / Mac (bash)
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Windows (PowerShell)
```sh
md ~\AppData\Local\nvim\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)
```

### Install Plugins
Run `nvim` and execute  command `:PlugInstall` .

## Vim Configuration
Install vim-plug from command line.

### Linux / Mac (bash)
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Windows (PoserShell)
```sh
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
```

### Install Plugins
Run `vim` and execute  command `:PlugInstall` .

## Recommended Tools
* Font
    * [Cica](https://github.com/miiton/Cica)
    * [HackGenNerd Console](https://github.com/yuru7/HackGen)
* [alacritty](https://github.com/jwilm/alacritty)
* [tmux](https://github.com/tmux/tmux)
* [fish](https://github.com/fish-shell/fish-shell)
* [ripgrep](https://github.com/BurntSushi/ripgrep)
* [fzf](https://github.com/junegunn/fzf)
* [ghq](https://github.com/motemen/ghq)
* [fd](https://github.com/sharkdp/fd)
