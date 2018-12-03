# install Jenkins with Docker - Allow port 8080 on AWS SG

# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
    
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
# Update the apt package index
sudo apt-get update

# Install the latest version of Docker CE
sudo apt-get install -y docker-ce

#Install Jenkins - map port 8080 and 50000
sudo docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts
