#! /bin/bash
rsync -avr --delete /run/media/mike/External /backups
rsync -avr --delete --exclude=/home/mike/VirtualBox\ VMs/ /home /backups