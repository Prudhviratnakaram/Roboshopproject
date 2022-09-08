#!/usr/bin/bash
  component=redis
source common.sh
echo setup mrepo
 curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>>${log}
 StatusCheck
 echo install the redis
 yum install redis-6.2.7 -y
 StatusCheck
 echo enabling the redis service
 systemctl enable redis &>>${log} && systemctl start redis &>>${log}
 StatusCheck