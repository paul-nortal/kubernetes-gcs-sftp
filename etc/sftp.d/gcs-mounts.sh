#!/bin/bash
# File mounted as: /etc/sftp.d/mount_user_directories.sh
chmod 666 /dev/fuse

runuser -l paul -c \
'export GOOGLE_APPLICATION_CREDENTIALS=/credentials/gcloud-key.json && \
gcsfuse -o nonempty --only-dir paul sftp-storage-paul /home/paul/ftp'

# runuser -l user2 -c \
# 'export GOOGLE_APPLICATION_CREDENTIALS=/credentials/gcloud-key.json && \
# gcsfuse -o nonempty --only-dir user2 bucket /home/user2/ftp'
