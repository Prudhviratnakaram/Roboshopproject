#!/usr/bin/bash
 curl -sL https://rpm.nodesource.com/setup_lts.x | bash
 yum install nodejs -y
 id roboshop
   if [ $? -ne 0 ];then
    echo "adding the roboshopsuer"
    useradd roboshop
   StatusCheck
   fi
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip"
 cd /home/roboshop
 unzip /tmp/cart.zip
 mv cart-main cart
 cd cart
 npm install
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
 systemctl daemon-reload
 systemctl start cart
 systemctl enable cart