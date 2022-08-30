#!/usr/bin/bash
source common.sh
component=mongodb
echo "set up m repo"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/roboshop-devops-project/mongodb/main/mongo.repo &>>${log}
StatusCheck
echo "install mongodb"
 yum install -y mongodb-org
 StatusCheck
 echo "Enable mongodb"
 systemctl enable mongod && systemctl start mongod &>>${log}
StatusCheck
  systemctl restart mongod

  Download

   cd /tmp
   echo "Extract the schema"
   unzip -o mongodb.zip &>>${log}

   echo "load schema"
  cd mongodb-main &&  mongo < catalogue.js &&  mongo < users.js &>>${log}



