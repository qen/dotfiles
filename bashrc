
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
[ -f `brew --prefix`/etc/bash_completion ] && source `brew --prefix`/etc/bash_completion

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
alias svim='VIMSLIM="yes" nvim'

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
# GIT_PS1_SHOWUNTRACKEDFILES='1'
# GIT_PS1_DESCRIBE_STYLE='branch'
# GIT_PS1_SHOWUPSTREAM='auto'
# GIT_PS1_SHOWSTASHSTATE='true'
GIT_PS1_SHOWCOLORHINTS='true'
GIT_PS1_SHOWDIRTYSTATE='true'
source ~/.bash-colors.sh
source ~/.bash-git-prompt.sh

export SUDO_PS1="\[$txtred\]\u@\h\[$txtrst\] \[$bldylw\]\w \[$txtrst\]\$ "
export PROMPT_COMMAND='__git_ps1 "\[$bldylw\]\W\[$txtrst\]" " \\\$ " "(%s)"'
