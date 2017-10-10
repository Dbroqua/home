#!/bin/bash

#
#
#
#
#
#
#
#

TYPE='' # usb / sshfs
CMD=rsync
ARGS='-avz --delete --exclude /Nextcloud --exclude /.cache --exclude /.config/google-chrome-unstable --exclude /.config/google-chrome --exclude /Downloads --exclude /.thunderbird --exclude /Projects --exclude /Software --exclude /tmp --exclude /VirtualBox\ VMs'
ORIG='/home/dbroqua/'
DEST=''
HOSTNAME=`hostname`


# USB
UUID='6e3f7ae3-8fa1-43f3-88c0-a12651519ffb'
MOUNT='/mnt/backup'
DEST_USB="/mnt/backup/${HOSTNAME}/dbroqua/"
# SSHFS
DEST_SSHFS="malpartida.mousur.org:Backup/${HOSTNAME}/dbroqua/"

echo `date` > ${ORIG}/lastSync

while getopts t:h opt
do
	case $opt in
		t)
			case ${OPTARG} in
				usb)
					TYPE='usb'
					DEST=${DEST_USB}
				;;
				sshfs)
					TYPE='sshfs'
					DEST=${DEST_SSHFS}
				;;
				*)
					echo "usb / sshfs attendu"
					exit 1;
			esac
		;;
	esac
done

echo `date` > ${ORIG}/lastSync_${TYPE}

if [ "${TYPE}" != '' ] ; then
	case ${TYPE} in
		usb)
			sudo cryptsetup luksOpen /dev/sdb1 backup
			sudo mount /dev/mapper/backup ${MOUNT}
#			sudo umount ${MOUNT}
#			sudo mount /dev/disk/by-uuid/${UUID} ${MOUNT}
			echo "Go !"
			if [ $? == 0 ] ; then
				${CMD} ${ARGS} ${ORIG} ${DEST}
			fi
#			sudo umount ${MOUNT}
			sudo umount ${MOUNT}
			sudo cryptsetup luksClose backup
		;;
		sshfs)
			${CMD} ${ARGS} ${ORIG} ${DEST}

		;;
	esac
fi
