#!/usr/bin/bash
source common.sh
 echo "setting nodejs repos"
   curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/cart.log
   StatusCheck

   echo "installing node js"
    yum install nodejs -y &>>/tmp/cart.log
   StatusCheck
   id roboshop &>>/tmp/cart.log
   if [ $? -ne 0 ];then
    echo "adding the roboshopsuer"
    useradd roboshop &>>/tmp/cart.log
   StatusCheck
   fi
    echo Downloading the App contennt
    curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" &>>/tmp/cart.log
    cd /home/roboshop &>>/tmp/cart.log
    StatusCheck
    echo cleaning the old applicationn
    rm -rf cart. &>>/tmp/cart.log
    StatusCheck

    echo extracting the archive
    unzip -o /tmp/cart.zip &>>/tmp/cart.log &&  mv cart-main cart &>>/tmp/cart.log
    cd cart &>>/tmp/cart.log
    StatusCheck

    echo installing the nodejs dependencies
    npm install &>>/tmp/cart.log
    StatusCheck
     echo configuring the systemd service
   mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
   systemctl daemon-reload
   StatusCheck
   systemctl start cart
   systemctl enable cart
   StatusCheck

