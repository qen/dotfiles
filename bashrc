
export EDITOR='nvim'

# docker rmi $(docker images -a | grep none | awk '{print $3}')
# docker rm $(docker ps -a -f status=exited -q)
# docker volume rm $(docker volume ls -qf dangling=true)
# docker run --rm -v /:/moby alpine sh -c "df -h && df -hi"
# docker ps --filter status=dead --filter status=exited -aq | xargs docker rm
# docker system info
# docker system df

# https://github.com/junegunn/fzf#tips
# ag wildcard ignore is defined in ~/.agignore
export FZF_DEFAULT_COMMAND="ag -g ''"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias ll='ls -alhG'
alias vim='nvim'
alias vimf='nvim +Files'
alias nvimf='nvim +Files'
alias svim='VIMSLIM="yes" nvim'

# prompt
# export PS1="\[\033[1;33m\]\W\[\033[0m\] \$ "

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS='1'
source ~/.bash-colors.sh
source ~/.bash-git-prompt.sh

export PS1="\[$bldylw\]\W\[$txtcyn\]$(__git_ps1 " (%s)")\[$txtrst\] \$ "
export SUDO_PS1="\[$txtred\]\u@\h\[$txtrst\] \[$bldylw\]\w \[$txtrst\]\$ "
PROMPT_COMMAND='__git_ps1 "\[$bldylw\]\W\[$txtrst\]" " \\\$ " "(%s) "'

