#!/usr/bin/bash
  component=mysql
source common.sh
if [ -z "$MYSQL_PASSWORD" ];then
  echo "variable password is missing"
  exit 1
  fi
 curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
 yum install mysql-community-server -y
 systemctl enable mysqld
 systemctl start mysqld
 echo "the envoronment variable is "
 echo 'show databases;' | mysql -uroot -p$MYSQL_PASSWORD &>>${log}
 if [ $? -ne 0 ];then
   echo Default password
 DEAFAULT_PASSWORD=$(sudo grep 'A temporary password' /var/log/mysqld.log | awk '{print$NF}')
echo "alter user 'root'@'localhost' identified with mysql_native_password by '$MYSQL_PASSWORD';" | mysql --connect-expired-password -uroot -p${DEAFAULT_PASSWORD}
echo "uninstall plugin validate_password" |  mysql -uroot -p$MYSQL_PASSWORD
fi
#> uninstall plugin validate_password;
 curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
 cd /tmp
 unzip mysql.zip
 cd mysql-main
 mysql -u root -pRoboShop@1 <shipping.sql