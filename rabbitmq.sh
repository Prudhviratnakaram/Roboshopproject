component=rabbitmq
source common.sh

if [ -z "$user" ];then
  echo "dont proceed"
  exit 1
fi
echo "yum setup"
 yum install https://github.com/rabbitmq/erlang-rpm/releases/download/v23.2.6/erlang-23.2.6-1.el7.x86_64.rpm -y &>>{log}
 curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash &>>{log}
 StatusCheck
 echo "installing yum"
 yum install rabbitmq-server -y
 rabbitmqctl list_users | grep roboshop &>>{log}
 if [ $? -ne 0 ];then
echo "enabling the rabbitmq"
 systemctl enable rabbitmq-server && systemctl start rabbitmq-server &>>{log}
 StatusCheck
 rabbitmqctl add_user roboshop ${user} && rabbitmqctl set_user_tags roboshop administrator && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
 fi

 StatusCheck
