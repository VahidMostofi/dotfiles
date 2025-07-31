# set vi mode for terminal
set -o vi

export PATH="$HOME/bin:$PATH";

for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug start --------------------------------------------------
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-autosuggestions", as:plugin, defer:2

zplug load
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# zplug finish ------------------------------------------------
#
plugins=(git z colored-man-pages kubectl)

source $ZSH/oh-my-zsh.sh

export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/vahid/.asdf/bin:/Library/Apple/usr/bin:/Users/vahid/.fig/bin:/Users/vahid/.local/bin:/Users/vahid/.asdf/bin

. "$HOME/.asdf/asdf.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/vahid/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/vahid/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/vahid/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/vahid/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/vahid/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/vahid/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/vahid/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/vahid/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

set -o vi

export PATH="$PATH:/Users/vahid/dev/flutter/bin"

source ~/keys.sh

source ~/.env.secrets

eval "$(direnv hook zsh)"


# Added by Amplify CLI binary installer
export PATH="/opt/homebrew/opt/openssl@1.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@1.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.0/lib/pkgconfig"

# GO
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Starship
eval "$(starship init zsh)"

eval "$(rbenv init - zsh)"


