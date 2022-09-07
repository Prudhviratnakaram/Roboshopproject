#!/usr/bin/bash
  echo "setting nodejs repos"
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/cart.log
   echo "installing node js"
 yum install nodejs -y &>>/tmp/cart.log

 id roboshop &>>/tmp/cart.log
   if [ $? -ne 0 ];then
      echo "adding the roboshopsuer"
    echo "adding the roboshopsuer"
    useradd roboshop
   StatusCheck
   fi
    echo Downloading the App contennt
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>>/tmp/cart.log
 cd /home/roboshop &>>/tmp/cart.log
    echo extracting the archive
 unzip -o /tmp/cart.zip &>>/tmp/cart.log
 mv cart-main cart &>>/tmp/cart.log
 cd cart &>>/tmp/cart.log
   echo installing the nodejs dependencies
 npm install &>>/tmp/cart.log
 echo configuring the systemd service
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/cart.log
 systemctl daemon-reload &>>/tmp/cart.log
 systemctl start cart &>>/tmp/cart.log
 systemctl enable cart &>>/tmp/cart.log