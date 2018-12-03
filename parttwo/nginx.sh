# Update our local package index
sudo apt-get update

# Install Nginx
sudo apt-get install -y nginx

# Allow HTTP and HTTPS connections
sudo ufw allow 'Nginx FULL'

# list available application configuration
# sudo ufw app list

# enable firewall if ufw returns inactive
sudo ufw enable
