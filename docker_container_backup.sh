#!/bin/bash
BACKUP_DIR='backup_docker/'
echo "Please enter container id:"
read CONTAINER_ID
docker stop $CONTAINER_ID
docker commit -p "${CONTAINER_ID}" "${CONTAINER_ID}_backup"
docker save -o "/home/majid/backup_doc/${CONTAINER_ID}.tar" "${CONTAINER_ID}_backup"
OUT=`docker inspect -f '{{ json .Mounts }}' $CONTAINER_ID | awk -F"," '{ print $2}' | tr -d '[",:]' | sed 's/Source//'`
cp -r $OUT $BACKUP_DIR
