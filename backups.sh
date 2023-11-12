#!/bin/bash
#drivelink=https://driveuploader.com/upload/nySe03l157/

filename="devops_backup_$(date +%Y%m%d_%H%M%S)"

mysqldump -u mirat -p devops > $filename.sql 
rclone -v sync ~/Desktop/Devops/A2/$filename.sql googledrive:backup



echo $filename
