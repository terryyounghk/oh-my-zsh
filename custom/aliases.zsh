alias reload!='. ~/.zshrc'

################################################################################
# supporting functions
################################################################################

# list recent apps and open new instance
function fasd-app () {
  echo 'open -n ...'
  s -i $1 .app$ -e 'open -n'
}

# list recent items and open in code
function fasd-edit () {
  echo 'code ...'
  if [ "$1" = "." ] ; then
    code .
  else
    s -i $1 -e code
  fi
}

# list recent directories and open in finder
function fasd-finder () {
  echo 'open in finder ...'
  d -i $1 -e 'open'
}

function fasd-cd () {
  echo 'cd to directory ...'
  fasd_cd -d -i $1
}

################################################################################
# These are my lazy aliases from a to z
# My muscle-memory dictates this list, and these are subject to change.
################################################################################

# [a] reserved for fasd
    #alias a='fasd -a' # files and directories

# [b]ack to previous wd
    alias b='cd -' 

# [c]leanup - recursively delete .DS_Store files
    alias c="find . -type f -name '*.DS_Store' -ls -delete"

# [d] reserved for fasd
    #alias d='fasd -d'

# [e]dit file (uses fasd, i'm not using $DOTS/bin/e that much)
    #alias e='' 

# [f] reserved for fasd
    #alias f='fasd -f'

# [g]oogle whatever is on the clipboard
    alias g='google "\"`pbpaste`\""'

# [h]ome
    alias h='cd ~' 

# [i]p address
    alias i='myip'

# [j]ump to directory in finder using fasd
    #alias j=''

# [k] Quic[k]-loo[k] a file (requires oh-my-zsh-osx plugin)
    alias k='quick-look'

# [l]s : the one I most frequently use
    alias l='ls -al'

# [m]ou
    alias m='open -n /Applications/mou.app'

# [n]ew instance of app
    #alias n=''

# [o]pen current directory in finder
    alias o='open .'

# [p]review man (requires oh-my-zsh osx plugin)
    alias p='man-preview'

# [q]uit terminal
    alias q='exit' 

# [r]epo directory (bare)
    alias r='cd ~/repo'

# [s] reserved for fasd
    #alias s='fasd -si'

# [t]re -L . Requires $DOTS/bin/tre. Usage: t 1, t 2, t 3...
    alias t='tre -L'

# [u]ltimateVideoConverter
    alias u='open -n /Applications/videoconverterultimate.app'

# [v]lc
    alias v='open -n /Applications/vlc.app'

# [w]orking directory
    alias w='cd ~/wd' 

# [x] killall (because typing 4 Ls drives me nuts)
    alias x='killall'

# [y]
    alias y='google'

# [z] reserved for fasd
    #alias z='fasd_cd -d'


################################################################################
# Quick jump to working directories
################################################################################

alias cr='cd ~/cr' # code review
alias wd='cd ~/wd' # working directory


################################################################################
# My other aliases
################################################################################

alias cls='clear' # Good 'ol Clear Screen command

alias fid='fasd -i -d' # just to find and list directories
alias fap='fasd-app'
alias fd='fasd-cd'
alias fed='fasd-edit'
alias finder='fasd-finder'

alias st='snyk test'
alias sm='snyk monitor'

alias tn='ts-node'
alias tsnode='ts-node'
