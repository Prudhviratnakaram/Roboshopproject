#!/usr/bin/bash
component=catalogue
source common.sh
Nodejs
 mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
 systemctl daemon-reload
 systemctl start catalogue
 systemctl enable catalogue
