sudo apt-get update

# Download and add the signing key
$ curl -o nginx_signing.key http://nginx.org/keys/nginx_signing.key
$ sudo apt-key add nginx_signing.key

## Add official NGINX repository to /etc/apt/sources.list
echo "## Add official NGINX repository" >> /etc/apt/sources.list
echo "deb http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list
echo "deb-src http://nginx.org/packages/ubuntu/ xenial nginx" >> /etc/apt/sources.list

# Install Nginx
sudo apt-get update
sudo apt-get install -y nginx

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Allow HTTP and HTTPS connections
# sudo ufw allow 'Nginx FULL'

# list available application configuration
# sudo ufw app list

# enable firewall if ufw returns inactive
# sudo ufw enable
