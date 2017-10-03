if [ ! -d $HOME/.configus ]; then
    mkdir -p $HOME/.configus
fi
if [ ! -f $HOME/.configus/.zsh_plugins/antigen.zsh ]; then
    if [ ! -d $HOME/.configus/.zsh_plugins ]; then
        mkdir -p $HOME/.configus/.zsh_plugins
    fi
    curl -L git.io/antigen > $HOME/.configus/.zsh_plugins/antigen.zsh
fi

source $HOME/.configus/aliases.zsh
source $HOME/.configus/functions.zsh
source $HOME/.configus/.zsh_plugins/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle lein
antigen bundle command-not-found

# Node Plugins
antigen bundle coffee
antigen bundle node
antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle python
antigen bundle virtualenv


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle "greymd/docker-zsh-completion"
# Load the theme.
antigen theme wezm+

# Tell Antigen that you're done.
antigen apply
