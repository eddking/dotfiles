. ~/.zprezto/runcoms/zshrc

unsetopt correct_all
unsetopt share_history
setopt inc_append_history

#rm gets aliased with the -i option somewhere. stop that
unalias rm
alias rm='nocorrect rm'

# Custom Aliases
. ~/.aliases
. ~/.functions

# props to @matthewfranglen, the mad bastard
function vim-ctrlp () {
  BUFFER='vim +:CtrlP'
  zle accept-line
}
zle -N                vim-ctrlp
bindkey -M viins '^P' vim-ctrlp
bindkey -M viins 'kj' vi-cmd-mode
bindkey '^[accept-completion' autosuggest-accept
source ~/.iterm2_shell_integration.zsh
