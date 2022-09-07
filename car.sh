#!/usr/bin/bash
set -e

echo "setting nodejs repos"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/car.log

echo "installing node js"
 yum install nodejs -y &>>/tmp/car.log

 echo "adding the roboshopsuer"
 useradd roboshop

 echo Downloading the App contennt
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>>/tmp/car.log
 cd /home/roboshop &>>/tmp/car.log

 echo cleaning the old applicationn
 rm -rf cart &>>/tmp/car.log

 echo extracting the archive
 unzip -o /tmp/cart.zip &>>/tmp/car.log
 mv cart-main cart &>>/tmp/car.log
 cd cart &>>/tmp/car.log

 echo installing the nodejs dependencies
 npm install &>>/tmp/car.log

 echo configuring the systemd service
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/car.log
 systemctl daemon-reload &>>/tmp/car.log

 echo starting the cart service
 systemctl start cart &>>/tmp/car.log
 systemctl enable cart &>>/tmp/car.log