StatusCheck()
{
  if [ $? -eq 0 ];then
    echo "SUCCESS"
  else
    echo "FAILURE"
    exit 1
  fi
}
Nodejs()
{
  echo "setting nodejs repos"
  curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/${component}.log
  StatusCheck

  echo "installing node js"
   yum install nodejs -y &>>/tmp/${component}.log
  StatusCheck
  id roboshop &>>/tmp/${component}.log
  if [ $? -ne 0 ];then
   echo "adding the roboshopsuer"
   useradd roboshop &>>/tmp/${component}.log
  StatusCheck
  fi
  Download


   StatusCheck
   echo cleaning the old applicationn
    cd /home/roboshop &>>/tmp/${component}.log && rm -rf ${component}. &>>/tmp/${component}.log
   StatusCheck

   echo extracting the archive
   unzip -o /tmp/${component}.zip &>>/tmp/${component}.log &&  mv ${component}-main ${component} &>>/tmp/${component}.log
   cd ${component} &>>/tmp/${component}.log
   StatusCheck

   echo installing the nodejs dependencies ${component}
   npm install &>>/tmp/${component}.log
   StatusCheck
    echo configuring the systemd service
  mv /home/roboshop/${component}/systemd.service /etc/systemd/system/${component}.service &>>/tmp/${component}.log  &&   systemctl daemon-reload  &>>/tmp/${component}.log
  StatusCheck
  echo "starting the ${component} service"
  systemctl start ${component} &>>/tmp/${component}.log  && systemctl enable ${component} &>>/tmp/${component}.log
  StatusCheck
}
USER_ID=$(id -u)
# shellcheck disable=SC2170
if [ $USER_ID -ne 0 ];then
  echo"you should run this script as root user;"
  exit 1
  fi
Download()
{
  echo "Downloading the ${component} Application content "
  curl -s -L -o /tmp/${component} .zip "https://github.com/roboshop-devops-project/${component} /archive/main.zip" &>>/tmp/${component}.log
  StatusCheck
}
log=/tmp/${component}.log
rm -f${log}
Java()
{

    echo "install maven"
   yum install maven -y &>>{log}
   StatusCheck
  useradd roboshop
   cd /home/roboshop
   rm -rf ${component}
   curl -s -L -o /tmp/${component}.zip "https://github.com/roboshop-devops-project/${component}/archive/main.zip" &>>{log}
   StatusCheck
   unzip -o /tmp/${component}.zip
   mv ${component}-main ${component}
   cd ${component}
   mvn clean package && mv target/${component}-1.0.jar ${component}.jar && mv /home/roboshop/${component}/systemd.service /etc/systemd/system/${component}.service &>>{log}
   StatusCheck
   systemctl daemon-reload && systemctl start ${component} && systemctl enable ${component}
}

user=roboshop123

Python()
{
  if [ -z "$user" ];then
    echo "dont proceed"
    exit 1
  fi
  echo "Installing python"
   yum install python36 gcc python3-devel -y &>>{log}
   StatusCheck
   echo "user add"
  rabbitmqctl list_users | grep roboshop &>>{log}
   if [ $? -ne 0 ];then
     echo "enabling the rabbitmq"
   cd /home/roboshop
   rm -rf
   echo "payement"
   curl -L -s -o /tmp/${component}.zip "https://github.com/roboshop-devops-project/${component}/archive/main.zip" &>>{log}
   unzip -o /tmp/${component}.zip
   mv ${component}-main ${component}
   cd /home/roboshop/${component} &>>{log}
   StatusCheck
   pip3 install -r requirements.txt &>>{log}
   mv /home/roboshop/${component}/systemd.service /etc/systemd/system/${component}.service &>>{log}
   systemctl daemon-reload && systemctl enable ${component} && systemctl start ${component}
   echo "done"
   fi
   StatusCheck
}