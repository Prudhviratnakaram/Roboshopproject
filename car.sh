#!/usr/bin/bash
component=cart
source common.sh

Nodejs
 echo configuring the systemd service
 mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service &>>/tmp/cart.log
 StatusCheck

 echo starting the cart service
 systemctl daemon-reload && systemctl start cart &>>/tmp/cart.log && systemctl enable cart &>>/tmp/cart.log
 StatusCheck