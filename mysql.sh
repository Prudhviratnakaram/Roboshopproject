#!/usr/bin/bash
  component=mysql
source common.sh
if [ -z "$MYSQL_PASSWORD" ];then
  echo "variable password is missing"
  exit 1
  fi
 curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
 echo "installing mysql"
 yum install mysql-community-server -y &>>${log}
 StatusCheck
 echo start mysql srvice
 systemctl enable mysqld &>>${log} && systemctl start mysqld &>>${log}
 echo "the envoronment variable is "
 echo 'show databases;' | mysql -uroot -p$MYSQL_PASSWORD &>>${log}
 if [ $? -ne 0 ];then
   echo Default password
   DEAFAULT_PASSWORD=$(grep 'A temporary password' /var/log/mysqld.log | awk '{print$NF}')
   echo "alter user 'root'@'localhost' identified with mysql_native_password by '$MYSQL_PASSWORD';" | mysql --connect-expired-password -uroot -p${DEAFAULT_PASSWORD}
   StatisCheck
fi
echo 'show plugins;' | mysql -uroot -p$MYSQL_PASSWORD 2>&1| grep validate_password &>>${log}
 if [ $? -eq 0 ];then
   echo Uninstall the plugin
   echo  "uninstall plugin validate_password;" | mysql -uroot -p$MYSQL_PASSWORD &>>${log}
   StatusCheck
fi

Download

echo "extract and load schema"
 cd /tmp &>>${log} && unzip mysql.zip &>>${log} && cd mysql-main &>>${log} && mysql -u root -pRoboShop@1 <shipping.sql &>>${log}
 StatusCheck