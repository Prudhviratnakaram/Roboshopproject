#!/usr/bin/bash
  component=frontend
source common.sh
echo "installing the mrepos"
  curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash &>>${log}
  StatusCheck
 yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y rabbitmq-server -y &>>${log}
 StatusCheck

 echo "Enabling the service"
 systemctl enable rabbitmq-server &&  systemctl start rabbitmq-server &>>${log}
  StatusCheck
 echo "adding the user"
 rabbitmqctl add_user roboshop roboshop123 &>>${log}
 rabbitmqctl set_user_tags roboshop administrator &>>${log}
 rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"  &>>${log}
  StatusCheck