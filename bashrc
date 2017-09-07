
export EDITOR='nvim'

# docker volume rm $(docker volume ls -qf dangling=true)
# docker run --rm -v /:/moby alpine sh -c "df -h && df -hi"
# docker ps --filter status=dead --filter status=exited -aq | xargs docker rm
# docker system info
# docker system df

# https://github.com/junegunn/fzf#tips
# export FZF_DEFAULT_COMMAND="ag  -g '' --yaml --html --ruby --php --xml --wsdl --wadl --swift --sql --shell --scala --sass --rake --python --perl --markdown --js --css"
# ag wildcard ignore is defined in ~/.agignore
export FZF_DEFAULT_COMMAND="ag -g ''"
# export FZF_DEFAULT_COMMAND="ag -g '' --path-to-ignore ${pwd}/.ignore"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias ll='ls -alhG'
alias vim='nvim'
alias vimf='nvim +Files'
alias nvimf='nvim +Files'
alias svim='VIMSLIM="yes" nvim'

# prompt
export PS1="\[\033[1;33m\]\W\[\033[0m\] \$ "
