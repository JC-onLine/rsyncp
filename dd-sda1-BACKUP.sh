#!/bin/bash
#sudo time dd if=/dev/sda5 of=/media/user/BACKUP/sda5-SYSTEM/sda5-debian-2019-11-02.img bs=4096 status=progress
sudo time dd if=/dev/sda1 of=/media/xubuntu/Data/jc/BACKUP/sda1-SYSTEM/$1 bs=4096 status=progress

