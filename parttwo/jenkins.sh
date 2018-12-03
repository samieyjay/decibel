# Add the repository key to the system
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt-get update

# Install Jenkins and its dependencies
sudo apt-get install jenkins

# Start Jenkins
sudo systemctl start jenkins

# Open port 8080 for Jenkins
sudo ufw allow 8080
