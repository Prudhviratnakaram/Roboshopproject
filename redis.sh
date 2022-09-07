!/usr/bin/bash
source common.sh
component=redis
 echo "set up yum repo"
 curl -L https://raw.githubusercontent.com/roboshop-devops-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>>${log}
 StatusCheck
 rm -rf redis
 echo "install redis"
 yum install redis-6.2.7 -y &>>${log}
 StatusCheck
 echo "updating the redis listen address"
 sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf /etc/redis/redis.conf &>>${log}
 StatusCheck
 systemctl enable redis && systemctl start redis &>>${log}
 StatusCheck