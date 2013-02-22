# To be placed in /etc/profile or ~/.bash_profile

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


