
#
# Set $XDG_CONFIG_HOME
#

set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config

#
# Bootstrap Fisher
# https://github.com/jorgebucaran/fisher#bootstrap-installation
#

if not functions -q fisher
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#
# Hide $GOPATH
#

set -gx GOPATH $HOME/.go

#
# Extend $PATH
#

# Go
set -pxg fish_user_paths $GOPATH/bin

# Rust
set -pxg fish_user_paths $HOME/.cargo/bin

# Yarn (Node.js)
set -pxg fish_user_paths $HOME/.yarn/bin

#
# fzf
#

set -U FZF_FIND_FILE_COMMAND "fd --type f . \$dir"

#
# exa
#

alias ls='exa'
alias ll='exa -l'
alias la='exa -la'
