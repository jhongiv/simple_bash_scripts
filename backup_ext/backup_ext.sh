#!/bin/bash

PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
echo $PATH
RUTA=/media/$USER/$(blkid | grep 01CBBEEA6AE1D1C0 | cut -d \" -f2 | sed -e 's/ /\\ /g')
DIR_OUT=$RUTA/DOCUMENTS_JOAN/
DIR_SYNC=/home/$USER/DOCUMENTS/
#PATHOUT=/media/$USER/$PATHOUT
BACKUP_DIR=$RUTA/.backup_sync
SUFFIX=$(date +%Y%m%d)
echo $BACKUP_DIR
#ls $PATHOUT
#pwd

echo rsync -avhb -P --backup-dir=$BACKUP_DIR --suffix=.$SUFFIX $DIR_SYNC $DIR_OUT
