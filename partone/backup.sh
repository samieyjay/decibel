# install rysnc

sudo apt-get install rsync

# create test files to backup and sync on server 1
cd ~
mkdir rsync-dir
touch rsync-dir/file{1..20}

#start sync between server 1 and 2
rsync -avrt --delete -e 'ssh -p 22' ~/rsync-dir/ ubuntu@172.31.24.202:~/downloads

# setup cronjob to scan and backup new files every 15mins /etc/crontab or crontab -e
# 15 * * * * root rsync -avrt --delete -e 'ssh -p 22' ~/rsync-dir/ ubuntu@172.31.24.202:~/downloads
