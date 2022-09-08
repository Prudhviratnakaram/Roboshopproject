#!/usr/bin/bash
  component=mongodb
source common.sh
echo Downloading the appp content
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${log}
StatusCheck
echo Install MongoDb
 yum install -y mongodb-org &>>${log}
 StatusCheck
echo Start mongodb service
 systemctl enable mongod &>>${log} && systemctl start mongod &>>${log}
 systemctl restart mongod
 echo update the listen config

 echo "update the listeners update"
 sed -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>${log}
 StatusCheck
Download

echo Extract the schema files

 cd /tmp  &>>${log} &&  unzip -o mongodb.zip &>>${log}
 StatusCheck
 echo local schema &>>${log}
 cd mongodb-main &>>${log}
 mongo < catalogue.js &>>${log}
 mongo < users.js  &>>${log}
 StatusCheck




