# Setup My Development Environment / Dotfiles

My dotfiles at Galois. They are intended to be deployed
on Mac OS X 10.6+ or Debian/Fedora Linux.

Note: deploy.sh is outdated. Don't use it.

## Misc install related commands

    mkdir -p ~/git && cd ~/git
    git clone git@github.com:benjaminfjones/dotfiles-galois.git
    git clone https://github.com/benjaminfjones/vim-config ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    git clone https://github.com/benjaminfjones/zsh-config ~/.zsh
    ln -s ~/.zsh/zshrc ~/.zshrc
    git clone https://github.com/benjaminfjones/oh-my-zsh ~/.oh-my-zsh
    cd ~/.oh-my-zsh
    
    cd ~/.vim; zsh boot.sh

    rm -rf ~/.ssh && scp -r [key_host]:keys/ssh ~/.ssh
