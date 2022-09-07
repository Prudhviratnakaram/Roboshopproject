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
   echo Downloading the App contennt
   curl -s -L -o /tmp/${component}.zip "https://github.com/roboshop-devops-project/${component}/archive/main.zip" &>>/tmp/${component}.log
   cd /home/roboshop &>>/tmp/${component}.log
   StatusCheck
   echo cleaning the old applicationn
   rm -rf ${component}. &>>/tmp/${component}.log
   StatusCheck

   echo extracting the archive
   unzip -o /tmp/${component}.zip &>>/tmp/${component}.log &&  mv ${component}-main ${component} &>>/tmp/${component}.log
   cd ${component} &>>/tmp/${component}.log
   StatusCheck

   echo installing the nodejs dependencies
   npm install &>>/tmp/${component}.log
   StatusCheck
    echo configuring the systemd service
  mv /home/roboshop/${component}/systemd.service /etc/systemd/system/${component}.service &>>/tmp/${component}.log  &&   systemctl daemon-reload  &>>/tmp/${component}.log
  StatusCheck
  echo "starting the ${component} service"
  systemctl start ${component} &>>/tmp/${component}.log  && systemctl enable ${component} &>>/tmp/${component}.log
  StatusCheck
}


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

   yum install maven -y &>>{log}
   StatusCheck
   cd /home/roboshop
   rm -rf shipping
   curl -s -L -o /tmp/shipping.zip "https://github.com/roboshop-devops-project/shipping/archive/main.zip" &>>{log}
   StatusCheck
   unzip -o /tmp/shipping.zip
   mv shipping-main shipping
   cd shipping
   mvn clean package && mv target/shipping-1.0.jar shipping.jar && mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service &>>{log}
   StatusCheck
   systemctl daemon-reload && systemctl start shipping && systemctl enable shipping
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
   curl -L -s -o /tmp/payment.zip "https://github.com/roboshop-devops-project/payment/archive/main.zip" &>>{log}
   unzip -o /tmp/payment.zip
   mv payment-main payment
   cd /home/roboshop/payment &>>{log}
   StatusCheck
   pip3 install -r requirements.txt &>>{log}
   mv /home/roboshop/payment/systemd.service /etc/systemd/system/payment.service &>>{log}
   systemctl daemon-reload && systemctl enable payment && systemctl start payment
   echo "done"
   fi
   StatusCheck
}