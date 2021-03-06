# Set paths
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# Set default editor /usr/bin/nano
export EDITOR=code

# Set default blocksize for ls, df, du
export BLOCKSIZE=1k

alias f='open -a Finder ./'
alias ~="cd ~"
alias c='clear'
alias cl='clear; ls'
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'  
alias numFiles='echo $(ls -1 | wc -l)' 
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
alias comms='cat ~/.bash_profile | grep "()";alias'
alias update='sudo softwareupdate -i -a'    

# Public facing IP Address
alias myip='curl ip.appspot.com'  

# Show all open TCP/IP sockets                  
alias netCons='lsof -i'        

# Flush out the DNS Cache                     
alias flushDNS='dscacheutil -flushcache'     

# Display open sockets       
alias lsock='sudo /usr/sbin/lsof -i -P'    

# Display only open UDP sockets      
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'  

# Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'  

# Get info on connections for en0
alias ipInfo0='ipconfig getpacket en0'        

# Get info on connections for en1
alias ipInfo1='ipconfig getpacket en1'      

# All listening connections   
alias openPorts='sudo lsof -i | grep LISTEN'    

# All ipfw rules inc/ blocked IPs    
alias showBlocked='sudo ipfw list'                  

# Quickly search for file
alias qfind="find . -name " 

# Zip folder
zipf () { zip -r "$1".zip "$1" ; }     

# Extract most know archives with one command
extract () {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}

# Find file under the current directory                
ff () { /usr/bin/find . -name "$@" ; }     

# Find file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }  

# Find file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  

# Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }

# Display useful host related informaton
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    echo
}

# Git aware prompt setup https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
 
# Git completion https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
bind 'set completion-ignore-case on'
source ~/.git-completion.bash
 
# Git aware prompt
export PS1="\[$bldred\][\[$txtylw\]\u\[$txtred\]@\[$txtylw\]\w\[$txtred\]] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtwht\]\\$ "

# Bash git completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"