 set -e
 curl -s -L -o /etc/yum.repos.d/mysql.repo https://raw.githubusercontent.com/roboshop-devops-project/mysql/main/mysql.repo
 yum install mysql-community-server -y
 systemctl enable mysqld
 systemctl start mysqld
 deafault_password=$(sudo grep 'A temporary password' /var/log/mysqld.log | awk '{print$NF}')
echo "Alter user 'root'@'localhost' identified with mysql_native_password by 'RoboShop@1';" | mysql -uroot -p$(deafault_password)
 mysql -uroot -pRoboShop@1
#> uninstall plugin validate_password;
 curl -s -L -o /tmp/mysql.zip "https://github.com/roboshop-devops-project/mysql/archive/main.zip"
 cd /tmp
 unzip mysql.zip
 cd mysql-main
 mysql -u root -pRoboShop@1 <shipping.sql