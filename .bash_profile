complete -G '*.sh' sh

# Get the Git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Make Git branch a variable
branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

# Custom bash prompt
#
# Includes custom character for the prompt, path, and Git branch name.
#
# Source: kirsle.net/wizards/ps1.html
export PS1="\n\[$(tput bold)\]\[$(tput setaf 5)\]➜ \[$(tput setaf 6)\]\w\[$(tput setaf 3)\]\$(parse_git_branch) \[$(tput sgr0)\]"

export PATH=/opt/local/bin:/opt/local/sbin:${PATH}
#export PYTHONPATH=/Users/client/dev/github/someproject:$PYTHONPATH
export PATH=~/.local/bin:$PATH
export AWS_ACCESS_KEY_ID=YOURAKHERE
export AWS_SECRET_ACCESS_KEY=YOURSAKHERE
# Aliases

## Shortcuts
alias ll='ls -al'
alias editgit='code ~/.gitconfig'
alias editbash='code ~/.bash_profile'
alias resource='source ~/.bash_profile && echo "Done!"'

## Git commands
alias log='git log'
alias wut='git log master...${branch} --oneline'
alias diff='git diff'
alias branch='git branch'
alias st='git status'
alias fetch='git fetch'
alias push='git push origin head'
alias pull='git pull'
alias fp='fetch && pull'
alias gmm='git merge master'
alias recent='git for-each-ref --sort=-committerdate refs/heads/'
alias branch_new="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"

alias k='kubectl'

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# added by Anaconda3 5.0.0 installer
#export PATH="/Users/client/anaconda3/bin:$PATH"
export EDITOR="emacs"
