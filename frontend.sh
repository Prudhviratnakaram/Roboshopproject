#!/usr/bin/bash
source common.sh
component=frontend
echo "installing nginx"
yum install nginx -y
StatusCheck
systemctl enable nginx
systemctl start nginx
Download
echo "Cleaning the old content"
cd /usr/share/nginx/html && rm -rf *
StatusCheck
echo "Download the extracted content"
unzip /tmp/frontend.zip &>>${log}
mv frontend-main/static/* . && mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf
StatusCheck
echo "start nginx"
systemctl restart nginx &>>${log}



