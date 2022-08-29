#!/usr/bin/bash
source common.sh
COMPONENT=frontend
echo "installing nginx"
yum install nginx -y
StatusCheck
systemctl enable nginx
systemctl start nginx
echo "Download frontend"

curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/static/* .
mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
systemctl restart nginx


