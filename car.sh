#!/usr/bin/bash
set -e
curl -sL https://rpm.nodesource.com/setup_lts.x | bash >/tmp/car.log
 yum install nodejs -y >/tmp/car.log
 useradd roboshop
 curl -s -L -o /tmp/cart.zip "https://github.com/roboshop-devops-project/cart/archive/main.zip" >/tmp/car.log
 cd /home/roboshop >/tmp/car.log
 rm -rf cart >/tmp/car.log
 unzip -o /tmp/cart.zip >/tmp/car.log
 mv cart-main cart >/tmp/car.log
 cd cart >/tmp/car.log
 npm install >/tmp/car.log
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service >/tmp/car.log
 systemctl daemon-reload >/tmp/car.log
 systemctl start cart >/tmp/car.log
 systemctl enable cart >/tmp/car.log