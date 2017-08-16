
export EDITOR='vim'

# https://github.com/junegunn/fzf#tips
# export FZF_DEFAULT_COMMAND="ag  -g '' --yaml --html --ruby --php --xml --wsdl --wadl --swift --sql --shell --scala --sass --rake --python --perl --markdown --js --css"
# ag wildcard ignore is defined in ~/.agignore
export FZF_DEFAULT_COMMAND="ag  -g ''"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias ll='ls -alhG'
alias vim='vim'
alias vimf='vim +Files'
alias nvimf='nvim +Files'
