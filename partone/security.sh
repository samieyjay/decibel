# update linux distribution

sudo apt update

# install clamax

sudo apt install -y clamav

# update pattern files for better scanning performance

sudo freshclam

# download test infected file

wget http://www.eicar.org/download/eicar.com /home/ubuntu

# sudo clamscan --infected --remove --recursive /home/ubuntu
