#! /bin/bash
rsync -avr --delete --log-file=/home/mike/rsynclogs/backupHome-$(date +%F_%R).log /run/media/mike/External /backups
rsync -avr --delete --exclude=/home/mike/VirtualBox\ VMs/ --log-file=/home/mike/rsynclogs/backupExternal-$(date +%F_%R).log /home /backups
