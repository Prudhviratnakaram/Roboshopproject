#!/usr/bin/bash
component=cart
source common.sh

Nodejs



 echo configuring the systemd service
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/car.log &&  systemctl daemon-reload &>>/tmp/car.log
 StatusCheck

 echo starting the cart service
 systemctl start cart &>>/tmp/car.log && systemctl enable cart &>>/tmp/car.log
 StatusCheck