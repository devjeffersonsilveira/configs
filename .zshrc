if [ ! -d $HOME/.configus ]; then
    mkdir -p $HOME/.configus
    curl https://raw.githubusercontent.com/jalxes/configs/master/.configus/aliases.zsh -o ~/.configus/aliases.zsh
    curl https://raw.githubusercontent.com/jalxes/configs/master/.configus/functions.zsh -o ~/.configus/functions.zsh
fi
if [ ! -f $HOME/.configus/.zsh_plugins/antigen.zsh ]; then
    if [ ! -d $HOME/.configus/.zsh_plugins ]; then
        mkdir -p $HOME/.configus/.zsh_plugins
    fi
    curl -L git.io/antigen >$HOME/.configus/.zsh_plugins/antigen.zsh
fi

export PATH=~/.configus/bin:$PATH
export FZF_BASE=$(which fzf)
export PATH=~/.local/bin:$PATH

# if [ ! -d $HOME/.npm-global ]; then
#     mkdir -p $HOME/.npm-global
# fi
# npm config set prefix '~/.npm-global'
# export PATH=~/.npm-global/bin:$PATH

# eval $(go env)
# export PATH=$GOPATH/bin:$PATH

# export PATH=~/.config/composer/vendor/bin:$PATH
# export PATH=~/.gem/ruby/2.5.0/bin:$PATH

source $HOME/.configus/aliases.zsh
source $HOME/.configus/functions.zsh
source $HOME/.configus/.zsh_plugins/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle fzf
antigen bundle command-not-found

# Node Plugins
# antigen bundle npm
# antigen bundle yarn

# Python Plugins
#  antigen bundle pip
#  antigen bundle python
#  antigen bundle virtualenv

function git_prompt_info() {
   # nop
}
function parse_git_dirty() {
   # nop
}
function git_prompt_status() {
   # nop
}

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

#antigen bundle "greymd/docker-zsh-completion"
# Load the theme.
antigen theme wezm+

# Tell Antigen that you're done.
antigen apply

PROMPT='%T '$PROMPT

