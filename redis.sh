#!/usr/bin/bash
  component=redis
source common.sh
echo setup mrepo
 curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>>${log}
 StatusCheck
  dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>${log}
  dnf module enable redis:remi-6.2 -y &>>${log}
 echo install the redis &>>${log}
 yum install redis-6.2.7 -y &>>${log}
 StatusCheck
  StatusCheck
   echo "update the listeners update"
   sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf &>>${log}
   StatusCheck
 echo enabling the redis service
 systemctl enable redis &>>${log} && systemctl restart redis &>>${log}
 StatusCheck