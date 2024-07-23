fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"
source ~/dotfiles/zsh/external/bd.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh/scripts.sh

setopt AUTO_PARAM_SLASH
unsetopt CASE_GLOB

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

bindkey -v
export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

### Searching ###
#^t - search for a file in the current dir and sub-dir
#^r search for an entry in the command history
#ALT+c select a sub-dir to make it current dir

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi



