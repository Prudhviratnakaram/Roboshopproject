#!/usr/bin/bash
  component=frontend
source common.sh
echp "installing nginx"
 yum install nginx -y
 StatusCheck

Download
echo Clean the old content
 cd /usr/share/nginx/html && rm -rf *
 StatusCheck
 echo Extract the Download content
 unzip -o /tmp/frontend.zip &>>${log}&& mv frontend-main/static/* . &>>{log}&& mv frontend-main/localhost.conf /etc/nginx/default.d/roboshop.conf &>>{log}
 StatusCheck
 echo starting nginx
  systemctl enable nginx &>>{log}&& systemctl start nginx &>>{log}&& systemctl restart nginx &>>{log}



