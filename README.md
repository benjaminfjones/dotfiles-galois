# Setup My Development Environment / Dotfiles

My dotfiles at Galois. They are intended to be deployed
on Mac OS X 10.6+ or Debian/Fedora Linux. Use the deploy.sh
script to symlink dotfiles to their correct places.

## Misc install related commands

    mkdir -p ~/git && cd ~/git
    git clone git@github.com:benjaminfjones/dotfiles-galois.git
    ./deploy.sh

    git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle

    rm -rf ~/.ssh && scp -r [key_host]:keys/ssh ~/.ssh
