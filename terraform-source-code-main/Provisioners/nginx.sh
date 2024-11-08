#!/bin/bash

# Update package lists
sudo yum update

# Install
 Nginx
sudo yum install -y nginx

# Start Nginx service
sudo systemctl start nginx

# Enable Nginx to start on system boot
sudo systemctl enable nginx