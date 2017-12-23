#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# environment variables
export PATH=$PATH:/home/mike/.bin           # adds ~/.bin to PATH
export EDITOR=/usr/bin/vim                  # set vim as default editor
export BROWSER=/usr/bin/waterfox            # set waterfox as default browser
set -o vi                                   # set vi keybindings in terminal
export HISTCONTROL=ignoredups               # Ingore duplicates in command history
bind TAB:menu-complete                      # inline tab complete

# PS1
PS1='\[\e[0;34m\]\W\[\e[m\]\[\e[0;35m\]:\[\e[m\] \[\e[0;37m\]'                              # new PS1
# PS1='\[\e[0;35m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;35m\]->\[\e[m\] \[\e[0;37m\]'   # user
# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\] \[\e[2;37m\]'   # root


# system aliases
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias x='startx'
alias q='exit'
alias off='sudo shutdown -h now'
alias reboot='sudo reboot'
alias rebash='source /home/mike/.bashrc'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../..'
alias wifi='sudo wifi-menu -o'

# pacman aliases
alias pac='/usr/bin/pacman -S'                          # 'default action'      - install one or more packages
alias pacdu='sudo /usr/bin/pacman -Syy'                 # '[d]atabase [u]pdate' - downloads copy of the master package database
alias pacu='sudo /usr/bin/pacman -Syu'                       # '[u]pdate'            - upgrade all packages to their newest version
alias pacua='sudo /usr/bin/pacman -Syyu && cower -u'         # '[u]date + [a]ll      - updates master package database and all packages
alias pacr='sudo /usr/bin/pacman -Rns'                  # '[r]emove'            - uninstall one or more packages
alias pacs='/usr/bin/pacman -Ss'                        # '[s]earch'            - search for a package using one or more keywords
alias paci='/usr/bin/pacman -Si'                        # '[i]nfo'              - show information about a package
alias paclo='/usr/bin/pacman -Qdt'                      # '[l]ist [o]rphans'    - list all packages which are orphaned
alias pacc='sudo /usr/bin/pacman -Sc'                   # '[c]lean cache'       - delete all not currently installed package files
alias paclf='/usr/bin/pacman -Ql'                       # '[l]ist [f]iles'      - list all files installed by a given package
alias pacq='/usr/bin/pacman -Qs'                        # '[q]uery'             - search for locally installed packages
alias pacexpl='sudo /usr/bin/pacman -D --asexplicit'    # 'mark as [expl]icit'  - mark one or more packages as explicitly installed 
alias pacimpl='sudo /usr/bin/pacman -D --asdeps'        # 'mark as [impl]icit'  - mark package as non explicitly installed (dependency)

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro='sudo /usr/bin/pacman -Rns $(/usr/bin/pacman -Qqdt)'

# config files
alias brc='vim ~/.bashrc'                                   # bashrc file
alias i3c='vim /home/mike/.config/i3/config'                # ic config
alias termc='vim /home/mike/.config/termite/config'         # termite config
alias vrc='vim /home/mike/.vimrc'                           # vimrc file

# program aliases
alias rss='/usr/bin/newsboat'
