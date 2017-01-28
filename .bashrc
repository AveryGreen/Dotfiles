#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# environment variables
#export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'leafpad'; else echo 'nano'; fi)"		# leafpad, nano

PS1='\[\e[0;35m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;35m\]->\[\e[m\] \[\e[0;37m\]'		# user
# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\] \[\e[2;37m\]'	# root
# PS1='\u \W $ '										# default

# Ingore duplicates in command history
export HISTCONTROL=ignoredups

# System aliases
alias ls="ls --color=auto"
alias la="ls -la"
alias x="startx"
alias q="exit"
alias off="sudo shutdown -h now"
alias reboot="sudo reboot"
alias s="sudo"
alias rebash="source /home/mike/.bashrc"

# pacman aliases
alias pac="sudo /usr/bin/pacman -S"			# default action	- install one or more packages
alias pacdu="sudo /usr/bin/pacman -Syy"			# '[d]atabase [u]pdate'	- downloads copy of the master package database
alias pacu="sudo /usr/bin/pacman -Syu"			# '[u]pdate'		- upgrade all packages to their newest version
alias pacr="sudo /usr/bin/pacman -Rns"			# '[r]emove'		- uninstall one or more packages
alias pacs="/usr/bin/pacman -Ss"			# '[s]earch'		- search for a package using one or more keywords
alias paci="/usr/bin/pacman -Si"			# '[i]nfo'		- show information about a package
alias paclo="/usr/bin/pacman -Qdt"			# '[l]ist [o]rphans'	- list all packages which are orphaned
alias pacc="sudo /usr/bin/pacman -Scc"			# '[c]lean cache'	- delete all not currently installed package files
alias paclf="/usr/bin/pacman -Ql"			# '[l]ist [f]iles'	- list all files installed by a given package
# alias pacexpl='sudo /usr/bin/pacman -D --asexp'	# 'mark as [expl]icit'	- mark one or more packages as explicitly installed 
# alias pacimpl='sudo /usr/bin/pacman -D --asdep'	# 'mark as [impl]icit'	- mark one or more packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="sudo /usr/bin/pacman -Rns $(/usr/bin/pacman -Qqdt)"

# config files
alias brc="vim ~/.bashrc"					# bashrc file
alias i3c="vim /home/mike/.config/i3/config"			# ic config
alias termc='leafpad /home/mike/.config/termite/config'	# termite config

screenfetch
